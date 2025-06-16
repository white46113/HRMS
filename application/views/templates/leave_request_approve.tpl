<div class="card mb-3 user-details-block">
    <input type="hidden" value="{$leave_list['leave_id']}" id="leave_request_id" />
    <input type="hidden" value="{base64_encode(json_encode($leave_list))}" name="" id="user_details_input" />
    <div class="row g-0 m-3">
        <div class="col-2">
            <div class="image-block">
                <img src="{$leave_list['image']}" width="100" height="100" />
            </div>
        </div>
        <div class="col-10 employee-detils">
            <div class="row">
                <div class="col-4 p-1">
                    <span class="employee-name employee-name-block">{{$leave_list['employee_name']}}</span>
                    <span class="emp-grid-code" id="employee_code">{{$leave_list['employee_code']}}</span>
                </div>
                <div class="col-4 p-1 location-block">
                    <span class="title-box">Location</span>
                    <span class="val-box">{{$leave_list['location']}}</span>
                </div>
                <div class="col-4 p-1 designation-block">
                    <span class="title-box">Designation</span>
                    <span class="val-box">{{$leave_list['designation_name']}}</span>
                </div>
                <div class="col-4 p-1 department-block">
                    <span class="title-box">Department</span>
                    <span class="val-box">{{$leave_list['department_name']}}</span>
                </div>
                <div class="col-4 p-1 from-date-block">
                    <span class="title-box">From Date</span>
                    <span class="val-box">{{date_formater($leave_list['from_date'])}}</span>
                </div>
                <div class="col-4 p-1 to-date-block">
                    <span class="title-box">To Date</span>
                    <span class="val-box">{{date_formater($leave_list['to_date'])}}</span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card mb-3 user-details-block">
    <div class="row g-0 m-3">
        <div class="col-12 employee-detils">
            <div class="row">
                <div class="col-4 p-1">
                    <span class="title-box">Sick Leave</span>
                    <span class="val-box ">{{$allocated_leaves['SickLeave']}} Day(s)</span>
                </div>
                <div class="col-4 p-1">
                    <span class="title-box">Paid Leave</span>
                    <span class="val-box ">{{$allocated_leaves['PaidLeave']}} Day(s)</span>
                </div>
                <div class="col-4 p-1">
                    <span class="title-box">Casual Leave</span>
                    <span class="val-box ">{{$allocated_leaves['CasualLeave']}} Day(s)</span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card mb-3 leave-box">
    <div class="row g-0 m-3">
        <div class="col-12 text-center">
            <div class="ms-3">
                <div class="radio-toolbar leave_aprove_reject_check">
                    <input type="radio" id="approveAll" name="allReqs" value="approve" />
                    <label for="approveAll" class="me-3"><i class="fas fa-check-circle"></i> Approve </label>

                    <input type="radio" id="denyAll" name="allReqs" value="reject" />
                    <label for="denyAll"><i class="fas fa-times-circle"></i> Reject </label>
                </div>
            </div>
        </div>
    </div>
</div>
