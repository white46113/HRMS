
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
                                               <select class="form-select " name="department_name_search" id="department_name_search">
			                                        <option value="">Select Department Name</option>
			                                        {foreach from=$departments item=department_val}
			                                            <option value="{$department_val.departmen_name} ({$department_val.department_code})">{$department_val.departmen_name} ({$department_val.department_code})</option>
			                                        {/foreach}
			                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Designation Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                               <select class="form-select " name="designation_name_search" id="designation_name_search">
			                                        <option value="">Select Department Name</option>
			                                        {foreach from=$designation item=designation_val}
			                                            <option value="{$designation_val.designation_name} ({$designation_val.grads})">{$designation_val.designation_name} ({$designation_val.grads})</option>
			                                        {/foreach}
			                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">CTC</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="ctc_search" class="form-control number-formatter" placeholder="CTC">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Added By</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="added_by_search"  placeholder="Added By">
                                              <!-- <span class="input-group-text"><i class="las la-calendar-alt"></i></span> -->
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Added Date</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="added_date_search" class="form-control"  placeholder="Added Date">
                                              <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
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
                                             <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
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
			<h3>Salary Structure</h3>
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
            <!-- <div class="timesheet-summary-lst year-drop-down ">
                <select class="form-select form-control" name="year_drop_down" id="year_drop_down">
                    {foreach from=$year_arr key=key_val item=year}
					    {{if $key_val+1 == count($year_arr)}}
					        <option value="{$year}" selected>{$year}</option>
					    {{else}}
							<option value="{$year}" >{$year}</option>
					    {{/if}}
					{/foreach}
                </select>
            </div> -->
			<div class="timesheet-summary-lst">
					<a href="{get_entiry_url('salary_structure','Add','')}" class="btn btn-primary add-department  add-action">
						<i class="ti ti-plus"></i>
						<span>Add Structure</span>
					</a>
				</div>
			</div>
		</div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">

			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				
				<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table display" style="border-collapse: collapse;" border-color="#e1e1e1">
					<thead>
						<tr class="text-center">
							<th scope="col">Department Name</th>
							<th scope="col">Designation Name</th>
							<th scope="col">CTC</th>
							<th scope="col">Added By</th>
							<th scope="col">Added Date</th>
							<th scope="col">Updated By</th>
							<th scope="col">Updated Date</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">

						{foreach $salary_strucuture as $salary_strucuture_index => $salary_strucuture_row}
							<tr class="department-request-row">
								<td>{{$salary_strucuture_row.department}}</td>
								<td>{{$salary_strucuture_row.designation}}</td>
								<td>{{getNumberFormate($salary_strucuture_row.ctc_value)}}</td>
								<td>{{$salary_strucuture_row.added_by_name}}</td>
								<td>{{date_formater($salary_strucuture_row.added_date)}}</td>
								<td>{{$salary_strucuture_row.updated_by_name}}</td>
								<td>{{date_formater($salary_strucuture_row.updated_date)}}</td>
								<td>{{$salary_strucuture_row.action}}</td>
							</tr>
						{/foreach}
				</tbody>
			</table>

			</div>
		</div>
	</div>

</div>
<div class="modal fade leave-popup-block" id="salary_component_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel">Salary Component</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="SalaryComponentForm" action="javascript:void(0)" method="post">
				<div class="modal-body">
					<div class="main-content">

						<div class="card mb-3 leave-box">
							<div class="row g-0 m-3">
								<div class="mb-3 select-box-block col-6 select-box" {if $user_data['role'] != 'arom'} style="display: none" {/if}>
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
								<div class="mb-3 col-6">
									<label for="componentName" class="form-label">Component Name</label>
									<input type="text" class="form-control " id="component_name" name="component_name"  placeholder="Enter Component Name">
								</div>
								<div class="mb-3 col-6">
									<label for="componentValue" class="form-label">Component Value</label>
									<input type="text" class="form-control " id="component_value" name="component_value"  placeholder="Enter Component Value">
								</div>
								<div class="mb-3 select-box-block col-6 select-box" >
                                    <label for="valueType" class="form-label">Type</label>
                                    <select class="form-select " name="value_type" id="value_type">
                                        <option value="">Select Type</option>
                                        {foreach from=$value_type_arr item=value_type}
                                            <option value="{$value_type.id}">{$value_type.val}</option>
                                            
                                        {/foreach}
                                    </select>
                                </div>
                               <div class="mb-3 select-box-block col-6 select-box" >
                                    <label for="componentType" class="form-label">Component Type</label>
                                    <select class="form-select " name="component_type" id="component_type">
                                        <option value="">Select Component Type</option>
                                        {foreach from=$component_type_arr item=component_type}
                                            <option value="{$component_type.id}">{$component_type.val}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="mb-3 col-6">
									<label for="year" class="form-label">Year</label>
									<select class="form-select form-control" name="year" id="year">
					                    {foreach from=$year_arr key=key_val item=year}
					                        {{if $key_val+1 == count($year_arr)}}
					                            <option value="{$year}" selected>{$year}</option>
					                        {{else}}
					                         <option value="{$year}" >{$year}</option>
					                        {{/if}}
					                    {/foreach}
					                </select>
								</div>
								<div class="mb-3 select-box-block col-6 select-box" >
                                    <label for="isCompulsory" class="form-label">Is Compulsory</label>
                                    <select class="form-select " name="is_compulsory" id="is_compulsory">
                                        <option value="">Select Is Compulsory</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                        
                                    </select>
                                </div>
                                <div class="mb-3 col-6">
									<label for="year" class="form-label h-10">Description</label>
									<textarea class="form-control"  placeholder="Enter Description" id="description" name="description"></textarea>
								</div>
								<input type="hidden" class="form-control"  name="salary_component_id" id="salary_component_id">
								<input type="hidden" class="form-control mode"  name="mode" id="mode">
							</div>
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary submit-holiday">Submit</button>
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
<script>
    var no_data_message =  {{$no_data_message|json_encode}};
    var selected_company = {{$selected_company|json_encode}}
</script>

<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/leave.css" />
<link rel="stylesheet" href="public/css/salary_component.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/salary_strucuture_list.js"></script>
{include file="footer.tpl" }
