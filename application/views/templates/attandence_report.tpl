 <!-- salary calender  -->
<link rel="stylesheet" href="public/css/plugin/SemanticCalender/semantic_calender.css" />
<script src="public/js/plugin/SemanticCalender/semantic_calender.js"></script>
<!-- salary calender  -->
<div class="main-middle-container">
    <aside class="right-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between filter-title-bolock">
            <a href="javascript:void(0)" class="text-nowrap logo-img">
                Filter
            </a>
            <div class="close-filter-btn d-xl-none d-block filter-popup cursor-pointer" >
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar filter-block" data-simplebar="init">
            <div class="simplebar-wrapper" style="margin: 0px -24px;">
                <div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div>
                <div class="simplebar-mask">
                    <div class="simplebar-offset" style="right: -7px; bottom: 0px;">
                        <div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: 100%; overflow-y: scroll;">
                            <div class="simplebar-content" style="padding: 0px 15px;">
                                <ul id="sidebarnav" class="in">
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Status</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i>
                                            </span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select form-control" name="status_drop_down" id="status_drop_down">
                                                <option value="" >Select Status</option>
                                                    <option value="Active" >Active</option>
                                                    <option value="Inactive" >Inactive</option>
                                                    <option value="Pending" >Pending</option>
                                                    <option value="Block" >Block</option>
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="employee_name_search" class="form-control" placeholder="Name">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Employee Code</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="employee_code_search" class="form-control" placeholder="Employee Code">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Joining Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="join_date_search"  placeholder="Joining Date">
                                               <span class="input-group-text time-picker-addon date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Email</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="email_search" class="form-control"  placeholder="Email">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Department</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <!-- <input type="text" class="form-control" id="department_search"  placeholder="Department"> -->
                                              <select class="form-select form-control" name="department_search" id="department_search" value="">
                                                    <!-- <option value="" >Select Department</option> -->
                                                    <option value=""></option>
                                                    {{foreach from=$department key=key_val item=department_val}}
                                                        <option value="{{$department_val['department_id']}}" >{{$department_val['department']}}</option>
                                                    {{/foreach}}
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Designation</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <!-- <input type="text" class="form-control" id="designation_search"  placeholder="Designation">  -->
                                              <select class="form-select form-control" name="designation_search" id="designation_search">
                                                    <option value="" ></option>
                                                    
                                                    {{foreach from=$designation key=key_val item=designation_val}}
                                                        <option value="{{$designation_val['designation_id']}}" >{{$designation_val['designation']}}</option>
                                                    {{/foreach}}
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                </ul>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="simplebar-placeholder" style="width: auto; height: 810px;"></div>
            </div>
            <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="width: 0px; display: none;"></div></div>
            <div class="simplebar-track simplebar-vertical" style="visibility: visible;"><div class="simplebar-scrollbar" style="height: 214px; display: block; transform: translate3d(0px, 0px, 0px);"></div></div>
        </nav>
         <div class="filter-popup-btn">
            <button class="btn btn-primary reset-filter">Reset</button>
            <button class="btn btn-primary search-filter">Search</button>
        </div>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
    <div class="sub-header att-sub-header">
        <div class="sub-header-left pull-left">
            <h3>Attandence Report</h3>
        </div>
        <div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
          <div class="timesheet-summary-lst">
                <div class="dropdown grid-drop-down " title="Download CSV">
                        <button class="btn btn-secondary top-btn-row" type="button"  id="downloadCSVBtn">
                            <i class="ti ti-file-type-csv" style="color: black"></i> 
                        </button>
                </div>
            </div>
            <div class="timesheet-summary-lst">
                <div class="dropdown grid-drop-down " title="Download PDF">
                        <button class="btn btn-secondary top-btn-row" type="button"  id="downloadPDFBtn">
                            <i class="ti ti-file-type-pdf" style="color: black"></i> 
                        </button>
                </div>
            </div>
           
            <div class="timesheet-summary-lst">
                   <div class="dropdown grid-drop-down reset-filter" title="Reset Filter">
                        <button class="btn btn-secondary top-btn-row" type="button"  >
                            <i class="ti ti-refresh " style="color: black"></i> 
                        </button>
                    </div>
                </div>
            <div class="timesheet-summary-lst">
                   <div class="dropdown grid-drop-down filter-popup" title="Filter">
                        <button class="btn btn-secondary top-btn-row" type="button"  >
                            <i class="ti ti-filter " style="color: black"></i> 
                        </button>
                    </div>
                </div>
           
            
          </div>
        </div>
        </div>
    </div>
   
    <div class="inner-container" style="position: static; zoom: 1;">
        <div class="timesheet-container">
             <div class="w-100">
        <input type="text" name="reason" placeholder="Filter Search" class="form-control serarch-filter-input m-3 me-0" id="serarch-filter-input" fdprocessedid="bxkoib">
      </div>
            <div class="custom-modal-content custom-content-table-with-fixed-column">
                <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table" style="border-collapse: collapse;" border-color="#e1e1e1" id="attandence_report">
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="week_off_add" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalToggleLabel">Add week off</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="main-content">
                <div class="card mb-3 in-time-correction-box">
                    <input type="hidden"  value="" id="employee-id">
                        <div class="row g-0 m-3">
                            
                            <div class="col-4">
                                <div class="ms-3">
                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Week Off </p>                                   
                                </div>
                            </div>
                            <div class="col-8 text-center">
                                <select class="form-select form-control" name="week_off" id="week_off">
                                  <option value="Monday" >Monday</option>
                                  <option value="Tuesday" >Tuesday</option>
                                  <option value="Wednesday" >Wednesday</option>
                                  <option value="Thursday" >Thursday</option>
                                  <option value="Friday" >Friday</option>
                                  <option value="Saturday" >Saturday</option>
                                  <option value="Sunday" >Sunday</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
            </div>


          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button class="btn btn-primary submit-week-off" >Submit</button>
          </div>
        </div>
      </div>
    </div>
