<div id="receipt-data">
    <div>
        <div style="text-align:center;margin-bottom: 15px;">
            <?php
            if ($store) {
                echo '<p style="text-align:center;border-bottom:5px solid;">';
                if(!empty($store->logo)) {
                    echo '<p><img src="'.base_url('uploads/' . $store->logo).'"/></p> ';
                }
                echo '<strong>' . $store->name . '</strong> ' .'<br>';
                echo '</p>';
               // echo '<p>' . nl2br($store->receipt_header) . '</p>';
            }


            ?>
        </div>
        <table class="table table-striped table-condensed">
            <tr>
                <td class="text-left" style="width: 30%; background:#fff;"><strong><?=lang('invoice_number');?></strong></td>
                <td class="text-left" style="width: 20%; background:#fff;"><?=$inv->store_invoice_id;?></td>
                <td class="text-right" style="width: 24%; background:#fff;"><?=$inv->store_invoice_id;?></td>
                <td class="text-right" style="width: 30%; background:#fff;"><strong><?='رقم الفاتورة';?></strong></td>
            </tr>
            <tr>
                <td class="text-left" style="width: 30%; background:#fff;"><strong><?=lang('invoice_issue_date');?></strong></td>
                <td class="text-left" style="width: 20%; background:#fff;"><?=date('d-m-Y', strtotime($inv->date));?></td>
                <td class="text-right" style="width: 24%; background:#fff;"><?=date('d-m-Y', strtotime($inv->date));?></td>
                <td class="text-right" style="width: 30%; background:#fff;"><strong><?='إصدار تاريخ الفاتورة';?></strong></td>
            </tr>
             <tr>
                <td class="text-left" style="width: 30%; background:#fff;"><strong><?=lang('customer_name');?></strong></td>
                <td class="text-left" style="width: 20%; background:#fff;"><?=$customer->name;?></td>
                <td class="text-right" style="width: 24%; background:#fff;"><?=$customer->name;?></td>
                <td class="text-right" style="width: 30%; background:#fff;"><strong><?='اسم الزبون';?></strong></td>
            </tr>
            <tr>
                <td class="text-left" style="width: 30%; background:#fff;"><strong><?=lang('customer_no');?></strong></td>
                <td class="text-left" style="width: 20%; background:#fff;"><?=$customer->phone;?></td>
                <td class="text-right" style="width: 24%; background:#fff;"><?=$customer->phone;?></td>
                <td class="text-right" style="width: 30%; background:#fff;"><strong><?='رقم هاتف العميل';?></strong></td>
            </tr>
        </table>
        <div style="clear:both; height: 50px;"></div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th class="text-center" style="width: 25%; border-bottom: 1px solid #ccc; border-right: 1px solid #f7f7f7; background: #000; color:#f7f7f7;"><?=lang('nature_of_goods_or_service');?> <br> <?= 'طبيعة البضاعة والخدمة'; ?> </th>
                    <th class="text-center" style="width: 25%; border-bottom: 1px solid #ccc; border-right: 1px solid #f7f7f7; background: #000; color:#f7f7f7;"><?=lang('unit_price');?><br> <?= 'سعر الوحدة';?> </th>
                    <th class="text-center" style="width: 25%; border-bottom: 1px solid #ccc; border-right: 1px solid #f7f7f7; background: #000; color:#f7f7f7;"><?=lang('quantity');?><br> <?= 'كمية';?></th>
                    <th class="text-center" style="width: 25%; border-bottom: 1px solid #ccc;background: #000; color:#f7f7f7;"><?=lang('item_subtotal');?><br> <?= 'المجموع الفرعي للبند (متضمنًا ضريبة القيمة المضافة)';?></th>
                </tr>
            </thead>
            <tbody>
                <?php
                $tax_summary = [];
                $taxable_amount = 0;
                $storevat = (float) substr($store->vat, 0, -1);

                foreach ($rows as $row) {
                    //$unit_price_without_vat = $row->net_unit_price - (($row->net_unit_price*$storevat)/100);
                    $unit_price_without_vat = $row->net_unit_price;
                    $taxable_amount = $taxable_amount + ($unit_price_without_vat*$row->quantity);
                    echo '<tr><td>';
                    echo $row->product_name;
                    // echo $row->comment ? '<br>' . nl2br($row->comment) : '';
                    echo '</td>';
                    echo '<td style="text-align:right;">' . $this->tec->formatMoney($unit_price_without_vat) . '</td>';
                    echo '<td class="text-right">';
                    echo $this->tec->formatQuantity($row->quantity). '</td><td class="text-right">' . $this->tec->formatMoney($row->subtotal) . '</td></tr>';
                }
                ?>
                <tr><td> </td><td> </td><td> </td><td> </td></tr>
            </tbody>
            <tfoot>
                <tr>
                    <td  style="border-top:1px solid #000"><?=lang('total_taxable_amount');?></td>
                    <td colspan="2" style="text-align: right;border-top:1px solid #000"><?='إجمالي المبلغ الخاضع للضريبة (باستثناء ضريبة القيمة المضافة)';?></td>
                    <td style="text-align: right;border-top:1px solid #000"><?=$this->tec->formatMoney($taxable_amount);?></td>
                </tr>
                <tr>
                    <td><?=lang('total_vat');?>(<?=$store->vat?>)</td>
                    <td colspan="2" style="text-align: right;"><?='إجمالي ضريبة القيمة المضافة';?></td>
                    <td style="text-align: right;"><?=$this->tec->formatMoney($inv->total_tax);?></td>
                </tr>
                <tr>
                    <td style="border-bottom:1px solid #000;"><?=lang('total_amount_paid');?></td>
                    <td colspan="2" style="text-align: right;border-bottom:1px solid #000;"><?='المبلغ الإجمالي المدفوع';?></td>
                    <td style="text-align: right;border-bottom:1px solid #000;"><?= $this->tec->formatMoney($inv->total+$inv->total_tax); ?></td>
                </tr>
                <tr>
                    <td style="border-bottom:1px solid #000;"><strong><?=lang('paid_by');?></strong></td>
                    <td colspan="2" style="text-align: right;border-bottom:1px solid #000;"><strong><?='مدفوعة';?></strong></td>
                    <td style="text-align: right;border-bottom:1px solid #000;"><strong><?= lang($payments[0]->paid_by); ?></strong></td>
                </tr>
                <tr>
                    <td style="border-bottom:1px solid #000;"><strong><?=lang('pos_paid_amount');?></strong></td>
                    <td colspan="2" style="text-align: right;border-bottom:1px solid #000;"><strong><?='المبلغ المدفوع في نقاط البيع';?></strong></td>
                    <td style="text-align: right;border-bottom:1px solid #000;"><?= $this->tec->formatMoney($payments[0]->pos_paid); ?></td>
                </tr>
                <tr>
                    <td style="border-bottom:1px solid #000;"><strong><?=lang('pos_balance_amount');?></strong></td>
                    <td colspan="2" style="text-align: right;border-bottom:1px solid #000;"><strong><?='مبلغ رصيد نقاط البيع';?></strong></td>
                    <td style="text-align: right;border-bottom:1px solid #000;"><?= $this->tec->formatMoney($payments[0]->pos_balance); ?></td>
                </tr>


            </tfoot>
        </table>
        <div style="width: 100%; text-align: center;">
            <p>
                <span><?=lang('location');?>: <?=$store->address1.', '.$store->address2.', '.$store->city.' - '.$store->postal_code.', '.$store->state.', '.$store->country;?></span><br>
                <span><?=lang('phone');?>: <?=$store->phone;?></span><br>
                <span><?=lang('vat_id');?>: <?=$store->vat_id;?></span><br>
                <?php if (!empty($inv->note)) { ?>
                <span><?=lang('note');?>: <?=nl2br($inv->note);?></span><br>
                <?php } ?>
                <?php if (!empty($payments[0]->note)) { ?>
                <span><?=lang('payment_note');?>: <?=nl2br($payments[0]->note);?></span><br>
                 <?php } ?>
            </p>
            <?php

                $QRcode_content = lang('company_name').': '.$store->name.', '.lang('vat_no').': '.$store->vat_id. ', '.lang('timestamp').': '.date('d-m-Y H:i:s a', strtotime($inv->date)).', '.lang('total_vat').': '.$this->tec->formatMoney($inv->total_tax).', '.lang('total_amount_paid').': '.$this->tec->formatMoney($inv->total+$inv->total_tax);

                $params['data'] = $QRcode_content;
                echo $this->ciqrcode->generate($params);
            ?>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>