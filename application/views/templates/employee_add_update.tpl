''
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css" />
<link rel="stylesheet" href="public/css/employee.css" />
<link rel="stylesheet" href="public/css/steper.css" />
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
    <div class="sub-header-left pull-left">
        <h3>{if $mode == 'Add'}Add Employee{else}Update Employee{/if}</h3>
        
    </div>
    <div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
            <div class="timesheet-summary-lst">
                <div class="dropdown grid-drop-down">
                  <a class="btn btn-secondary top-btn-row" href="{$back_url}" title="Back"  >
                        <i class="ti ti-arrow-left"></i>
                    
                  </a>
                  
                </div>
            </div>
          </div>
        </div>
    

</div>
<div class="inner-container" style="position: static; zoom: 1;">
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
            <div class="position-relative overflow-hidden  min-vh-100 d-flex align-items-center justify-content-center outer-div-box">
                <div class="d-flex w-100">
                    <div class="row justify-content-center w-100">
                        <div class="col-md-8 col-lg-6 col-xxl-11 mt-3 mb-4">
                            <div class="card mb-0">
                                <div class="card-body">
                                    <div class="step-bar">
                                        <ol id="progressbar" class="mb-5">
                                            <li class="active active_step step-first-block">
                                                <div class="icon-div"><i class="ti ti-user"></i></div>
                                            </li>
                                            <li class="step-second-block">
                                                <div class="icon-div"><i class="ti ti-address-book"></i></div>
                                            </li>
                                            <li class="step-third-block">
                                                <div class="icon-div"><i class="ti ti-building-bank"></i></div>
                                            </li>
                                        </ol>
                                    </div>

                                    <form action="javascript:void(0)" method="POST" id="employee_registration">
                                        <input type="hidden" name="mode" value="{$mode}" id="mode">
                                        <input type="hidden" name="employee_id" value="{$employee_data['employee_id']}" id="employee_id">
                                        <div class="personal-details step-first-form" >
                                            <div class="row mb-3 title-block">
                                                <label class="h3">Personal Details</label>
                                            </div>
                                            <div class="form-contain">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="first_name" class="form-label">First Name <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="first_name" name="first_name" value="{$employee_data['first_name']}" placeholder="Enter First Name" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="middle_name" class="form-label">Middle Name </label>
                                                        <input type="text" class="form-control" id="middle_name" name="middle_name" value="{$employee_data['middle_name']}" placeholder="Enter Middle Name" />
                                                    </div>
                                                    <div class="col">
                                                        <label for="last_name" class="form-label">Last Name <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="last_name" name="last_name" value="{$employee_data['last_name']}" placeholder="Enter Last Name" />
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="email" class="form-label">Email <span class="star_required">*</span></label>
                                                        <input type="email" class="form-control" id="email" name="email" value="{$employee_data['email']}" placeholder="Enter Email" />
                                                    </div>

                                                    <div class="col dob">
                                                        <label for="dob" class="form-label">Date of Birth <span class="star_required">*</span></label>

                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="dob" name="dob" value="{getDatePickerFormat($employee_data['dob'])}" placeholder="Select Date of Birth" />

                                                            <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col mobile_number">
                                                        <div class="form-group mb-1">
                                                            <label for="mobile_number" class="w-100 form-label">Mobile Number <span class="star_required">*</span></label>
                                                            <input type="text" class="form-control tel-input" id="mobile_number" name="mobile_number" placeholder="Enter Mobile Number" value="{$employee_data['mobile_number']}"/>
                                                        </div>
                                                    </div>

                                                    <div class="col secondary_number">
                                                        <div class="form-group mb-1">
                                                            <label for="secondary_number" class="w-100 form-label">Secondary Mobile Number </label>
                                                            <input type="text" class="form-control tel-input" id="secondary_number" name="secondary_number" placeholder="Enter Secondary Mobile Number" value="{$employee_data['secondary_mobile_number']}" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col gender-box">
                                                        <div class="form-group mb-0">
                                                            <label for="gender" class="form-label ">Gender <span class="star_required">*</span></label><br />
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input form-control" type="radio" name="gender" id="male" value="Male" {{if $employee_data['gender'] == 'Male'}} checked {{/if}}/>
                                                                <label class="form-check-label " for="male">Male</label>
                                                            </div>
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input" type="radio" name="gender" id="female" value="Female" {{if $employee_data['gender'] == 'Female'}} checked {{/if}}/>
                                                                <label class="form-check-label" for="female">Female</label>
                                                            </div>
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input" type="radio" name="gender" id="other" value="Other" {{if $employee_data['gender'] == 'Other'}} checked {{/if}}/>
                                                                <label class="form-check-label" for="other">Other</label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col marital-box">
                                                        <div class="form-group mb-0">
                                                            <label for="marital_status" class="form-label">marital Status <span class="star_required">*</span></label><br />
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input form-control" type="radio" name="marital_status" id="single" value="Single" {{if $employee_data['marital_status'] == 'Single'}} checked {{/if}}/>
                                                                <label class="form-check-label" for="single">Single</label>
                                                            </div>
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input" type="radio" name="marital_status" id="married" value="Married" {{if $employee_data['marital_status'] == 'Married'}} checked {{/if}}/>
                                                                <label class="form-check-label" for="married">Married</label>
                                                            </div>
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input" type="radio" name="marital_status" id="other_status" value="Other" {{if $employee_data['marital_status'] == 'Other'}} checked {{/if}}/>
                                                                <label class="form-check-label" for="other">Other</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                {if $mode == "Add"}
                                                <div class="row mb-3">
                                                    <div class="col password-box">
                                                        <label for="password" class="form-label">Password <span class="star_required">*</span></label>
                                                        <div class="input-group">
                                                            <input type="password" class="form-control" id="password" name="password" placeholder="*******" />
                                                            <span class="input-group-text date-picker-addon">
                                                            <i class=" ti ti-eye password-icon cursor"  style=""></i>
                                                          </span>
                                                        </div>
                                                    </div>
                                                    <div class="col password-box">
                                                        <label for="confirm-password" class="form-label">Confirm Password <span class="star_required">*</span></label>
                                                        <div class="input-group">
                                                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="*******" />
                                                            <span class="input-group-text date-picker-addon">
                                                            <i class=" ti ti-eye password-icon cursor"  style=""></i>
                                                          </span>
                                                            <!-- <i class=" ti ti-eye password-icon cursor" id="passwordIconHide" style=""></i> -->
                                                        </div>
                                                    </div>
                                                </div>

                                                {/if}
                                                <div class="row mb-3">
                                                    <div class="col-6 col">
                                                        <label for="profile_image" class="form-label">Profile Image <span class="star_required">*</span></label>
                                                        <input type="file" class="form-control image_input" id="profile_image" name="profile_image" value="{$employee_data['profile_image']}" {if $mode=="Update"}style="display: none;"{/if} />
                                                        <label for="file" class="btn image-upload-block-box  mt-1" {if $mode=="Update"}style="display: none;"{/if}>
                                                            <i class="ti ti-upload"></i>
                                                            <span class="js-fileName">Upload a file</span>
                                                            <span tooltip="Valid extensions : gif, png, jpg, jpeg, jpe, bmp, ico.&#xa;Valid size : Less than (<) 5 MB.&#xa;" flow="right" class="tooltip-icon float-right"><i class="ti ti-info-square-rounded cursor"></i></span>
                                                          </label>
                                                        {if $mode=="Update"}
                                                        <div class="input-group mb-1 update-file-block cursor" id="customFileInput">
                                                          <input type="text" name="profile_image_name" class="form-control cursor image_input"  aria-describedby="basic-addon1" >
                                                          <label for="file" class="btn image-upload-block-box  mt-1" >
                                                            <i class="ti ti-upload"></i>
                                                            <span class="js-fileName">Upload a file</span>
                                                            <span tooltip="Valid extensions : gif, png, jpg, jpeg, jpe, bmp, ico.&#xa;Valid size : Less than (<) 5 MB.&#xa;" flow="right" class="tooltip-icon float-right"><i class="ti ti-info-square-rounded cursor"></i></span>
                                                          </label>
                                                        </div>
                                                        {/if}
                                                        <div class="col-2 col update-imeg-file ps-0 mb-2"  {if $mode=="Add"}style="display: none;"{/if}>
                                                        <div class="mt-2">

                                                            <img src="{{$base_url}}public/img/uploads/employee_profile/{{$employee_data['profile_image']}}" width="100">
                                                        </div>
                                                    </div>

                                                    
                                                    </div>
                                                    
                                                    
                                                </div>

                                            </div>
                                            <div {if $role eq 'employee'} style="display: none"{/if}>
                                            <div class="row mb-3 title-block">
                                                <label class="h3">Work Details</label>
                                            </div>
                                            <div class="form-contain">
                                                <div class="row mb-3">
                                                    <div class="col-6" {if $role != 'arom'} style="display: none" {/if}>
                                                        <label for="country" class="form-label">Company <span class="star_required">*</span></label>
                                                        <select class="form-select form-control" name="company" id="company">
                                                            <option value="">Select Company</option>
                                                            {foreach from=$company_details item=company_name}
                                                                {if $company_name.company_id == $selected_company}
                                                                    <option value="{$company_name.company_id}" selected>{$company_name.company_name}</option>
                                                                {else}
                                                                    <option value="{$company_name.company_id}">{$company_name.company_name}</option>
                                                                {/if}
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="department" class="form-label">Department <span class="star_required">*</span></label>
                                                        <select class="form-select form-control" name="department" id="department">
                                                            <option value="">Select Department</option>
                                                            {foreach from=$department item=department_val}
                                                            {if $department_val.department_id == $employee_data['department']}
                                                                <option value="{$department_val.department_id}" selected>{$department_val.departmen_name} [{$department_val.department_code}]</option>
                                                            {else}
                                                                <option value="{$department_val.department_id}">{$department_val.departmen_name} [{$department_val.department_code}]</option>
                                                            {/if}
                                                            
                                                            {/foreach}
                                                        </select>
                                                        
                                                    </div>

                                                    <div class="col">
                                                        <label for="designation" class="form-label">Designation <span class="star_required">*</span></label>
                                                        <select class="form-select form-control" name="designation" id="designation">
                                                            <option value="">Select Designation</option>
                                                            {foreach from=$designation item=designation_val}
                                                            {if $designation_val.id == $employee_data['designation']}
                                                                <option value="{$designation_val.id}" selected>{$designation_val.designation_name}</option>
                                                            {else}
                                                                <option value="{$designation_val.id}">{$designation_val.designation_name}</option>
                                                            {/if}
                                                            {/foreach}
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="row mb-3">

                                                	 <div class="col-6 col ">
                                                        <div>
                                                            <label for="employement_type" class="form-label">Employee Type <span class="star_required">*</span></label>
                                                        </div>
                                                        <select class="form-select form-control" name="employement_type" id="employement_type">

                                                            {foreach from=$employement_type item=employement_type_val}
                                                                {if $employement_type_val.id == $employee_data['role']}
                                                                    <option value="{$employement_type_val.id}" selected>{$employement_type_val.val}</option>
                                                                {else}
                                                                    <option value="{$employement_type_val.id}" >{$employement_type_val.val}</option>
                                                                {/if}
                                                            {/foreach}
                                                        </select>
                                                    </div>

                                                    <div class="col manager-block">
                                                        <label for="manager" class="form-label">Reporting Senior <span class="star_required">*</span></label>
                                                        <select class="form-select form-control" name="manager" id="manager">
                                                            <option value="">Select Reporting Senior</option>
                                                            {foreach from=$manager item=manager_val}
                                                                {if $manager_val.employee_id == $employee_data['reporting_manager']}
                                                                    <option value="{$manager_val.employee_id}" selected>{$manager_val.name}</option>
                                                                {else}
                                                                    <option value="{$manager_val.employee_id}">{$manager_val.name}</option>
                                                                {/if}
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                    
                                                </div>

                                                <div class="row mb-3">
                                                	<div class="col employement_date">
                                                        <label for="dob" class="form-label">Joining Date <span class="star_required">*</span></label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="employement_date" name="employement_date" placeholder="Select Joining Date" value="{getDatePickerFormat($employee_data['employment_date'])}" />

                                                            <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                                        </div>
                                                    </div>
                                                    <div class="col col-6 ">
                                                        <div>
                                                            <label for="week_off" class="form-label">Week Off <span class="star_required">*</span></label>
                                                        </div>
                                                        <select class="form-select form-control" name="week_off" id="week_off">
                                                            <option value="Monday">Monday</option>
                                                            <option value="Tuesday">Tuesday</option>
                                                            <option value="Wednesday">Wednesday</option>
                                                            <option value="Thursday">Thursday</option>
                                                            <option value="Friday">Friday</option>
                                                            <option value="Saturday">Saturday</option>
                                                            <option value="Sunday">Sunday</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                	
                                                    <div class="col col-6 work_mobile_number">
                                                        <div class="form-group mb-1">
                                                            <label for="work_mobile_number" class="w-100 form-label">Work Mobile Number <span class="star_required">*</span></label>
                                                            <input type="text" class="form-control tel-input" id="work_mobile_number" name="work_mobile_number" placeholder="Enter Work Mobile Number" value="{$employee_data['work_mobile_number']}"/>
                                                        </div>
                                                    </div>
                                                
                                                	<div class="col col-6 ">
                                                        <label for="work_email" class="form-label">Work Email <span class="star_required">*</span></label>
                                                        <input type="email" class="form-control" id="work_email" name="work_email" placeholder="Enter Work Email" value="{$employee_data['work_email']}"/>
                                                    </div>
                                                    
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col overtime-allow-box">
                                                        <div class="form-group mb-0">
                                                            <label for="overtime_allow" class="form-label">Overtime Allowed <span class="star_required">*</span></label><br />
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input form-control" type="radio" name="overtime_allow" id="yes" value="Yes" {{if $employee_data['over_time_allow'] == 'Yes' || $mode == 'Add'}} checked {{/if}}/>
                                                                <label class="form-check-label" for="yes">Yes</label>
                                                            </div>
                                                            <div class="form-check form-check-inline mt-2">
                                                                <input class="form-check-input" type="radio" name="overtime_allow" id="no" value="No" {{if $employee_data['over_time_allow'] == 'No'}} checked {{/if}}/>
                                                                <label class="form-check-label" for="no">No</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col col-6 overtime_rate" {{if $employee_data['over_time_allow'] == 'No'}}style="display: none;"{{/if}}>
                                                        <label for="work_email" class="form-label">Overtime Rate (Per Hour) <span class="star_required">*</span></label>
                                                        <div class="input-group ">
                                                            <span class="input-group-text prefix-block"><i class="ti ti-currency-rupee"></i></span>
                                                            <input type="text" class="form-control w-auto number-formatter" id="overtime_rate_per_hour" name="overtime_rate_per_hour" placeholder="Enter Overtime Rate" value="{getNumberFormate($employee_data['overtime_rate_per_hour'])}"/>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="attachment-details step-second-form" style="display: none;">
                                            <div class="row mb-3 title-block">
                                                <label class="h3">Address</label>
                                            </div>

                                            <div class="form-contain">
                                                <div class="row mb-3">
                                                    <div class="col-6 col">
                                                        <label for="country" class="form-label">Country <span class="star_required">*</span></label>
                                                        <select class="form-select form-control" name="country" id="country">
                                                            <option value="">Select Country</option>

                                                            {foreach from=$country item=countryname}
                                                                {if $countryname.id == $employee_data['country']}
                                                                    <option value="{$countryname.id}" selected>{$countryname.country_name}</option>
                                                                {else}
                                                                    <option value="{$countryname.id}">{$countryname.country_name}</option>
                                                                {/if}
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                    <div class="col-6 col">
                                                        <label for="state" class="form-label">State <span class="star_required">*</span></label>
                                                        <select class="form-select form-control" name="state" id="state">
                                                            <option value="">Select State</option>

                                                            {foreach from=$state item=stateName}
                                                                {if $stateName.iStateId == $employee_data['state']}
                                                                    <option value="{$stateName.iStateId}" selected="">{$stateName.vState}</option>
                                                                {else}
                                                                    <option value="{$stateName.iStateId}">{$stateName.vState}</option>
                                                                {/if}
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-6">
                                                        <label for="city" class="form-label">City <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" value="{$employee_data['city']}"/>
                                                    </div>
                                                    <div class="col-6">
                                                        <label for="address" class="form-label">Address <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address" 
                                                        value="{$employee_data['address']}" />
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-6 col">
                                                        <label for="zipcode" class="form-label">Zip code <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Enter Zip code"  value="{$employee_data['zipcode']}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 title-block">
                                                <label class="h3">Additional Info</label>
                                            </div>

                                            <div class="form-contain">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="aadhar_number" class="form-label">Aadhar Number <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="aadhar_number" name="aadhar_number" placeholder="Enter Aadhar Number" value="{$employee_data['aadhar_number']}"/>
                                                    </div>
                                                    <div class="col">
                                                        <label for="pan_card_number" class="form-label">PAN Card Number <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="pan_card_number" name="pan_card_number" placeholder="Enter PAN Card Number" value="{$employee_data['pan_card_number']}"/>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="pf_number" class="form-label">PF Number </label>
                                                        <input type="text" class="form-control" id="pf_number" name="pf_number" placeholder="Enter PF Number " value="{$employee_data['pf_number']}"/>
                                                    </div>
                                                    <div class="col">
                                                        <label for="uan_number" class="form-label">UAN Number </label>
                                                        <input type="text" class="form-control" id="uan_number" name="uan_number" placeholder="Enter UAN Number " value="{$employee_data['uan_number']}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 title-block">
                                                <label class="h3">Education details</label>
                                            </div>

                                            <div class="form-contain">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="degree_name" class="form-label">Degree<span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="degree_name" name="degree_name" placeholder="Enter Degree" value="{$employee_data['education_degree']}"/>
                                                    </div>
                                                    <div class="col">
                                                        <label for="education_field" class="form-label">Field <span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="education_field" name="education_field" placeholder="Enter Field" value="{$employee_data['education_feild']}"/>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="college_name" class="form-label">College Name<span class="star_required">*</span></label>
                                                        <input type="text" class="form-control" id="college_name" name="college_name" placeholder="Enter College Name" value="{$employee_data['education_college']}"/>
                                                    </div>
                                                    <div class="col">
                                                        <label for="pass_out_year" class="form-label">Pass Out Year <span class="star_required">*</span></label>
                                                        <input type="number" class="form-control" id="pass_out_year" name="pass_out_year" placeholder="Enter Pass Out Year" value="{$employee_data['education_pass_out_year']}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="banck-details step-third-form" style="display: none;">
                                            <div class="row mb-4 title-block">
                                                <label class="h3">Bank Detail</label>
                                                <button type="button" class="btn btn-primary add-leave add-action" id="add-bank">
                                                    <i class="ti ti-plus"></i>
                                                    <span class="add-bank">Add Bank</span>
                                                </button>
                                            </div>
                                            <div class="banck-details-rows">
                                               <!--  <div class="form-contain border border-primary rounded-2 border border-2 p-3">
                                                    <div class="row action-box">
                                                        <div class="col-10"></div>

                                                        <div class="col-2">
                                                            <i class="ti ti-trash h2 pe-3 ps-2 float-right cursor delete-bank"></i>
                                                            <div class="float-right pt-1 pe-2">
                                                                <label class="h4">Default :</label><input class="form-check-input mt-1 ms-2" type="checkbox" aria-label="Checkbox for following text input" name="defaul_bank[0]" value="Yes" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col">
                                                            <label for="bank_name" class="form-label">Bank Name<span class="star_required">*</span></label>
                                                            <input type="text" class="form-control" id="bank_name_0" name="bank_name[]" placeholder="Bank Name" />
                                                        </div>
                                                        <div class="col">
                                                            <label for="branch_address" class="form-label">Branch Address <span class="star_required">*</span></label>
                                                            <input type="text" class="form-control" id="branch_address_0" name="branch_address[]" placeholder="Branch Address" />
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col">
                                                            <label for="ifsc_code" class="form-label">IFSC Code <span class="star_required">*</span></label>
                                                            <input type="text" class="form-control" id="ifsc_code_0" name="ifsc_code[]" placeholder="IFSC Code" />
                                                        </div>
                                                        <div class="col">
                                                            <label for="account_type" class="form-label">Account Type<span class="star_required">*</span></label>
                                                            <select class="form-select form-control" name="account_type[]" id="account_type_0">
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
                                                            <input type="text" class="form-control" id="account_number_0" name="account_number[]" placeholder="Account Number" />
                                                        </div>
                                                        <div class="col">
                                                            <label for="account_holder_name" class="form-label">Account Holder Name <span class="star_required">*</span></label>
                                                            <input type="text" class="form-control" id="account_holder_name_0" name="account_holder_name[]" placeholder="Account Holder Name" />
                                                        </div>
                                                    </div>
                                                </div> -->
                                                {include file='bank_add_templete.tpl'}
                                            </div>
                                        </div>
                                        <div class="text-center step-first-btn mt-5">
                                            <button type="button" name="user_signup" class="btn btn-primary py-8 fs-4 rounded-2 me-3 next" data-target="step-second" data-current="step-first">Next</button>
                                            <a href="{$back_url}" name="user_signup" class="btn btn-outline-danger py-8 fs-4 rounded-2 discard" >Discard</a>
                                        </div>

                                        <div class="text-center step-second-btn mt-5" style="display: none;">
                                            <button type="button" name="user_signup" class="btn btn-outline-secondary py-8 fs-4 rounded-2 previous me-3" data-target="step-first" data-current="step-second">Back</button>
                                            <button type="button" name="user_signup" class="btn btn-primary py-8 fs-4 rounded-2 me-3 next" data-target="step-third" data-current="step-second" data-pre="step-first">Next</button>
                                            <a href="{$back_url}" name="user_signup" class="btn btn-outline-danger py-8 fs-4 rounded-2 discard" >Discard</a>
                                        </div>

                                        <div class="text-center step-third-btn mt-5" style="display: none;">
                                            <button type="button" name="user_signup" class="btn btn-outline-secondary py-8 fs-4 rounded-2 previous me-3" data-target="step-second" data-current="step-third">Back</button>
                                            <button type="button" data-current="step-third" name="user_signup" class="btn btn-primary py-8 fs-4 rounded-2  me-3 next">Submit</button>
                                            <a href="{$back_url}" name="user_signup" class="btn btn-outline-danger py-8 fs-4 rounded-2 discard" >Discard</a>
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

