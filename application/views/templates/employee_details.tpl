<div class="main-middle-container">
    <div class="sub-header att-sub-header">
        <div class="sub-header-left pull-left">
            <h3>Employee Details</h3>
        </div>
        <div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
            {if $data[0]['is_edit'] == "No"}
            <div class="timesheet-summary-lst"  >
              <a href="employee-add.html?id={$employee_id}" title="Edit"><button type="button" class="btn btn-primary add-designation add-leave add-action">
                <span>Edit</span>
              </button>
                    </a>
            </div>

            {/if}
          </div>
        </div>
        
    </div>
    <div class="inner-container" style="position: static; zoom: 1;">
<section class="h-100 gradient-custom-2">
   <div class="container py-5 h-100 employee-profile-box pt-1">
   <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-lg-9 col-xl-12">
         <div class="card">
            <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
               <div class="ms-4 mt-5 detail-img-block" >
                  <img src="{{$base_url}}public/img/uploads/employee_profile/{{$data[0]['profile_image']}}"
                     alt="Generic placeholder image" class=" mt-4 mb-2"
                     >
               </div>
               <div class="ms-1 name-block" >
                  <h2>{$data[0].first_name} {$data[0].middle_name} {$data[0].last_name}</h2>
                  <p>{$data[0].employee_code}</p>
               </div>
            </div>
            <div class="p-2 text-black menu-bar">
               <div class="d-flex justify-content-end text-center py-2">
                  <div class="row w-100">
                     <div class="col-2">
                     </div>
                     <div class="col-10">
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                           <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Personal Details</button>
                           <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Work Details</button>
                           <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Bank Accounts</button>
                        </div>
                     </div>

                  </div>
               </div>
            </div>
            <nav>
            </nav>
            <div class="tab-content" id="nav-tabContent">
               <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <div class="card-body p-4 text-black employee-contain-box">
                     <div class="mb-4 ">
                        <p class="lead fw-normal mb-2 ms-1">Personal Information</p>
                        <div class="p-4 rounded-2" style="background-color: #ecedef;">
                           <div class="row">
                              <div class="col-3 ">
                                 <div class="title-div">
                                    <strong>Name</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].first_name} {$data[0].middle_name} {$data[0].last_name}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">  
                                    <strong>Email</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].email}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Phone Number</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].phone_code} {$data[0].mobile_number}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Secondary Mobile Number </strong>
                                 </div>
                                 <div>
                                    <span>
                                       {if $data[0].secondary_mobile_number neq ''}
                                          {$data[0].secondary_mobile_code} {$data[0].secondary_mobile_number}
                                       {else}
                                          {display_no_character()}
                                       {/if}
                                    </span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Gender</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].gender}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Marital Status</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].marital_status}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Date Of Birth</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].dob|date_format:"%d %B %Y"}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="mb-4 ">
                        <p class="lead fw-normal mb-2 ms-1">Address Information</p>
                        <div class="p-4 rounded-2"  style="background-color: #ecedef;">
                           <div class="row">
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Country</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].country_name}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>State</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].vState}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>City</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].city}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Pincode</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].zipcode}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Address</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].address}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                 <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <div class="card-body p-4 text-black employee-contain-box">
                    <div class="mb-4">
                        <p class="lead fw-normal mb-2 ms-1">Work Information</p>
                        <div class="p-4 rounded-2" style="background-color: #ecedef;">
                           <div class="row">
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Company</strong>
                                    
                                 </div>
                                 <div class="value-div">
                                    {if in_array($user_data['role'],["arom","admin"])}
                                    <span><a href="{get_entiry_url('company','View',$data[0].company_id)}">{{$data[0].company_name}}</a></span>
                                    {else}
                                    <span>{{$data[0].company_name}}</span>
                                    {/if}
                                 </div>
                              </div>
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Department</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].departmen_name} ({$data[0].department_code})</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Designation</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].designation_name}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Employee Type </strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].role}</span>
                                 </div>
                              </div>
                               <div class="col-3">
                                 <div class="title-div">
                                    <strong>Employee Code</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].employee_code}</span>
                                 </div>
                              </div>
                              {{if $data[0]['reporting_manager'] > 0}}
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Reportiong Manager</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].manager}</span>
                                 </div>
                              </div>

                              {{/if}}
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Joining Date</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].employment_date|date_format:"%d %B %Y"}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Week Off</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].employee_week_off}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Overtime Allowed</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].over_time_allow}</span>
                                 </div>
                              </div>
                              {if $data[0].over_time_allow eq 'Yes'}
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Overtime Rate (Per Hour) </strong>
                                 </div>
                                 <div>
                                    <span>{getNumberFormate($data[0].overtime_rate_per_hour)}</span>
                                 </div>
                              </div>
                              {/if}
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Work Mobile Numbe </strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].work_mobile_code} {$data[0].work_mobile_number} </span>
                                 </div>
                              </div>
                             <div class="col-3">
                                 <div class="title-div">
                                    <strong>Work Email</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].work_email}</span>
                                 </div>
                              </div>
                              
                           </div>
                        </div>
                     </div>
                     <div class="mb-4">
                        <p class="lead fw-normal mb-2 ms-1">Shift Details</p>
                        <div class="p-4 rounded-2" style="background-color: #ecedef;">
                           <div class="row">
                              {if is_valid_array($shift_details)}
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Shift Name</strong>
                                 </div>
                                 <div>
                                    <span>{$shift_details.shift_name}</span>
                                 </div>
                              </div>
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Shift Start Date</strong>
                                 </div>
                                 <div>
                                    <span>{$shift_details.start_date}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Shift End Date</strong>
                                 </div>
                                 <div>
                                    <span>{$shift_details.end_date}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Shift Start Time</strong>
                                 </div>
                                 <div>
                                    <span>{display_no_character($shift_details.start_time)}</span>
                                 </div>
                              </div>
                               <div class="col-3">
                                 <div class="title-div">
                                    <strong>Shift End Time</strong>
                                 </div>
                                 <div>
                                    <span>{display_no_character($shift_details.end_time)}</span>
                                 </div>
                              </div>
                              {else}
                                 <div class="col-12 text-center no-data-found-block">
                                       <img alt="" src="{{$base_url}}public/assets/images/images/no_data_found_new.png" height="150" width="150" class="mt-3">
                                       <br>
                                       <span class="mb-4 no-data-found-message">No shift data found!</span>
                                   </div>
                              {/if}
                           </div>
                        </div>
                     </div>
                     <div class="mb-4">
                        <p class="lead fw-normal mb-2 ms-1">Additional Info</p>
                        <div class="p-4 rounded-2" style="background-color: #ecedef;">
                           <div class="row">
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Aadhar Number</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].aadhar_number}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>PAN Card Number</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].pan_card_number}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>PF Number </strong>
                                 </div>
                                 <div>
                                    <span>{display_no_character($data[0].pf_number)}</span>
                                 </div>
                              </div>
                               <div class="col-3">
                                 <div class="title-div">
                                    <strong>UAN Number</strong>
                                 </div>
                                 <div>
                                    <span>{display_no_character($data[0].uan_number)}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="mb-4">
                        <p class="lead fw-normal mb-2 ms-1">Education details</p>
                        <div class="p-4 rounded-2" style="background-color: #ecedef;">
                           <div class="row">
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Degree</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].education_degree}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Field</strong>
                                 </div>
                                 <div>
                                    <span>{$data[0].education_feild}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>College Name</strong>
                                 </div>
                                 <div>
                                    <span>{display_no_character($data[0].education_college)}</span>
                                 </div>
                              </div>
                               <div class="col-3">
                                 <div class="title-div">
                                    <strong>Pass Out Year</strong>
                                 </div>
                                 <div>
                                    <span>{display_no_character($data[0].education_pass_out_year)}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </div>
               <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                  
                   <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <div class="card-body p-4 text-black employee-contain-box">
                    <div class="mb-4">
                        <p class="lead fw-normal mb-2 ms-1">Bank Information</p>
                        {foreach from=$bank_data item=bank_data_val}
                        <div class="p-4 rounded-2 mb-3" style="background-color: #ecedef;">
                           <div class="row">
                              <div class="col-3 mb-2">
                                 <div class="title-div">
                                    <strong>Bank Name</strong>
                                 </div>
                                 <div>
                                    <span>{$bank_data_val["bank_name"]}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Branch Address</strong>
                                 </div>
                                 <div>
                                    <span>{$bank_data_val['branch_address']}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>IFSC Code </strong>
                                 </div>
                                 <div>
                                    <span>{$bank_data_val['ifsc_code']}</span>
                                 </div>
                              </div>
                               <div class="col-3">
                                 <div class="title-div">
                                    <strong>Account Type</strong>
                                 </div>
                                 <div>
                                    <span>{$bank_data_val['account_type']}</span>
                                 </div>
                              </div>
                              
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Account No</strong>
                                 </div>
                                 <div>
                                    <span>{$bank_data_val['account_no']}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Account Holder Name</strong>
                                 </div>
                                 <div>
                                    <span>{$bank_data_val['account_holder_name']}</span>
                                 </div>
                              </div>
                              <div class="col-3">
                                 <div class="title-div">
                                    <strong>Default Bank</strong>
                                 </div>
                                 <div>
                                    <span>{$bank_data_val['default_bank']} </span>
                                 </div>
                              </div>
                             
                              
                           </div>
                        </div>
                        {/foreach}
                     </div>
                  </div>
               </div>

               </div>
            </div>
