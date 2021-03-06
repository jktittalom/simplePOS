<?php
 if (!defined('BASEPATH')) {
     exit('No direct script access allowed');
 }

class Pos_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function addSale($data, $items, $payment = [], $did = null)
    {
        if ($this->db->insert('sales', $data)) {
            $sale_id = $this->db->insert_id();

            foreach ($items as $item) {
                $item['sale_id'] = $sale_id;
                if ($this->db->insert('sale_items', $item)) {
                    if ($item['product_id'] > 0 && $product = $this->site->getProductByID($item['product_id'])) {
                        if ($product->type == 'standard') {
                            $this->db->update('product_store_qty', ['quantity' => ($product->quantity - $item['quantity'])], ['product_id' => $product->id, 'store_id' => $data['store_id']]);
                        } elseif ($product->type == 'combo') {
                            $combo_items = $this->getComboItemsByPID($product->id);
                            foreach ($combo_items as $combo_item) {
                                $cpr = $this->site->getProductByID($combo_item->id);
                                if ($cpr->type == 'standard') {
                                    $qty = $combo_item->qty * $item['quantity'];
                                    $this->db->update('product_store_qty', ['quantity' => ($cpr->quantity - $qty)], ['product_id' => $cpr->id, 'store_id' => $data['store_id']]);
                                }
                            }
                        }
                    }
                }
            }

            if ($did) {
                $this->db->delete('suspended_sales', ['id' => $did]);
                $this->db->delete('suspended_items', ['suspend_id' => $did]);
            }
            $msg = [];
            if (!empty($payment)) {
                if ($payment['paid_by'] == 'stripe') {
                    $card_info = ['number' => $payment['cc_no'], 'exp_month' => $payment['cc_month'], 'exp_year' => $payment['cc_year'], 'cvc' => $payment['cc_cvv2'], 'type' => $payment['cc_type']];
                    $result    = $this->stripe($payment['amount'], $card_info);
                    if (!isset($result['error']) && !empty($result['transaction_id'])) {
                        $payment['transaction_id'] = $result['transaction_id'];
                        $payment['date']           = $result['created_at'];
                        $payment['amount']         = $result['amount'];
                        $payment['currency']       = $result['currency'];
                        unset($payment['cc_cvv2']);
                        $payment['sale_id'] = $sale_id;
                        $this->db->insert('payments', $payment);
                    } else {
                        $this->db->update('sales', ['paid' => 0, 'status' => 'due'], ['id' => $sale_id]);
                        $msg[] = lang('payment_failed');
                        $msg[] = '<p class="text-danger">' . $result['code'] . ': ' . $result['message'] . '</p>';
                    }
                } else {
                    if ($payment['paid_by'] == 'gift_card') {
                        $gc = $this->getGiftCardByNO($payment['gc_no']);
                        $this->db->update('gift_cards', ['balance' => ($gc->balance - $payment['amount'])], ['card_no' => $payment['gc_no']]);
                    }
                    unset($payment['cc_cvv2']);
                    $payment['sale_id'] = $sale_id;
                    $this->db->insert('payments', $payment);
                }
            }

            return ['sale_id' => $sale_id, 'message' => $msg];
        }

        return false;
    }

    public function closeRegister($rid, $user_id, $data)
    {
        if (!$rid) {
            $rid = $this->session->userdata('register_id');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        if ($data['transfer_opened_bills'] == -1) {
            $this->db->delete('suspended_sales', ['created_by' => $user_id]);
        } elseif ($data['transfer_opened_bills'] != 0) {
            $this->db->update('suspended_sales', ['created_by' => $data['transfer_opened_bills']], ['created_by' => $user_id]);
        }
        if ($this->db->update('registers', $data, ['id' => $rid, 'user_id' => $user_id])) {
            return true;
        }
        return false;
    }

    public function fetch_products($category_id, $limit, $start)
    {
        $this->db->limit($limit, $start);
        if ($category_id) {
            $this->db->where('category_id', $category_id);
        }
        $this->db->order_by('code', 'asc');
        $query = $this->db->get('products');

        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }


    public function fetch_products_Jiten($category_id, $limit, $start)
    {
        // By DevRiver: 01 Sep 2021, Getting all active product
        $active = 1;
        $store_id = $this->session->userdata('store_id');

        $this->db->select("products.*");
        $this->db->limit($limit, $start);
        if ($category_id) {
            $this->db->where('category_id', $category_id);
        }
        $this->db->where('active', $active);
        $this->db->join('product_store_qty', "product_store_qty.product_id = products.id and display=1 and store_id = {$store_id} ", 'inner');
        $this->db->group_by('products.id');

        $this->db->order_by('code', 'asc');
        $query = $this->db->get('products');

        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getAllSaleItems($sale_id)
    {
        $j = "(SELECT id, code, name, tax_method from {$this->db->dbprefix('products')}) P";
        $this->db->select("sale_items.*,
            (CASE WHEN {$this->db->dbprefix('sale_items')}.product_code IS NULL THEN {$this->db->dbprefix('products')}.code ELSE {$this->db->dbprefix('sale_items')}.product_code END) as product_code,
            (CASE WHEN {$this->db->dbprefix('sale_items')}.product_name IS NULL THEN {$this->db->dbprefix('products')}.name ELSE {$this->db->dbprefix('sale_items')}.product_name END) as product_name,
            {$this->db->dbprefix('products')}.tax_method as tax_method", false)
        ->join('products', 'products.id=sale_items.product_id', 'left outer')
        ->order_by('sale_items.id');
        $q = $this->db->get_where('sale_items', ['sale_id' => $sale_id]);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getAllSalePayments($sale_id)
    {
        $q = $this->db->get_where('payments', ['sale_id' => $sale_id]);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getComboItemsByPID($product_id)
    {
        $this->db->select($this->db->dbprefix('products') . '.id as id, ' . $this->db->dbprefix('products') . '.code as code, ' . $this->db->dbprefix('combo_items') . '.quantity as qty, ' . $this->db->dbprefix('products') . '.name as name, ' . $this->db->dbprefix('products') . '.quantity as quantity')
        ->join('products', 'products.code=combo_items.item_code', 'left')
        ->group_by('combo_items.id');
        $q = $this->db->get_where('combo_items', ['product_id' => $product_id]);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getCustomerByID($id)
    {
        $q = $this->db->get_where('customers', ['id' => $id], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getGiftCardByNO($no)
    {
        $q = $this->db->get_where('gift_cards', ['card_no' => $no], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getOpenRegisters()
    {
        $this->db->select('date, user_id, cash_in_hand, CONCAT(' . $this->db->dbprefix('users') . ".first_name, ' ', " . $this->db->dbprefix('users') . ".last_name, ' - ', " . $this->db->dbprefix('users') . '.email) as user', false)
            ->join('users', 'users.id=pos_register.user_id', 'left');
        $q = $this->db->get_where('registers', ['status' => 'open']);
        if ($q->num_rows() > 0) {
            foreach ($q->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getProductByCode($code)
    {
        $jpsq = "( SELECT product_id, quantity, price from {$this->db->dbprefix('product_store_qty')} WHERE store_id = {$this->session->userdata('store_id')} ) AS PSQ";
        $this->db->select("{$this->db->dbprefix('products')}.*, COALESCE(PSQ.quantity, 0) as quantity, COALESCE(PSQ.price, {$this->db->dbprefix('products')}.price) as store_price", false)
        ->join($jpsq, 'PSQ.product_id=products.id', 'left');
        $q = $this->db->get_where('products', ['code' => $code], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    // by Jiten, 18 Aug 2021, We need to use global setting default Vat for each product
    public function getProductByCode_Jiten($code, $default_vat=0.00)
    {
        // By DevRiver: 01 Sep 2021, Getting all active product
        $active = 1;
        $store_id = $this->session->userdata('store_id');
        $display = 1;
        
        $jpsq = "( SELECT product_id, quantity, price from {$this->db->dbprefix('product_store_qty')} WHERE store_id = {$store_id} and display={$display}) AS PSQ";
        $this->db->select("{$this->db->dbprefix('products')}.*, COALESCE(PSQ.quantity, 0) as quantity, COALESCE(PSQ.price, {$this->db->dbprefix('products')}.price) as store_price", false)
        ->join($jpsq, "PSQ.product_id=products.id", 'inner');

        $q = $this->db->get_where('products', ['code' => $code, 'active' => $active], 1);
        if ($q->num_rows() > 0) {
            $obj = $q->row();
            $obj->tax = $default_vat;  // tax percent
            $obj->tax = (100+$default_vat)/100;  // tax percent Formula to calculate inclusive tax by Client
            $obj->original_price = $obj->store_price > 0 ? $obj->store_price : $obj->price; 
            $price_withoutTax = $obj->price > 0 ? $obj->price/($obj->tax) : $obj->store_price/($obj->tax);
            $obj->product_tax = $obj->original_price - $price_withoutTax;
            
            return $obj;
        }
        return false;
    }

    public function getProductNames($term, $limit = 10, $strict = false)
    {
        $store_id = $this->session->userdata('store_id');
        $this->db->select("{$this->db->dbprefix('products')}.*, COALESCE(psq.quantity, 0) as quantity, COALESCE(psq.price, 0) as store_price")
        ->join("( SELECT * from {$this->db->dbprefix('product_store_qty')} WHERE store_id = {$store_id}) psq", 'products.id=psq.product_id', 'left');
        if ($strict) {
            $this->db->where('code', $term);
        } else {
            if ($this->db->dbdriver == 'sqlite3') {
                $this->db->where("(name LIKE '%{$term}%' OR code LIKE '%{$term}%' OR  (name || ' (' || code || ')') LIKE '%{$term}%')");
            } else {
                $this->db->where("(name LIKE '%{$term}%' OR code LIKE '%{$term}%' OR  concat(name, ' (', code, ')') LIKE '%{$term}%')");
            }
        }
        $this->db->group_by('products.id')->limit($limit);
        $q = $this->db->get('products');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }
    // by Jiten, 18 Aug 2021, We need to use global setting default Vat for each product
    public function getProductNames_Jiten($term, $limit = 10, $strict = false, $default_vat=0.00)
    {
        // By DevRiver: 01 Sep 2021, Getting all active product
        $active = 1;
        $store_id = $this->session->userdata('store_id');
        $display = 1; // need to show product when that product is display enabled, 01 Sep 2021

        $this->db->select("{$this->db->dbprefix('products')}.*, COALESCE(psq.quantity, 0) as quantity, COALESCE(psq.price, 0) as store_price")
        ->join("( SELECT * from {$this->db->dbprefix('product_store_qty')} WHERE store_id = {$store_id} and display={$display}) psq", 'products.id=psq.product_id', 'inner');
        if ($strict) {
            $this->db->where('code', $term);
        } else {
            if ($this->db->dbdriver == 'sqlite3') {
                $this->db->where("(name LIKE '%{$term}%' OR code LIKE '%{$term}%' OR  (name || ' (' || code || ')') LIKE '%{$term}%') and active = {$active}");
            } else {
                $this->db->where("(name LIKE '%{$term}%' OR code LIKE '%{$term}%' OR  concat(name, ' (', code, ')') LIKE '%{$term}%') and active = {$active}");
            }
        }
        $this->db->group_by('products.id')->limit($limit);
        $q = $this->db->get('products');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $row->tax = $default_vat;  // tax percent
                $row->tax = (100+$default_vat)/100;  // tax percent
                $row->original_price = $row->store_price > 0 ? $row->store_price : $row->price; 
                
                //$row->price = $row->price/$row->tax;
                //$row->store_price = $row->store_price/$row->tax;
               /* $row->price = $row->price - (($row->price*$row->tax)/100);
                $row->store_price = $row->store_price - (($row->store_price*$row->tax)/100);*/

               // $row->product_tax = $row->store_price > 0 ? $row->original_price - $row->store_price : $row->original_price - $row->price; // inclusive tax

                $price_withoutTax = $row->price > 0 ? $row->price/($row->tax) : $row->store_price/($row->tax);
                $row->product_tax = $row->original_price - $price_withoutTax;

                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getRegisterCashRefunds($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS returned', false)
            ->join('return_sales', 'return_sales.id=payments.return_id', 'left')
            ->where('type', 'returned')->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'cash');
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterCashSales($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'cash');
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterCCSales($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cc_slips, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'CC');
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterChSales($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)
            ->group_start()->where("{$this->db->dbprefix('payments')}.paid_by", 'Cheque')->or_where("{$this->db->dbprefix('payments')}.paid_by", 'cheque')->group_end();
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterExpenses($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('SUM( COALESCE( amount, 0 ) ) AS total', false)
            ->where('date >', $date);
        $this->db->where('created_by', $user_id);

        $q = $this->db->get('expenses');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterGCSales($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'gift_card');
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterOtherSales($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'other');
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterRefunds($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS returned', false)
            ->join('return_sales', 'return_sales.id=payments.return_id', 'left')
            ->where('type', 'returned')->where('payments.date >', $date);
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterSales($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date);
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getRegisterStripeSales($date = null, $user_id = null)
    {
        if (!$date) {
            $date = $this->session->userdata('register_open_time');
        }
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'stripe');
        $this->db->where('payments.created_by', $user_id);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getSaleByID($sale_id)
    {
        $q = $this->db->get_where('sales', ['id' => $sale_id], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getSuspendedSaleByID($id)
    {
        $q = $this->db->get_where('suspended_sales', ['id' => $id], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getSuspendedSaleItems($id)
    {
        $q = $this->db->get_where('suspended_items', ['suspend_id' => $id]);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getSuspendedSales($user_id = null)
    {
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->order_by('date', 'desc');
        $q = $this->db->get_where('suspended_sales', ['created_by' => $user_id]);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getTodayCashRefunds()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS returned', false)
            ->join('return_sales', 'return_sales.id=payments.return_id', 'left')
            ->where('type', 'returned')->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'cash');

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayCashSales()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'cash');

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayCCSales()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cc_slips, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'CC');

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayChSales()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)
            ->group_start()->where("{$this->db->dbprefix('payments')}.paid_by", 'Cheque')->or_where("{$this->db->dbprefix('payments')}.paid_by", 'cheque')->group_end();

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayExpenses()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('SUM( COALESCE( amount, 0 ) ) AS total', false)
            ->where('date >', $date);

        $q = $this->db->get('expenses');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayGCSales()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'gift_card');

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayOtherSales()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'other');

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayRefunds()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS returned', false)
            ->join('return_sales', 'return_sales.id=payments.return_id', 'left')
            ->where('type', 'returned')->where('payments.date >', $date);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodaySales()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date);

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getTodayStripeSales()
    {
        $date = date('Y-m-d 00:00:00');
        $this->db->select('COUNT(' . $this->db->dbprefix('payments') . '.id) as total_cheques, SUM( COALESCE( grand_total, 0 ) ) AS total, SUM( COALESCE( amount, 0 ) ) AS paid', false)
            ->join('sales', 'sales.id=payments.sale_id', 'left')
            ->where('payments.date >', $date)->where("{$this->db->dbprefix('payments')}.paid_by", 'stripe');

        $q = $this->db->get('payments');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function openRegister($data)
    {
        if ($this->db->insert('registers', $data)) {
            return true;
        }
        return false;
    }

    public function products_count($category_id)
    {
        if ($category_id) {
            $this->db->where('category_id', $category_id);
        }
        return $this->db->count_all_results('products');
    }

    public function registerData($user_id = null)
    {
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $q = $this->db->get_where('registers', ['user_id' => $user_id, 'status' => 'open'], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function stripe($amount = 0, $card_info = [], $desc = '')
    {
        $this->load->model('stripe_payments');
        // $card_info = array( "number" => "4242424242424242", "exp_month" => 1, "exp_year" => 2016, "cvc" => "314" );
        // $amount = $amount ? $amount*100 : 3000;
        $amount = $amount * 100;
        if ($amount && !empty($card_info)) {
            $token_info = $this->stripe_payments->create_card_token($card_info);
            if (!isset($token_info['error'])) {
                $token = $token_info->id;
                $data  = $this->stripe_payments->insert($token, $desc, $amount, $this->Settings->currency_prefix);
                if (!isset($data['error'])) {
                    $result = ['transaction_id' => $data->id,
                        'created_at'            => date('Y-m-d H:i:s', $data->created),
                        'amount'                => ($data->amount / 100),
                        'currency'              => strtoupper($data->currency),
                    ];
                    return $result;
                }
                return $data;
            }
            return $token_info;
        }
        return false;
    }

    public function suspendSale($data, $items, $did = null)
    {
        if ($did) {
            if ($this->db->update('suspended_sales', $data, ['id' => $did]) && $this->db->delete('suspended_items', ['suspend_id' => $did])) {
                foreach ($items as $item) {
                    unset($item['cost']);
                    $item['suspend_id'] = $did;
                    $this->db->insert('suspended_items', $item);
                }
                return true;
            }
        } else {
            if ($this->db->insert('suspended_sales', $data)) {
                $suspend_id = $this->db->insert_id();
                foreach ($items as $item) {
                    unset($item['cost']);
                    $item['suspend_id'] = $suspend_id;
                    $this->db->insert('suspended_items', $item);
                }
                return $suspend_id;
            }
        }
        return false;
    }

    public function updateSale($id, $data, $items)
    {
        $osale  = $this->getSaleByID($id);
        $oitems = $this->getAllSaleItems($id);
        foreach ($oitems as $oitem) {
            $product = $this->site->getProductByID($oitem->product_id, $osale->store_id);
            if ($product->type == 'standard') {
                $this->db->update('product_store_qty', ['quantity' => ($product->quantity + $oitem->quantity)], ['product_id' => $product->id, 'store_id' => $osale->store_id]);
            } elseif ($product->type == 'combo') {
                $combo_items = $this->getComboItemsByPID($product->id);
                foreach ($combo_items as $combo_item) {
                    $cpr = $this->site->getProductByID($combo_item->id, $osale->store_id);
                    if ($cpr->type == 'standard') {
                        $qty = $combo_item->qty * $oitem->quantity;
                        $this->db->update('product_store_qty', ['quantity' => ($cpr->quantity + $qty)], ['product_id' => $cpr->id, 'store_id' => $osale->store_id]);
                    }
                }
            }
        }

        $data['status'] = $osale->paid > 0 ? 'partial' : ($data['grand_total'] <= $osale->paid ? 'paid' : 'due');

        if ($this->db->update('sales', $data, ['id' => $id]) && $this->db->delete('sale_items', ['sale_id' => $id])) {
            foreach ($items as $item) {
                $item['sale_id'] = $id;
                if ($this->db->insert('sale_items', $item)) {
                    $product = $this->site->getProductByID($item['product_id'], $osale->store_id);
                    if ($product->type == 'standard') {
                        $this->db->update('product_store_qty', ['quantity' => ($product->quantity - $item['quantity'])], ['product_id' => $product->id, 'store_id' => $osale->store_id]);
                    } elseif ($product->type == 'combo') {
                        $combo_items = $this->getComboItemsByPID($product->id);
                        foreach ($combo_items as $combo_item) {
                            $cpr = $this->site->getProductByID($combo_item->id, $osale->store_id);
                            if ($cpr->type == 'standard') {
                                $qty = $combo_item->qty * $item['quantity'];
                                $this->db->update('product_store_qty', ['quantity' => ($cpr->quantity - $qty)], ['product_id' => $cpr->id, 'store_id' => $osale->store_id]);
                            }
                        }
                    }
                }
            }

            return true;
        }

        return false;
    }

    public function getStoreMaxInvoiceID($store_id)
    {
        $this->db->select('MAX(store_invoice_id) as max_invoice_id')
            ->where('sales.store_id', $store_id);
        $q = $this->db->get('sales');

        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }
}
