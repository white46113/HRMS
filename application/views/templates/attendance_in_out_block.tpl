<a href="javascript:void(0)" class="tab-show-logo text-nowrap logo-img text-center  py-3 w-100 mb-4 " {if $type eq 'web'}style="display:none"{/if}>
    <img src="{{$company_logo}}" width="120" alt="">
</a>
<div class="attendance-in-out-block mt-4">
	<input type="hidden" class="employee_id_val" value="{{$employee_id_val}}">
    <input type="hidden" id="attendance-id" value="{{$attendance_id}}">
    <div class="card mb-3">
        <div class="row g-0 pb-3">
            <div class="col-md-3 col-4">
                <img src="{{$base_url}}public/img/uploads/employee_profile/{{$profile_image}}" class="img-fluid rounded-start" ]/>
            </div>
            <div class="col-md-9 col-8">
                <div class="card-body">
                    <h5 class="card-title employee-code">{{$employee_code}}</h5>
                    <p class="card-text mb-2 employee-name">{{$first_name}} {{$middle_name}} {{$last_name}}</p>
                    <p class="card-text employee-designation">{{$designation_name}}</p>
                </div>                                                                                                                                      
            </div>
        </div>
    </div>
</div>
<div class="attendance-in-block mt-4 pt-3">
    <div class="card mb-4  {{if $attendance_in_time != '' }}disable-box{{/if}}">
        <div class="row g-0 m-3">
            <div class="{{if $type == "Tab"}}col-2{{else}}col-1{{/if}}">
                <i class="las la-fingerprint"></i>
            </div>
            <div class="{{if $type == "Tab"}}col-7{{else}}col-9{{/if}}">
                <div class="ms-3">
                    <p class="fs-5 mb-1 fw-bold attendance-lable">Attendance In </p>
                    {{if $attendance_in_time != ''}}
                    	<span>{{$attendance_in_time}}</span>
                    
                    {{/if}}
                </div>
            </div>
            <div class="{{if $type == "Tab"}}col-3 text-right{{else}}col-2 text-center{{/if}}">
                <input class="form-check-input" type="checkbox" value="" id="attendance-in-check" {{if $attendance_in_time != ''}}disabled checked {{/if}} />
            </div>
        </div>
    </div>
    <div class="card mb-3 mt-4 {{if $attendance_out_time != '' || $attendance_in_time == ''}}disable-box{{/if}}">
        <div class="row g-0 m-3">
            <div class="{{if $type == "Tab"}}col-2{{else}}col-1{{/if}}">
                <i class="las la-sign-out-alt"></i>
            </div>
            <div class="{{if $type == "Tab"}}col-7{{else}}col-9{{/if}}">
                <div class="ms-3">
                    <p class="fs-5 mb-1 fw-bold attendance-lable">Attendance Out</p>
                   {{if $attendance_in_time != ''}}
                    	<span>{{$attendance_out_time}}</span>
                    {{/if}}
                </div>
            </div>
            <div class="{{if $type == "Tab"}}col-3 text-right{{else}}col-2 text-center{{/if}}">
                <input class="form-check-input" type="checkbox" value="" id="attendance-out-check" {{if $attendance_out_time != '' || $attendance_in_time == ''}}disabled  {{/if}} {{if $attendance_out_time != '' }}checked  {{/if}}/>
            </div>
        </div>
    </div>
    <div class="text-center mb-3 submit-block mt-5 ">
        <button class="btn btn-outline-primary  pb-2 pt-2" onclick="window.location.reload()">Cancel</button>
    	{{if  $attendance_in_time == ''}}
        <button class="btn btn-outline-primary  pb-2 pt-2" id="attendance_in_btn">IN</button>
        {{/if}}
        {{if  $attendance_in_time != '' && $attendance_out_time == ''}}
        <button class="btn btn-outline-primary  pb-2 pt-2" id="attendance_out_btn">Out</button>
        {{/if}}
    </div>
</div>
