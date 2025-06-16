
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
		<div class="sub-header-left pull-left">
			<h3>Add Salary Components</h3>
		</div>
		<div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
            <div class="timesheet-summary-lst">
                <div class="dropdown grid-drop-down">
                  <a class="btn btn-secondary top-btn-row" href="{get_entiry_url('salary_component','List','')}" title="Back"  >
                        <i class="ti ti-arrow-left"></i>
                    
                  </a>
                  
                </div>
            </div>
          </div>
          </div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">
			<form id="SalaryComponentForm" action="javascript:void(0)" method="post">
				<input type="hidden" class="form-control mode"  name="mode" id="mode" value="Add">
			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<div class="form-contain-box ">
					<div class="tabTitle position-relative">
					    <h2 id="cc_sh_sys_static_field_3">
					        <span>Salary Component</span>
					    </h2>
					    <div class="btn-box-ele float-right action-box">
					    		<a href="javascript:void(0)" class="btn btn-primary add-action ps-4 pe-4">
									<i class="ti ti-plus"></i>
									<span>Add New</span>
								</a>
					    </div>
					    <div class="button-action-box float-right w-50">
					    	<div class="btn-box-ele float-right company-box">
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
					    	<div class="btn-box-ele float-right company-box">
					    		<div class="drop-down-box  {if $user_data['role'] neq 'arom'}hide{/if}">
						    	<select class="form-select company_id" name="company_id" id="company_id"  >
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
					    	
					    </div>
					   
					</div>
                    <div class="content noPad form-table-row" style="display: block;">
						    <table class="responsive table table-bordered" id="component-table">
						        <thead>
						            <tr>
						                <th width="20%">Component Name</th>
						                <th width="14%">Component Type<em class="color-red">*</em></th>
						                <th width="14%">Component Value Type<em class="color-red">*</em></th>
						                <th width="14%">Component Value</th>
						                <th width="12%">Is Compulsory<em class="color-red">*</em></th>

						                <th width="20%">Description<span class="def_cur"></span><em class="color-red">*</em></th>
						                <th width="6%">
						                    <div align="center">Actions</div>
						                </th>
						            </tr>
						        </thead>
						        <tbody id="salary-component-row-box">
						             {include file='salary_component_row.tpl'}
						        </tbody>
						    </table>
						</div>

                </div>
			</div>
			<div class="frm-bot-btn frm-ctrls-bar bot-btn-rtl mt-3 w-100 d-inline-block">
			    <div class="action-btn-align" id="action_btn_container">
			        <div class="action-btn-align" id="action_btn_container">
			            <a  name="next" href="{get_entiry_url('salary_component','List','')}"  class="btn btn-outline-danger py-8 fs-4 rounded-2 discard me-2" >
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
    // var no_data_message =  {{$no_data_message|json_encode}};
    // var selected_company = {{$selected_company|json_encode}}
</script>

<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/salary_component_add.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/salary_component_add.js"></script>
{include file="footer.tpl" }
