var table = '';
var grid_type = "Table";
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById('leave_aprove_reject'))
    
    $(document).on('click',".la-check-circle",function(){
        var employee_data = $(this).attr("data-user-details");
        employee_data = JSON.parse(atob(employee_data));
        var leave_id = $(this).attr("data-id");
        loader();
        $.ajax({
                type: "POST",
                url: "leave/get_leave_request_data",
                data: {leave_id:leave_id},
                success: function (response) {
                  var responseObject = JSON.parse(response);
                  setTimeout(function(){
                      $("#leave_aprove_reject .main-content").html(responseObject)
                      myModal.show()
                      hide_loader();
                   },1000)
                },
                error: function (error) {
                  
                },
              });


    	
     //    
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
          var width = $("#example_wrapper").width();
          table.destroy();    
          makeTable('');
          // console.log(width)
          // $(".dataTables_scroll .dataTables_scrollHeadInner table").attr("style","width:"+width+"px")
          // $("#example_wrapper .dataTables_scroll").show()
          // $(".grid-block").hide()
        }
    })

    $(".submit-leave").on("click",function(){
    	var checked_val = $(".leave_aprove_reject_check input:checked").val();
    	if(checked_val != undefined && checked_val != null && checked_val != ''){
    		var user_data = $("#user_details_input").val();
    		employee_data = JSON.parse(atob(user_data));
    		var leave_request_id = $("#leave_request_id").val();
    		var formData = {leave_request_id:leave_request_id,slected_status:checked_val,employee_data:employee_data};
    		loader()
    		// console.log(formData)
              $.ajax({
                type: "POST",
                url: "leave/update_leave_status",
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
    	}else{
    		toaster("warning","Please select option.")
    	}
    	
    	// $('input[value="approve"]').prop("checked", true);
    })
    // $(".submit-week-off").on("click",function(){
    //     var employee_id = $("#employee-id").val();
    //     var week_off = $("#week_off").val();
        
    //     if(week_off == "" || week_off == null || week_off == undefined){
    //         toaster("warning","Please select week off");
    //     }else{
    //         loader()
            
    //     }
        
    // })
    makeTable('');

    // filter 
    $("#status_drop_down").select2({
          placeholder: "Select Status",
          allowClear: true,
          minimumResultsForSearch: Infinity,
          autocomplete:'off'
    });

    $('#start_date_search').datepicker({
      showButtonPanel: true,
      changeMonth: true,
      changeYear: true,
      showOtherMonths: true,
      selectOtherMonths: true ,
      onSelect: function(selectedDate) {
            $("#end_date_search").datepicker("option", "minDate", selectedDate);
      }
    })

    $('#end_date_search').datepicker({
      showButtonPanel: true,
      changeMonth: true,
      changeYear: true,
      showOtherMonths: true
    })

    $(".search-filter").on("click",function(){
        var data = serachParams();
        table.destroy(); 
        makeTable();
        $(".close-filter-btn").trigger( "click" )
    })
    $(".reset-filter").on("click",function(){
        resetFilter()
    })

});


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
                            values.splice(7, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename : 'leave_request'
                },
            
            {
                extend: 'pdf',
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function(api, node, config) {
                    $(node).attr('title', 'Download Pdf');
                },
                filename: 'leave_request',
                customize: function (doc) {
                  doc.pageMargins = [15, 15, 15, 15];
                  doc.content[0].text = 'Leave Request';
                  doc.content[0].color = '#5d87ff';
                    for (var i = 1; i < doc.content[1].table.body.length; i++) {
                        // Change the value of the first field in each row to "New Value"
                        var cellElement = $('#example').DataTable().cell(i-1, 0).node();
                        var image = $(cellElement).find("img").attr("src");
                        doc.content[1].table.body[i][0].text = image;  // [i][0] => 0 is the index of which data you modify
                    }
                    doc.content[1].table.widths = ['15%', '19%', '13%', '13%','15%', '15%', '10%'];
                    doc.content[1].table.body[0].forEach(function(cell) {
                        cell.fillColor = '#5d87ff';
                    });
                    doc.content[1].table.body.forEach(function(row, index) {
                        row.splice(8, 1);
                        row.splice(0, 1);
                        row.forEach(function(cell) {
                            // Set alignment for each cell
                            cell.alignment = 'center'; // Change to 'left' or 'right' as needed
                        });
                        
                    });
                }
            }
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
        "scrollY": "68vh",
        ajax: {
            data: {'search':data},    
            url: "leave/get_employee_leaves",
            type: "POST",
        },
        "columnDefs": [
		    { "sortable": false, "targets": 0 },
		    { "sortable": true, "targets": 0 },
		    { "sortable": false, "targets": 6 },
		    { "sortable": false, "targets": 8 }
		  ],
		order: [[1, 'asc']],


        scroller: {
            loadingIndicator: true,
        },
        "drawCallback": function( settings, json ) {
          var data = settings.jqXHR.responseJSON.data;
          var html = "<div class='container grid-block-container'><div class='row w-100'>";
          if(data.length > 0){
            for (var i = 0; i < data.length; i++) {
              var action_html = "";
              if(data[i]['action'] != "--"){
                  action_html = '<a hijacked="yes" href="javascript:void(0)" data-id="'+data[i]['employee_id']+'" data-user-details="'+data[i]['employee_json']+'" context="" title="Login As" class="btn view-btn  btn  la-check-circle">Approve</a>';
              }
              
               html += '<div class="col-3"><div class="card mb-4"><div class="grid_view_warehouse"><div class="grid_view_warehouse_box h-auto"><div class="grid_view_warehouse_title mb-0"><div class="grid_view_warehouse_title_lt"><div class="grid_view_warehouse_title_icon"><img src="'+data[i]['image_url']+'" width="62" height="62" class="list-image ma_profile_image" /></div><div class="grid_view_warehouse_title_cnt p-3 pt-2"><h5 class="trim-characters"><a href="'+data[i]['employee_url']+'" class="inline-edit-link" title="'+data[i]['employee_name']+'">'+data[i]['employee_name']+'</a></h5><h6 class="trim-characters mb-1">'+data[i]['employee_code']+'</h6><div class="status_label '+data[i]['status_text']+'">'+data[i]['status_label']+'</div></div></div></div><div class="grid-types"><div class="request_type"><strong>Location</strong>'+data[i]['location']+'</div><div class="other-actions-list-btn mt-0 mr-2">'+action_html+'</div></div><div class="usage_type_box"><div class="label_text" ><span>User Email</span><label>'+data[i]['email']+'</label></div><div class="label_text" ><span>Department</span><label>'+data[i]['department']+'</label></div><div class="label_text" ><span>Designation</span><label>'+data[i]['designation']+'</label></div><div class="label_text"><span>From Date</span><label>'+data[i]['from_date']+'</label></div><div class="label_text"><span>To Date</span><label>'+data[i]['to_date']+'</label></div></div></div></div></div></div>';
            }
          }else{
            html += "<div class='no-grid-data-found text-center mt-3'>"+no_data_message+"</div>";
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
          },300)
          
         
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
  var start_date = $("#start_date_search").val();
  var end_date = $("#end_date_search").val();
  var params = {status:status,employee_name:employee_name,employee_code:employee_code,start_date:start_date,end_date:end_date};
  return params;
}
function resetFilter(){
  $("#status_drop_down").val('').trigger('change');
  $("#employee_name_search").val('');
  $("#employee_code_search").val('');
  $("#start_date_search").val('');
  $("#start_date_search").trigger('change')
  $("#end_date_search").val('');
  table.destroy(); 
        makeTable()
  
}
