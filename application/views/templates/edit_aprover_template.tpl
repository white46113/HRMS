<div class="main-content">
	<input type="hidden" name="edit_approve_id" id="edit_approve_id" value="{$data['new_employe_data']['employee_id']}">
    <ul class="nav nav-tabs float-left" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Perosonal details</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Work Details</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Bank Details</button>
        </li>
    </ul>
    <ul class="nav nav-tabs justify-content-end updated-by-block" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><label>Updated By : <strong>{$updated_by}</strong></label></button>
        </li>

    </ul>
    

     <div class="tab-content mt-3" id="myTabContent">
            <div class="tab-pane fade show active " id="home" role="tabpanel" aria-labelledby="home">
                <div class="card mb-3 user-details-block">
                <input type="hidden" value="2" id="leave_request_id" />

                <div class="row g-0 m-3">
                    <div class="col-2">
                        <div class="image-block p-2"><img src="{{$base_url}}public/img/uploads/employee_profile/{{$data['new_employe_data']['profile_image_name']}}" alt="" width="100" height="100" class="rounded-circle" /></div>
                    </div>
                    <div class="col-10 employee-detils">
                        <div class="row">
                            <div class="col-3 p-1">
                                <span class="employee-name employee-name-block">{$data['new_employe_data']['first_name']} {$data['new_employe_data']['last_name']}</span>
                                <span class="emp-grid-code" id="employee_code">{$data['old_employe_data']['employee_data']['employee_code']}</span>
                            </div>
                            <div class="col-3 p-1 location-block">
                                <span class="title-box">Email</span>
                                <span class="val-box">{$data['new_employe_data']['email']}</span>
                            </div>
                            <div class="col-3 p-1 designation-block">
                                <span class="title-box">Phone Number</span>
                                <span class="val-box">{$data['new_employe_data']['phone_code']} {$data['new_employe_data']['mobile_number']}</span>
                            </div>
                            {if $data['new_employe_data']['secondary_number'] != ""}
                            <div class="col-3 p-1 department-block">
                                <span class="title-box">Secondary Mobile Number</span>
                                <span class="val-box">{$data['new_employe_data']['secondary_number_code']} {$data['new_employe_data']['secondary_number']}</span>
                            </div>
                            {/if}
                            <div class="col-3 p-1 from-date-block">
                                <span class="title-box">Gender</span>
                                <span class="val-box">{$data['new_employe_data']['gender']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Marital Status</span>
                                <span class="val-box">{$data['new_employe_data']['marital_status']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Date Of Birth</span>
                                <span class="val-box">{$data['new_employe_data']['dob']}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
            <div class="card mb-3 user-details-block">

                <div class="row g-0 m-3">
                	<p class="lead fw-normal mb-2 ms-1 title-box-title">Address Information</p>
                    <div class="col-12 employee-detils">
                        <div class="row">
                            <div class="col-3 p-1">
                                <span class="title-box">Country</span>
                                <span class="val-box" >{$data['new_employe_data']['country']}</span>
                            </div>
                            <div class="col-3 p-1 location-block">
                                <span class="title-box">State</span>
                                <span class="val-box">{$data['new_employe_data']['state']}</span>
                            </div>
                            <div class="col-3 p-1 designation-block">
                                <span class="title-box">City</span>
                                <span class="val-box">{$data['new_employe_data']['city']}</span>
                            </div>
                            <div class="col-3 p-1 department-block">
                                <span class="title-box">Pincode</span>
                                <span class="val-box">{$data['new_employe_data']['zipcode']}</span>
                            </div>
                            <div class="col-3 p-1 from-date-block">
                                <span class="title-box">Address</span>
                                <span class="val-box">{$data['new_employe_data']['address']}</span>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="card mb-3 user-details-block">
                <div class="row g-0 m-3">
                	<p class="lead fw-normal mb-2 ms-1 title-box-title">Work Information</p>
                    <div class="col-12 employee-detils">
                        <div class="row">
                            <div class="col-3 p-1">
                                <span class="title-box">Department</span>
                                <span class="val-box">{$data['new_employe_data']['department']}</span>
                            </div>
                            <div class="col-3 p-1 location-block">
                                <span class="title-box">Designation</span>
                                <span class="val-box">{$data['new_employe_data']['designation']}</span>
                            </div>
                            <div class="col-3 p-1 department-block">
                                <span class="title-box">Employee Type</span>
                                <span class="val-box">{$data['new_employe_data']['employement_type']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Reportiong Manager</span>
                                <span class="val-box">{$data['new_employe_data']['manager']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Joining Date</span>
                                <span class="val-box">{$data['new_employe_data']['employement_date']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Week Off</span>
                                <span class="val-box">{$data['new_employe_data']['week_off']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Overtime Allowed</span>
                                <span class="val-box">{$data['new_employe_data']['overtime_allow']}</span>
                            </div>
                            {{if $data['new_employe_data']['overtime_allow'] eq 'Yes'}}
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Overtime Rate (Per Hour) </span>
                                {{if isset($data['new_employe_data']['overtime_rate_per_hour'])}}
                                    <span class="val-box">{getNumberFormate($data['new_employe_data']['overtime_rate_per_hour'])}</span>
                                {{else}}
                                    <span class="val-box">{getNumberFormate(0)}</span>
                                {{/if}}
                            </div>
                            {{/if}}
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Work Mobile Numbe</span>
                                <span class="val-box">{$data['new_employe_data']['work_mobile_number_code']} {$data['new_employe_data']['work_mobile_number']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Work Email</span>
                                <span class="val-box">{$data['new_employe_data']['work_email']}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3 user-details-block">
                <div class="row g-0 m-3">
                    <p class="lead fw-normal mb-2 ms-1 title-box-title">Additional Info</p>
                    <div class="col-12 employee-detils">
                        <div class="row">
                            <div class="col-3 p-1">
                                <span class="title-box">Aadhar Number</span>
                                <span class="val-box">{$data['new_employe_data']['aadhar_number']}</span>
                            </div>
                            <div class="col-3 p-1 location-block">
                                <span class="title-box">PAN Card Number</span>
                                <span class="val-box">{$data['new_employe_data']['pan_card_number']}</span>
                            </div>
                            <div class="col-3 p-1 department-block">
                                <span class="title-box">PF Number</span>
                                <span class="val-box">{display_no_character($data['new_employe_data']['pf_number'])}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">UAN Number</span>
                                <span class="val-box">{display_no_character($data['new_employe_data']['uan_number'])}</span>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3 user-details-block">
                <div class="row g-0 m-3">
                    <p class="lead fw-normal mb-2 ms-1 title-box-title">Education details</p>
                    <div class="col-12 employee-detils">
                        <div class="row">
                            <div class="col-3 p-1">
                                <span class="title-box">Degree</span>
                                <span class="val-box">{$data['new_employe_data']['degree_name']}</span>
                            </div>
                            <div class="col-3 p-1 location-block">
                                <span class="title-box">Field</span>
                                <span class="val-box">{$data['new_employe_data']['education_field']}</span>
                            </div>
                            <div class="col-3 p-1 department-block">
                                <span class="title-box">College Name</span>
                                <span class="val-box">{$data['new_employe_data']['college_name']}</span>
                            </div>
                            <div class="col-3 p-1 to-date-block">
                                <span class="title-box">Pass Out Year</span>
                                <span class="val-box">{$data['new_employe_data']['pass_out_year']}</span>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">               
                	{foreach from=$data['new_employe_data']['bank_data'] item=bank_data_val}
                	<div class="card mb-3 user-details-block">
                	 <div class="row g-0 m-3 mb-3">

	                    <div class="col-12 employee-detils">
	                        <div class="row">
	                            <div class="col-3 p-1">
	                                <span class="title-box">Bank Name</span>
	                                <span class="val-box">{$bank_data_val['bank_name']}</span>
	                            </div>
	                            <div class="col-3 p-1 location-block">
	                                <span class="title-box">Branch Address</span>
	                                <span class="val-box">{$bank_data_val['branch_address']}</span>
	                            </div>
	                            <div class="col-3 p-1 designation-block">
	                                <span class="title-box">IFSC Code</span>
	                                <span class="val-box">{$bank_data_val['ifsc_code']}</span>
	                            </div>
	                            <div class="col-3 p-1 department-block">
	                                <span class="title-box">Account Type</span>
	                                <span class="val-box">{$bank_data_val['account_type']}</span>
	                            </div>
	                            <div class="col-3 p-1 from-date-block">
	                                <span class="title-box">Account No</span>
	                                <span class="val-box">{$bank_data_val['account_number']}</span>
	                            </div>
	                            <div class="col-3 p-1 to-date-block">
	                                <span class="title-box">Account Holder Name</span>
	                                <span class="val-box">{$bank_data_val['account_holder_name']}</span>
	                            </div>
	                            <div class="col-3 p-1 to-date-block">
	                                <span class="title-box">Default Bank</span>
	                                <span class="val-box">{$bank_data_val['default_bank']}</span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	               </div>	
	                {/foreach}
        </div>
    </div>
</div>