</section>

</div>
</div>
<!-- footer end -->
</div>
</div>
</div>
<style>
   @media (max-width: 767.98px) {
   .employee-profile-box .rounded-top.text-white.d-flex{
   height: 158px !important;
   }
   .employee-profile-box .detail-img-block img {
   width: 120px;
   height: 120px;
   border-radius: 50%;
   background: white;
   padding: 2px;
   }
   .employee-profile-box  .card .name-block {
   margin-top: 99px !important;
   }
   .employee-profile-box  .card .name-block h2{
   font-size: 17px !important;
   }
   .employee-profile-box  .detail-img-block {
   width: 134px;
   z-index: 1;
   }
   .employee-profile-box .card .name-block p {
   font-size: 13px !important;
   }
   .card-body .row span{
   letter-spacing: 0.4px;
   overflow: hidden;
   vertical-align: top;
   max-width: 115px;
   }
   .employee-profile-box {
   max-width: 100% !important;
   }
   }
   .employee-profile-box {
          max-width: 98%;
   }
   .card-body .row .col-3{
   margin-bottom: 1rem !important;
   }
   .card-body .row strong{
   font-size: 15px;
   }
   .card-body .row strong{
   font-size: 16px;
   color: #807b85 !important;
   }
   .fw-normal {
   font-weight: 500 !important;
   font-size: 20px;
   font-family: 'GilroySemibold', sans-serif !important;
   }
   .card .name-block h2{
   color: #fff;
   margin-bottom: 0px
   }
   .card .name-block p{
   letter-spacing: 2px;
   color: #fff;
   font-size: 16px; 
   }
   .title-div{
   margin-bottom: 5px;
   }
   .card .name-block{
   margin-top: 119px;
   }
   .detail-img-block{
   width: 206px;
   z-index: 1;
   }
   .detail-img-block img{
   width: 180px;
   height: 180px;
   border-radius: 50%;
   background: white;
   padding: 2px;
   }
   .img-fluid.profile-image{
   max-width: 150px !important;
   max-height: 150px !important;
   height:100%;
   border-radius: 50% !important;
   }
   .image-body-box{
   margin-bottom: 26px !important;
   }
   .main-details-box {
   width: 81% !important;
   }
   .menu-bar {
   background: #d4d4d4;
   border-radius: 0 0 4px 4px;
   }
   
   .employee-profile-box .nav-link.active {
    margin-bottom: 0px !important;
   /*border-bottom: 3px solid gray !important;*/
   border-radius: 0px;
   background: none !important;
   border: unset;
   }
   .employee-profile-box .nav-tabs .nav-link{
          font-weight: 600;
   border: unset;
   padding-left: 19px;
   padding-right: 19px;
   margin-bottom: 10px;
       font-size: 18px;
       color: var(--bs-nav-tabs-link-active-color);
   }
   .employee-profile-box .nav.nav-tabs{
      border: none;
   }
   .employee-profile-box .nav-link:hover{
     margin-bottom: 0px !important;
   }
   .employee-profile-box .nav-link:hover:after {

       width: 53px;
    }
  .employee-profile-box .nav-link:after {
      bottom: 0;
  }
  .employee-profile-box .nav-link.active:after {
      content: '';
    display: block;
    position: relative;
    width: 54% !important;
    margin-top: 8px;
    background: #898989;
    height: 3px;

  }
  .employee-profile-box .nav-link:hover:after {
      content: '';
      display: block;
      position: relative;
      width: 54% !important;
      background: #898989;
      height: 3px;
      margin-top: 7px;
      transition: width .3s;

  }
  .employee-profile-box .nav-tabs .nav-link.active {
      color: #206DFF;
  }
  .no-data-found-message {
    color: var(--body-text-color) !important;
    font-size: var(--x_normalFont) !important;
       color: black;
       margin-bottom: 0px !important;
       font-size: 18px !important;
   }
   .no-data-found-block img {
    width: 7% !important;
       height: 70% !important;
       -webkit-filter: invert(20%) !important;
   }

</style>
{include file="footer.tpl" }