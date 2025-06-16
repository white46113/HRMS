
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
                                            <span class="hide-menu">Designation Name </span>

                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <input type="text" id="designation_name_search" class="form-control" placeholder="Department Name">
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Department Name</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>
                                        <li class="sidebar-item">
                                            <div class="input-group">
                                               <select class="form-select form-control w-100"  id="department_name_search">
                                               	<option value="" >Select Department Name</option>
		                                    	{foreach from=$departmen item=department_val}
		                                            <option value="{$department_val.departmen_name} ({$department_val.department_code})" >{$department_val.departmen_name} ({$department_val.department_code})</option>
		                                        {/foreach}
		                                    </select>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="filter-row">
                                        <li class="nav-small-cap">
                                            <span class="hide-menu">Grade</span>
                                            <span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
                                        </li>

                                        <li class="sidebar-item">
                                            <div class="input-group">
                                              <select class="form-select form-control w-100"  id="grad_search">
		                                    	 <option value="" >Select Grade</option>
		                                    	 {foreach from=$grads_data key=k item=v}
											  		  <option value="{$v['id']}" >{$v['val']}</option>
												{/foreach}
		                                          
		                                      </select>
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
			<h3>Designations</h3>
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
					<button type="button" class="btn btn-primary add-designation add-leave add-action">
						<i class="ti ti-plus"></i>
						<span>Add Designation</span>
					</button>
				</div>
			</div>
		</div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">

			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" id="designation-table" style="border-collapse: collapse;" border-color="#e1e1e1">
					<thead>
						<tr class="text-center">
							<!-- <th scope="col">#</th> -->
							<th scope="col">Designation Name</th>
							<th scope="col">Department Name</th>
							<th scope="col">Grade</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">
						
						{foreach $designation as $designation_index => $designation_row}
						<tr class="leave-request-row">
							<!-- <td>{$designation_index + 1}</td> -->
							<td>{$designation_row.designation_name}</td>
							<td>{$designation_row.departmen_name} ({$designation_row.department_code})</td>
							<td>{$designation_row.grads}</td>
							<td><span  class="edit_holiday me-2 text-secondary" data-id='{$designation_row.id}' data-designation='{$designation_row.designation_name}' data-departmet='{$designation_row.department_id}' data-grads='{$designation_row.grads}'><i title="Edit" class=" la-edit ti ti-edit cursor" ></i></span>
              <span class="delete_designation text-danger hide" data-id='{$designation_row.id}' ><i class=" la-trash cursor ti ti-trash" title="Remove"></i></span></td>

					</tr>
					{/foreach}
					
				</tbody>
			</table>

			</div>
		</div>
	</div>

</div>

<div class="modal fade leave-popup-block" id="designation_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel">Designation</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="designation_form" action="javascript:void(0)" method="post">
				<div class="modal-body">
					<div class="main-content">

						<div class="card mb-3 leave-box">
							<div class="row g-0 m-3">
								<div class="col-12 mb-3">
									<label for="designationName" class="form-label">Designation Name</label>
									<input type="text" class="form-control designation_name" id="designation_name" name="designation_name"  placeholder="Enter Designation Name">
								</div>
								<div class="col-12 mb-3">
	                                <div class="department-box ">
	                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Department</p>
	                                    <div class=" select-box">
		                                    <select class="form-select form-control w-100" name="department" id="department">
		                                    	<!-- <option value="" >Select Department</option> -->
		                                    	{foreach from=$departmen item=department_val}
		                                            <option value="{$department_val.department_id}" >{$department_val.departmen_name} [{$department_val.department_code}]</option>
		                                        {/foreach}
		                                    </select>
	                                	</div>
	                                </div>
                                </div>
                                <div class="col-12 mb-3">  
	                                <div class="grads-box ">
		                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Grade</p>
		                                    <div class=" select-box">
		                                    <select class="form-select form-control w-100" name="grads" id="grads">
		                                    	 <option value="" >Select Grade</option>
		                                    	 {foreach from=$grads_data key=k item=v}
											  		  <option value="{$v['id']}" >{$v['val']}</option>
												{/foreach}
		                                          
		                                    </select>
		                                </div>
	                                </div>

                                    
                            </div>
								<input type="hidden" class="form-control designation_id"  name="designation_id" >


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
<style type="text/css">
	.department-box  .select2-container{
		width: 100% !important;
	}
	
</style>
<script>
    var no_data_message =  {{$no_data_message|json_encode}};
    // var selected_company = {{$selected_company|json_encode}}
</script>
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/leave.css" />
<link rel="stylesheet" href="public/css/designation.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/designation.js"></script>
{include file="footer.tpl" }
