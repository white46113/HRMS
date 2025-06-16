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
                                            <span class="hide-menu">Group Name </span>

                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="group_name_search" class="form-control" placeholder="Group Name">
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
                                              <input type="text" id="shift_name_search" class="form-control" placeholder="Shift Name">
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
                                             <select class="form-select " name="shift_type_search" id="shift_type_search">
                                                <option value="">Select Shift Type</option>
                                                {foreach from=$shift_type_data item=shift_type}
                                                    <option value="{$shift_type.id}" >{$shift_type.val}</option>
                                                {/foreach}
                                                </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Start Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="start_date_search" class="form-control"  placeholder="Start Date">
                                              <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">End Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="end_date_search"  placeholder="End Date">
                                              <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
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
			<h3>Shift Groups</h3>
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
						<span>Add Group</span>
					</button>
				</div>
			</div>
		</div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">

			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" id="employee_shift" style="border-collapse: collapse;" border-color="#e1e1e1">
					<thead>
						<tr class="text-center">
							<!-- <th scope="col">#</th> -->
							<th scope="col">Group Name</th>
							<th scope="col">Shift Name</th>
							<th scope="col">Shift type</th>
							<th scope="col">Start Date</th>
							<th scope="col">End Date</th>
							<th scope="col">Start Time</th>
							<th scope="col">End Time</th>
							<th scope="col">Employee Count</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					
					<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">
						
						{foreach $data as $data_index => $data_row}
						<tr class="leave-request-row">
							<!-- <td>{$data_index + 1}</td> -->
							<td>{$data_row.group_title}</td>
							<td>{$data_row.shift_name}</td>
							<td>{$data_row.shift_type}</td>
							<td>{date_formater($data_row.start_date)}</td>
							<td>{date_formater($data_row.end_date)}</td>
							<td>{$data_row.start_time}</td>
							<td>{$data_row.end_time}</td>
							<td>{$data_row.employee_ids_count}</td>
							<td>{$data_row.action}</td>

						</tr>
						{/foreach}
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>

<!-- <div class="modal fade leave-popup-block" id="Shift_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
<div class="modal-dialog modal-dialog-centered ">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="exampleModalToggleLabel">Employee Shift</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<form id="shiftForm" action="javascript:void(0)" method="post">
<div class="modal-body">
<div class="main-content">

<div class="card mb-3 leave-box">
<div class="row g-0 m-3">


<div class="mb-3">
<label for="group_title" class="form-label">Group Title</label>
<input type="text" class="form-control group_title" id="group_title" name="group_title"  placeholder="Enter Group Title">
</div>
<div class="mb-3">
<label for="shift_id" class="form-label">Shift</label>
<select class="form-select shift_id" name="shift_id" id="shift_id">
<option value="">Select Shift</option>
{foreach $shift as $shift_index => $shift_row}
<option value="{$shift_row.id}">{$shift_row.shift_name} ({$shift_row.shift_type})</option>
{/foreach}
</select>
</div>
<div class="mb-3">
<label for="employee_ids" class="form-label">Employee</label>
<select class="form-select employee_ids" name="employee_ids" id="employee_ids">

{foreach $employee as $employee_index => $employee_row}
<option value="{$employee_row.employee_id }">{$employee_row.first_name} {$employee_row.middle_name} {$employee_row.last_name} ({$employee_row.employee_code})</option>
{/foreach}
</select>
</div>

<input type="hidden" class="form-control employee_shift_id "  name="employee_shift_id" >


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
</div>  -->

<!-- view shift details popup -->

