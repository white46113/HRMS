var table = '';
var grid_type = "Table";
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById('week_off_add'))
    var salarySlipModal = new bootstrap.Modal(document.getElementById('salary_block'))
    var aproveModal = new bootstrap.Modal(document.getElementById('edit_approve_block'))
    $(document).on('click',".la-calendar",function(){
        var id = $(this).attr("data-id");
        $("#employee-id").val(id)
        $("#week_off").select2({
          placeholder: "Select Week Off",
          allowClear: false,
          multiple:true,
        });
        myModal.show()
    });
    $(document).on('click',".la-check-circle",function(){
     var employee_id = $(this).attr("data-id");
      let msg = "Are you sure want to activate this account?";
      let action = "activation";
      let title = "Employee Account Activation";
      activeInactiveUser(employee_id,msg,title,action)
    });
    $(document).on('click',".la-times-circle",function(){
      var employee_id = $(this).attr("data-id");
      let msg = "Are you sure want to deactivate this account?";
      let action = "deactivation";
      let title = "Employee Account Deactivate";
      activeInactiveUser(employee_id,msg,title,action)
    });

    $(document).on('click',".edit-approve",function(){
     var employee_id = $(this).attr("data-id");
     loader()
        $.ajax({
        type: "POST",
        url: "home/edit_employee_date",
        data: {
            employee_id: employee_id,
        },
        success: function (response) {
            var responseObject = JSON.parse(response);
            var html = responseObject.html;
            setTimeout(function () {
                $("#edit_approve_block .modal-body").html(html)
                aproveModal.show();
                hide_loader()
            }, 2000);
            
        },
        error: function (error) {},
        });
    });
    $(document).on('click',".submit-approve-edit",function(){
     var approval_type = $(this).attr("data-type");
     var employee_id = $("#edit_approve_id").val();
     loader()
     if(employee_id != "" && approval_type  != ""){
        $.ajax({
        type: "POST",
        url: "home/edit_employee_details",
        data: {
            employee_id: employee_id,
            approval_type:approval_type
        },
        success: function (response) {
            var responseObject = JSON.parse(response);
              var msg = responseObject.message;
              var success = responseObject.success;
              if (parseInt(success) == 1) {
                toaster("success", msg);
                setTimeout(function () {
                  location.reload(true);
                }, 2000);
              } else {
                toaster("fails", msg);
              }
            
        },
        error: function (error) {},
        });
     }
     
        
    });

    

    $(document).on("click",".delet-employee", function () {
        var id = $(this).data("id");
        loader()
        Swal.fire({
            title: "Delete Employee",
            text: "Are you sure you want to delete this emloyee?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!",
            customClass: {
                confirmButton: "btn btn-primary me-1",
                cancelButton: "btn btn-label-secondary",
            },
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                $.ajax({
                type: "POST",
                url: "home/delete_employee",
                data: {
                    id: id,
                },

                success: function (response) {
                    var responseObject = JSON.parse(response);
                    var msg = responseObject.message;
                    var success = responseObject.success;
                    if (parseInt(success) == 1) {
                        toaster("success", msg);
                        setTimeout(function () {
                            location.reload(true);
                        }, 2000);
                    } else {
                        toaster("fails", msg);
                    }
                },
                error: function (error) {},
            });
            }else{
                hide_loader();
            }
        });
    });  
    $(".dropdown-menu li").on('click',function(){
        $(".dropdown-menu li").removeClass("active");
        $(this).addClass("active");
        var slected_val = $(this).attr("data-value")
        if(slected_val == "Grid"){
            grid_type = "Grid";
          $("#example_wrapper .dataTables_scroll").hide()
          $(".grid-block").show()
        }else if (slected_val == "Table") {
          grid_type = "Table";
          // var width = $("#example_wrapper").width()
          // $(".dataTables_scroll .dataTables_scrollHeadInner table").attr("style","width:"+width+"px")
          // $("#example_wrapper .dataTables_scroll").show()
          // $(".grid-block").hide()
          table.destroy();    
          makeTable('');
        }
    })
    $('#serarch-filter-input').on('keyup', function() {
     
      table.destroy();    
          makeTable(this.value);
    });
    // })

    $(".submit-week-off").on("click",function(){
        var employee_id = $("#employee-id").val();
        var week_off = $("#week_off").val();
        
        if(week_off == "" || week_off == null || week_off == undefined){
            toaster("warning","Please select week off");
        }else{
            loader()
            var formData = {employee_id:employee_id,week_off:week_off};
              $.ajax({
                type: "POST",
                url: "home/submit_employee_week_off",
                data: formData,
                success: function (response) {
                  var responseObject = JSON.parse(response);
                  var success = responseObject.success;
                  var msg = responseObject.message;
                  setTimeout(function(){
                      hide_loader();
                      if (parseInt(success) == 1) {
                        toaster("success",msg);
                            myModal.hide()
                            table.destroy();    
                            makeTable('');
                            
                      } else {
                        toaster("fails",msg);
                      }
                   },1000)
                },
                error: function (error) {
                  
                },
              });
        }
        
    })

    makeTable('');


    // filter 
    $("#status_drop_down").select2({
          placeholder: "Select Status",
          allowClear: true,
          minimumResultsForSearch: Infinity,
          autocomplete:'off'
    });
    $("#designation_search").select2({
      allowClear: true,
      placeholder:{
        id: '',
        text: 'Select Department'
    }
    });
    $("#department_search").select2({
      allowClear: true,
      placeholder:{
        id: '',
        text: 'Select Designation'
    }
    });

    // $('#join_date_search').daterangepicker({
    //   showButtonPanel: true,
    //   changeMonth: true,
    //   changeYear: true,
    //   showOtherMonths: true,
    //   selectOtherMonths: true ,
    //   dateFormat: "yy-mm-dd"
    // })
    $('#join_date_search').daterangepicker({
      autoUpdateInput: false,
      locale: {
          cancelLabel: 'Clear'
      }
    });

    $('#join_date_search').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
    });

    $('#join_date_search').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });

    $(".search-filter").on("click",function(){
        var data = serachParams();
        table.destroy(); 
        makeTable();
        $(".close-filter-btn").trigger( "click" )
    })
    $(".reset-filter").on("click",function(){
        resetFilter()
    })

    // slary slip popup
    $(document).off('click','.submit-salary-date');
    $(document).on('click',".submit-salary-date",function(){
      var salary_month_year = $("#salary_month_year input").val();
      var employee_id = $("#employee-id-val").val();
      if(employee_id > 0 && salary_month_year != ""){
        $(".salary_month_year_error").hide();
        salarySlipModal.hide();
        loader();
        let params = {id:employee_id,salary_month_year:salary_month_year};
        $.ajax({
          type: "POST",
          url: "salary/getpdfUrl",
          data: params,
          success: function (response) {
              response = response ?? '';
              if(response == '') return 0;
              var responseObject = JSON.parse(response);
              downloadPDF(responseObject.url); 
              hide_loader()       
          },
          error: function (error) {},
          });
      }else{
        if(salary_month_year == "" || salary_month_year == undefined){
          $(".salary_month_year_error").show();
        }else{
          toaster("fails","Error!");
        }
      }
    });
    $(document).off('click','.pdf-download');
    $(document).on('click','.pdf-download',function(e){
      $('#salary_month_year input').val('');
      let id = $(this).attr('data-id');
      $("#salary_block #employee-id-val").val(id)
      salarySlipModal.show();
    });
    $("#salary_month").select2({
          placeholder: "Select Month",
          allowClear: true,
          minimumResultsForSearch: Infinity,
          autocomplete:'off'
    });
    $("#salary_year").select2({
          placeholder: "Select Year",
          allowClear: true,
          minimumResultsForSearch: Infinity,
          autocomplete:'off'
    });
    $('#salary_month_year').calendar({
      type: 'month',
      maxDate: new Date()
    });

});


