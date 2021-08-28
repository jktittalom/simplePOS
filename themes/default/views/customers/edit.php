<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box box-primary">
        <div class="box-header">
          <h3 class="box-title"><?= lang('update_info'); ?></h3>
        </div>
        <div class="box-body">
          <?php echo form_open("customers/edit/".$customer->id);?>

          <div class="col-md-6">
            <div class="form-group">
              <label class="control-label" for="code"><?= $this->lang->line("name"); ?></label>
              <?= form_input('name', set_value('name', $customer->name), 'class="form-control input-sm" id="name"'); ?>
            </div>

            <div class="form-group">
              <label class="control-label" for="email_address"><?= $this->lang->line("email_address"); ?></label>
              <?= form_input('email', set_value('email', $customer->email), 'class="form-control input-sm" id="email_address"'); ?>
            </div>

            <div class="form-group">
              <label class="control-label" for="phone"><?= $this->lang->line("phone"); ?></label>
              <?= form_input('phone', set_value('phone', $customer->phone), 'class="form-control input-sm" id="phone"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="address1"><?= $this->lang->line("address1"); ?></label>
              <?= form_input('address1', set_value('address1', $customer->address1), 'class="form-control input-sm" id="address1"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="address2"><?= $this->lang->line("address2"); ?></label>
              <?= form_input('address2', set_value('address2', $customer->address2), 'class="form-control input-sm" id="address2"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="city"><?= $this->lang->line("city"); ?></label>
              <?= form_input('city', set_value('city', $customer->city), 'class="form-control input-sm" id="city"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="state"><?= $this->lang->line("state"); ?></label>
              <?= form_input('state', set_value('state', $customer->state), 'class="form-control input-sm" id="state"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="postal_code"><?= $this->lang->line("postal_code"); ?></label>
              <?= form_input('postal_code', set_value('postal_code', $customer->postal_code), 'class="form-control input-sm" id="postal_code"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="vat_id"><?= $this->lang->line("vat_id"); ?></label>
              <?= form_input('vat_id', set_value('vat_id', $customer->vat_id), 'class="form-control input-sm" id="vat_id"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="additional_no"><?= $this->lang->line("additional_no"); ?></label>
              <?= form_input('additional_no', set_value('additional_no', $customer->additional_no), 'class="form-control input-sm" id="additional_no"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="other_seller_id"><?= $this->lang->line("other_seller_id"); ?></label>
              <?= form_input('other_seller_id', set_value('other_seller_id', $customer->other_seller_id), 'class="form-control input-sm" id="other_seller_id"');?>
            </div>

            <div class="form-group">
              <label class="control-label" for="cf1"><?= $this->lang->line("ccf1"); ?></label>
              <?= form_input('cf1', set_value('cf1', $customer->cf1), 'class="form-control input-sm" id="cf1"'); ?>
            </div>

            <div class="form-group">
              <label class="control-label" for="cf2"><?= $this->lang->line("ccf2"); ?></label>
              <?= form_input('cf2', set_value('cf2', $customer->cf2), 'class="form-control input-sm" id="cf2"');?>
            </div>


            <div class="form-group">
              <?php echo form_submit('edit_customer', $this->lang->line("edit_customer"), 'class="btn btn-primary"');?>
            </div>
          </div>
          <?php echo form_close();?>
        </div>
      </div>
    </div>
  </div>
</section>
