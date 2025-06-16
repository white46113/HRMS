var start_date_ele  = '';
var end_date_ele = "";
$(document).ready(function(){
	
	var myModal = new bootstrap.Modal(document.getElementById('employee_leave_popup'))
	// // $('.timepicker').mdtimepicker();
	
	$(".add-leave").on("click",function(){
		start_date_ele.val('')
		end_date_ele.val('')
		$("#leave_request_id").val();
		$("#mode").val("Add");
		$("#leave_reason").val('')
		date_range_arr_val = [];
		for (var i = 0; i < date_range_arr.length; i++) {
	        var startDate = new Date(date_range_arr[i].start);
	        startDate.setDate(startDate.getDate() - 1);
	        var formattedDate = startDate.toISOString().split('T')[0];
	        date_range_arr_val.push({"start": formattedDate,"end": date_range_arr[i].end})
	    }
		updateDisabledRanges(date_range_arr_val,start_date_ele);
		updateDisabledRanges(date_range_arr_val,end_date_ele);
		myModal.show()
	})
    $("#month_drop_down").select2({
          placeholder: "Select Month",
          // allowClear: true,
          minimumResultsForSearch: Infinity,
          // minimumResultsForSearch: 0,	
          	autocomplete:'off',
  	});
  	$("#leave_type").select2({
          placeholder: "Select Leave Name",
           minimumResultsForSearch: Infinity,
          // allowClear: true,
          	autocomplete:'off',
  	});
  	$("#leave_name").select2({
          placeholder: "Select Leave type",
           minimumResultsForSearch: Infinity,
          // allowClear: true,
          	autocomplete:'off',
  	});
  	$("#month_drop_down").on("change",function(){
  		var value = $(this).val();
  		console.log(value)
  		if(value != "" && value != null && value != undefined){
  			filterSheetDate(value);
  		}
  	})

 	start_date_ele =$('#start_date').datepicker({
 			showButtonPanel: true,
		    changeMonth: true,
		    changeYear: true,
		    showOtherMonths: true,
		    selectOtherMonths: true , 
		    yearRange: 'c-100:c+100',
		    minDate: new Date(),
		    beforeShowDay: function(date){
	            // Define disabled date ranges
	            var disabledRanges = date_range_arr;

	            for (var i = 0; i < disabledRanges.length; i++) {
	                var startDate = new Date(disabledRanges[i].start);
	                startDate.setDate(startDate.getDate());
	                var endDate = new Date(disabledRanges[i].end);

	                if (date >= startDate && date <= endDate) {
	                    // Return false to disable this date
	                    return [false];
	                }
	            }
	            
	            // Return true to enable this date
	            return [true];
	        },
		    onSelect: function(selectedDate) {
            $("#end_date").datepicker("option", "minDate", selectedDate);
        }
	});

	end_date_ele = $('#end_date').datepicker({
			showButtonPanel: true,
			changeMonth: true,
			changeYear: true,
			showOtherMonths: true,
			selectOtherMonths: true , 
			yearRange: 'c-100:c+100',
			minDate: new Date(),
			beforeShowDay: function(date){
	            // Define disabled date ranges
	            var disabledRanges = date_range_arr;

	            for (var i = 0; i < disabledRanges.length; i++) {
	                var startDate = new Date(disabledRanges[i].start);
	                // startDate.setDate(startDate.getDate() - 1);
	                var endDate = new Date(disabledRanges[i].end);

	                if (date >= startDate && date <= endDate) {
	                    // Return false to disable this date
	                    return [false];
	                }
	            }
	            
	            // Return true to enable this date
	            return [true];
	        },
	})
	
	$(document).on('click',".la-edit",function(){
		$("#mode").val("Update");
		var start_date = $(this).parents(".leave-request-row").find(".start-date").html();
		var end_date = $(this).parents(".leave-request-row").find(".end-date").html();
		var leave_name = $(this).parents(".leave-request-row").find(".leave-name").attr("data-leave-type");
		$("#leave_name").val(leave_name).trigger('change')
		var request_id = $(this).attr("data-leave-request-id");
		var leave_type = $(this).attr("data-leave-type");
		$("#leave_type").val(leave_type).trigger('change')
		 var date_range = [];
		 for (var i = 0 ; i <  date_range_arr.length; i++) {
		 	if(!(date_range_arr[i]['start'] == start_date) && !(date_range_arr[i]['end'] == end_date)){
	                var startDate = new Date(date_range_arr[i].start);
			        startDate.setDate(startDate.getDate() - 1);
			        var formattedDate = startDate.toISOString().split('T')[0];
		 		date_range.push({"start": formattedDate,"end": date_range_arr[i].end});
		 	}
		 }
		start_date = $(this).attr("data-start-date");
		end_date = $(this).attr("data-end-date");
		leave_reason = $(this).parents(".leave-request-row").find(".reason-box").html();
		leave_reason = leave_reason != "--" ? leave_reason : "";
		$("#leave_start_date").val(start_date)
		$("#leave_end_date").val(end_date)
		$("#leave_request_id").val(request_id);
		$("#leave_reason").val(leave_reason)
		updateDisabledRanges(date_range,start_date_ele);
		updateDisabledRanges(date_range,end_date_ele);
		console.log(start_date,end_date)
		start_date_ele.val(start_date)
		end_date_ele.val(end_date)
		myModal.show()
	})

	$(".submit-leave").on("click",function(){
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();
		var leave_type = $("#leave_type").val();
		var leave_name = $("#leave_name").val();
		
		if(start_date != "" && end_date != "" && leave_name != "" && leave_type != "" && leave_type != null && leave_type != undefined){
			var mode = $("#mode").val();
			var leave_request_id = $("#leave_request_id").val();
			var leave_reason = $("#leave_reason").val();
			loader()
			var formData = {leave_name:leave_name,start_date:start_date,end_date:end_date,leave_range_arr:leave_range_arr,mode:mode,leave_request_id:leave_request_id,leave_reason:leave_reason,leave_type:leave_type};
			// console.log(formData)
			// return;
		      $.ajax({
		        type: "POST",
		        url: "leave/add_update_leave",
		        data: formData,
		        success: function (response) {
		          var responseObject = JSON.parse(response);
		          var success = responseObject.success;
		          var msg = responseObject.message;
		         
			          if (parseInt(success) == 1) {
			            	myModal.hide()
							toaster("success",msg);
							setTimeout(function(){
								hide_loader();
								window.location.reload()
							},1000)
			          } else {
			          	setTimeout(function(){
				          	hide_loader();
				            toaster("fails",msg);
				        },1000)
			          }
			      
		        },
		        error: function (error) {
		          
		        },
	      });
	    }else{
	    	if(leave_type == "" || leave_type == null || leave_type == undefined){
	    		toaster("warning","Please select  leave type.");
	    	}else if(leave_name == ''){
	    		toaster("warning","Please select leave name.");
	    	}else{
	    		toaster("warning","Please select leave dates.");
	    	}
	    }
	})
})

function filterSheetDate(value){
	var formData = {month:value,month_arr:month_arr}
	loader()
	$.ajax({
	        type: "POST",
	        url: "leave/leave_list_filter_data",
	        data: formData,
	        success: function (response) {
	          var responseObject = JSON.parse(response);
	          var success = responseObject.success;
	          var msg = responseObject.message;
	          console.log(responseObject)
	          setTimeout(function(){
              	  hide_loader();
		          if (parseInt(success) == 1) {
		            	$("#leave_data_body").html(responseObject.html);
						// toaster("success",msg);
		          } else {
		            toaster("fails",msg);
		          }
		       },1000)
	        },
	        error: function (error) {
	          
	        },
	      });
}
function updateDisabledRanges(disabledRanges,element) {

        element.datepicker("option", "beforeShowDay", function(date) {
            for (var i = 0; i < disabledRanges.length; i++) {
                var startDate = new Date(disabledRanges[i].start);
                var endDate = new Date(disabledRanges[i].end);

                if (date >= startDate && date <= endDate) {
                    // Return false to disable this date
                    return [false];
                }
            }
            // Return true to enable this date
            return [true];
        });
}

