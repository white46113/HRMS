<div class="details">
    <!-- Grp detatils start -->
    <div class="card mb-3 user-details-block">
        <div class="row g-0 m-3">
            <div class="col-12 employee-detils">
                <div class="row">
                    <div class="col-3 p-2">
                        <span class="title-box">Group Title</span>
                        <span class="val-box">{{$shiftDetails['group_title']}}</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">Shift Name</span>
                        <span class="val-box">{{$shiftDetails['shift_name']}}</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">Department</span>
                        <span class="val-box">{{$shiftDetails['department_name']}} ({{$shiftDetails['department_code']}})</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">Start Date</span>
                        <span class="val-box">{{$shiftDetails['start_date_display']}}</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">End Date</span>
                        <span class="val-box">{{$shiftDetails['end_date_display']}}</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">Start Time</span>
                        <span class="val-box">{{$shiftDetails['start_time']}}</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">End Time</span>
                        <span class="val-box">{{$shiftDetails['end_time']}}</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">Shift Type</span>
                        <span class="val-box">{{$shiftDetails['shift_type']}}</span>
                    </div>
                    <div class="col-3 p-2">
                        <span class="title-box">Total Employee</span>
                        <span class="val-box">{{$shiftDetails['employee_count']}}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

  

    <!--grp detail end  -->
    <h5 class="mb-3">Employee Details</h5>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col text-center">Employee Name</th>
                <th scope="col text-center">Employee Code</th>
                <!-- <th scope="col" style="text-align: center">Department</th> -->
            </tr>
        </thead>
        <tbody class="shift_employee_details">
        	{foreach $employees as $employees_index => $employees_row}
        		<tr>
	                <th scope="col text-center">{$employees_row['first_name']} {$employees_row['last_name']}</th>
	                <th scope="col text-center">{$employees_row['employee_code']}</th>
	                <!-- <th scope="col" style="text-align: center">{$employees_row['department']}</th> -->
	            </tr>
        	{/foreach}
            
        </tbody>
    </table>
</div>
