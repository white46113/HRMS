
<div class="main-middle-container">
	<div class="sub-header att-sub-header">
		<div class="sub-header-left w-100">
			<h2>FESTIVAL HOLIDAY LIST - {{$current_year}} </h2>
		</div>

	</div>
	<div class="inner-container mt-4" >
    <div class="timesheet-container">
        <div class="custom-modal-content custom-content-table-with-fixed-column holiday-list-body {if !(count($holiday_data) > 0)}no-table-box-effect{/if}">
            <table width="50" border="1" cellspacing="0" cellpadding="0" class="table leave-list-table" style="border-collapse: collapse;" border-color="#e1e1e1">
                {{$count = 1}}
                <tbody id="leave_data_body" tabindex="5001" style="overflow: hidden; outline: none;" >
                	{if count($holiday_data) > 0}
	                	{foreach $holiday_data as $holiday_index => $holiday_row}
	                		<tr class="month-{{strtolower($holiday_index)}}">
		                         <td colspan="3" width="150" valign="middle" align="left" class="cell-month"><div class="text-left">{{$holiday_index}}</div></td>
		                    </tr>
		                    <tr class="month-{{strtolower($holiday_index)}}" >
							    <td width="50" valign="middle" align="left">
							        <table border="0" cellspacing="0" cellpadding="0" class="table">
							            <tbody>
							            	{foreach $holiday_row as $index => $row}
							                <tr>
							                    <td width="" valign="middle" align="left" style="border-right: 1px solid rgba(0, 0, 0, 0.1) !important; border-bottom: 1px solid rgba(0, 0, 0, 0.1) !important;"><div class="text-center">{{$count++}}</div></td>
							                </tr>
							                {/foreach}
							                
							            </tbody>
							        </table>
							    </td>

							    <td width="130" valign="middle" align="left" class="holiday-month-row">
							        <table>
							            <tbody>
							            	{foreach $holiday_row as $index => $row}
							                <tr>
							                    <td width="" valign="middle" align="left"><div class="text-center">{{$row['holiday_date']}}</div></td>
							                </tr>
							                {/foreach}
							            </tbody>
							        </table>
							    </td>
							    <td width="400" valign="middle" align="left">
							        <table>
							            <tbody>
							            	{foreach $holiday_row as $index => $row}
								                <tr>
								                    <td width="" valign="middle" align="left"><div class="text-left">{{$row['holiday_name']}}</div></td>
								                </tr>
							                {/foreach}
							                
							            </tbody>
							        </table>
							    </td>
							</tr>
	                	{/foreach}
	                {else}
	                <tbody class="no_holiday_found" tabindex="5001" style="overflow: hidden; outline: none;">
											<tr>
						<td colspan="4">
							<div class="mb-5">
								<img alt="" src="{{$base_url}}public/assets/images/images/no_holiday_found.png" height="100" width="100" class="mt-5 mb-3 no-holiday-img">
								<br>
								<span class="mb-4 no-data-found-message">No holiday data found!</span>
							</div>
						</td>
					</tr>
									</tbody>
	                {/if}
                	
                    

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

<link rel="stylesheet" href="public/css/holiday.css" />


{include file="footer.tpl" }
