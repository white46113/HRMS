{{if count($attendance_sheet) > 0}} {foreach $attendance_sheet as $sem_index => $sem_row}
<tr class="{{$sem_row['row_class']}}">
    <td align="center" valign="middle" class="text-center att-date">{{$sem_row['attendance_date']}}</td>
    <td align="center" valign="middle" class="text-center att-time timesheet-shift-row">{{$attendance_in}}</td>
    <td align="center" valign="middle" class="text-center att-time">{{$sem_row['attendance_in_time']}}</td>

    <td align="center" valign="middle" class="text-center att-time timesheet-shift-row">{{$attendance_out}}</td>
    <td align="center" valign="middle" class="text-center att-time">{{$sem_row['attendance_out_time']}}</td>
    <td align="center" valign="middle" class="text-center att-hrs">{{$sem_row['working_hr']}}</td>
    <td align="center" valign="middle" class="text-center att-status">{{$sem_row['attendance']}}</td>
    <td align="center" valign="middle" class="text-center att-action">
        {$sem_row['btn_html']}
    </td>
</tr>
{/foreach} {{else}}
<tr>
    <td colspan="8">
        <div class="mb-5 no-data-found-block">
            <img alt="" src="{{$base_url}}public/assets/images/images/no_data_found_new.png" height="150" width="150" class="mt-5" />
            <br />
            <span class="mb-4 no-data-found-message">No timesheet data found!</span>
        </div>
    </td>
</tr>

{{/if}}
