<div class="main-middle-container">
    <div class="sub-header att-sub-header">
        <div class="sub-header-left pull-left">
            <h3>Company Settings</h3>
        </div>
        <div class="sub-header-right pull-right">
          <div class="timesheet-summary icon-box">
            
          </div>
        </div>
        
    </div>
    <div class="inner-container" style="position: static; zoom: 1;">
    	<div class="timesheet-container">
    		<input type="hidden" name="company_id" id="company_id" value="{$company_id}">
    		
    	<div class="setting-block">
    		 {foreach from=$company_config key=company_key item=company_setting}
	    		<div class="config-box {if $company_key == (count($company_config) - 1)}mb-4{/if} " id="{$company_setting.id}">
	    			<div class="row m-2 p-2 border-bottom border-2 pt-3 pb-4">
	    				<div class="col-6 title-box">
					      <div class="mb-1">
					      	<label>{$company_setting.title}</label>
					      </div>	
					      <span class="mt-3">{$company_setting.description}</span>
					    </div>
					    <div class="col-6 text-center pt-3 value-box" data-id="{$company_setting.id}" data-name="{$company_setting.name}">
					    	{if $company_setting.type == "check_box"}
						      	<div class=" form-switch">
		  						<input class="form-check-input" type="checkbox" role="switch" {if $company_setting.value == 'Yes'}checked{/if}>
								</div>
							{else if $company_setting.type == "input"}

								<input type="text" class="form-control " {{if $company_setting['name'] eq 'company_prefix'}}disabled{{/if}} placeholder="" value="{$company_setting.value}">
							{/if}
				    	</div>
    				</div>
    			</div>
    		{/foreach}
    		<div class="setting-btn text-center">
    			<button type="button" class="btn btn-primary fs-6 submit-config">Submit</button>
				<a type="button" class="btn btn-danger fs-6" href="./home.html">Discard</a>
    		</div>
    	</div>
    	</div>

    </div>
	</div>
	</div>
	<link rel="stylesheet" href="public/css/comany_setting.css" />
	<script src="public/js/comany_setting.js"></script>
	{include file="footer.tpl" }