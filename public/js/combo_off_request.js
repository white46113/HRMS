var table = '';
var myModal = '';
var grid_type = "Table";
$(document).ready(function () {
	myModal = new bootstrap.Modal(document.getElementById("combo_off_aprove_reject"));
    combo_off_request.init();
});

const combo_off_request = {
	init: function(){
		let that = this;
		// initiate datatable 
		this.dataTable();
		// initiate filter
		this.initiateFilter();

		$(document).on("click",".approve-combo-off",function(){
			var employee_details = $(this).attr("data-employee");
			employee_details = JSON.parse(atob(employee_details));
			$("#combo_off_aprove_reject .user-details-block .image-block img").attr("src",employee_details['image']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .employee-name-block").html(employee_details['employee_name']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .employee-code-box").html(employee_details['employee_code']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .location-block .val-box").html(employee_details['location']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .designation-block .val-box").html(employee_details['designation_name']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .department-block .val-box").html(employee_details['department_name']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .week-off-block .val-box").html(employee_details['employee_week_off']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .over-time-block").html(employee_details['over_time']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .combo-off-date-block").html(employee_details['combo_off_date']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .reference-date-block").html(employee_details['reference_date']);
			$("#combo_off_aprove_reject .user-details-block .employee-detils .reason-block").html(employee_details['reason']);
			var combo_off_request_id = $(this).attr("data-combo-off-id");
			$("#combo_off_request_id").val(combo_off_request_id);
			$("input[name='allReqs']").prop('checked', false);
			$("#combo_off_comment").val('')
			myModal.show();
		})
		$(".submit-combo-off-approval").on("click",function(){
	    	var checked_val = $(".combo_off_aprove_reject_check input:checked").val();
	    	var combo_off_comment = $("#combo_off_comment").val();
	    	if(checked_val != undefined && checked_val != null && checked_val != '' && combo_off_comment != ""){
	    		var combo_off_request_id = $("#combo_off_request_id").val();
    			var formData = {combo_off_request_id:combo_off_request_id,slected_status:checked_val,combo_off_comment:combo_off_comment};
    			$.ajax({
                type: "POST",
                url: "leave/update_combo_off_status",
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
                            that.dataTable();
                            
                      } else {
                        toaster("fails",msg);
                      }
                   },1000)
                },
                error: function (error) {
                  
                },
              });
	    	}else{
	    		if(combo_off_comment == ''){
	    			toaster("warning","Please enter comment.");
	    		}else{
    				toaster("warning","Please select option.");
    			}
    		}
	    })

	    // serach filter
	    $(".search-filter").on("click",function(){
	        table.destroy(); 
	        that.dataTable();
	        $(".close-filter-btn").trigger( "click" )
	    })
	    $(".reset-filter").on("click",function(){
	        that.resetFilter()
	    })

	    // grid table change
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
	},
	dataTable : function(){
		loader()
	    var data = this.searchParams();
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
	                    filename : 'combo_off_request'
	                },
	            
	            {
	                extend: 'pdf',
	                text: '<i class="ti ti-file-type-pdf"></i>',
	                init: function(api, node, config) {
	                    $(node).attr('title', 'Download Pdf');
	                },
	                filename: 'combo_off_request',
	                customize: function (doc) {
	                  doc.pageMargins = [15, 15, 15, 15];
	                  doc.content[0].text = 'Combo Off Request';
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
	        
	        ajax: {
	            data: {'search':data},    
	            url: "leave/get_combo_off_request",
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
	          console.log(data)
	          var html = "<div class='container grid-block-container'><div class='row w-100'>";
	          if(data.length > 0){	
	            for (var i = 0; i < data.length; i++) {
	              var action_html = data[i]['other_Action'];
	              html += '<div class="col-3"><div class="card mb-4"><div class="grid_view_warehouse"><div class="grid_view_warehouse_box h-auto"><div class="grid_view_warehouse_title mb-0"><div class="grid_view_warehouse_title_lt"><div class="grid_view_warehouse_title_icon"><img src="'+data[i]['image_url']+'" width="62" height="62" class="list-image ma_profile_image" /></div><div class="grid_view_warehouse_title_cnt p-3 pt-2"><h5 class="trim-characters"><a href="'+data[i]['employee_url']+'" class="inline-edit-link" title="'+data[i]['employee_name']+'">'+data[i]['employee_name']+'</a></h5><h6 class="trim-characters mb-1">'+data[i]['employee_code']+'</h6><div class="status_label '+(data[i]['status_text']).toLowerCase()+'">'+data[i]['status_text']+'</div></div></div></div><div class="grid-types"><div class="request_type"><strong>Location</strong>'+data[i]['location']+'</div><div class="other-actions-list-btn mt-0 mr-2">'+action_html+'</div></div><div class="usage_type_box"><div class="label_text" ><span>Reference Date</span><label class="trim-text" title="'+data[i]['reference_date']+'">'+data[i]['reference_date']+'</label></div><div class="label_text" ><span>Combo Off Date</span><label class="trim-text" title="'+data[i]['combo_off_date']+'">'+data[i]['combo_off_date']+'</label></div><div class="label_text" ><span>Combo Off Reason</span><label class="trim-text" title="'+data[i]['combo_off_reason']+'">'+data[i]['combo_off_reason']+'</label></div><div class="label_text"><span>Approve/Reject Reason</span><label class="trim-text" title="'+data[i]['update_reason']+'">'+data[i]['update_reason']+'</label></div></div></div></div></div></div>';
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
	},
	initiateFilter: function(){
		$('#reference_date_search,#combo_off_date_search').datepicker({
	      showButtonPanel: true,
	      changeMonth: true,
	      changeYear: true,
	      showOtherMonths: true,
	      selectOtherMonths: true ,
	    })
	    $("#status_drop_down").select2({
          placeholder: "Select Status",
          allowClear: true,
          minimumResultsForSearch: Infinity,
          autocomplete:'off'
   		 });
	},
	searchParams: function(){
		var status = $("#status_drop_down").val();
		var employee_name = $("#employee_name_search").val();
		var employee_code = $("#employee_code_search").val();
		var reference_date = $("#reference_date_search").val();
		var combo_off_date = $("#combo_off_date_search").val();
		var combo_off_reason = $("#combo_off_reason_search").val();
		var comment = $("#comment_search").val();
		var params = {combo_off_reason:combo_off_reason,comment:comment,status:status,employee_name:employee_name,employee_code:employee_code,reference_date:reference_date,combo_off_date:combo_off_date};
		console.log(params)
		return params;
	},
	resetFilter: function(){
		$("#status_drop_down").val('').trigger("change");
		$("#employee_name_search").val('');
		$("#employee_code_search").val('');
		$("#reference_date_search").val('');
		$("#combo_off_date_search").val('');
		$("#combo_off_reason_search").val('');
		$("#comment_search").val('');
		table.destroy();    
        this.dataTable();
        console.log("ok")
	}
}


// 