<div class="modal fade" id="Shift_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel">Employee Shift</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="shiftForm" action="javascript:void(0)" method="post">
				<div class="modal-body ">
					<div class="main-content">

						<div class="card mb-3 leave-box">
							<div class="row g-0 m-3">
								<div class="col-6 mb-3">
									<label for="group_title" class="form-label">Group Title</label>
									<input type="text" class="form-control group_title" id="group_title" name="group_title"  placeholder="Enter Group Title">
								</div>
								<div class="col-6  mb-3">
                                    <label for="start_date" class="form-label">Start Date <span class="star_required">*</span></label>
                                    <div class="input-group">
                                    	<input type="text" class="form-control" id="start_date" name="start_date" value="" placeholder="Select Start Date" />
                                    	<span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                    </div>
                                </div>
                                <div class=" col-6 mb-3">
                                    <label for="end_date" class="form-label">End Date <span class="star_required">*</span></label>
                                    <div class="input-group">
                                    	<input type="text" class="form-control" id="end_date" name="end_date" value="" placeholder="Select End Date" />
                                    	<span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                    </div>
                                </div>
                                <div class="col-6  mb-3 select-box-block select-box" {if $user_data['role'] != 'arom'} style="display: none" {/if}>
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
                                <div class="col-6  mb-3 select-box">
									<label for="department" class="form-label">Department</label>
									<select class="form-select department " name="department" id="department">
										<option value="">Select Department</option>
										{foreach from=$departments item=departments_val}
											<option value="{$departments_val.department_id}">{$departments_val.departmen_name} [{$departments_val.department_code}]</option>
										{/foreach}
									</select>
								</div>
								<div class="col-6  mb-3 select-box">
									<label for="shift_id" class="form-label">Shift</label>
									<select class="form-select shift_id" name="shift_id" id="shift_id">
										<option value="">Select Shift</option>
										{foreach $shift as $shift_index => $shift_row}
										<option value="{$shift_row.id}">{$shift_row.shift_name} ({$shift_row.shift_type})</option>
										{/foreach}
									</select>
								</div>
								<div class="col-6  mb-3 select-box">
									<label for="employee_ids" class="form-label">Employee</label>
									<select class="form-select employee_ids" name="employee_ids" id="employee_ids" placeholder="Select Employee">

										{foreach $employee as $employee_index => $employee_row}
										<option value="{$employee_row.employee_id }">{$employee_row.first_name} {$employee_row.middle_name} {$employee_row.last_name} ({$employee_row.employee_code})</option>
										{/foreach}
									</select>
								</div>


								<input type="hidden" class="form-control employee_shift_id "  name="employee_shift_id" >
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

<div class="modal fade" id="employee_shift_details" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">

			<div class="modal-header border-bottom">
				<h4 class="modal-title" id="exampleModalToggleLabel">Group  Details</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>


			<div class="modal-body border-bottom employee-shift-conatiner">

			</div>


			<div class="modal-footer">

				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="font-size: 19px;">Close</button>
				<!-- <button class="btn btn-primary submit-active" style="font-size: 19px;">Yes</button> -->
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
<style media="screen">
	.select2-container{
		width: 100% !important;
	}
	.select2-container.select2-container--default.select2-container--open{
		z-index: 1056;
	}

	.select2-container--default .select2-results__option[aria-selected=true] {
	    background-color: #ddd;
	    pointer-events: none;
	    color:#000;
	        color: var(--bs-body-color);
	}
	b.val-box {
		    color: #000000 !important;
	}
	table thead th{
		color: #504d4d;
	}
	.leave-box .input-group {
    width: 100% !important;
}
.employee-shift-conatiner .table{
    border: 1px solid #dadada;
}
.employee-shift-conatiner .table tr,.employee-shift-conatiner .table th {
    border: none !important;
}
.employee-shift-conatiner .table>thead,.employee-shift-conatiner .table>thead>th ,.employee-shift-conatiner .table tr{
    display: table;
    table-layout: fixed;
    width: 100%;
    
}
.employee-shift-conatiner .table>tbody{
        display: block;
    max-height: 150px;
    overflow-y: scroll;
}
</style>
<script type="text/javascript" >
 var selected_company = {{$selected_company|json_encode}};
 var no_data_message = {{$no_data_message|json_encode}};
</script>
<link rel="stylesheet" href="public/css/employee_shift.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
<script src="public/js/employee_shift.js"></script>
{include file="footer.tpl" }
