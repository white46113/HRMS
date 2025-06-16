
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
                                            <span class="hide-menu">Component Name</span>

                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="component_name_search" class="form-control" placeholder="Component Name">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Component Type</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                               <select class="form-select " name="component_type_search" id="component_type_search">
			                                        <option value="">Select Component Type</option>
			                                        {foreach from=$component_type_arr item=component_type}
			                                            <option value="{$component_type.id}">{$component_type.val}</option>
			                                        {/foreach}
			                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Component Value</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="component_value_search" class="form-control number-formatter" placeholder="Component Value">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Value Type</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                               <select class="form-select " name="type_search" id="type_search">
			                                        <option value="">Select Value Type</option>
			                                        {foreach from=$value_type_arr item=value_type}
			                                            <option value="{$value_type.id}">{$value_type.val}</option>
			                                            
			                                        {/foreach}
			                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Is Compulsory</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select " name="is_compulsory_search" id="is_compulsory_search">
			                                        <option value="">Select Is Compulsory</option>
			                                        <option value="Yes">Yes</option>
			                                        <option value="No">No</option>
			                                        
			                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Description</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group ">
                                              <input type="text" class="form-control" id="description_search"  placeholder="Description">
                                              
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
			<h3>Salary Component</h3>
		</div>
		<div class="sub-header-right pull-right">
			<div class="timesheet-summary icon-box">
                <div class="timesheet-summary-lst year-drop-down icon-box-destop">
                    <select class="form-select form-control" name="year_drop_down" id="year_drop_down">
                        {foreach from=$year_arr key=key_val item=year}
                            {{if $key_val+1 == count($year_arr)}}
                                <option value="{$year}" selected>{$year}</option>
                            {{else}}
                                <option value="{$year}" >{$year}</option>
                            {{/if}}
                        {/foreach}
                    </select>
                </div>
    			<!-- <div class="timesheet-summary-lst year-drop-down icon-box-destop">
                    <select class="form-select form-control" name="year_drop_down" id="year_drop_down">
                        {foreach from=$year_arr key=key_val item=year}
    					    {{if $key_val+1 == count($year_arr)}}
    					        <option value="{$year}" selected>{$year}</option>
    					    {{else}}
    							<option value="{$year}" >{$year}</option>
    					    {{/if}}
    					{/foreach}
                    </select>
                </div>
                <div class="timesheet-summary-lst icon-box-destop">
                    <div class="dropdown grid-drop-down " title="Download CSV">
                            <button class="btn btn-secondary top-btn-row" type="button"  id="downloadCSVBtn">
                                <i class="ti ti-file-type-csv" style="color: black"></i> 
                            </button>
                    </div>
                </div>
                <div class="timesheet-summary-lst icon-box-destop">
                    <div class="dropdown grid-drop-down " title="Download PDF">
                            <button class="btn btn-secondary top-btn-row" type="button"  id="downloadPDFBtn">
                                <i class="ti ti-file-type-pdf" style="color: black"></i> 
                            </button>
                    </div>
                </div>
    			<div class="timesheet-summary-lst icon-box-destop">
                       <div class="dropdown grid-drop-down reset-filter" title="Reset Filter">
                            <button class="btn btn-secondary top-btn-row" type="button"  >
                                <i class="ti ti-refresh " style="color: black"></i> 
                            </button>
                        </div>
                </div>
                <div class="timesheet-summary-lst icon-box-destop">
                       <div class="dropdown grid-drop-down filter-popup" title="Filter">
                            <button class="btn btn-secondary top-btn-row" type="button"  >
                                <i class="ti ti-filter " style="color: black"></i> 
                            </button>
                        </div>
                </div> -->
            <div class="other-actions-list-btn  mr-2 icon-box-responsive">
                <a class=" btn view-btn  filter-popup" href="javascript:void(0)" type="button"  title="Filter" >
                    <i class="ti ti-filter" style="color: black"></i> 
                </a>
                <div class="dropdown">
                    <button class="dropdown-toggle  btn-sm" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"></button>
                    <ul class="dropdown-menu mt-2">
                        <li>
                            <a class="dropdown-item reset-filter icon-m-10"  href="javascript:void(0)" title="Reset Filter">
                                <i class="ti ti-refresh " style="color: black"></i>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item icon-m-10" id="downloadPDFBtn" title="PDF">
                                <i class="ti ti-file-type-pdf" style="color: black"></i>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item icon-m-10" id="downloadCSVBtn" title="CSV">
                                <i class="ti ti-file-type-csv" style="color: black"></i>
                            </a>
                        </li>
                        
                    </ul>
                </div>
            </div>
           
			<div class="timesheet-summary-lst">
					<a href="{get_entiry_url('salary_component','Add','')}" class="btn btn-primary add-department  add-action">
						<i class="ti ti-plus"></i>
						<span>Add Component</span>
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
							<th scope="col">Component Name</th>
							<th scope="col">Component Type</th>
							<th scope="col">Component Value</th>
							<th scope="col">Value Type</th>
							<th scope="col">Year</th>
							<th scope="col">Is Compulsory</th>
							<th scope="col">Description</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">

						{foreach $salary_components as $salary_component_index => $salary_component_row}
							<tr class="department-request-row">
								<td>{{$salary_component_row.component_name}}</td>
								<td>{{$salary_component_row.component_type}}</td>
								<td>{{getNumberFormate($salary_component_row.component_value)}}</td>
                                <!-- <td>{{$salary_component_row.value_type}}</td> -->
								<td>{{if ($salary_component_row.value_type == 'Decimal')}}
                                   Amount
                                    {{else}}
                                    {{$salary_component_row.value_type}}
                                    {{/if}}
                                    </td>
								<td>{{$salary_component_row.year}}</td>
								<td>{{$salary_component_row.is_compulsory}}</td>
								<td>{{$salary_component_row.description}}</td>
								<td>{{$salary_component_row.action}}</td>
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
									<input type="text" class="form-control number-formatter" id="component_value" name="component_value"  placeholder="Enter Component Value">
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
<script src="public/js/salary_component.js"></script>
{include file="footer.tpl" }
