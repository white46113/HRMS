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
                                                {{foreach from=$status_arr key=key item=val}}
					                            	<option value="{$val['val']}" >{$val['val']}</option>
					                            {{/foreach}}
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Employee Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="employee_name_search" class="form-control">
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
                                              <input type="text" id="employee_code_search" class="form-control">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Reference Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="reference_date_search"  placeholder="Reference Date">
                                               <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Combo Off Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="combo_off_date_search"  placeholder="Combo Off Date">
                                               <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Combo Off Reason</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="combo_off_reason_search" class="form-control">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Approve/Reject Reason	</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="comment_search" class="form-control">
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
            <h3>Combo Off Request</h3>
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
                    <div class="dropdown grid-drop-down">
                      <button class="btn btn-secondary top-btn-row" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="las la-list-ul" style="color: black"></i>
                      </button>
                      <ul class="dropdown-menu p-0 mt-1" aria-labelledby="dropdownMenuButton1">
                        <li  class="active table" data-value="Table"><label>Table</label> <i class="las la-stream" style="color: black"></i></li>
                        <li  class="grid" data-value="Grid"><label>Grid</label><i class="las la-border-all" style="color: black"></i></li>

                      </ul>
                    </div>
                </div>
                
            </div>
            
           
        </div>
        </div>
    </div>
    <div class="inner-container" style="position: static; zoom: 1;">
        <div class="timesheet-container">
            <div class="custom-modal-content custom-content-table-with-fixed-column data_table_block">
                <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table display" style="border-collapse: collapse;" border-color="#e1e1e1" id="example">
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


<div class="modal fade leave-popup-block" id="combo_off_aprove_reject" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalToggleLabel">Leave Reuqest</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="main-content">
                	<div class="main-content">
					    <div class="card mb-3 user-details-block">
					        <input type="hidden" value="" id="combo_off_request_id" />
					        <div class="row g-0 m-3">
					            <div class="col-2">
					                <div class="image-block">
					                    <img src="" width="100" height="100" />
					                </div>
					            </div>
					            <div class="col-10 employee-detils">
					                <div class="row">
					                    <div class="col-4 p-1">
					                        <span class="employee-name employee-name-block"></span>
					                        <span class="emp-grid-code employee-code-box" ></span>
					                    </div>
					                    <div class="col-4 p-1 location-block">
					                        <span class="title-box">Location</span>
					                        <span class="val-box"></span>
					                    </div>
					                    <div class="col-4 p-1 designation-block">
					                        <span class="title-box">Designation</span>
					                        <span class="val-box"></span>
					                    </div>
					                    <div class="col-4 p-1 department-block">
					                        <span class="title-box">Department</span>
					                        <span class="val-box"></span>
					                    </div>
					                    <div class="col-4 p-1 week-off-block">
					                        <span class="title-box">Week Off</span>
					                        <span class="val-box"></span>
					                    </div>
					                    
					                </div>
					            </div>
					        </div>
					    </div>
					    <div class="card mb-3 user-details-block">
					        <div class="row g-0 m-3">
					            <div class="col-12 employee-detils">
					                <div class="row">
					                    <div class="col-3 p-1">
					                        <span class="title-box">Reference Date</span>
					                        <span class="val-box reference-date-block"></span>
					                    </div>
					                    <div class="col-3 p-1">
					                        <span class="title-box">Combo Off Date</span>
					                        <span class="val-box combo-off-date-block"></span>
					                    </div>
					                    <div class="col-3 p-1">
					                        <span class="title-box">Over Time</span>
					                        <span class="val-box over-time-block"></span>
					                    </div>
					                    <div class="col-3 p-1">
					                        <span class="title-box">Reason</span>
					                        <span class="val-box reason-block"></span>
					                    </div>
					                    <div class="col-4 p-1">
					                        <span class="title-box mb-2">Comment</span>
					                        <span>
				                                    <textarea class="form-control" id="combo_off_comment" name="combo_off_comment" placeholder="Comment" ></textarea>	
				                            </span>
					                    </div>
					                    
					                </div>
					            </div>
					        </div>
					    </div>
					    <div class="card mb-3 leave-box">
					        <div class="row g-0 m-3">
					            <div class="col-12 text-center">
					                <div class="ms-3">
					                    <div class="radio-toolbar combo_off_aprove_reject_check">
					                        <input type="radio" id="approveAll" name="allReqs" value="approve" />
					                        <label for="approveAll" class="me-3"><i class="fas fa-check-circle"></i> Approve </label>

					                        <input type="radio" id="denyAll" name="allReqs" value="reject" />
					                        <label for="denyAll"><i class="fas fa-times-circle"></i> Reject </label>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>

            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button class="btn btn-primary submit-combo-off-approval" >Submit</button>
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
<link rel="stylesheet" href="public/css/combo_off_request.css" />
<!-- <link rel="stylesheet" href="public/css/leave.css" /> -->
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
    var base_url = {{$base_url|json_encode}};
</script>
     
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="public/js/combo_off_request.js"></script>
{include file="footer.tpl" }
