
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
		<div class="sub-header-left pull-left">
			<h3>Holiday Management</h3>
		</div>
		<div class="sub-header-right pull-right">
			<div class="timesheet-summary">
				<div class="timesheet-summary-lst year-drop-down ">
                <select class="form-select form-control" name="month_drop_down" id="year_drop_down">
                    {foreach from=$year_arr key=key_val item=year}
                        {{if $key_val+1 == count($year_arr)}}
                            <option value="{$year}" selected>{$year}</option>
                        {{else}}
                         <option value="{$year}" >{$year}</option>
                        {{/if}}
                    {/foreach}
                </select>
            </div>
				<div class="timesheet-summary-lst">
					<button type="button" class="btn btn-primary add-leave add-action">
						<i class="ti ti-plus"></i>
						<span>Add Holiday</span>
					</button>
				</div>
			</div>
		</div>

	</div>
	<div class="inner-container" style="position: static; zoom: 1;">
		<div class="timesheet-container">

			<div class="custom-modal-content custom-content-table-with-fixed-column ">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" style="border-collapse: collapse;" border-color="#e1e1e1" id="holiday-management-table">
					<thead>
                        <tr>
                            {{foreach from=$data key=key item=val}}
                            <th><b>Search {{$val['title']}}</b></th>
                            {{/foreach}}
                        </tr>
                    </thead>
                    <tbody></tbody>
				</table>
			</div>
		</div>
	</div>

</div>

<div class="modal fade leave-popup-block" id="employee_holiday_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel">Holiday</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="holidayForm" action="javascript:void(0)" method="post">
				<div class="modal-body">
					<div class="main-content">

						<div class="card mb-3 leave-box">
							<div class="row g-0 m-3">


								<div class="mb-3">
									<label for="holidayName" class="form-label">Holiday Name</label>
									<input type="text" class="form-control holiday_name" id="holiday_name" name="holiday_name"  placeholder="Enter Holiday Name">
								</div>
								<div class="mb-3">
									<label for="holidayDate" class="form-label">Holiday Date</label>
									<div class="input-group">
										<input type="text" class="form-control holiday_date" id="holiday_date" name="holiday_date" placeholder="Select Holiday Date" >
									<span class="input-group-text date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                
                                </div>
                                
								</div>
								<input type="hidden" class="form-control holiday_id"  name="id" value="" id="holiday_id">


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
<script type="text/javascript" >
    var holiday_dates = {{$holiday_dates|json_encode}};
    var column_details =  {{$data|json_encode}};
    var page_length_arr = {{$page_length_arr|json_encode}}
    var is_searching_enable =  {{$is_searching_enable|json_encode}};
    var is_top_searching_enable =  {{$is_top_searching_enable|json_encode}};
    var is_paging_enable =  {{$is_paging_enable|json_encode}};
    var is_serverSide =  {{$is_serverSide|json_encode}};
    var no_data_message =  {{$no_data_message|json_encode}};
    var is_ordering =  {{$is_ordering|json_encode}};
    var sorting_column = {{$sorting_column}}
    var api_name =  {{$api_name|json_encode}};
    var page_name = 'teacher_page';
    var base_url = {{$base_url|json_encode}};
    </script>

<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/holiday_management.css" />
<style type="text/css">
	.timesheet-container .custom-content-table-with-fixed-column {
    

}
</style>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/holiday-management.js"></script>
{include file="footer.tpl" }
