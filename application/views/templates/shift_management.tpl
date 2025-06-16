
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
                                            <span class="hide-menu">Department </span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                               <select class="form-select form-control w-100"  id="department_name_search">
                                               	<option value="" >Select Department </option>
		                                    	{foreach from=$departments item=department_val}
		                                            <option value="{$department_val.departmen_name} ({$department_val.department_code})" >{$department_val.departmen_name} ({$department_val.department_code})</option>
		                                        {/foreach}
		                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Shift Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>

                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select form-control w-100"  id="shift_name_search">
		                                    	 <option value="" >Select Shift Name</option>
		                                    	 {foreach from=$data key=k item=v}
											  		  <option value="{$v['shift_name']}" >{$v['shift_name']}</option>
												{/foreach}
		                                          
		                                      </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Shift Type</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>

                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select form-control w-100"  id="shift_type_search">
		                                    	 <option value="" >Select Shift Type</option>
		                                    	 {foreach from=$shift_type_data key=key_val item=shift_type_val}
											 <option value="{$shift_type_val['id']}" >{$shift_type_val['val']}</option>
										{/foreach}
		                                          
		                                      </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Start Time</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control time-picker-input" id="start_time_search"  placeholder="Start Time">
                                              <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">End Time</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control time-picker-input" id="end_time_search"  placeholder="End Time">
                                               <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <!-- 
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Added Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="added_date_search" class="form-control"  placeholder="Added Date">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Updated By</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="updated_by_search"  placeholder="Updated By">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Updated Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="updated_date_search"  placeholder="Updated Date">
                                              
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
			<h3>Shift Management</h3>
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
						<span>Add Shift</span>
					</button>
				</div>
			</div>
			
		</div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">

			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" id="shift_management" style="border-collapse: collapse;" border-color="#e1e1e1">
					<thead>
						<tr class="text-center">
							<!-- <th scope="col">#</th> -->
							<!-- <th scope="col">Comapny Name</th> -->
							<th scope="col">Department</th>
							<th scope="col">Shift Name</th>
							<th scope="col">Shift type</th>
							<th scope="col">Start Time</th>
							<th scope="col">End Time</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">
						
						{foreach $data as $data_index => $data_row}
						<tr class="leave-request-row">
							<!-- <td>{$data_index + 1}</td> -->
							<!-- <td>{$data_row.company_name}</td> -->
							<td>{$data_row.departmen_name} ({$data_row.department_code})</td>
							<td>{$data_row.shift_name}</td>
							<td>{$data_row.shift_type}</td>
							<td>{$data_row.start_time}</td>
							<td>{$data_row.end_time}</td>
							<td>{$data_row.action}</td>

						</tr>
						{/foreach}
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>

<div class="modal fade leave-popup-block" id="Shift_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered  modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel">Shift</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="shiftForm" action="javascript:void(0)" method="post">
				<div class="modal-body">
					<div class="main-content">

						<div class="card mb-3 leave-box">
							<div class="row g-0 m-3">
								<div class="mb-3 select-box col-6">
									<label for="shift_name" class="form-label">Shift Name</label>
									<input type="text" class="form-control shift_name" id="shift_name" name="shift_name"  placeholder="Enter Shift Name">
								</div>
								<div class="mb-3 select-box-block select-box col-6" {if $user_data['role'] != 'arom'} style="display: none" {/if}>
                                    <label for="company_id" class="form-label">Company</label>
                                    <select class="form-select company_id" name="company_id" id="company_id">
                                        <option value="">Select Company</option>
                                        {foreach from=$company_details item=company_name}
                                            {if $company_name.company_id == $selected_company}
                                                <option value="{$company_name.company_id}" selected>{$company_name.company_name}</option>
                                            {else}
                                                <option value="{$company_name.company_id}">{$company_name.company_name}</option>
                                            {/if}
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="mb-3 select-box col-6">
									<label for="department" class="form-label">Department</label>
									<select class="form-select department" name="department_id" id="department_id">
										<option value="">Select Department</option>
										{foreach from=$departments item=departments_val}
											<option value="{$departments_val.department_id}">{$departments_val.departmen_name} [{$departments_val.department_code}]</option>
										{/foreach}
									</select>
								</div>
								<div class="mb-3 select-box col-6">
									<label for="shift_type" class="form-label">Shift type</label>
									<select class="form-select shift_type" name="shift_type" id="shift_type">
										<option value="">Select Shift Type</option>
										{foreach from=$shift_type_data key=key_val item=shift_type_val}
											 <option value="{$shift_type_val['id']}" >{$shift_type_val['val']}</option>
										{/foreach}
										
									</select>
								</div>
								<div class="mb-3 col-6">
									<label for="start_time" class="form-label">Start Time</label>
                                    <div class="input-group ">
									<input type="text" class="form-control start_time time-picker-input" id="start_time" name="start_time"  placeholder="Enter Satrt Time">
                                    <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
                                    </div>
								</div>
								<div class="mb-3 col-6">
									<label for="end_time" class="form-label">End Time</label>
                                    <div class="input-group ">
									<input type="text" class="form-control end_time time-picker-input" id="end_time" name="end_time" placeholder="Enter End time" >
                                     <span class="input-group-text time-picker-addon"><i class="ti ti-clock"></i></span>
                                    </div>
								</div>
								<input type="hidden" class="form-control shift_id"  name="id" >


							</div>
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary submit-shift">Submit</button>
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
<style type="text/css">
	.chosen-disabled *{
	    
	    cursor: not-allowed;
	    /* cursor: none; */
	}
</style>

<script type="text/javascript" >
 var selected_company = {{$selected_company|json_encode}}
  var no_data_message =  {{$no_data_message|json_encode}};
</script>

<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/shift_management.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
<script src="public/js/shift_management.js"></script>
{include file="footer.tpl" }