// below function is used to force download file
const downloadPDF = (pdfUrl) => {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', pdfUrl, true);
  xhr.responseType = 'blob';

  xhr.onload = function() {
      if (xhr.status === 200) {
          // Create a link element and trigger download
          var blob = xhr.response;
          var link = document.createElement('a');
          link.href = window.URL.createObjectURL(blob);
          link.download = 'salary_slip.pdf';
          link.click();
      }
  };

  xhr.send();
}

function makeTable(data) {
  loader()
    var data = serachParams();
    table = new DataTable("#example", {
        dom: 'Bfrtilp',
        buttons: [
              {     
                extend: 'csv',
                  text: '<i class="ti ti-file-type-csv"></i>',
                  init: function(api, node, config) {
                  $(node).attr('title', 'Download CSV');
                  },
                  customize: function (csv) {
                        var lines = csv.split('\n');
                        var modifiedLines = lines.map(function(line) {
                            var values = line.split(',');
                            values.splice(0, 1);
                            values.splice(8, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename : 'employee_list'
                },
            
              {
                extend: 'pdf',
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function(api, node, config) {
                    $(node).attr('title', 'Download Pdf');
                },
                filename: 'employee_list',
                customize: function (doc) {
                  doc.pageMargins = [15, 15, 15, 15];
                  doc.content[0].text = 'Employee List';
                  doc.content[0].color = '#5d87ff';
                    // doc.content[1].table.widths = ['15%', '19%', '13%', '13%','15%', '15%', '10%'];
                    doc.content[1].table.body[0].forEach(function(cell) {
                        cell.fillColor = '#5d87ff';
                    });
                    doc.content[1].table.body.forEach(function(row, index) {
                        row.splice(9, 1);
                        row.splice(0, 1);
                        // row.forEach(function(cell) {
                        //     // Set alignment for each cell
                        //     cell.alignment = 'center'; // Change to 'left' or 'right' as needed
                        // });
                        
                    });
                }
            },
        ],
        orderCellsTop: true,
        fixedHeader: true,
        lengthMenu: page_length_arr,
        // "sDom":is_top_searching_enable,
        columns: column_details,
        processing: false,
        serverSide: is_serverSide,
        sordering: true,
        searching: is_searching_enable,
        ordering: is_ordering,
        bSort: true,
        orderMulti: true,
        pagingType: "full_numbers",
        scrollCollapse: true,
        scrollX: true,
        scrollY: true,
        paging: is_paging_enable,
        fixedHeader: false,
        info: true,
        autoWidth: true,
        lengthChange: true,
        ajax: {
            data: {'search':data},    
            url: "home/get_employee_listing_data",
            type: "POST",
        },
        "columnDefs": [
		    { "sortable": false, "targets": 0 },
		    { "sortable": true, "targets": 0 },
		    { "sortable": false, "targets": 7 },
        { "sortable": false, "targets": 9 }
		  ],
		  order: [[1, 'asc']],


        scroller: {
            loadingIndicator: true,
        },
        "drawCallback": function( settings, json ) {
          var data = settings.jqXHR.responseJSON.data;
          var html = "<div class='container grid-block-container'><div class='row w-100'>";
          for (var i = 0; i < data.length; i++) {
            var action_html = "";
            if(data[i]['action'] != "--"){
                action_html = '<a hijacked="yes" href="javascript:void(0)" data-id="'+data[i]['employee_id']+'" context="" title="Login As" class="btn view-btn  btn  la-calendar">Week Off</a>';
                action_html = data[i]['other_Action'];
            }
            
             html += '<div class="col-3"><div class="card mb-4"><div class="grid_view_warehouse"><div class="grid_view_warehouse_box h-auto"><div class="grid_view_warehouse_title mb-0"><div class="grid_view_warehouse_title_lt"><div class="grid_view_warehouse_title_icon"><div class="status-radius '+(data[i]['status_val']).toLowerCase()+'"></div><img src="'+data[i]['image_url']+'" width="62" height="62" class="list-image ma_profile_image" /></div><div class="grid_view_warehouse_title_cnt p-3"><h5 class="trim-characters"><a href="'+data[i]['employee_url']+'" class="inline-edit-link" title="'+data[i]['name']+'">'+data[i]['name']+'</a></h5><h6 class="trim-characters">'+data[i]['employee_code']+'</h6></div></div></div><div class="grid-types"><div class="request_type"><strong>Group Name</strong>Employee</div><div class="other-actions-list-btn mt-0 mr-2">'+action_html+'</div></div><div class="usage_type_box"><div class="label_text" ><span>User Email</span><label>'+data[i]['email']+'</label></div><div class="label_text" ><span>Department</span><label>'+data[i]['department']+'</label></div><div class="label_text" ><span>Designation</span><label>'+data[i]['designation']+'</label></div><div class="label_text"><span>Joining Date</span><label>'+data[i]['joining_date']+'</label></div></div></div></div></div></div>';
          }
          $(".dropdown-menu li").removeClass("active");
          html += '</div></div>';
          $("#example_wrapper .grid-block").remove();
          $("#example_wrapper .dataTables_scroll").after("<div class='grid-block' style='display:none'>"+html+"</div>")
          if(grid_type == "Table"){
                $(".dropdown-menu li.table").addClass("active");
                $("#example_wrapper .dataTables_scroll").show()
                $(".grid-block").hide()
          }else{
                $(".dropdown-menu li.grid").addClass("active");
                $(".grid-block").show()
                $("#example_wrapper .dataTables_scroll").hide()
          }
          setTimeout(function(){
            hide_loader()
          },1000)
         
            // setHeigt();
        },
        language: {
            loadingRecords: "&nbsp;",
            processing: '<div class="spinner"></div>',
            emptyTable: no_data_message,
            paginate: {
                first: "<<",
                last: ">>",
                next: ">",
                previous: "<",
            },
        },
    });
    

    $('.dataTables_length').find('label').contents().filter(function() {
        return this.nodeType === 3; // Filter out text nodes
    }).remove();
}

function serachParams(){
  var status = $("#status_drop_down").val();
  var employee_name = $("#employee_name_search").val();
  var employee_code = $("#employee_code_search").val();
  var join_date = $("#join_date_search").val();
  var email = $("#email_search").val();
  var department = $("#department_search").val();
  var designation = $("#designation_search").val();
  var search_val = $("#serarch-filter-input").val();
  var params = {search_val:search_val,status:status,employee_name:employee_name,employee_code:employee_code,join_date:join_date,email:email,department:department,designation:designation};
  return params;
}
function resetFilter(){
  $("#status_drop_down").val('').trigger('change');
  $("#employee_name_search").val('');
  $("#employee_code_search").val('');
  $('#join_date_search').daterangepicker('setDate', '')
  $('#join_date_search').val('');
  $('#join_date_search').daterangepicker('setDate', '')
  $('#join_date_search').val('');
  $("#department_search,#designation_search").val('').trigger('change');
  $("#email_search").val('');
  $("#department_search").val('');
  $("#designation_search").val('');
  table.destroy(); 
        makeTable() 
}

function activeInactiveUser(employee_id = '',msg = '',title = '',action= ''){
  Swal.fire({
            title: title,
            text: msg,
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes",
            customClass: {
                confirmButton: "btn btn-primary me-1",
                cancelButton: "btn btn-label-secondary",
            },
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                changeUserStatus(employee_id,action);
            }else{
                hide_loader();
            }
  });
}
function changeUserStatus(employee_id = '',mode = ''){
  if(employee_id > 0){
        loader();
          var formData = {employee_id:employee_id,mode:mode};
              $.ajax({
                type: "POST",
                url: "home/activate_employee",
                data: formData,
                success: function (response) {
                  var responseObject = JSON.parse(response);
                  var success = responseObject.success;
                  var msg = responseObject.message;
                  setTimeout(function(){
                      hide_loader();
                      if (parseInt(success) == 1) {
                        toaster("success",msg);
                            table.destroy();    
                            makeTable('');
                            
                      } else {
                        toaster("fails",msg);
                      }
                   },1000)
                },
                error: function (error) {
                  
                },
              });
      }else{
        toaster("fails","Error!");
      }
}