</div>
<div class="modal fade" id="salary_block" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header border-bottom">
        <h4 class="modal-title" id="exampleModalToggleLabel">Employee Salary Slip</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body " style="font-size: 26px;font-weight: 600;">
       
        <div class="row mt-3">
            <div class="col-5 text-end">
                <input type="hidden" value="1" id="employee-id-val">
                <div class="ms-3 mt-2">
                    <p class="fs-3  fw-bold">Month/Year </p>                                   
                </div>
            </div>
            <div class="col-7 text-start ">
                <div class="input-group ui calendar w-75" id="salary_month_year">
                    <input type="text"  placeholder="Salary slip month" class="form-control hasDatepicker valid"> 
                    <span class="input-group-text time-picker-addon"><i class="las ti ti-calendar-month"></i></span>
                </div>
                <label class="error salary_month_year_error" style="display: none;">Please select salary slip month.</label>
            </div>
        </div>
        <div class="text-center mt-4">
            <button class="btn btn-primary submit-salary-date" style="font-size: 15px;">Pay Slip Download</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
<div class="modal fade" id="edit_approve_block" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <input type="hidden" value="" id="edit_approve_employee-id">
      <div class="modal-header border-bottom">
        <h4 class="modal-title" id="exampleModalToggleLabel">Employee Edit Details</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
           
      </div>
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-secondary submit-approve-edit" data-type="Reject" data style="font-size: 19px;">Reject</button>
        <button class="btn btn-primary submit-approve-edit" data-type="Approve" style="font-size: 19px;">Approve</button>
      </div>
    </div>
  </div>
</div>

<!-- extra for footer -->
</div>
</div>
</div>
</div>
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/employee_listing.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
{include file="footer.tpl" }


 

  <script>
            var column_details = {{$data|json_encode}} ;
            var page_length_arr = {{$page_length_arr|json_encode}} ;
            var is_searching_enable = {{$is_searching_enable|json_encode}} ;
            var is_top_searching_enable = {{$is_top_searching_enable|json_encode}} ;
            var is_paging_enable = {{$is_paging_enable|json_encode}} ;
            var is_serverSide = {{$is_serverSide|json_encode}} ;
            var no_data_message = {{$no_data_message|json_encode}} ;
            var is_ordering = {{$is_ordering|json_encode}} ;
            var sorting_column = {{$sorting_column}} ;
            var api_name = {{$api_name|json_encode}} ;
            var base_url = {{$base_url|json_encode}} ;
            var sheet_prod_column_name = {{$sheet_prod_column_name|json_encode}};
            var stock_column_name = {{$stock_column_name|json_encode}};
            var plastic_prod_column_name = {{$plastic_prod_column_name|json_encode}};
            
           
          </script>
<script src="{{$base_url}}/public/js/attandence_report.js"></script>
