
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
		<div class="sub-header-left pull-left">
			<h3>{if $mode == 'Add'}Add Salary Structure{else}Update Salary Structure{/if}</h3>
		</div>
		<div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
            <div class="timesheet-summary-lst">
                <div class="dropdown grid-drop-down">
                  <a class="btn btn-secondary top-btn-row" href="{get_entiry_url("salary_structure","List")}" title="Back"  >
                        <i class="ti ti-arrow-left"></i>
                    
                  </a>
                  
                </div>
            </div>
          </div>
        </div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">
            <form action="javascript:void(0)" method="POST" id="salary_structure_form">
			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<div class="form-contain-box p-4">
                        <input type="hidden" name="mode" id="mode" value="{$mode}">
                        <input type="hidden" name="id" id="id" value="{$id}">
                        {if $mode eq 'Update'}
                            <input type="hidden" name="company_id"  value="{$selected_company}">
                            <input type="hidden" name="department_id"  value="{$department_id}">
                            <input type="hidden" name="designation_id"  value="{$designation_id}">

                        {/if}
                        <div class="column-view-parent form-row row-fluid tab-focus-child">
                            <div class="two-block-view tab-focus-element" id="cc_sh_sys_static_field_1">
                                <div class="form-right-div form-static-div">
                                    <h3 class="inner-title">
                                        Company Details
                                    </h3>
                                </div>
                            </div>
                            <div class="two-block-view tab-focus-element" id="cc_sh_sys_static_field_4"><div class="form-right-div form-static-div">&nbsp;&nbsp;</div></div>
                        </div>
                        <div class="form-contain company-detail-box">
                            <div class="row mb-3">
                                <div class="col-6 form-input-box">
                                    <label for="email" class="form-label">Company <span class="star_required">*</span></label>
                                    <div class="input-group select-box">
                                        <select class="form-select form-control" name="company_id" id="company_id" {if $mode eq 'Update' || $user_data['role'] neq 'arom'}disabled{/if}>
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
                                </div>

                                <div class="col-6 form-input-box ">
                                    <label for="dob" class="form-label">Department <span class="star_required">*</span></label>

                                    <div class="input-group select-box" >
                                        <select class="form-select form-control" name="department_id" id="department_id" {if $mode eq 'Update'}disabled{/if}>
                                            <option value="">Select Department</option>
                                            {foreach from=$departments item=department_val} 
                                                {if $department_val.department_id == $department_id} 
                                                    <option value="{$department_val.department_id}" selected>{$department_val.departmen_name} ({$department_val.department_code})</option>
                                                {else}
                                                    <option value="{$department_val.department_id}">{$department_val.departmen_name} ({$department_val.department_code})</option>
                                                {/if}
                                            {/foreach}
                                        </select>

                                    </div>
                                </div>
                                <div class="col-6 form-input-box">
                                    <label for="dob" class="form-label">Designation <span class="star_required">*</span></label>

                                    <div class="input-group select-box">
                                       <select class="form-select form-control" name="designation_id" id="designation_id" {if $mode eq 'Update'}disabled{/if}>
                                            <option value="">Select Designation</option>
                                            {foreach from=$designation item=designation_val} 
                                                {if $designation_val.id == $designation_id} 
                                                    <option value="{$designation_val.id}" selected>{$designation_val.designation_name} ({$designation_val.grads})</option>
                                                {else}
                                                    <option value="{$designation_val.id}">{$designation_val.designation_name} ({$designation_val.grads})</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6 form-input-box">
                                    <label for="dob" class="form-label">CTC <span class="star_required">*</span></label>

                                    <div class="input-group">
                                        <input type="text" class="form-control number-formatter"  id="ctc_value" name="ctc_value" placeholder="Enter CTC" value="{getNumberFormate($ctc_value)}" readonly/>
                                    </div>
                                </div>
                                <div class="col-6 form-input-box">
                                    <label for="dob" class="form-label">Gross per month <span class="star_required">*</span></label>

                                    <div class="input-group">
                                        <input type="text" value="{getNumberFormate($ctc_value/12)}" class="form-control number-formatter"  id="cross_month_value"  placeholder="Enter CTC" value="{getNumberFormate($ctc_value/12)}" />
                                    </div>
                                </div>
                                <div class="col-6 form-input-box">
                                    <label for="dob" class="form-label">Gross per month(Calculated) <span class="star_required">*</span></label>

                                    <div class="input-group">
                                        <input type="text" class="form-control number-formatter"  id="cross_month_value_cal"  placeholder="Enter CTC" value="{getNumberFormate($ctc_value/12)}" readonly/>
                                    </div>
                                </div>
                                <div class="col-6 form-input-box">
                                    <label for="dob" class="form-label">Income per month <span class="star_required">*</span></label>

                                    <div class="input-group">
                                        <input type="text" class="form-control number-formatter"  id="income_per_month"  placeholder="Enter CTC" value="" readonly/>
                                    </div>
                                </div>
                                <div class="col-6 form-input-box">
                                    <label for="dob" class="form-label">Deduction per month <span class="star_required">*</span></label>

                                    <div class="input-group">
                                        <input type="text" class="form-control number-formatter"  id="deduction_per_month"  placeholder="Enter CTC" value="" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="column-view-parent form-row row-fluid tab-focus-child">
                                <div class="two-block-view tab-focus-element" id="cc_sh_sys_static_field_1">
                                    <div class="form-right-div form-static-div">
                                        <h3 class="inner-title">
                                            Salary Component
                                            <div class="status_color float-right"> 
                                                <ul class="float-left mr-3">
                                                   <li class="label_used"><span ></span>Existing Component</li>
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
                                    <a  name="next" href="./salary-component.html"  class="btn btn-outline-danger py-8 fs-4 rounded-2 discard me-2" >
                                        Discard
                                    </a>
                                    <button  name="submit" type="submit" class="btn btn-primary py-8 fs-4 rounded-2 me-3 next">
                                        Submit
                                    </button>
                                </div>
                            </div>
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
    var mode =  {{$mode|json_encode}};
    var selected_company = {{$selected_company|json_encode}}
</script>
<link rel="stylesheet" href="public/css/salary_structure_add_update.css" />
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/salary_structure_form.js"></script>
{include file="footer.tpl" }
