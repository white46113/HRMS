
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
		<div class="sub-header-left pull-left">
			<h1>
                	Salary
                	
				<a hijacked="yes" href="#stock/issue_request/index" class="backlisting-link" title="Back to Issue Request Listing"><i class="las la-angle-double-right"></i><em>Employee Salary Structure</em></a>
				<span>{if $mode == 'Extended'}Extend Salary Structure{else}Update Salary Structure{/if}</span>
			</h1>
		</div>
		<div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
            <div class="timesheet-summary-lst">
                <div class="dropdown grid-drop-down">
                  <a class="btn btn-secondary top-btn-row" href="{get_entiry_url("employee_salary_component","List",$employee_details['employee_id'])}" title="Back"  >
                        <i class="ti ti-arrow-left"></i>
                    
                  </a>
                  
                </div>
            </div>
          </div>
        </div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<form action="javascript:void(0)" method="POST" id="salary_structure_form">
		<div class="timesheet-container">
			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<div class="title-contain-box p-4">
					<h3 class="">{if $mode != 'Extended'}{$designation_salary_structure['refrence_number']}{/if}</h3>
					<div class="title-contain-bloack">
						<div class="row">
								<div class="col-3 mt-2">
									<div class="title-box">Company</div>
									<div class="value-box" title="{$designation_salary_structure['company_name']}">{$designation_salary_structure['company_name']}</div>
								</div>
								<div class="col-3 mt-2">
									<div class="title-box">Employee </div>
									<div class="value-box" ><a title="{$employee_details['employee_name']}" href="{get_entiry_url('employee','View',$employee_details['employee_id'])}">{$employee_details['employee_name']}</a></div>
								</div>
								<div class="col-3 mt-2">
									<div class="title-box">Department</div>
									<div class="value-box" title="{$designation_salary_structure['department']}">{$designation_salary_structure['department']}</div>
								</div>
								<div class="col-3 mt-2">
									<div class="title-box">Designation</div>
									<div class="value-box" title="{$designation_salary_structure['designation']}">{$designation_salary_structure['designation']}</div>
								</div>
								<div class="col-3 mt-2">
									<div class="title-box">CTC</div>
									<div class="value-box mt-1"><input readonly type="text" class="form-control number-formatter"  id="ctc_value" name="ctc_value" placeholder="Enter CTC" value="{getNumberFormate($designation_salary_structure['ctc_value'])}" /></div>
								</div>
                                <div class="col-3 mt-2">
                                    <div class="title-box">Gross per month</div>
                                    <div class="input-group">
                                        <input type="text" value="{getNumberFormate($designation_salary_structure['ctc_value']/12)}" class="form-control number-formatter"  id="cross_month_value"  placeholder="Enter CTC" value="{getNumberFormate($designation_salary_structure['ctc_value']/12)}" />
                                    </div>
                                </div>
                                <div class="col-3 mt-2">
                                    <div class="title-box">Gross per month(Calculated) </div>
                                    <div class="input-group">
                                        <input type="text" class="form-control number-formatter"  id="cross_month_value_cal"  placeholder="Enter CTC" value="{getNumberFormate($designation_salary_structure['ctc_value']/12)}" readonly/>
                                    </div>
                                </div>
                                <div class="col-3 mt-2">
                                    <div class="title-box">Income per month </div>
                                    <div class="input-group">
                                        <input type="text" class="form-control number-formatter"  id="income_per_month"  placeholder="Enter CTC" value="" readonly/>
                                    </div>
                                </div>
                                <div class="col-3 mt-2">
                                    <div class="title-box">Deduction per month </div>
                                    <div class="input-group">
                                        <input type="text" class="form-control number-formatter"  id="deduction_per_month"  placeholder="Enter CTC" value="" readonly/>
                                    </div>
                                </div>
                                <div class="col-3 mt-2">
									<div class="title-box">Effective From</div>
									<div class="value-box input-group mt-1">
										<input type="text" id="effective_date_from" name="effective_date_from" class="form-control"  placeholder="Effective From" value="{$designation_salary_structure['effective_from']}">
                                              <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
									</div>
								</div>
								<div class="col-3 mt-2">
									<div class="title-box">Effective To</div>
									<div class="value-box input-group mt-1">
										<input type="text" id="effective_date_to" name="effective_date_to" class="form-control"  placeholder="Effective To" value="{$designation_salary_structure['effective_to']}">
                                              <span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="timesheet-container">
			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<div class="form-contain-box p-4">
                        <input type="hidden" name="mode" id="mode" value="{$mode}">
                        <input type="hidden" name="id" id="id" value="{$id}">
                        <input type="hidden" name="company_id"  value="{$designation_salary_structure['company_id']}">
                        <input type="hidden" name="department_id"  value="{$designation_salary_structure['department_id']}">
                        <input type="hidden" name="designation_id"  value="{$designation_salary_structure['designation_id']}">
                        <input type="hidden" name="employee_id"  value="{$employee_details['employee_id']}">
                        
                        <div class="form-contain company-detail-box">
                            <div class="column-view-parent form-row row-fluid tab-focus-child">
                                <div class="two-block-view tab-focus-element" id="cc_sh_sys_static_field_1">
                                    <div class="form-right-div form-static-div">
                                        <h3 class="inner-title">
                                            Salary Component
                                            <div class="status_color float-right"> 
                                                <ul class="float-left mr-3">
                                                  
                                                   <li class="label_compulsory"><input style="width: 1px !important;    height: 23px !important;border: 1px solid white;border-radius: 14px !important;" type="checkbox" class="form-check-input is_compulsory  disabled_check " checked>Compulsory Component</li>
                                                </ul>                                                 
                                            </div>
                                        </h3>
                                    </div>
                                </div>
                                <div class="two-block-view tab-focus-element" id="cc_sh_sys_static_field_4"><div class="form-right-div form-static-div">&nbsp;&nbsp;</div></div>
                            </div>
                            <div class="content noPad form-table-row" style="display: block;">
                                <table class="responsive dataTable table table-bordered" id="component-table">
                                    <thead>
                                        <tr>
                                            <th width="20%">Component Name</th>
                                            <th width="10%">Component Type</th>
                                            <th width="12%">Component Value<br> Type</th>
                                            <th width="20%">Component Value<br>(Monthly)<em class="color-red">*</em></th>
                                            <th width="20%">Component value per month</th>
                                            <th width="20%">Component value per year</th>
                                            <th width="12%">Is Compulsory</th>
                                        </tr>
                                    </thead>
                                    <tbody id="salary-component-row-box">
                                         {include file='salary_structure_component_row.tpl'}
                                    </tbody>
                                </table>
                            </div>

                        </div>                    
                </div>
			</div>
             <div class="frm-bot-btn frm-ctrls-bar bot-btn-rtl mt-3 w-100 d-inline-block mb-3">
                            <div class="action-btn-align" id="action_btn_container">
                                <div class="action-btn-align" id="action_btn_container">
                                    <a  name="next" href="{get_entiry_url("employee_salary_component","List",$employee_details['employee_id'])}"  class="btn btn-outline-danger py-8 fs-4 rounded-2 discard me-2" >
                                        Discard
                                    </a>
                                    <button  name="submit" type="submit" class="btn btn-primary py-8 fs-4 rounded-2 me-3 next">
                                        {if $mode eq 'Extended'}Extend {else}Update{/if}
                                    </button>
                                </div>
                            </div>
                        </div>
            
		</div>
	</div>
	</form>

</div>

</div>
<!-- extra for footer -->
</div>
</div>
</div>
</div>
<script>
    var mode =  {{$mode|json_encode}};
    var selected_company = {{$selected_company|json_encode}};
    var redirect_url = {{get_entiry_url("employee_salary_component","List",$employee_details['employee_id'])|json_encode}}
</script>
<link rel="stylesheet" href="public/css/salary_structure_add_update.css" />
<link rel="stylesheet" href="public/css/employee_salary_structure_form.css" />
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/employee_salary_structure_form.js"></script>
{include file="footer.tpl" }
