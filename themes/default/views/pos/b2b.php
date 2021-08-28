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
                            <td class="text-left" style="width: 20%; background:#fff; border: 1px solid #ccc;"><?=$inv->id;?></td>
                            <td class="text-right" style="width: 24%; background:#fff; border: 1px solid #ccc;"><?=$inv->id;?></td>
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

                            $barcode_content = lang('company_name').': '.$store->name.', '.lang('vat_no').': '.$store->vat_id. ', '.lang('timestamp').': '.date('d-m-Y H:i:s a', strtotime($inv->date)).', '.lang('total_vat').': '.$this->tec->formatMoney($inv->total_tax).', '.lang('total_amount_paid').': '.$this->tec->formatMoney($inv->total);

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
                            <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;"><strong><?=lang('Seller');?>:</strong></td>
                            <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;"><strong>تاجر:</strong></td>
                        </tr>
                    </table>
                </td>
                <td style="background-color: #5f5c5c;">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;"><strong><?=lang('Buyer');?>:</strong></td>
                            <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;"><strong>مشتر:</strong></td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$store->name;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">اسم:</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$customer->name;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">اسم:</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Building no.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$store->address1;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">لا للبناء.</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Building no.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=!empty($customer->address1) ? $customer->address1 : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">لا للبناء.</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Street Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$store->address2;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">اسم الشارع:</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Street Name');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=!empty($customer->address2) ? $customer->address2 : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">اسم الشارع:</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('District');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">يصرف</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('District');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">يصرف</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('City');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$store->city;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">مدينة</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('City');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=!empty($customer->city) ? $customer->city : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">مدينة</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Country');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$store->country;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">دولة</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Country');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=!empty($customer->country) ? $customer->country : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">دولة</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Postal Code');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$store->postal_code;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">رمز بريدي</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Postal Code');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=!empty($customer->postal_code) ? $customer->postal_code : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">رمز بريدي</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Additional No.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">رقم إضافي</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Additional No.');?></td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=!empty($customer->additional_no) ? $customer->additional_no : '';?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">رقم إضافي</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('VAT Number');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$store->vat_id;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">ظريبه الشراء:</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('VAT Number');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=!empty($customer->vat_id) ? $customer->vat_id : '' ;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">ظريبه الشراء:</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Other Seller ID');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">معرف البائع الآخر:</td>
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
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=lang('Other Seller ID');?>:</td>
                                        <td style="width: 50%; text-align: left;border: 1px solid #ccc;"><?=$customer->other_seller_id;?></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;"></td>
                                        <td style="width: 50%; text-align: right;border: 1px solid #ccc;">معرف البائع الآخر:</td>
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
                <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;"><?=lang('Line Items');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;">البنود:</td>
            </tr>
            <tr>
                <td style="width: 50%; text-align: center;color:#fff;background-color:#5f5c5c; font-weight: bold;">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 25%;border-right: 1px solid; border-color: #ccc; ">
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
                <td style="width: 50%; text-align: left;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;"><?=lang('total_amounts');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc; color:#fff;background-color:#5f5c5c;font-weight: bold;">المبالغ الإجمالي:</td>
            </tr>
            <tr>
                <td colspan="2" style="width:100%">
                    <table style="width:100%">
                        <tr>
                            <td>
                                <table style="width:100%">
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;"><?=lang('total_excluding_vat')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;"><?=lang('الإجمالي (باستثناء ضريبة القيمة المضافة)')?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;"><?=$this->tec->formatMoney($total_taxable_amount_excluding);?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;"><?=lang('discount')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;"><?='خصم'?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;"><?=lang('')?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;"><?=lang('total_taxable_amount')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;"><?='إجمالي المبلغ الخاضع للضريبة (باستثناء ضريبة القيمة المضافة)';?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;"><?=$this->tec->formatMoney($taxable_amount);?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;"><?=lang('total_vat')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;"><?='إجمالي ضريبة القيمة المضافة';?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;"><?=$this->tec->formatMoney($inv->total_tax);?></td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;border: 1px solid #ccc;"></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: left;"><?=lang('total_amount_paid')?></td>
                                        <td style="width:25%;border: 1px solid #ccc;text-align: right;"><?='المبلغ الإجمالي المدفوع';?></td>
                                        <td style="width:20%;border: 1px solid #ccc;text-align: right;"><?= $this->tec->formatMoney($inv->total+$inv->total_tax); ?></td>
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
                <td style="width: 35%; text-align: left;border: 1px solid #ccc; font-weight: bold;"><?=lang('note');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc;"><?=nl2br($inv->note);?></td>
            </tr>
             <tr>
                <td style="width: 35%; text-align: left;border: 1px solid #ccc;font-weight: bold;"><?=lang('payment_note');?>:</td>
                <td style="width: 50%; text-align: right;border: 1px solid #ccc;"><?=nl2br($payments[0]->note);?></td>
            </tr>
        </table>

        <div style="clear:both; height: 50px;"></div>
        
    </div>
    <div style="clear:both;"></div>
</div>