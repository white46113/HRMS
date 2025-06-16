
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
    <div class="sub-header-left pull-left">
        <h3>Combo Off</h3>
        
    </div>
    <div class="sub-header-right pull-right">
        <div class="timesheet-summary">
            <div class="timesheet-summary icon-box">
            <!-- <div class="timesheet-summary-lst year-drop-down ">
                <select class="form-select form-control" name="month_drop_down" id="month_drop_down">
                    {foreach from=$months key=key_val item=month}
                        {{if $key_val+1 == count($months)}}
                            <option value="{$month}" selected>{$month}</option>
                        {{else}}
                         <option value="{$month}" >{$month}</option>
                        {{/if}}
                    {/foreach}
                </select>
            </div> -->
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
                   <button type="button" class="btn btn-primary add-combo-off add-action">
                   	<i class="ti ti-plus"></i>
                   	<span>Apply Combo Off</span>
               		</button>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="inner-container" style="position: static; zoom: 1;">
    <div class="timesheet-container">

        <div class="custom-modal-content custom-content-table-with-fixed-column ">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table combo-off-list-table" style="border-collapse: collapse;" border-color="#e1e1e1">
                <thead>
                    <tr>
                        <th align="center" valign="middle" class="text-center att-date">Reference date</th>
                        <th align="center" valign="middle" class="text-center att-date">Combo Off Date</th>
                        <th align="center" valign="middle" class="text-center att-date">Overtime</th>
                        <th align="center" valign="middle" class="text-center att-time">Combo Off Reason</th>
                        <th align="center" valign="middle" class="text-center att-time">Approve/Reject Reason</th>
                        <th align="center" valign="middle" class="text-center att-time">Status</th>
                        <th align="center" valign="middle" class="text-center att-time">Action</th>
                    </tr>
                </thead>
                <tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">
                    
                        {foreach $applied_combo_off as $sem_index => $sem_row}
                        <tr class="combo-off-request-row">
                            <td align="center" valign="middle" class="text-center  " >
                             	{{$sem_row['combo_off_date']}}
                         	</td>
                            <td align="center" valign="middle" class="text-center ">
                            	{{$sem_row['reference_date']}}
                            </td>
                            <td align="center" valign="middle" class="text-center over_time_row">
                            	{{$sem_row['over_time']}}
                            </td>
                            <td align="center" valign="left" class="text-left combo-off-reason">	
                            	{{display_no_character($sem_row['added_reason'])}}
                           	</td>
                            <td align="center" valign="left" class="text-left">
                            	{{display_no_character($sem_row['update_reason'])}}
                            </td>
                            <td align="center" valign="middle" class="text-center status-row">
                                <span class="{{strtolower($sem_row['status'])}}">{{$sem_row['status']}}</span>
                            </td>
                            <td align="center" valign="middle" class="text-center ">
                            	{{$sem_row['action']}}
                           	</td>
                        </tr>
                        {/foreach}
               	</tbody>
               
            </table>
        </div>
    </div>
</div>

</div>

<div class="modal fade leave-popup-block" id="employee_combo_off_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalToggleLabel">Combo Off Request</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="main-content">
            	<form id="comboOffForm" action="javascript:void(0)" method="post">
                	<div class="card mb-3 user-details-block">
                    <input type="hidden"  value="" id="mode" name="mode">
                    <input type="hidden"  value="" id="employee_combo_off_id" name="employee_combo_off_id">
                        <div class="row g-0 m-3">
                            <div class="col-2">
                                <div class="image-block">
                                    <img src="{{$base_url}}/public/img/uploads/employee_profile/{{$employee_data['profile_image']}}" width="100" height="100" >                                   
                                </div>
                            </div>
                            <div class="col-10 employee-detils">
                                <div class="row">
                                	<div class="col-4 p-1">
                                		<span class="employee-name">{{$employee_data['first_name']}} {{$employee_data['middle_name']}} {{$employee_data['last_name']}}</span> 
                            			<span class="emp-grid-code" id="employee_code">{{$employee_data['employee_code']}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box">Location</span> 
                            			<span class="val-box" >{{$employee_data['city']}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box" >Designation</span> 
                            			<span class="val-box" >{{$employee_data['designation_name']}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box">Department</span> 
                            			<span class="val-box" >{{$employee_data['department_name']}}</span>
                                	</div>
                                	<div class="col-4 p-1">
                                		<span class="title-box">Week Off</span> 
                            			<span class="val-box" >{{$employee_data['employee_week_off']}}</span>
                                	</div>

                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card mb-3 leave-box">
                        <div class="row g-0 m-3">
                            <div class="col-6 p-2">
                                <div class="ms-3">
                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Refrence Date</p>
                                    <span >
                                    	<div class="input-group date-box-block">
										  <input type="text" class="form-control" id="reference_date" name="reference_date"  placeholder="Refrence Date">
										  <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
										</div>
                                    </span>                                    
                                </div>
                            </div>
                            <div class="col-6 p-2">
                                <p class="fs-5 mb-1 fw-bold attendance-lable">Over Time</p>
                                <span >
                                    <div class="input-group ">
                                    	<input type="hidden" name="overtime_hours" value="--" id="overtime_hours">
                                    	<span class="overtimes-value-block fs-5">

                                    		--
                                    	</span>
										  
									</div>
                                    	
                                </span>  
                                    
                            </div>
                            <div class="col-6 p-2 ">
                            	 <div class="ms-3">
                                <p class="fs-5 mb-1 fw-bold attendance-lable">Combo Off Date</p>
                                <span >
                                    	<div class="input-group date-box-block">
										  <input type="text" class="form-control" id="combo_off_date" name="combo_off_date"  placeholder="Combo Off Date">
										  <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
										</div>
                                    	
                                </span>  
                            </div>
                                    
                            </div>
                            
                            <div class="col-6 p-2 ">
                            	<div class="">
	                                <p class="fs-5 mb-1 fw-bold attendance-lable">Combo Off Reason</p>
	                                <span >
	                                    <textarea class="form-control" id="combo_off_reason" name="combo_off_reason" placeholder="Combo Off Reason" ></textarea>
	                                    	
	                                </span>
	                            </div>  
                                    
                            </div>
                        </div>
                        <span class="note-box"><lable>Note</lable> : &nbsp;Combo off only applicable from {$startDate} to {$endDate}.</span>
                    </div>
                    <div class="modal-footer justify-content-center">
			            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			            <button class="btn btn-primary submit-combo_off" type="submit" >Submit</button>
			          </div>
                </form>
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

    <link rel="stylesheet" href="public/css/attendance_sheet.css" />
    <link rel="stylesheet" href="public/css/employee_combo_off.css" />

    <script type="text/javascript" >
        var overtime_date_arr = {{$overtimes_date|json_encode}};
        var overall_combo_off_dates = {{$overall_combo_off_dates|json_encode}};
        var no_data_message =  {{$no_data_message|json_encode}};
    </script>
     <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="public/js/employee_combo_off.js"></script>
 {include file="footer.tpl" }