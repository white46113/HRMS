<div class="main-middle-container">
    <div class="sub-header att-sub-header">
        <div class="sub-header-left pull-left">
            <h3>Company Details</h3>
        </div>
        <div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
            {if in_array($user_data['role'],["arom"])}
            <div class="timesheet-summary-lst"  >
              <a href="add-company.html?id={$id}" title="Edit"><button type="button" class="btn btn-primary add-designation add-leave add-action">
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
              <img src="public/img/uploads/company_logo/{$company_data['company_logo']}"
                alt="Generic placeholder image" class=" mt-4 mb-2"
                >
              <!-- <button type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark"
                style="z-index: 1;">
                Edit profile
              </button> -->
            </div>

            <div class="ms-1 name-block" >
              <h2>{$company_data.company_name} </h2>
              <p>{$company_data.company_code}</p>
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
                           <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Bank Accounts</button>
                        </div>
                     </div>

                  </div>
               </div>
            </div>
          <div class="tab-content" id="nav-tabContent">
               <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <div class="card-body p-4 text-black employee-contain-box">
                     <div class="mb-4 ">
              <p class="lead fw-normal mb-2 ms-1">Personal Information</p>
              <div class="p-4" style="background-color: #f8f9fa;">
                <div class="row">
                    
                    <div class="col-3">
                        <div class="title-div">
                        <strong>Phone Number</strong>
                      </div>
                      <div>
                        <span>{$company_data.contact_number_code} {$company_data.contact_number}</span>
                      </div>
                    </div>
                    <div class="col-3">
                        <div class="title-div">
                        <strong>Website</strong>
                      </div>
                      <div>
                        <span>{$company_data.website}</span>
                      </div>
                    </div>
                    <div class="col-3">
                        <div class="title-div">
                        <strong>Email</strong>
                      </div>
                      <div>
                        <span>{$company_data.company_email}</span>
                      </div>
                    </div>
                    
                   
                    <div class="col-3">
                        <div class="title-div">
                        <strong>Founding Date</strong>
                      </div>
                      <div>
                        <span>{$company_data.date_founded|date_format:"%d %B %Y"}</span>
                      </div>
                    </div>
                    
                </div>
            
               </div>
            </div>
            
           <div class="mb-4 ">
              <p class="lead fw-normal mb-2 ms-1">Address Information</p>
              <div class="p-4" style="background-color: #f8f9fa;">
                <div class="row">
                    <div class="col-3">
                        <div class="title-div">
                        <strong>Address</strong>
                      </div>
                      <div>
                        <span>{$company_data.company_address}</span>
                      </div>
                    </div>
                    <div class="col-3 mb-2">
                      <div class="title-div">
                        <strong>Country</strong>
                      </div>
                      <div>
                        <span>{$company_data.country_name}</span>
                      </div>
                    </div>
                    <div class="col-3">
                      <div class="title-div">
                        <strong>State</strong>
                      </div>
                      <div>
                        <span>{$company_data.vState}</span>
                      </div>
                    </div>
                    <div class="col-3">
                        <div class="title-div">
                        <strong>City</strong>
                      </div>
                      <div>
                        <span>{$company_data.city}</span>
                      </div>
                    </div>
                    
                    <div class="col-3">
                        <div class="title-div">
                        <strong>Zipcode</strong>
                      </div>
                      <div>
                        <span>{$company_data.zip_code}</span>
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
   margin-bottom: 1px !important;
       font-size: 18px;
       color: var(--bs-nav-tabs-link-active-color);
       padding-bottom: 8px;
   }
   .employee-profile-box .nav.nav-tabs{
      border: none;
   }
   .employee-profile-box .nav-link:hover{
     margin-bottom: 0px !important;
      padding-bottom: 0px !important;
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
    margin-top: 6px;
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
      margin-top: 5px;
      transition: width .3s;

  }
  .employee-profile-box .nav-tabs .nav-link.active {
      color: #206DFF;
          padding-bottom: 0px !important;
          margin-bottom: 0px !important;
  }
</style>
{include file="footer.tpl" }