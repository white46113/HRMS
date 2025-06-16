
{if count($bank_data) == 0}
<div class="form-contain border border-primary rounded-2 border border-2 p-3">
    <div class="row action-box">
        <input type="hidden" name="bank_id[{$index}]" value="">
        <div class="col-10"></div>
        <div class="col-2">
            <i class="ti ti-trash h2 pe-3 ps-2 float-right cursor delete-bank" data-id=""></i>
            <div class="float-right pt-1 pe-2"><label class="h4">Default :</label><input class="form-check-input mt-1 ms-2" type="checkbox" value="Yes" aria-label="Checkbox for following text input " id="default_bank_check_{$index}" name="defaul_bank[{$index}]" /></div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="bank_name" class="form-label">Bank Name<span class="star_required">*</span></label>
            <input type="text" class="form-control" id="bank_name_{$index}" name="bank_name[{$index}]" placeholder="Enter Bank Name" />
        </div>
        <div class="col">
            <label for="branch_address" class="form-label">Branch Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="branch_address_{$index}" name="branch_address[{$index}]" placeholder="Enter Branch Name" />
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="ifsc_code" class="form-label">IFSC Code <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="ifsc_code_{$index}" name="ifsc_code[{$index}]" placeholder="Enter IFSC Code" />
        </div>
        <div class="col">
            <label for="account_type" class="form-label">Account Type<span class="star_required">*</span></label>
            <select class="form-select form-control" name="account_type[{$index}]" id="account_type_{$index}">
                <option value="">Select Account Type</option>
                <option value="Saving">Saving</option>
                <option value="Current">Current</option>
                <option value="Domestic">Domestic</option>
            </select>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="account_number" class="form-label">Account Number<span class="star_required">*</span></label>
            <input type="text" class="form-control" id="account_number_{$index}" name="account_number[{$index}]" placeholder="Enter Account Number" />
        </div>
        <div class="col">
            <label for="account_holder_name" class="form-label">Account Holder Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="account_holder_name_{$index}" name="account_holder_name[{$index}]" placeholder="Enter Account Holder Name" />
        </div>
    </div>
</div>

{else}
    {foreach from=$bank_data key=key_val item=bank_data_val}
        <div class="form-contain border border-primary rounded-2 border border-2 p-3">
            <div class="row action-box">
                <input type="hidden" name="bank_id[{$key_val}]" value="{$bank_data_val['id']}">
                <div class="col-10"></div>
                <div class="col-2">
                    <i class="ti ti-trash h2 pe-3 ps-2 float-right cursor delete-bank" data-id="{$bank_data_val['id']}"></i>
                    <div class="float-right pt-1 pe-2"><label class="h4">Default :</label><input class="form-check-input mt-1 ms-2" id="default_bank_check_{$key_val}" type="checkbox" value="Yes" aria-label="Checkbox for following text input" name="defaul_bank[{$key_val}]" {if $bank_data_val['default_bank'] == 
                        'Yes'}checked{/if}/></div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="bank_name" class="form-label">Bank Name<span class="star_required">*</span></label>
                    <input type="text" class="form-control" id="bank_name_{$key_val}" name="bank_name[{$key_val}]" value="{$bank_data_val['bank_name']}" placeholder="Enter Bank Name" />
                </div>
                <div class="col">
                    <label for="branch_address" class="form-label">Branch Name <span class="star_required">*</span></label>
                    <input type="text" class="form-control" id="branch_address_{$key_val}" name="branch_address[{$key_val}]" value="{$bank_data_val['branch_address']}" placeholder="Enter Branch Name" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="ifsc_code" class="form-label">IFSC Code <span class="star_required">*</span></label>
                    <input type="text" class="form-control" id="ifsc_code_{$key_val}" name="ifsc_code[{$key_val}]" value="{$bank_data_val['ifsc_code']}" placeholder="Enter IFSC Code" />
                </div>
                <div class="col">
                    <label for="account_type" class="form-label">Account Type<span class="star_required">*</span></label>
                    <select class="form-select form-control" name="account_type[{$key_val}]"  id="account_type_{$key_val}">
                        <option value="">Select Account Type</option>
                        <option value="Saving" {if $bank_data_val['account_type'] == 'Saving'}selected{/if}>Saving</option>
                        <option value="Current" {if $bank_data_val['account_type'] == 'Current'}selected{/if}>Current</option>
                        <option value="Domestic" {if $bank_data_val['account_type'] == 'Domestic'}selected{/if}>Domestic</option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="account_number" class="form-label">Account Number<span class="star_required">*</span></label>
                    <input type="text" class="form-control" id="account_number_{$key_val}" name="account_number[{$key_val}]" value="{$bank_data_val['account_no']}" placeholder="Enter Account Number" />
                </div>
                <div class="col">
                    <label for="account_holder_name" class="form-label">Account Holder Name <span class="star_required">*</span></label>
                    <input type="text" class="form-control" id="account_holder_name_{$key_val}" name="account_holder_name[{$key_val}]" value="{$bank_data_val['account_holder_name']}" placeholder="Enter Account Holder Name" />
                </div>
            </div>
        </div>
    {/foreach}

{/if}