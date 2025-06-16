	{{if count($leave_list) > 0}}
	{foreach $leave_list as $sem_index => $sem_row}
	<tr class="leave-request-row">
        <td align="center" valign="middle" class="text-center att-date leave-name" data-leave-type="{{$sem_row['leave_name']}}">{{get_status($sem_row['leave_name'])}}</td>
	    <td align="center" valign="middle" class="text-center att-date start-date">{{date_formater($sem_row['leave_start_date'])}}</td>
	    <td align="center" valign="middle" class="text-center att-date end-date">{{date_formater($sem_row['leave_end_date'])}}</td>
        <td align="center" valign="middle" class="text-center att-date ">{{get_status($sem_row['leave_type'])}}</td>
	    <td align="center" valign="middle" class="text-center att-date reason-box">{{display_no_character($sem_row['reason'])}}</td>
	    <td align="center" valign="middle" class="text-center att-date">{{$sem_row['approved_by']}}</td>
	    <td align="center" valign="middle" class="text-center att-date">{{$sem_row['applied_days']}}</td>
	    <td align="center" valign="middle" class="text-center att-date status-row">
	        <span class="{{$sem_row['status']}}">{{get_status($sem_row['status'])}}</span>
	    </td>
	    <td align="center" valign="middle" class="text-center att-date">{{$sem_row['action']}}</td>
	</tr>
	{/foreach}
	{{else}}
                    <tr >
                        <td colspan="10">
                            <div class="mb-5 no-data-found-block">
                             <img
                                alt=""
                                src="{{$base_url}}public/assets/images/images/no_data_found_new.png"
                                height="150"
                                width="150"
                                 class="mt-5"
                            />
                            <br>
                            <span class="mb-4 no-data-found-message">No leave data found!</span>
                            </div>
                        </td>
                    </tr>


                {{/if}} 
