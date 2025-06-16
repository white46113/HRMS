var table = '';
var grid_type = "Table";

$(document).ready(function () {

	$(document).on("click",".approve-reject-correction", function () {
        var id = $(this).data("id");
        loader()
       
        Swal.fire({
            title: "Approve Attendance Correction",
            text: "Are you sure you want to approve this attendance correction?",
            icon: "success",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Approve",
            customClass: {
                confirmButton: "btn btn-primary me-1",
                cancelButton: "btn btn-label-secondary",
                denyButton: 'btn btn-warning'
            },
            denyButtonText: `Reject`,
            showDenyButton: true,
            buttonsStyling: false,
        }).then(function (result) {
            if (result.isConfirmed || result.isDenied) {
            	var status = "Reject";
            	if(result.value){
            		var status = "Approve";
            	}
                $.ajax({
	                type: "POST",
	                url: "attendance/submit_attendance_correction",
	                data: {
	                    id: id,
	                    status:status
	                },

	                success: function (response) {
	                    var responseObject = JSON.parse(response);
	                    var msg = responseObject.message;
	                    var success = responseObject.success;
	                    if (parseInt(success) == 1) {
	                        toaster("success", msg);
	                        setTimeout(function () {
	                           table.destroy(); 
        						makeTable();
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
         // $(".swal2-actions").append('<button type="button" class="swal2-deny" aria-label="" >Dont save</button>')
     });

    makeTable('');

    // filter
    $('#attendance_in_time_search,#correction_in_time_search,#attendance_out_time_search,#correction_out_time_search').mdtimepicker();
	$("#status_search").select2({
		placeholder: "Select Status",
          allowClear: true,
          minimumResultsForSearch: Infinity
	});
	$('#attendance_date_search').datepicker({
      showButtonPanel: true,
      changeMonth: true,
      changeYear: true,
      showOtherMonths: true,
      selectOtherMonths: true
    })
	$(".search-filter").on("click", function () {
        table.destroy(); 
        makeTable();
        $(".close-filter-btn").trigger( "click" )
    });
    $(".reset-filter").on("click", function () {
        resetFilter();
    });

});

function createButton(text, cb) {
  return $('<button>' + text + '</button>').on('click', cb);
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
                            values.splice(7, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename : 'attendance_correction_request_list'
                },
            
            {
                extend: 'pdf',
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function(api, node, config) {
                    $(node).attr('title', 'Download Pdf');
                },
                filename: 'attendance_correction_request_list',
                customize: function (doc) {
                  doc.pageMargins = [15, 15, 15, 15];
                  doc.content[0].text = 'Attendance Correction Request List';
                  doc.content[0].color = '#5d87ff';
                    doc.content[1].table.widths = ['15%', '19%', '13%', '13%','15%', '15%', '10%'];
                    doc.content[1].table.body[0].forEach(function(cell) {
                        cell.fillColor = '#5d87ff';
                    });
                    doc.content[1].table.body.forEach(function(row, index) {
                        row.splice(7, 1);
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
        processing: true,
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
            url: "attendance/attendance_correction_date",
            type: "POST",
        },
        "columnDefs": [
		    { "sortable": false, "targets": 7 }
		  ],
		// order: [[1, 'asc']],


        scroller: {
            loadingIndicator: true,
        },
        "drawCallback": function( settings, json ) {
          // var data = settings.jqXHR.responseJSON.data;
          // var html = "<div class='container grid-block-container'><div class='row w-100'>";
          // if(data.length > 0){
          //   for (var i = 0; i < data.length; i++) {
          //     var action_html = "";
          //     if(data[i]['action'] != "--"){
          //         action_html = '<a hijacked="yes" href="javascript:void(0)" data-id="'+data[i]['employee_id']+'" data-user-details="'+data[i]['employee_json']+'" context="" title="Login As" class="btn view-btn  btn  la-check-circle">Approve</a>';
          //     }
              
          //      html += '<div class="col-3"><div class="card mb-4"><div class="grid_view_warehouse"><div class="grid_view_warehouse_box h-auto"><div class="grid_view_warehouse_title mb-0"><div class="grid_view_warehouse_title_lt"><div class="grid_view_warehouse_title_icon"><img src="'+data[i]['image_url']+'" width="62" height="62" class="list-image ma_profile_image" /></div><div class="grid_view_warehouse_title_cnt p-3 pt-2"><h5 class="trim-characters"><a href="'+data[i]['employee_url']+'" class="inline-edit-link" title="'+data[i]['employee_name']+'">'+data[i]['employee_name']+'</a></h5><h6 class="trim-characters mb-1">'+data[i]['employee_code']+'</h6><div class="status_label '+data[i]['status_text']+'">'+data[i]['status_label']+'</div></div></div></div><div class="grid-types"><div class="request_type"><strong>Location</strong>'+data[i]['location']+'</div><div class="other-actions-list-btn mt-0 mr-2">'+action_html+'</div></div><div class="usage_type_box"><div class="label_text" ><span>User Email</span><label>'+data[i]['email']+'</label></div><div class="label_text" ><span>Department</span><label>'+data[i]['department']+'</label></div><div class="label_text" ><span>Designation</span><label>'+data[i]['designation']+'</label></div><div class="label_text"><span>From Date</span><label>'+data[i]['from_date']+'</label></div><div class="label_text"><span>To Date</span><label>'+data[i]['to_date']+'</label></div></div></div></div></div></div>';
          //   }
          // }else{
          //   html += "<div class='no-grid-data-found text-center mt-3'>"+no_data_message+"</div>";
          // }
          // $(".dropdown-menu li").removeClass("active");

          // html += '</div></div>';
          // $("#example_wrapper .grid-block").remove();
          // $("#example_wrapper .dataTables_scroll").after("<div class='grid-block' style='display:none'>"+html+"</div>")
          // if(grid_type == "Table"){
          //       $(".dropdown-menu li.table").addClass("active");
          //       $("#example_wrapper .dataTables_scroll").show()
          //       $(".grid-block").hide()
          // }else{
          //       $(".dropdown-menu li.grid").addClass("active");
          //       $(".grid-block").show()
          //       $("#example_wrapper .dataTables_scroll").hide()
          // }
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
  var status = $("#status_search").val();
  var employee_name = $("#employee_name_search").val();
  var attendance_date = $("#attendance_date_search").val();
  var attendance_in_time = $("#attendance_in_time_search").val();
  var correction_in_time = $("#correction_in_time_search").val();
  var attendance_out_time = $("#attendance_out_time_search").val();
  var correction_out_time = $("#correction_out_time_search").val();
  var params = {status:status,employee_name:employee_name,attendance_date:attendance_date,attendance_in_time:attendance_in_time,correction_in_time:correction_in_time,attendance_out_time:attendance_out_time,correction_out_time:correction_out_time};
  return params;
}
function resetFilter(){
  $("#status_search").val('').trigger('change');
  $("#employee_name_search").val('');
  $("#attendance_date_search").val('').trigger('change');
  $("#attendance_in_time_search").val('').trigger('change');
  $("#correction_in_time_search").val('').trigger('change');
  $("#attendance_out_time_search").val('').trigger('change');
  $("#correction_out_time_search").val('').trigger('change');
  table.destroy(); 
        makeTable()
  
}
