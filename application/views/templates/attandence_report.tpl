 <!-- salary calender  -->
 <style>
 .select2-selection__clear{
    z-index:10000;
 }
 </style>
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
                                            <span class="hide-menu">Employee</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i>
                                            </span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select form-control" name="employee_drop_down" id="employee_drop_down">
                                                <option value="" >Select Employee</option>
                                                    {{foreach $employee_data as $key => $val}}
                                                         <option value="{{$val['employee_id']}}" >{{$val['full_name']}}</option>
                                                    {{/foreach}}
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="daterange" class="form-control serarch-filter-input m-3 me-0" name="daterange" />
                                                <span class="input-group-text time-picker-addon date-picker-addon"><i class="las la-calendar-alt"></i></span>
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
<script src="{{$base_url}}/public/js/moment.min.js"></script>
<script src="{{$base_url}}/public/js/daterangepicker.js"></script>
<script src="{{$base_url}}/public/js/attandence_report.js"></script>
