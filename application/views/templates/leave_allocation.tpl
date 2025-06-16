
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
                                            <span class="hide-menu">Department Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                               <select class="form-select form-control w-100"  id="department_name_search">
                                               	<option value="" >Select Department Name</option>
		                                    	{foreach from=$department item=department_val}
		                                            <option value="{$department_val.departmen_name} ({$department_val.department_code})" >{$department_val.departmen_name} ({$department_val.department_code})</option>
		                                        {/foreach}
		                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Designation Name </span>

                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                             <select class="form-select form-control w-100"  id="designation_name_search">
                                               	<option value="" >Select Designation Name</option>
		                                    	{foreach from=$designation_arr item=designation_val}
		                                            <option value="{$designation_val.designation_name} (Grade - {$designation_val.grads})" >{$designation_val.designation_name} (Grade - {$designation_val.grads})</option>
		                                        {/foreach}
		                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Sick Leave</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>

                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="sick_leave_search" class="form-control number-value-formate-box" placeholder="Sick Leave">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Paid Leave</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>

                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="paid_leave_search" class="form-control number-value-formate-box" placeholder="Paid Leave">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Casual Leave</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>

                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="casual_leave_search" class="form-control number-value-formate-box" placeholder="Casual Leave">
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
			<h3>Leave Allocation</h3>
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
					<button type="button" class="btn btn-primary add-leave add-action">
						<i class="ti ti-plus"></i>
						<span>Add Allocation</span>
					</button>
				</div>
			</div>
		</div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">

			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" style="border-collapse: collapse;" border-color="#e1e1e1" id="leave-allocation-table">
					<thead>
						<tr class="text-center">
							<th scope="col">Department Name</th>
							<th scope="col">Designation Name</th>
							<th scope="col">Sick Leave<br>  (Days)</th>
							<th scope="col">Paid Leave<br>  (Days)</th>
							<th scope="col">Casual Leave<br>  (Days)</th>
							<th scope="col">Total Leave<br>  (Days)</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">
						<!-- {if count($data) > 0} -->
						{foreach $data as $data_index => $data_row}
						<tr class="leave-request-row">
							<td>{$data_row.departmen_name} ({$data_row.department_code})</td>
							<td>{$data_row.designation_name} (Grade - {$data_row.grads})</td>
							<td>{$data_row.sick_leave}</td>
							<td>{$data_row.paid_leave}</td>
							<td>{$data_row.casual_leave}</td>
							<td>{$data_row.total_leave}</td>
							<td>{$data_row.action}</td>

						</tr>
						{/foreach}
						<!-- {else}
						<tr>
							<td colspan="7">
								<div class="mb-5 no-data-found-block">
									<img alt="" src="{{$base_url}}public/assets/images/images/no_data_found_new.png" height="150" width="150" class="mt-5" />
									<br />
									<span class="mb-4 no-data-found-message">No leave allocation data found!</span>
								</div>
							</td>
						</tr>
						{/if} -->
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>

<div class="modal fade leave-popup-block" id="leave_allocation_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel">Leave Allocation</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="leaveallocationForm" action="javascript:void(0)" method="post">
				<div class="modal-body">
					<div class="main-content">

						<div class="card mb-3 leave-box">
							<div class="row g-0 m-3">
								<div class="mb-3 select-box col-6">
									<label for="department_id" class="form-label">Department</label>
									<select class="form-select department_id" name="department_id" id="department_id">
										<option value="">Select Department</option>

										{foreach $department as $department_index => $department_row}
										<option value="{$department_row.department_id }">{$department_row.departmen_name} ({$department_row.department_code})</option>
										{/foreach}
									</select>
								</div>

								<div class="mb-3 select-box col-6">
									<label for="designation_id" class="form-label">Designation</label>
									<select class="form-select designation_id" name="designation_id" id="designation_id">
										<option value="">Select Designation</option>
									</select>
								</div>

								<div class="mb-3 col-6 ">
									<label for="sick_leave" class="form-label">Sick Leave</label>
									<input type="text" class="form-control sick_leave number-value-formate-box" id="sick_leave" name="sick_leave"  placeholder="Enter Sick Leave">
								</div>

								<div class="mb-3 col-6">
									<label for="paid_leave" class="form-label">Paid Leave</label>
									<input type="text" class="form-control paid_leave number-value-formate-box" id="paid_leave" name="paid_leave"  placeholder="Enter Paid Leave" >
								</div>
								<div class="mb-3 col-6">
									<label for="casual_leave" class="form-label">Casual Leave</label>
									<input type="text" class="form-control casual_leave number-value-formate-box" id="casual_leave" name="casual_leave" placeholder="Enter Casual Leave" >
								</div>
								<input type="hidden" class="form-control leave_allocation_id "  name="id" >


							</div>
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary submit-leave-allocation">Submit</button>
				</div>
			</form>
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
 var no_data_message =  {{$no_data_message|json_encode}};
    // var
</script>
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/leave.css" />

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
<script src="public/js/leave_allocation.js"></script>
{include file="footer.tpl" }
