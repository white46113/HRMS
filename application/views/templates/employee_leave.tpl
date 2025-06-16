
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
    <div class="sub-header-left pull-left">
        <h3>Leave</h3>
        
    </div>
    <div class="sub-header-right pull-right">
        <div class="timesheet-summary">
            
            <div class="timesheet-summary-lst year-drop-down ">
                <select class="form-select form-control" name="month_drop_down" id="month_drop_down">
                    {foreach from=$months key=key_val item=month}
                        {{if $key_val+1 == $selected_month}}
                            <option value="{$month}" selected>{$month}</option>
                        {{else}}
                         <option value="{$month}" >{$month}</option>
                        {{/if}}
                    {/foreach}
                </select>
            </div>
            <div class="timesheet-summary-lst">
               <button type="button" class="btn btn-primary add-leave add-action">
               	<i class="ti ti-plus"></i>
               	<span>Apply for leave</span>
           		</button>
            </div>
            <!-- <div class="timesheet-summary-lst">
                <div class="dropdown">
                  <button class="btn btn-secondary " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="las la-fill-drip"></i>
                  </button>
                  <ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton1">
                    <li title="Present" class="pl-3"><span class="color-box present"></span>Present</li>
                    <li title="Absent" class="pl-3"><span class="color-box absent"></span>Absent</li>
                    <li title="Week Off" class="pl-3"><span class="color-box week_off"></span>Week Off</li>
                    
                  </ul>
                </div>
            </div> -->
           
        </div>
    </div>

</div>
<div class="inner-container" style="position: static; zoom: 1;">
    <div class="timesheet-container">

        <div class="custom-modal-content custom-content-table-with-fixed-column ">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" style="border-collapse: collapse;" border-color="#e1e1e1">
                <thead>
                    <tr>
                        <th align="center" valign="middle" class="text-center att-date">Leave Name</th>
                        <th align="center" valign="middle" class="text-center att-date">From Date</th>
                        <th align="center" valign="middle" class="text-center att-time">To Date</th>
                        <th align="center" valign="middle" class="text-center att-time">Type</th>
                        <th align="center" valign="middle" class="text-center att-time">Reason</th>
                        <th align="center" valign="middle" class="text-center att-time">Approved By</th>
                        <th align="center" valign="middle" class="text-center att-time">Applied Leave (Days)</th>
                        <th align="center" valign="middle" class="text-center att-time">Status</th>
                        <th align="center" valign="middle" class="text-center att-time">Action</th>
                    </tr>
                </thead>
               	<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">
                    
               		   {{if count($leave_list) > 0}}
                        {foreach $leave_list as $sem_index => $sem_row}
                        <tr class="leave-request-row">
                             <td align="center" valign="middle" class="text-center att-date leave-name" data-leave-type="{{$sem_row['leave_name']}}">{{get_status($sem_row['leave_name'])}}</td>
                            <td align="center" valign="middle" class="text-center att-date start-date">{{date_formater($sem_row['leave_start_date'])}}</td>
                            <td align="center" valign="middle" class="text-center att-date end-date">{{date_formater($sem_row['leave_end_date'])}}</td>
                            <td align="center" valign="middle" class="text-center att-date ">{{get_status($sem_row['leave_type'])}}</td>
                            <td align="center" valign="middle" class="text-center att-date reason-box">{{display_no_character($sem_row['reason'])}}</td>
                            <td align="center" valign="middle" class="text-center att-date">{{$sem_row['approved_by']}}</td>
                            <td align="center" valign="middle" class="text-center att-date">{{$sem_row['applied_days']}}</td>
                            <td align="center" valign="middle" class="text-center att-date status-row">
                                <span class="{{$sem_row['status']}}">{{get_status($sem_row['status'])}}</span>
                            </td>
                            <td align="center" valign="middle" class="text-center att-date">{{$sem_row['action']}}</td>
                        </tr>
                        {/foreach}
                        {{else}}
                            <tr >
                                <td colspan="10">
                                    <div class="mb-5 no-data-found-block">
                                     <img
                                        alt=""
                                        src="{{$base_url}}public/assets/images/images/no_data_found_new.png"
                                        height="150"
                                        width="150"
                                         class="mt-5"
                                    />
                                    <br>
                                    <span class="mb-4 no-data-found-message">No leave data found!</span>
                                    </div>
                                </td>
                            </tr>


                        {{/if}} 



               	</tbody>
            </table>
        </div>
    </div>
</div>

</div>

