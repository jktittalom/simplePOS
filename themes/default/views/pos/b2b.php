<div id="receipt-data">
    <div>
        <div style="text-align:center;margin-bottom: 15px;font-size: 18px;">
            <?php
            if ($store) {
                echo '<p style="text-align:center;border-bottom:5px solid;">';
                echo '<strong>' . 'فاتورة ضريبية' . '</strong> ' .'<br>';
                echo '<strong>' . lang('tax_invoice') . '</strong> ' .'<br>';
                echo '</p>';
               // echo '<p>' . nl2br($store->receipt_header) . '</p>';
            }
            ?>
        </div>
        <table>
            <tr>
                <td style="width: 50%;">
                    <table class="table table-striped table-condensed">
                        <tr>
                            <td class="text-left" style="width: 30%; background:#fff; border: 1px solid #ccc;"><strong><?=lang('invoice_number');?></strong></td>
                            <td class="text-left" style="width: 20%; background:#fff; border: 1px solid #ccc;"><?=$inv->store_invoice_id;?></td>
                            <td class="text-right" style="width: 24%; background:#fff; border: 1px solid #ccc;"><?=$inv->store_invoice_id;?></td>
                            <td class="text-right" style="width: 30%; background:#fff; border: 1px solid #ccc;"><strong><?='رقم الفاتورة';?></strong></td>
                        </tr>
                        <tr><td colspan="4"> </td></tr>
                        <tr><td colspan="4"> </td></tr>
                        <tr><td colspan="4"> </td></tr>
                        <tr><td colspan="4"> </td></tr>
                        <tr>
                            <td class="text-left" style="width: 30%; background:#fff; border: 1px solid #ccc;"><strong><?=lang('invoice_issue_date');?></strong></td>
                            <td class="text-left" style="width: 20%; background:#fff; border: 1px solid #ccc;"><?=date('d-m-Y', strtotime($inv->date));?></td>
                            <td class="text-right" style="width: 24%; background:#fff; border: 1px solid #ccc;"><?=date('d-m-Y', strtotime($inv->date));?></td>
                            <td class="text-right" style="width: 30%; background:#fff; border: 1px solid #ccc;"><strong><?='إصدار تاريخ الفاتورة';?></strong></td>
                        </tr>
                        <tr>
                            <td class="text-left" style="width: 30%; background:#fff; border: 1px solid #ccc;"><strong><?=lang('date_of_supply');?></strong></td>
                            <td class="text-left" style="width: 20%; background:#fff; border: 1px solid #ccc;"><?=date('d-m-Y', strtotime($inv->date));?></td>
                            <td class="text-right" style="width: 24%; background:#fff; border: 1px solid #ccc;"><?=date('d-m-Y', strtotime($inv->date));?></td>
                            <td class="text-right" style="width: 30%; background:#fff; border: 1px solid #ccc;"><strong><?='تاريخ التوريد';?></strong></td>
                        </tr>
                    </table>
                </td>
                <td style="width: 50%; text-align: right;">
                    
                        <?php

                            $barcode_content = lang('company_name').': '.$store->name.', '.lang('vat_no').': '.$store->vat_id. ', '.lang('timestamp').': '.date('d-m-Y H:i:s a', strtotime($inv->date)).', '.lang('total_vat').': '.$this->tec->formatMoney($inv->total_tax).', '.lang('total_amount_paid').': '.$this->tec->formatMoney($inv->total+$inv->total_tax);

                            $params['data'] = $barcode_content;
                            echo $this->ciqrcode->generate($params);
                        ?>
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td style="background-color: #5f5c5c;">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;padding: 5px;"><strong><?=lang('Seller');?>:</strong></td>
                            <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;padding: 5px;"><strong>تاجر:</strong></td>
                        </tr>
                    </table>
                </td>
                <td style="background-color: #5f5c5c;">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;padding: 5px;"><strong><?=lang('Buyer');?>:</strong></td>
                            <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;padding: 5px;"><strong>مشتر:</strong></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$store->name;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">اسم:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$customer->name;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">اسم:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Building no.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$store->address1;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">لا للبناء.</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Building no.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=!empty($customer->address1) ? $customer->address1 : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">لا للبناء.</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Street Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$store->address2;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">اسم الشارع:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Street Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=!empty($customer->address2) ? $customer->address2 : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">اسم الشارع:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('District');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">يصرف</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('District');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">يصرف</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('City');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$store->city;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">مدينة</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('City');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=!empty($customer->city) ? $customer->city : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">مدينة</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Country');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$store->country;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">دولة</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Country');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=!empty($customer->country) ? $customer->country : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">دولة</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Postal Code');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$store->postal_code;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">رمز بريدي</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Postal Code');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=!empty($customer->postal_code) ? $customer->postal_code : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">رمز بريدي</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Additional No.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">رقم إضافي</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Additional No.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=!empty($customer->additional_no) ? $customer->additional_no : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">رقم إضافي</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('VAT Number');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$store->vat_id;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">ظريبه الشراء:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('VAT Number');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=!empty($customer->vat_id) ? $customer->vat_id : '' ;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">ظريبه الشراء:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Other Seller ID');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">معرف البائع الآخر:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=lang('Other Seller ID');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;padding: 5px;"><?=$customer->other_seller_id;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;">معرف البائع الآخر:</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <table style="width: 100%;">
            <tr>
                <td style="height:40px;"> </td>
            </tr>
        </table>

        <table style="width: 100%">
            <tr>
                <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;padding: 5px;"><?=lang('Line Items');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;padding: 5px;">البنود:</td>
            </tr>
            <tr>
                <td style="width: 50%; text-align: center;color:#fff;background-color:#5f5c5c; font-weight: bold;">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc; height: 100px;">
                                <?=lang('nature_of_goods_or_service');?> <br> <?= 'طبيعة البضاعة والخدمة'; ?>

                            </td>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc;">
                                <?=lang('unit_price');?> <br> <?= 'سعر الوحدة';?>
                            </td>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc;">
                                <?=lang('quantity');?> <br> <?= 'كمية';?>
                            </td>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc;">
                                <?=lang('taxable_amount');?> <br> <?= 'المبلغ الخاضع للضريبة';?>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 50%; text-align: center;color:#fff;background-color:#5f5c5c;font-weight: bold;">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc;">
                                <?=lang('discount');?> <br> <?= 'خصم';?>
                            </td>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc;">
                                <?=lang('tax_rate');?> <br> <?= 'معدل الضريبة'?>
                            </td>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc;">
                                <?=lang('tax_amount');?> <br> <?= 'قيمة الضريبة'?>
                            </td>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc;">
                                <?=lang('item_subtotal');?> <br> <?= 'المجموع الفرعي للبند (متضمنًا ضريبة القيمة المضافة)';?>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <?php
                $tax_summary = [];
                $taxable_amount = 0;
                $storevat = (float) substr($store->vat, 0, -1);

                $total_taxable_amount_excluding = 0;

                foreach ($rows as $row) {
                    //$unit_price_without_vat = $row->net_unit_price - (($row->net_unit_price*$storevat)/100);
                    $unit_price_without_vat = $row->net_unit_price;
                    $taxable_amount = $taxable_amount + ($unit_price_without_vat*$row->quantity);
                    $total_taxable_amount_excluding = $total_taxable_amount_excluding + ($unit_price_without_vat
                                            *$this->tec->formatQuantity($row->quantity));

                    ?>
                        <tr>
                            <td style="width: 50%;color: #000; ">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:left;"><?= $row->product_name;?></td>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:right;"><?= $this->tec->formatMoney($unit_price_without_vat); ?></td>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:right;"><?= $this->tec->formatQuantity($row->quantity); ?></td>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:right;"><?= $this->tec->formatMoney($unit_price_without_vat
                                            *$this->tec->formatQuantity($row->quantity)); ?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;color: #000; ">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:right;"><?= $this->tec->formatMoney($row->discount); ?></td>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:right;"><?= $store->vat; ?></td>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:right;"><?= $this->tec->formatMoney($row->item_tax); ?></td>
                                        <td style="width: 25%;border: 1px solid #ccc;text-align:right;"><?=$this->tec->formatMoney($row->subtotal);?></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
            <?php } ?>
        </table>
        <table style="width: 100%">
            <tr>
                <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;padding: 5px;"><?=lang('total_amounts');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;padding: 5px;">المبالغ الإجمالي:</td>
            </tr>
            <tr>
                <td colspan="2" style="width:100%">
                    <table style="width:100%">
                        <tr>
                            <td>
                                <table style="width:100%">
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><?=lang('total_excluding_vat')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?=lang('الإجمالي (باستثناء ضريبة القيمة المضافة)')?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?=$this->tec->formatMoney($total_taxable_amount_excluding);?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><?=lang('discount')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?='خصم'?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?=lang('')?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><?=lang('total_taxable_amount')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?='إجمالي المبلغ الخاضع للضريبة (باستثناء ضريبة القيمة المضافة)';?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?=$this->tec->formatMoney($taxable_amount);?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><?=lang('total_vat')?>(<?=$store->vat?>)</td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?='إجمالي ضريبة القيمة المضافة';?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?=$this->tec->formatMoney($inv->total_tax);?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><?=lang('total_amount_paid')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?='المبلغ الإجمالي المدفوع';?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?= $this->tec->formatMoney($inv->total+$inv->total_tax); ?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><strong><?=lang('paid_by')?></strong></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><strong><?='مدفوعة';?></strong></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><strong><?= lang($payments[0]->paid_by); ?></strong></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><strong><?=lang('pos_paid_amount')?></strong></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><strong><?='المبلغ المدفوع في نقاط البيع';?></strong></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?= lang($payments[0]->pos_paid); ?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;padding: 5px;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;padding: 5px;"><strong><?=lang('pos_balance_amount')?></strong></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;padding: 5px;"><strong><?='مبلغ رصيد نقاط البيع';?></strong></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;padding: 5px;"><?= lang($payments[0]->pos_balance); ?></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div style="clear:both; height: 30px;"></div>
        <table style="width: 100%">
            <tr>
                <td style="width: 35%; text-align: left;border: 1px solid #ccc; font-weight: bold;padding: 5px;"><?=lang('note');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"><?=nl2br($inv->note);?></td>
            </tr>
             <tr>
                <td style="width: 35%; text-align: left;border: 1px solid #ccc;font-weight: bold;padding: 5px;"><?=lang('payment_note');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc;padding: 5px;"><?=nl2br($payments[0]->note);?></td>
            </tr>
        </table>

        <div style="clear:both; height: 50px;"></div>
        
    </div>
    <div style="clear:both;"></div>
</div>