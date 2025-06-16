

<div class="sub-header">
    <div class="sub-header-left pull-left mt-2">
        <h3>Welcome, {{$user_data['first_name']}} 👋</h3>
        <div class="site-breadcrumb">Have a look at your overall summary.</div>
    </div>
</div>
<div class="p-2 dashbord-middle-box">
    <div class="row db-summary-content">
        <div class="col-lg-3 team-summary">
            <div class="dash-card-box my-summary-block">
                <div class="main-info-top">
                    <div class="my-profile-pic">
                        <img alt="" src="{{$base_url}}public/img/uploads/employee_profile/{{$user_data['profile_image']}}" />
                    </div>
                    <div class="my-details">
                        <h3>{{$user_data['first_name']}} {{$user_data['middle_name']}} {{$user_data['last_name']}}</h3>
                        <div class="my-designation">{{$user_data['designation_name']}}</div>
                        <div class="my-code">{{$user_data['employee_code']}}</div>
                    </div>
                </div>
                <div class="my-extra-info">
                    <div class="item-cnt">
                        <div class="item-label">Email :</div>
                        <div class="item-value email">{{$user_data['email']}}</div>
                    </div>
                    <div class="item-cnt">
                        <div class="item-label">Dept :</div>
                        <div class="item-value">{{$user_data['department_name']}}</div>
                    </div>
                    <div class="item-cnt">
                        <div class="item-label">Since :</div>
                        <div class="item-value">{{$joining_date_arr['y']}} Years {{$joining_date_arr['m']}} Months {{$joining_date_arr['d']}} Days</div>
                    </div>

                    <div class="item-cnt">
                        <div class="item-label">Location :</div>
                        <div class="item-value">{{$user_data['city']}}</div>
                    </div>
                </div>
            </div>
            <div class="dash-card-box">
                <div class="dash-card-box-header">
                    <div class="dash-card-box-header-title">
                        My Department
                    </div>
                    <div class="dash-card-box-header-action"></div>
                </div>
                <div class="dash-card-box-content">
                    <div class="dash-card-box-content-inner">
                        <ul class="team-member-db-summary-list" id="team-member-db-summary-list">
                           
                        {if count($department_member) > 0}
                          {foreach from=$department_member item=department_val}
                            <li class="summary-team-data-for-left" style="display: flex;">
                                <div class="badge-cnt">
                                    <span class="badge {$department_val['team_meber_class']}"> {$department_val['team_meber_title']}</span>
                                </div>
                                <div class="member-cnt {$department_val['attendance_status_class']}">
                                    <div class="emp-basic-info">
                                        <div class="emp-thumb">
                                            <img
                                                alt=""
                                                src="{$department_val['profile_image']}"
                                            />
                                        </div>
                                        <div class="status">
                                            {$department_val['attendance_status']}
                                        </div>
                                    </div>
                                    <div class="emp-details">
                                        
                                        <h3>{$department_val['full_name']}</h3>
                                        <div class="item-cnt">
                                            <!--<span class="item-label">As</span> -->
                                            <span class="item-data"> {$department_val['department_name']} </span>
                                        </div>
                                        <div class="item-cnt">
                                            <!-- <span class="item-label">Dept: </span> -->
                                            <span class="item-data"> {$department_val['designation_name']}</span>
                                        </div>
                                    </div>
                                </div>
                                {if $department_val['attendance_status'] neq 'Absent' && $department_val['attendance_status'] neq 'On Leave'}
                                <div class="inout-time  mt-2">
                                  <span class="item-label">In:</span><span class="item-data">{$department_val['attendance_in_time']} </span><span class="item-label">Out:</span> <span class="item-data">{display_no_character($department_val['attendance_out_time'])}</span></div>
                                {/if}
                            </li>

                          {/foreach}
                        {else}
                        <div class="db-emp-thumb-list text-center mt-4 mb-5 no-birthday-block">
                                        <div class="">
                                            <img class="" src="public/assets/images/images/no_data_found_new.png" height="70" width="70">
                                            <br>
                                            <span class="shadow-line"></span>
                                             No department_val data found..!
                                        </div>
                                    </div>
                        {/if}

                            
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-lg-6">
            <div class="row">
                <div class="col-lg-6 quick-access-summary">
                    <div class="dash-card-box attendance-box">
                        <div class="dash-card-box-header">
                            <div class="dash-card-box-header-title">Attendance</div>
                            <div class="dash-card-box-header-action">Today</div>
                        </div>
                        <div class="dash-card-box-content">
                            <div class="dash-card-box-content-inner">
                                <div class="wrapper-cnt d-flex">
                                    <div class="avg-hours highlight-box">
                                        <div class="count">{{$working_time}}</div>
                                        <span class="item-label">Working Hours <em>Today </em> </span>
                                    </div>

                                    <div class="bottom-action today-highlight w-100">
                                        <div class="d-flex">
                                            <div class="today-info">
                                                {{if $attendance_in_time != ''}}
                                                <div class="time">Attendance In : {{$attendance_in_time}}</div>
                                                {{else}}
                                                <div class="time absent-text">Absent</div>
                                                {{/if}}
                                            </div>
                                            {{if $attendance_out_time != ""}}
                                            <div class="today-info">
                                                <div class="time">Attendance Out : {{$attendance_out_time}}</div>
                                            </div>

                                            {{/if}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dash-card-box celebrating-birthdays">
                        <div class="dash-card-box-header">
                            <div class="dash-card-box-header-title" style="padding-left: 50px; grid-gap: 0;">
                                <div class="image-box"><img src="{{$base_url}}public/assets/images/images/birthday-cake_1.png" width="21" height="21" alt="" /></div>
                                Celebrating Birthdays
                                <div class="sub-title-text" style="margin: 0; color: var(--body-light-text); font-size: var(--mediumFont) !important; width: 100%; line-height: 14px; font-weight: var(--theme-font-weight-medium) !important;">
                                    {{date("d")}} {{date("D")}} to {{date("d", strtotime("+7 days"))}} {{date("D", strtotime("+7 days"))}} (Next 7 Days)
                                </div>
                            </div>
                        </div>
                        <div class="dash-card-box-content">
                            {if count($bithaday) > 0}
                            <div class="dash-card-box-content-inner">
                                <div class="birthday-list-block">
                                    <div class="wrapper-cnt d-flex mt-2 mb-2">
                                        <div class="db-emp-thumb-list">
                                            <ul>
                                                {foreach $bithaday as $index => $employee}
                                                <li>
                                                    <div class="emp-thumb tooltips" title="{{$employee['first_name']}} {{$employee['middle_name']}} {{$employee['last_name']}}">
                                                        <img alt="" width="50" height="50" src="{{$base_url}}public/img/uploads/employee_profile/{{$employee['profile_image']}}" />
                                                    </div>

                                                    <span class="text">{{date("d", strtotime($employee['dob']))}} {{date("M", strtotime($employee['dob']))}}</span>
                                                </li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {else}
                            <div class="birthday-list-block">
                                <div class="wrapper-cnt d-flex mt-0">
                                    <div class="db-emp-thumb-list text-center mt-0 no-birthday-block">
                                        <div class="">
                                            <img class="" src="public/assets/images/images/no_data_found_new.png" height="50" width="50" >
                                            <span class="shadow-line"></span>
                                             No birthday data found..!
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/if}
                        </div>
                    </div>

                </div>
                <div class="col-lg-6">
                    <div class="dash-card-box leave-box">
                        <div class="dash-card-box-header">
                            <div class="dash-card-box-header-title">Leave Balances</div>
                        </div>

                        <div id="leave_balance_summary_data">
                            <div class="dash-card-box-content">
                                <div class="dash-card-box-content-inner">
                                    <div class="wrapper-cnt d-flex">
                                        <div class="leave-balance highlight-box">
                                            <div class="count">{$pending_leave}</div>
                                            <span class="tooltips item-label" title="Privilege Leave"> PL</span>
                                        </div>

                                        <div class="bottom-action today-highlight w-100">
                                            <div class="d-flex">
                                                <div class="action-button ml-auto  mb-2 pb-1">
                                                    <a href="{$apply_leave_url}" class="text-link">Apply</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dash-card-box celebrating-birthdays celebrating-anniversary">
                        <div class="dash-card-box-header">
                            <div class="dash-card-box-header-title" style="padding-left: 50px; grid-gap: 0;">
                                <div class="image-box"><img src="{{$base_url}}public/assets/images/images/birthday-cake_1.png" width="21" height="21" alt="" /></div>
                                Celebrating Work Anniversary
                                <div class="sub-title-text" style="margin: 0; color: var(--body-light-text); font-size: var(--mediumFont) !important; width: 100%; line-height: 14px; font-weight: var(--theme-font-weight-medium) !important;">
                                    {{date("d")}} {{date("D")}} to {{date("d", strtotime("+7 days"))}} {{date("D", strtotime("+7 days"))}} (Next 7 Days)
                                </div>
                            </div>
                        </div>
                        <div class="dash-card-box-content">
                            {if count($work_anniversary) > 0}
                            <div class="dash-card-box-content-inner">
                                <div class="birthday-list-block">
                                    <div class="wrapper-cnt d-flex mt-2 mb-2">
                                        <div class="db-emp-thumb-list">
                                            <ul>
                                                {foreach $work_anniversary as $index => $employee}
                                                <li>
                                                    <div class="emp-thumb tooltips" title="{{$employee['first_name']}} {{$employee['middle_name']}} {{$employee['last_name']}}">
                                                        <img alt="" width="50" height="50" src="{{$base_url}}public/img/uploads/employee_profile/{{$employee['profile_image']}}" />
                                                    </div>

                                                    <span class="text">{{date("d", strtotime($employee['employment_date']))}} {{date("M", strtotime($employee['employment_date']))}}</span>
                                                </li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {else}
                            <div class="birthday-list-block">
                                <div class="wrapper-cnt d-flex mt-0">
                                    <div class="db-emp-thumb-list text-center mt-0 no-birthday-block">
                                        <div class="">
                                            <img class="" src="public/assets/images/images/no_data_found_new.png" height="50" width="50" >
                                            <span class="shadow-line"></span>
                                            No work anniversary data found..!
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/if}
                        </div>
                    </div>

                </div>
                <div class="col-lg-12 quick-access-summary">
                    <div class="dash-card-box attendace-summary-dash-card-box">
                        <div class="dash-card-box-header">
                            <div class="dash-card-box-header-title">Attendance Summary</div>
                            <div class="dash-card-box-header-action">{$attendance_summary['attendance_month']}</div>
                        </div>

                        <div class="dash-card-box-content">
                            <div class="dash-card-box-content-inner">
                                <div class="attendance-summary-block summary-block w-100">
                                    <div class="chart-summary with-icon green-block">
                                        <div class="chart-summary-icon">
                                            <i class="icon-right"><img src="public/assets/images/images/shift_completed.png" /></i>
                                        </div>
                                        <div class="chart-summary-ttl d-flex flex-column">
                                            <a role="link" class="ttl-count">
                                                <span class="present-count" tip-title="">
                                                    {$attendance_array['present_days']}
                                                </span>
                                            </a>
                                            <label class="dashboard-title">Present Days</label>
                                        </div>
                                    </div>
                                    <div class="chart-summary with-icon red-block">
                                        <div class="chart-summary-icon">
                                            <i class="icon-right"><img src="public/assets/images/images/absent.png" /></i>
                                        </div>
                                        <div class="chart-summary-ttl d-flex flex-column">
                                            <a role="link" class="ttl-count">
                                                <span class="absent-count" tip-title="">
                                                    {$attendance_summary['attendance_percentage']}
                                                </span>
                                            </a>
                                            <label class="dashboard-title">Avg. Attendance</label>
                                        </div>
                                    </div>
                                    <div class="chart-summary with-icon red-block">
                                        <div class="chart-summary-icon">
                                            <i class="icon-right"><img src="public/assets/images/images/absent.png" /></i>
                                        </div>
                                        <div class="chart-summary-ttl d-flex flex-column">
                                            <a role="link" class="ttl-count">
                                                <span class="absent-count" tip-title="">
                                                    {$attendance_array['absent_days']}
                                                </span>
                                            </a>
                                            <label class="dashboard-title">Absent Days</label>
                                        </div>
                                    </div>
                                    <div class="chart-summary with-icon yellow-block">
                                        <div class="chart-summary-icon">
                                            <i><img src="public/assets/images/images/on_leave.png" /></i>
                                        </div>
                                        <div class="chart-summary-ttl d-flex flex-column">
                                            <a role="link" class="ttl-count">
                                                <span class="leaves-count" tip-title="">
                                                    {$attendance_array['leaves']}
                                                </span>
                                            </a>
                                            <label class="dashboard-title">Leaves</label>
                                        </div>
                                    </div>

                                    <div class="chart-summary with-icon green-block">
                                        <div class="chart-summary-icon"><i class="las la-user-clock"></i></div>
                                        <div class="chart-summary-ttl d-flex flex-column">
                                            <a role="link" class="ttl-count">
                                                <span class="trip-count" tip-title="">
                                                   {$attendance_array['total_working_hours']}
                                                </span>
                                            </a>
                                            <label class="dashboard-title">Working Hours</label>
                                        </div>
                                    </div>
                                    <div class="chart-summary with-icon red-block">
                                        <div class="chart-summary-icon"><i class="ti ti-calendar-time"></i></div>
                                        <div class="chart-summary-ttl d-flex flex-column">
                                            <a role="link" class="ttl-count">
                                                <span class="trip-count" tip-title="">
                                                    {$attendance_array['week_off']}
                                                </span>
                                            </a>
                                            <label class="dashboard-title">Week Off</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Monthly Earnings -->
                    <div class="dash-card-box announcement-box">
                        <div class="dash-card-box-header">
                            <div class="dash-card-box-header-title">
                                <i class="ti ti-speakerphone"></i>
                                Announcements
                            </div>
                            <div class="dash-card-box-header-action">
                                {$current_year}
                            </div>
                        </div>
                        <div class="dash-card-box-content">
                            <div class="dash-card-box-content-inner">
                                <div class="wrapper-cnt d-flex pt-0">
                                    <div class="info-cnt">
                                        {if count($notification_details) > 0}
                                            {foreach $notification_details as $index => $notification}
                                            <p></p>
                                            <p><a href="{$notification['redirect_url']}">{$notification['title']}</a></p>
                                            <p></p>
                                            {/foreach}
                                        {else}
                                        <div class="text-center mt-5 pt-5">
                                            <img class="p-2 no-annocement-imag" src="public/assets/images/images/no_data_found_new.png" height="100" width="100" >
                                            <br> No announcements data found..!
                                        </div>  
                                        {/if}
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="dash-card-box holiday-box">
                        <div class="dash-card-box-header">
                            <div class="dash-card-box-header-title">Next Holiday</div>
                        </div>

                        <div class="dash-card-box-content">
                            {if count($holiday) > 0}
                            <div class="dash-card-box-content-inner">
                                <div class="wrapper-cnt d-flex mb-2">
                                    
                                    <div class="hoiday-date">
                                        <div class="date">{$holiday['date']}</div>
                                        <div class="month"><span>{$holiday['month']}</span> <span>{$holiday['year']}</span></div>
                                    </div>
                                    <div class="features-img"><img src="{{$base_url}}public/assets/images/images/holiday-img.png" alt="" /></div>
                                    <div class="bottom-action today-highlight w-100">
                                        <p>{$holiday['holiday_name']}</p>
                                    </div>
                                    
                                </div>
                               
                            </div>
                             {else}
                                <div class="text-center">
                                    <div class="mt-3">
                                        <img class="p-2" src="public/assets/images/images/no_holiday_dash.png" height="50" width="50" style="opacity: .5;" >
                                        <br> No holiday found..!
                                    </div>
                                </div>
                                    
                            {/if}
                        </div>
                    </div>
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
<script src="public/assets/js/dashboard.js"></script>
 {include file="footer.tpl" }