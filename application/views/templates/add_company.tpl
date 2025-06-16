
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css" />
<link rel="stylesheet" href="public/css/employee.css" />
<link rel="stylesheet" href="public/css/company_add_update.css" />
<link rel="stylesheet" href="public/css/steper.css" />
<div class="main-middle-container">
    <div class="sub-header att-sub-header">
        <div class="sub-header-left pull-left">
            <h3>{if $mode == 'Add'}Add Company{else}Update Company{/if}</h3>
        </div>
        <div class="sub-header-right pull-right">
            <div class="timesheet-summary icon-box">
                <div class="timesheet-summary-lst">
                    <div class="dropdown grid-drop-down">
                        <a class="btn btn-secondary top-btn-row" href="{$back_url}" title="Back">
                            <i class="ti ti-arrow-left"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="inner-container" style="position: static; zoom: 1;">
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
   
    <div
      class="position-relative overflow-hidden  min-vh-100 d-flex outer-div-box">
      <div class="d-flex w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-11 mb-4 mt-3">
            <div class="card mb-0">
              <div class="card-body">
                <div class="step-bar">
                    <ol id="progressbar" class="mb-5">
                        <li class=" active_step step-first-block step_top" data-step = '1'>
                            <div class="icon-div"><i class="ti ti-user"></i></div>
                        </li>
                        <li class="step-second-block step_top" data-step="2">
                            <div class="icon-div"><i class="ti ti-building-bank"></i></div>
                        </li>
                       
                    </ol>
                </div>
                <form action="javascript:void(0)" method="POST" id="company_form">
                    <input id="company_id" value="{$company_data['company_id']}" type="hidden" name="company_id">
                    <input id="mode" value="{$mode}" type="hidden" name="mode">
                    <input id="country_code" value="{$company_data['country_code']}" type="hidden" name="country_code">
                  <div class="details-block step-1 step-form">
                        <div class="row mb-3 title-block">
                            <label class="h3">Personal Details</label>
                        </div>
                        <div class="form-contain">
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="company_name" class="form-label">Company Name <span class="star_required">*</span></label>
                                    <input type="text" class="form-control" id="company_name" name="company_name" placeholder="Enter Company Name" value="{$company_data['company_name']}">
                                </div>
                            
                                <div class="col">
                                    <label for="company_email" class="form-label">Email <span class="star_required">*</span></label>
                                    <input type="text" value="{$company_data['company_email']}"" class="form-control" id="company_email" name="company_email" placeholder="Enter Email">
                                    
                                </div>


                            </div>

                            {if $mode eq "Add"}
                            <div class="row mb-3">
                              <div class="col">
                                  <label for="company_prefix" class="form-label">Prefix <span class="star_required">*</span></label>
                                  <input type="text" class="form-control" id="company_prefix" name="company_prefix" placeholder="Enter Company Prefix" value="">
                              </div>
                          
                              <div class="col">
                                  <label for="attendance_pin" class="form-label">Attendence Pin <span class="star_required">*</span></label>
                                  <input type="text" value="" class="form-control" id="attendance_pin" name="attendance_pin" placeholder="Enter Attendence Pin">
                                  
                              </div>


                          </div>
                            {/if}
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="company_code" class="form-label">Company Code </label>
                                    <input type="text" value ="{$company_data['company_code']}" class="form-control" id="company_code" placeholder="" name="company_code" style="text-transform: uppercase;">
                                </div>
                                <div class="col">
                                    <label for="company_logo" class="form-label">Company Logo<span class="star_required">*</span></label>
                                    <div class="file-input-wrapper">
                                        <input type="file" class="form-control" id="fileInput" onchange="updateFileName(this)" name="company_logo" style="display:none" value="">

                                        <div class="update-file-block cursor don1" id="fileInputName">
                                          <!-- <label class='input-group-text fileInputBox' for="fileInput" style="border-radius: 5px 0px 0px 5px !important;">Choose file</label>   -->
                                          <input type="text"  id="profile_image_name" class="form-control cursor  ignoreThisClass image_input" value="{if $company_data['company_logo'] neq ''} {$company_data['company_logo']}{else}No file choosen{/if}"  style="border-radius: 0px 5px 5px 0px !important;">
                                          <!-- <span class="don">
                                            {if $company_data['company_logo'] neq ''}
                                            {$company_data['company_logo']}
                                            {else}
                                             No file choosen
                                            {/if}
                                          </span> -->
                                           <label for="file" class="btn image-upload-block-box" >
                                                            <i class="ti ti-upload"></i>
                                                            <span class="js-fileName">Upload a file</span>
                                                            <span tooltip="Valid extensions : gif, png, jpg, jpeg, jpe, bmp, ico.&#xa;Valid size : Less than (<) 5 MB.&#xa;" flow="left" class="tooltip-icon float-right"><i class="ti ti-info-square-rounded cursor"></i></span>
                                                          </label>
                                        </div>
                                        <div id="imageContainer">
                                          {if $mode eq 'Update' && $company_data['company_logo'] neq ''}<img src="{$company_data['log_url']}/{$company_data['company_logo']}">{/if}
                                        </div>
                                      </div>

                                    <!-- <label for="company_logo" class="form-label">Company Logo</label>
                                    <input type="file" class="form-control" id="company_logo" name="company_logo" placeholder="*******"> -->
                                </div>

                            </div>

                            <div class="row mb-3">
                                <div class="col">

                                    <label for="contact_person" class="form-label">Contact Person <span class="star_required">*</span></label>
                                    <input type="text" class="form-control" value="{$company_data['contact_person']}" id="contact_person" name="contact_person" placeholder="Enter Contact Person">

                                </div>
                                <div class="col mobile_number">
                                    <div class="form-group mb-1">
                                        <label for="contact_number" class="w-100 form-label"> Contact Number <span class="star_required">*</span></label>
                                        <input type="text" class="form-control tel-input" value="{$company_data['contact_number']}" id="contact_number" name="contact_number" placeholder="Enter Contact Number">
                                    </div>

                                </div>

                            </div>
                            
                            
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="country" class="form-label">Country <span class="star_required">*</span></label>
                                    <select class="form-select form-control custom_error" name="country" id="country" >
                                    <option value="">Select Country</option>

                                    {foreach from=$country item=countryname}
                                    <option value="{$countryname.id}" {if $countryname.id eq $company_data['country'] } selected {elseif $countryname.country_code eq $default_company && $mode eq 'Add'}selected{/if} >{$countryname.country_name}</option>
                                    {/foreach}

                                    </select>
                                    
                                </div>
                                <div class="col">
                                    <label for="state" class="form-label">State <span class="star_required">*</span></label>
                                    <select class="form-select form-control custom_error" name="state" id="state">
                                    <option value="">Select State</option>

                                    {foreach from=$state item=stateName}
                                    <option value="{$stateName.iStateId}" {if $stateName.iStateId eq $company_data['state'] } selected {/if}>{$stateName.vState}</option>
                                    {/foreach}

                                    </select>
                                    
                                </div>


                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="city" class="form-label">City </label>
                                    <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" value="{$company_data['city']}">
                                </div>
                                <div class="col">
                                    <label for="address" class="form-label">Address <span class="star_required">*</span></label>
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address" value="{$company_data['company_address']}">
                                </div>

                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="zipcode" class="form-label">Zipcode <span class="star_required">*</span></label>
                                    <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Enter Zipcode" value="{$company_data['zip_code']}">
                                </div>
                                <div class="col">
                                    <label for="website" class="form-label">Website </label>
                                    <input type="text" class="form-control" id="website" name="website" placeholder="Enter Website" value="{$company_data['website']}">
                                    
                                </div>

                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="gst_number" class="form-label">GST Number <span class="star_required">*</span></label>
                                    <input type="text" class="form-control" id="gst_number" name="gst_number" placeholder="Enter GST Number" value="{$company_data['gst_number']}">
                                </div>
                                <div class="col">
                                    <label for="founding_date" class="form-label">Date of Founding<span class="star_required">*</span></label>
                                    
                                    <div class="input-group">
                                    <input type="text" class="form-control custom_error" id="founding_date" name="founding_date" placeholder="Select Date of Founding" value="{$company_data['date_founded']}">
                                    <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                    
                                    </div>
                                    
                                    <!-- <label id="founding_date-err" class="error" for="founding_date"></label> -->
                                </div>

                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="tan_number" class="form-label">TAN Number </label>
                                    <input type="text" class="form-control" id="tan_number" name="tan_number" placeholder="Enter TAN Number" value="{$company_data['tan_number']}">
                                </div>
                                <div class="col">
                                    <label for="pan_number" class="form-label">PAN Number <span class="star_required">*</span></label>
                                    <input type="text" class="form-control" id="pan_number" name="pan_number" placeholder="Enter Pan Number" value="{$company_data['pan_number']}"> 
                                    
                                </div>

                            </div>
                            <div class="row mb-3">
                                
                                <div class="col-6">
                                    <label for="description" class="form-label">Description </label>
                                    <textarea type="text" class="form-control" id="description" name="description" placeholder="Enter discription" value="">{$company_data['description']} </textarea>
                                </div>
                                

                            </div>
                        </div>
                        </div>
                        <div class="address-block step-2 step-form hide" >
                           <div class="row mb-4 title-block">
                                                    <label class="h3">Bank Detail</label>
                                                    <button type="button" name="add_bank" class="btn btn-primary w-45 add-action add_bank"><i class="ti ti-plus"></i><span>Add Banks</span></button>
                                                </div>
                           
                           
                            {include file='address.tpl'}
                         </div>

              
                      <div class="button-block text-center mt-4" >
                        <button type="button" name="next" class="btn btn-primary w-45 py-8 fs-4 mb-4 rounded-2 next me-3" data-current="">Next</button>
                        <button type="button" name="back" class="btn btn-outline-secondary w-45 py-8 fs-4 mb-4 rounded-2 back hide me-3">Back</button>
                        <button type="button" id="submit_button" name="submit" class="btn btn-primary w-45 py-8 fs-4 mb-4 rounded-2 submit hide me-3">Submit</button>
                        <a href="company.html"><button type="button" name="discard" class="btn btn-outline-danger  w-45 py-8 fs-4 mb-4 rounded-2 discard">Discard</button></aa>
                      </div>
                      </div>
                </form>
               
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- extra for footer -->
        </div>
    </div>
  </div>
    </div>
     <script type="text/javascript" >
        var bank_data = {{$bank_data|json_encode}};
    </script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput-jquery.min.js"></script>
        <script class="iti-load-utils" async="" src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/js/utils.js"></script>
  <script src="public/js/company.js"></script>
 {include file="footer.tpl" }