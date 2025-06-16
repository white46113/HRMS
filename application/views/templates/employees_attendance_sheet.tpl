

<div class="main-middle-container">
<div class="sub-header att-sub-header">
    <div class="sub-header-left pull-left">
        <h3>Employee Timesheet</h3>
        
    </div>
    <div class="sub-header-right pull-right">
        <div class="timesheet-summary">
            <div class="timesheet-summary-lst year-drop-down ">
                <div class="input-group ">
                                              <input type="text" class="form-control" id="join_date_search" autocomplete="off"  placeholder="Joining Date" value="{{$date}}">
                                               <span class="input-group-text time-picker-addon date-picker-addon"><i class="las la-calendar-alt"></i></span>
                                            </div>
            </div>
            <div class="timesheet-summary-lst">
                <div class="dropdown">
                  <button class="btn btn-secondary top-btn-row" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="las la-fill-drip"></i>
                  </button>
                  <ul class="dropdown-menu p-2 mt-1" aria-labelledby="dropdownMenuButton1">
                    <li title="Present" class="pl-3"><span class="color-box present"></span>Present</li>
                    <li title="Absent" class="pl-3"><span class="color-box absent"></span>Absent</li>
                    <li title="Week Off" class="pl-3"><span class="color-box week_off"></span>Week Off</li>
                    <li title="Correction" class="pl-3"><span class="color-box correction"></span>Correction</li>
                    
                  </ul>
                </div>
            </div>
           
        </div>
        

        
        
    </div>
</div>

<div class="inner-container" style="position: static; zoom: 1;">
    <div class="timesheet-container">

        <div class="custom-modal-content custom-content-table-with-fixed-column data_table_block">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table" style="border-collapse: collapse;" border-color="#e1e1e1">
                <thead>
                    <tr>
                        
                        <th align="center" valign="middle" class="text-center att-date">Employee Name</th>
                        <th align="center" valign="middle" class="text-center att-time">Shift Start</th>
                        <th align="center" valign="middle" class="text-center att-time">Time In</th>
                        <th align="center" valign="middle" class="text-center att-time">Shift End</th>
                        <th align="center" valign="middle" class="text-center att-time">Time Out</th>
                        <th align="center" valign="middle" class="text-center att-time">Working Hr</th>
                        <th align="center" valign="middle" class="text-center att-status">Present Absent</th>
                        <th align="center" valign="middle" class="text-center att-action">Action</th>
                    </tr>
                </thead>
                <tbody id="attendence_sheet_data" tabindex="5001" style="overflow: hidden; outline: none;">
                {{if count($attendance_sheet) > 0}}
                    {foreach $attendance_sheet as $sem_index => $sem_row}
                    <tr class="{{$sem_row['row_class']}}">
                        <td align="center" valign="middle" class="text-center att-date">{{$sem_row['employee_name']}}</td>
                        <td align="center" valign="middle" class="text-center att-time timesheet-shift-row">{{$attendance_in}}</td>
                        <td align="center" valign="middle" class="text-center att-time">{{$sem_row['attendance_in_time']}}</td>
                        

                        <td align="center" valign="middle" class="text-center att-time timesheet-shift-row">{{$attendance_out}}</td>
                        <td align="center" valign="middle" class="text-center att-time">{{$sem_row['attendance_out_time']}}</td>
                        <td align="center" valign="middle" class="text-center att-hrs">{{$sem_row['working_hr']}}</td>
                        <td align="center" valign="middle" class="text-center att-status">{{$sem_row['attendance']}}</td>
                        <td align="center" valign="middle" class="text-center att-action">{{$sem_row['btn_html']}}</td>
                    </tr>
                    {/foreach}
                {{else}}
                    <tr >
                        <td colspan="8">
                            <div class="mb-5 no-data-found-block">
                             <img
                                alt=""
                                src="{{$base_url}}public/assets/images/images/no_data_found_new.png"
                                height="150"
                                width="150"
                                 class="mt-5"
                            />
                            <br>
                            <span class="mb-4 no-data-found-message">No timesheet data found!</span>
                            </div>
                        </td>
                    </tr>


                {{/if}} 

                    

                    
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalToggleLabel">Correction</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="main-content">
                <div class="card mb-3 in-time-correction-box">
                    <input type="hidden"  value="" id="attendance-id-val">
                    <input type="hidden"  value="" id="attendance-date-val">
                        <div class="row g-0 m-3">
                            
                            <div class="col-8">
                                <div class="ms-3">
                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Attendance In </p>
                                        <span id="attendance-in-time-block">2024-02-29 10:13:53</span>                                    
                                </div>
                            </div>
                            <div class="col-4 text-center">
                                <input type="text" class="form-control timepicker" placeholder=" Time (Optional)" readonly="" field_signature="1318412689" form_signature="16953406393666940328" alternative_form_signature="16007236765535082429" visibility_annotation="true" id="in-time-input" data-time="" value="">
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3 out-time-correction-box">
                        <div class="row g-0 m-3">
                            
                            <div class="col-8">
                                <div class="ms-3">
                                    <p class="fs-5 mb-1 fw-bold attendance-lable">Attendance Out</p>
                                        <span id="attendance-out-time-block">2024-02-29 10:13:53</span>                                    
                                </div>
                            </div>
                            <div class="col-4 text-center">
                                <input type="text" class="form-control timepicker"  readonly="" field_signature="1318412689" form_signature="16953406393666940328" alternative_form_signature="16007236765535082429" visibility_annotation="true" data-time="" id="out-time-input" value="">
                            </div>
                        </div>
                    </div>
            </div>


          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button class="btn btn-primary submit-correction" >Submit</button>
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
    <style>
        #join_date_search{
            background: white;
        }
    </style>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="public/css/attendance_sheet.css" />
    <script type="text/javascript" >
        var month_arr = {{$months|json_encode}};
        var date = {{$date|json_encode}};
    </script>
    <script src="public/js/employee_attendance_sheet.js"></script>
 {include file="footer.tpl" }