<div class="modal fade leave-popup-block" id="employee_leave_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalToggleLabel">Leave Request</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="main-content">
                <div class="card mb-3 user-details-block">
                    <input type="hidden"  value="" id="mode">
                    <input type="hidden"  value="" id="leave_end_date">
                     <input type="hidden"  value="" id="leave_start_date">
                     <input type="hidden"  value="" id="leave_request_id">
                        <div class="row g-0 m-3">
                            
                            <div class="col-2">
                                <div class="image-block">
                                    <img src="{{$base_url}}/public/img/uploads/employee_profile/{{$profile_image}}" width="100" height="100" >                                   
                                </div>
                            </div>
                            <div class="col-10 employee-detils">
                                <div class="row">
                                	<div class="col-4 p-1">
                                		<span class="employee-name">{{$first_name}} {{$middle_name}} {{$last_name}}</span> 
                            			<span class="emp-grid-code" id="employee_code">{{$employee_code}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box">Location</span> 
                            			<span class="val-box" >{{$city}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box" >Designation</span> 
                            			<span class="val-box" >{{$designation_name}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box">Department</span> 
                            			<span class="val-box" >{{$department_name}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box">Week Off</span> 
                            			<span class="val-box" >{{$employee_week_off}}</span>
                                	</div>

                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card mb-3 user-details-block">
                        <div class="row g-0 m-3">
                            <div class="col-12 employee-detils">
                                <div class="row">
                                    <div class="col-4 p-1">
                                        <span class="title-box">Sick Leave</span> 
                                        <span class="val-box" >{{$allocated_leaves['SickLeave']}} Days</span>
                                    </div>
                                    <div class="col-4 p-1">
                                        <span class="title-box" >Paid Leave</span> 
                                        <span class="val-box" >{{$allocated_leaves['PaidLeave']}} Days</span>
                                    </div>
                                    <div class="col-4 p-1">
                                        <span class="title-box">Casual Leave</span> 
                                        <span class="val-box" >{{$allocated_leaves['CasualLeave']}} Days</span>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3 leave-box">
                        <div class="row g-0 m-3">
                            
                            <div class="col-6 p-2">
                                <div class="ms-3">
                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Start Date</p>
                                    <span >
                                    	<div class="input-group ">
										  <input type="text" class="form-control" id="start_date"  placeholder="Select Start Date">
										  <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
										</div>
                                    	
                                    </span>                                    
                                </div>
                            </div>
                            <div class="col-6 p-2">
                                <p class="fs-5 mb-1 fw-bold attendance-lable">End Date</p>
                                <span >
                                    	<div class="input-group ">
										  <input type="text" class="form-control" id="end_date"  placeholder="Select End Date">
										  <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
										</div>
                                    	
                                </span>  
                                    
                            </div>
                            <div class="col-6 p-2">
                                <div class=" half-full-day-box ms-3">
                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Leave Name</p>
                                    <div class=" select-box">
                                    <select class="form-select form-control" name="leave_name" id="leave_name">
                                            <option value=""></option>
                                            {foreach $leave_type as $sem_index => $sem_row}
                                            <option value="{$sem_row['id']}" >{$sem_row['val']}</option>
                                            {/foreach}
                                    </select>
                                </div>
                                </div>  
                                    
                            </div>
                            <div class="col-6 p-2">
                                <div class=" half-full-day-box ">
                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Leave Type</p>
                                    <div class=" select-box">
                                    <select class="form-select form-control" name="leave_type" id="leave_type">
                                        <option value=""></option>
                                            <option value="half_day" >Half Day</option>
                                            <option value="full_day" >Full Day</option>
                                    </select>
                                </div>
                                </div>  
                                    
                            </div>
                            <div class="col-6 p-2 ms-3">
                            	<div class="">
	                                <p class="fs-5 mb-1 fw-bold attendance-lable">Leave Reason</p>
	                                <span >
	                                    	<textarea class="form-control" id="leave_reason" placeholder="Enter Leave reason" ></textarea>
	                                    	
	                                </span>
	                            </div>  
                                    
                            </div>
                            
                        </div>
                    </div>
            </div>


          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button class="btn btn-primary submit-leave" >Submit</button>
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

    <link rel="stylesheet" href="public/css/attendance_sheet.css" />
    <link rel="stylesheet" href="public/css/leave.css" />

    <script type="text/javascript" >
        var month_arr = {{$months|json_encode}};
        var leave_dates = {{$leave_dates|json_encode}};
        var leave_range_arr = {{$leave_range_arr|json_encode}};
        var date_range_arr = {{$date_range_arr|json_encode}}
    </script>
     <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="public/js/employee_leave.js"></script>
 {include file="footer.tpl" }