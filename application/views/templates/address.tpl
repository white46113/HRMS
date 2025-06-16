{if count($bank_data) == 0}
<div class=" address-sub-block form-contain border border-primary rounded-2 border border-2 p-3">
    <!-- <div class="row mb-3">
        <label for="mark_as_default" class="form-label">Mark as Default 
            <input type="checkbox" id="mark_as_default_{{$index}}"  name="mark_as_default[{$index}]" class="default-check" value="Yes"/>
            <i class="ti ti-trash remove-address"></i>
        </div> -->

    <div class="row action-box">
        
        <div class="col-10"></div>
        <div class="col-2">
            <i class="ti ti-trash h2 pe-3 ps-2 float-right cursor remove-address" ></i>
            <div class="float-right pt-1 pe-2">
                 <label class="h4">Default :</label> <input type="checkbox" id="mark_as_default_{{$index}}"  name="mark_as_default[{$index}]" class="default-check form-check-input  mt-1 ms-2" value="Yes" />
            </div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="bank_name" class="form-label">Bank Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="bank_name_{{$index}}" name="bank_name[{$index}]" placeholder="Enter Bank Name">
        </div>
        <div class="col">
            <label for="bank_address" class="form-label">Branch Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="bank_address_{{$index}}" name="bank_address[{$index}]" placeholder="Enter Branch Name">
            
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="ifsc_code" class="form-label">IFSC Code<span class="star_required">*</span></label>
            <input type="text" class="form-control" id="ifsc_code_{{$index}}" name="ifsc_code[{$index}]" placeholder="Enter IFSC code">
        </div>
        <div class="col">
            <label for="acc_type" class="form-label">Account Type <span class="star_required">*</span></label>
            <select class="form-select form-control acc_type" name="acc_type[{$index}]" id="acc_type_{{$index}}" >
                <option value="">Select Account Type</option>
                <option value="Current">Current</option>
                <option value="Domestic">Domestic</option>
                <option value="Saving">Saving</option>
                </select>
            

        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="acc_numner" class="form-label">Account Number <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="acc_numner_{{$index}}" name="acc_numner[{$index}]" placeholder="Enter Account Number">
        </div>
        <div class="col">
            <label for="acc_holder" class="form-label">Account Holder Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="acc_holder_{{$index}}" name="acc_holder[{$index}]" placeholder="Enter Account Holder Name">

        </div>
    </div>
</div>
{else}
{foreach from=$bank_data key=index item=item_val}
<div class="address-sub-block form-contain border border-primary rounded-2 border border-2 p-3">
    <input type="hidden" id="bank_id_{{$index}}" value="{$item_val['id']}" name="bank_id[{$index}]">
    <!-- <div class="row mb-3">
        <label for="mark_as_default" class="form-label">Mark as Default
            
            <input type="checkbox" id="mark_as_default_{{$index}}"  name="mark_as_default[{$index}]" class="default-check" value="Yes" {if $item_val['default_bank'] == 'Yes'} checked {/if}/>
            <i class="ti ti-trash remove-address"></i>
        </div> -->
    <div class="row action-box">
        <!-- <input type="hidden" name="bank_id[0]" value="{$item_val['id']}" /> -->
        <div class="col-10"></div>
        <div class="col-2">
            <i class="ti ti-trash h2 pe-3 ps-2 float-right cursor remove-address" data-id="14"></i>
            <div class="float-right pt-1 pe-2">
                 <label class="h4">Default :</label> <input type="checkbox" id="mark_as_default_{{$index}}"  name="mark_as_default[{$index}]" class="default-check form-check-input  mt-1 ms-2" value="Yes" {if $item_val['default_bank'] == 'Yes'} checked {/if}/>
            </div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="bank_name" class="form-label">Bank Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="bank_name_{{$index}}" name="bank_name[{$index}]" placeholder="Enter Bank Name" value="{$item_val['bank_name']}">
        </div>
        <div class="col">
            <label for="bank_address" class="form-label">Branch Name  <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="bank_address_{{$index}}" name="bank_address[{$index}]" placeholder="Enter Branch Name" value="{$item_val['branch_address']}">
            
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="ifsc_code" class="form-label">IFSC Code<span class="star_required">*</span></label>
            <input type="text" class="form-control" id="ifsc_code_{{$index}}" name="ifsc_code[{$index}]" placeholder="Enter IFSC code" value="{$item_val['ifsc_code']}">
        </div>
        <div class="col">
            <label for="acc_type" class="form-label">Account Type <span class="star_required">*</span></label>
            <select class="form-select form-control acc_type" name="acc_type[{$index}]" id="acc_type_{{$index}}" >
                <option value="">Select Account Type</option>
                <option value="Current" {if $item_val['account_type'] == 'Current'} selected {/if}>Current</option>
                <option value="Domestic" {if $item_val['account_type'] == 'Domestic'} selected {/if}>Domestic</option>
                <option value="Saving" {if $item_val['account_type'] == 'Saving'} selected {/if}>Saving</option>
                </select>
            

        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <label for="acc_numner" class="form-label">Account Number <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="acc_numner_{{$index}}" name="acc_numner[{$index}]" placeholder="Enter Account Number" value="{$item_val['account_no']}">
        </div>
        <div class="col">
            <label for="acc_holder" class="form-label">Account Holder Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="acc_holder_{{$index}}" name="acc_holder[{$index}]" placeholder="Enter Account Holder Name" value="{$item_val['account_holder_name']}">

        </div>
    </div>
    

</div>
{/foreach}
{/if}
