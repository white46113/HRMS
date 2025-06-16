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
                                            <span class="hide-menu">Status </span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                               <select class="form-select form-control w-100"  id="status_search">
                                               	<option value="" >Select Status </option>
		                                    	{foreach from=$correction_status_arr item=correction_status_val}
		                                            <option value="{$correction_status_val.id} " >{$correction_status_val.val}</option>
		                                        {/foreach}
		                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Emaployee Name </span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                            	<input type="text" class="form-control " id="employee_name_search"  placeholder="Emaployee Name">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Attendance date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>

                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" class="form-control " id="attendance_date_search"  placeholder="Attendance date">
                                              <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Attendance In Time</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control time-picker-input" id="attendance_in_time_search"  placeholder="Attendance In Time">
                                              <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Correction In Time</span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control time-picker-input" id="correction_in_time_search"  placeholder="Correction In Time">
                                              <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Attendance Out Time</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control time-picker-input" id="attendance_out_time_search"  placeholder="Attendance Out Time">
                                              <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Correction Out Time</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control time-picker-input" id="correction_out_time_search"  placeholder="Correction Out Time">
                                              <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
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
            <h3>Attendance Correction Request</h3>
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
                <!-- <div class="timesheet-summary-lst">
                    <div class="dropdown grid-drop-down">
                      <button class="btn btn-secondary top-btn-row" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="las la-list-ul" style="color: black"></i>
                      </button>
                      <ul class="dropdown-menu p-0 mt-1" aria-labelledby="dropdownMenuButton1">
                        <li  class="active table" data-value="Table"><label>Table</label> <i class="las la-stream" style="color: black"></i></li>
                        <li  class="grid" data-value="Grid"><label>Grid</label><i class="las la-border-all" style="color: black"></i></li>

                      </ul>
                    </div>
                </div> -->
                
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

<!-- extra for footer -->
</div>
</div>
</div>
</div>
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/attendance_correction.css" />
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
    var base_url = {{$base_url|json_encode}};
</script>
     
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="public/js/attendance_correction.js"></script>
{include file="footer.tpl" }
