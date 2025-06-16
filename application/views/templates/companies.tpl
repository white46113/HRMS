
<style>
	.dataTables_wrapper.no-footer .dt-buttons {
    position: fixed;
    top: 98px;
    right: 362px;
}
#company_table_filter{
	display: none;
}
</style>
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
												<span class="hide-menu filter-label">Name</span>
												<span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
											</li>
											<li class="sidebar-item">
												<div class="input-group filter-input">
												  <input type="text" id="company_name_search" class="form-control" placeholder="Name" data-column="1">
												</div>
											</li>
										</div>
										<div class="filter-row">
											<li class="nav-small-cap">
												<span class="hide-menu filter-label">Code</span>
												<span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
											</li>
											<li class="sidebar-item">
												<div class="input-group filter-input">
												  <input type="text" id="company_code_search" class="form-control" placeholder="Employee Code" data-column="2">
												</div>
											</li>
										</div>
										<div class="filter-row">
											<li class="nav-small-cap">
												<span class="hide-menu filter-label">Email</span>
												<span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
											</li>
											<li class="sidebar-item">
												<div class="input-group filter-input">
												  <input type="text" id="email_search" class="form-control"  placeholder="Email" data-column="3">
												</div>
											</li>
										</div>
										<div class="filter-row">
											<li class="nav-small-cap">
												<span class="hide-menu filter-label">Date Of Founding</span>
												<span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
											</li>
											<li class="sidebar-item">
												<div class="input-group filter-input">
												  <input type="text" class="form-control" id="founding_search"  placeholder="Founding Date" data-column="4">
												  <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span> 
												</div>
											</li>
										</div>
										
										<div class="filter-row">
											<li class="nav-small-cap">
												<span class="hide-menu filter-label">GST Number</span>
												<span class="search-show-hide float-right"><i class="ti ti-minus"></i></span>
											</li>
											<li class="sidebar-item">
												<div class="input-group filter-input">
												  <input type="text" class="form-control" id="GST_search"  placeholder="GST NUmber" data-column="5">
												  <!-- <span class="input-group-text"><i class="las la-calendar-alt"></i></span> -->
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
			<h3>Companies</h3>
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
               
            {{if in_array($role,['arom'])}}
			<div class="timesheet-summary">
				<div class="timesheet-summary-lst">
					<a href="add-company.html"><button type="button" class="btn btn-primary add-designation add-leave add-action">
						<i class="ti ti-plus"></i>
						<span>Add Company</span>
					</button>
                </a>
				</div>
			</div>
			{{/if}}
			</div>
		</div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">

			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<table id="company_table" width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" style="border-collapse: collapse;" border-color="#e1e1e1">
					<thead>
						<tr class="text-center">
							<th scope="col">Image</th>
							<th scope="col">Name</th>
							<th scope="col">Code</th>
							<th scope="col">Email</th>
							<th scope="col">Date of Founding</th>
							<th scope="col">GST Number</th>
							 {{if in_array($role,['arom'])}}
							<th scope="col">Action</th>
							{{/if}}
							
						</tr>
					</thead>
					<tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;">
						{foreach $data as $key=>$val}
						<tr class="leave-request-row">
							<td class="  dt-center img-box"><img src="public/img/uploads/company_logo/{$val['company_logo']}" alt="" width="70" height="70" class="rounded-circle"></td>
							<td><a href="company-view?id={$val['company_id']}">{$val['company_name']}</a></td> 
							<td>{$val['company_code']}</td>
							<td>{$val['company_email']}</td>
							<td>{date_formater($val['date_founded'])}</td> 
							<td>{$val['gst_number']}</td> 
							{{if in_array($role,['arom'])}}
							<td><a href = "update-company.html?id={$val['company_id']}"><i class="la-edit ti ti-edit"></a></i></td>
							{{/if}}
			  			</tr>
						{/foreach}
					
				{*	<tr>
						<td colspan="4">
							<div class="mb-5 no-data-found-block">
								<img alt="" src="{{$base_url}}public/assets/images/images/no_data_found_new.png" height="150" width="150" class="mt-5" />
								<br />
								<span class="mb-4 no-data-found-message">No Companies found!</span>
							</div>
						</td>
					</tr>
					*}
				</tbody>
			</table>

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

<link rel="stylesheet" href="{{$base_url}}public/css/attendance_sheet.css" />
<link rel="stylesheet" href="{{$base_url}}public/css/leave.css" />
<script>
    var no_data_message =  {{$no_data_message|json_encode}};
    var base_url = {{$base_url|json_encode}};
    var role = {{$role|json_encode}}
</script>

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/company_listing.js"></script>

{include file="footer.tpl" }