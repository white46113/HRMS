$(document).ready(function(){
	
	var myModal = new bootstrap.Modal(document.getElementById('exampleModalToggle'))
	// $('.timepicker').mdtimepicker();
	
    $("#month_drop_down").select2({
          placeholder: "Select Country",
          // allowClear: true,
          minimumResultsForSearch: 0,
          	autocomplete:'off',
  	});
  	$("#month_drop_down").on("change",function(){
  		var value = $(this).val();
  		if(value != "" && value != null && value != undefined){
  			filterSheetDate(value);
  		}
  	})
	$(document).on('click',".la-edit",function(){
		 $(".card").removeClass('disable-box');
		 $('.timepicker').val('');
	 	  var attendance_id = $(this).attr('data-id');
		  var formData = {attendance_id:attendance_id};
		  loader()
	      $.ajax({
	        type: "POST",
	        url: "attendance/get_correction_data",
	        data: formData,
	        success: function (response) {
	          var responseObject = JSON.parse(response);
	          var success = responseObject.success;
	        setTimeout(function(){
              hide_loader();
	          if (parseInt(success) == 1) {
	          		$("#attendance-id-val").val(responseObject.attendance_id)
	          		$("#in-time-input").val(responseObject.in_time)
	          		$(".main-content #attendance-in-time-block").html(responseObject.attendance_in_time)
	          		$("#attendance-date-val").val(responseObject.attendance_date)
	          		if(responseObject.out_time != ""){
		          		$("#out-time-input").val(responseObject.out_time)
		          		$(".main-content #attendance-out-time-block").html(responseObject.attendance_out_time)
		          	}else{
		          		$(".out-time-correction-box").addClass('disable-box');
		          		$(".main-content #attendance-out-time-block").html('');
		          	}
	            	myModal.show()
	            	
					$('.timepicker').mdtimepicker();
	          } else {
	            toaster("fails","data not found!");
	          }
	        },1000)
	        },
	        error: function (error) {
	          
	        },
	      });
	})

	$(".submit-correction").on("click",function(){
		var attendance_id = $("#attendance-id-val").val();
		var attendance_in_time = $("#in-time-input").val();
		var attendance_date = $("#attendance-date-val").val();
		var attendance_out_time = $("#out-time-input").val();
		loader()
		var formData = {attendance_id:attendance_id,attendance_in_time:attendance_in_time,attendance_out_time:attendance_out_time,attendance_date,attendance_date};
	      $.ajax({
	        type: "POST",
	        url: "attendance/submit_correction_data",
	        data: formData,
	        success: function (response) {
	          var responseObject = JSON.parse(response);
	          var success = responseObject.success;
	          var msg = responseObject.message;
	          setTimeout(function(){
              	  hide_loader();
		          if (parseInt(success) == 1) {
		            	myModal.hide()
						toaster("success",msg);
						window.location.reload()
		          } else {
		            toaster("fails",msg);
		          }
		       },1000)
	        },
	        error: function (error) {
	          
	        },
	      });
	})
})

function filterSheetDate(value){
	var formData = {month:value,month_arr:month_arr}
	loader()
	$.ajax({
	        type: "POST",
	        url: "attendance/filter_sheet_data",
	        data: formData,
	        success: function (response) {
	          var responseObject = JSON.parse(response);
	          var success = responseObject.success;
	          var msg = responseObject.message;
	          console.log(responseObject)
	          setTimeout(function(){
              	  hide_loader();
		          if (parseInt(success) == 1) {
		            	$("#total_working_hrs").html(responseObject.total_working_hours+" Hrs");
		            	$("#attendence_sheet_data").html(responseObject.html);
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