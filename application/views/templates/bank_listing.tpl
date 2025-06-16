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
                                              <select class="form-select form-control" name="account_status_down" id="account_status_down">
                                                <option value="" >Select Status</option>
                                                    <option value="Active" >Active</option>
                                                    <option value="Inactive" >Inactive</option>
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Entity Type</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i>
                                            </span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select form-control" name="entity_drop_down" id="entity_drop_down">
                                                <option value="" >Select Entity Type</option>
                                                    <option value="Employee" >Employee</option>
                                                    <option value="Company" >Company</option>
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Employee / Company Code</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="emp_com_code_search" class="form-control" placeholder="code">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Bank Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="bank_name_search" class="form-control" placeholder="Bank Name">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Branch Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="branch_name_search" class="form-control" placeholder="Branch Name">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">IFSC Code</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="ifsc_code_search"  placeholder="IFSC Code">
                                              <!-- <span class="input-group-text"><i class="las la-calendar-alt"></i></span> -->
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Account Type</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i>
                                            </span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select form-control" name="account_type_drop_down" id="account_type_drop_down">
                                                <option value="" >Select Account Type</option>
                                                    <option value="Saving" >Saving</option>
                                                    <option value="Current" >Current</option>
                                                    <option value="Domestic" >Domestic</option>
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Account Number</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="account_number_search" class="form-control"  placeholder="Account Number">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Account Holder Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="account_holder_search"  placeholder="Account Holder Name">
                                              <!-- <span class="input-group-text"><i class="las la-calendar-alt"></i></span> -->
                                            </div>
                                        </li>
                                    </div>
                                    <!-- <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Designation</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="designation_search"  placeholder="Designation">
                                            </div>
                                        </li>
                                    </div> -->
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
            <h3>Bank List</h3>
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
            <div class="timesheet-summary-lst">
                    <div class="dropdown">
                      <button class="btn btn-secondary top-btn-row" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="las la-fill-drip"></i>
                      </button>
                      <ul class="dropdown-menu p-2 mt-1" aria-labelledby="dropdownMenuButton1">
                        <li title="Active" class="pl-3"><span class="color-box active"></span>Active</li>
                        <li title="Inactive" class="pl-3"><span class="color-box inactive"></span>Inactive</li>

                      </ul>
                    </div>
            </div>
          </div>
        </div>
        </div>
    </div>
    <div class="inner-container" style="position: static; zoom: 1;">
        <div class="timesheet-container">
            <div class="custom-modal-content custom-content-table-with-fixed-column">
                <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table" style="border-collapse: collapse;" border-color="#e1e1e1" id="example">
                    <thead>
                        <tr>
                            {{foreach from=$data key=key item=val}}
                            <th><b>Search {{$val['title']}}</b></th>
                            {{/foreach}}
                        </tr>
                    </thead>
                    <tbody></tbody>
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
<div class="modal fade" id="active_block" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <input type="hidden" value="" id="activate-employee-id">
      <input type="hidden" value="" id="mode-action">
      <div class="modal-header border-bottom">
        <h4 class="modal-title" id="exampleModalToggleLabel">Employee Account Activation</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body border-bottom" style="font-size: 26px;font-weight: 600;">
        Are you sure want to activate this account?
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="font-size: 19px;">No</button>
        <button class="btn btn-primary submit-active" style="font-size: 19px;">Yes</button>
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
<style>
.dataTables_wrapper.no-footer .dt-buttons {
    position: absolute;
    top: -57px;
    right: 176px;
}
.timesheet-container .custom-content-table-with-fixed-column th:first-child, .timesheet-container .custom-content-table-with-fixed-column td{
    padding-left: 10px !important;
}

</style>
<script>
    var column_details =  {{$data|json_encode}};
    var page_length_arr = {{$page_length_arr|json_encode}}
    var is_searching_enable =  {{$is_searching_enable|json_encode}};
    var is_top_searching_enable =  {{$is_top_searching_enable|json_encode}};
    var is_paging_enable =  {{$is_paging_enable|json_encode}};
    var is_serverSide =  {{$is_serverSide|json_encode}};
    var no_data_message =  {{$no_data_message|json_encode}};
    var is_ordering =  {{$is_ordering|json_encode}};
    var sorting_column = {{$sorting_column}}
    var api_name =  {{$api_name|json_encode}};
    var page_name = 'teacher_page';
    var base_url = {{$base_url|json_encode}};
</script>
<script type="text/javascript" src="public/js/bank_listing.js"></script>
{include file="footer.tpl" }