</div>

</div>
<!-- extra for footer -->
        </div>
    </div>
  </div>
    </div>

    <script type="text/javascript" >
        var month_arr = {{$months|json_encode}};
        var leave_dates = {{$leave_dates|json_encode}};
        var leave_range_arr = {{$leave_range_arr|json_encode}};
        var date_range_arr = {{$date_range_arr|json_encode}};
        var employee_week_off = {{$employee_data['employee_week_off']|json_encode}};
        var mode = {{$mode|json_encode}};
        var mobile_code = {{$employee_data['phone_code']|json_encode}};
        var mobile_number = {{$employee_data['mobile_number']|json_encode}};
        var secondary_mobile_code = {{$employee_data['secondary_mobile_code']|json_encode}};
        var secondary_mobile_number = {{$employee_data['secondary_mobile_number']|json_encode}};
        var work_mobile_code = {{$employee_data['work_mobile_code']|json_encode}};
        var work_mobile_number = {{$employee_data['work_mobile_number']|json_encode}};
        var profile_image = {{$employee_data['profile_image']|json_encode}};
        var index= {{$index|json_encode}};
        var role= {{$role|json_encode}};
    </script>
     <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput-jquery.min.js"></script>
        <script class="iti-load-utils" async="" src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/js/utils.js"></script>
<script src="public/js/employee_registration.js"></script>
 {include file="footer.tpl" }


        