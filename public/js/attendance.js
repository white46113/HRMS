var attendance_pin = '';
$(document).ready(function(){
	 $('body').find('[style="text-align: right;position: fixed;z-index:9999999;bottom: 0;width: auto;right: 1%;cursor: pointer;line-height: 0;display:block !important;"]').remove()
  setTimeout(function(){
    $('body').find('a[href*="https://www.000webhost.com/?utm_source=000webhostapp&utm_campaign=000_logo&utm_medium=website&utm_content=footer_img"]').css("display","none")
  },1000)
	$(".number-btn").on("click",function(){
		var number_val = $(this).attr("data-val");
		var employee_code = $("#employee-code").val();
		var final_employee_code = '';
		if(employee_code != ""){
			final_employee_code = employee_code+number_val;
		}else{
			final_employee_code = number_val;
		}
		$("#employee-code").val(final_employee_code);

	})
	$(".back-btn").on("click",function(){
		var employee_code = $("#employee-code").val();
		var final_employee_code = "";
		if(employee_code != ""){
			final_employee_code = employee_code.slice(0, -1);
		}
		$("#employee-code").val(final_employee_code);
	});
	$(".cancel-btn").on("click",function(){

		$("#employee-code").val('');
	});
	$("#sumbmit_attendance").on("click",function(){
		loader()
		var employee_code = $("#employee-code").val();
		if(employee_code != "" && employee_code != undefined && employee_code != null && employee_code > 0){
			var formData = {"employee_code":employee_code,type:type,prefix:prefix,logo:logo}
			$.ajax({
	        type: "POST",
	        url: "user/attendance_action",
	        data: formData,
	        success: function (response) {
	          var responseObject = JSON.parse(response);
	          var msg = responseObject.message;
	          var success = responseObject.success;
	          var html = responseObject.html;
	          var attendance_pin_val = responseObject.attendance_pin;
	          
	          setTimeout(function(){
	          	hide_loader();
	          	  if (parseInt(success) == 1) {
		            toaster("success",msg);
		            $(".attendance-entry-box").html(html);
		            $(".attendance-code-entry-box").addClass('hide');
		            $(".attendance-entry-box").removeClass('hide');
		            attendance_pin = attendance_pin_val;
		          } else {
		            toaster("fails",msg);
		          }
		     },1000)
	          
	        },
	        error: function (error) {
	          // console.error("Error:", error);

	        },
      });
		}else {
			hide_loader();
			toaster("warning","Please enter employee code!");
		}
	})
	$(document).on('click',"#attendance_in_btn",function(){
		var employee_id = $(".employee_id_val").val();
		var attendance_in_check = $("#attendance-in-check").prop("checked")
		if(employee_id > 0 && attendance_in_check){
			attendance_in_out(employee_id,"In")
		}else{
			toaster("warning","Please select option!");
		}
	})
	$(document).on('click',"#attendance_out_btn",function(){
		var employee_id = $(".employee_id_val").val();
		var attendance_id = $("#attendance-id").val();
		var attendance_out_check = $("#attendance-out-check").prop("checked")
		
		if(employee_id > 0 && attendance_out_check && attendance_id > 0){
			attendance_in_out(employee_id,"Out",attendance_id)
		}else{
			toaster("warning","Please select option!");
		}
	})
	$("#employee-code").on('input',function(){
		var code = $(this).val();
		if(code != ""){
			code = code.replace(/[^0-9]/g, "");
			$(this).val(code)
		}
	})

	

	
	
	
})

function attendance_in_out(employee_id = '',type = '',attendance_id = ''){

	Swal.fire({
	  title: 'Enter Pin',
	  input: 'text',
	  inputPlaceholder: 'Enter pin',
	  showCancelButton: true,
	  inputValidator: (value) => {
	    return new Promise((resolve) => {
	      if (value == attendance_pin) {
	        loader()
			var formData = {"employee_id":employee_id,type:type,prefix:prefix,attendance_id:attendance_id}
			$.ajax({
			type: "POST",
			url: "user/attendance_in_out_action",
			data: formData,
			success: function (response) {
				var responseObject = JSON.parse(response);
				var msg = responseObject.message;
				var success = responseObject.success;
				var html = responseObject.html;
				setTimeout(function(){
			          	hide_loader();
					if (parseInt(success) == 1) {
						toaster("success",msg);
						
						setTimeout(function () {
			              window.location.reload();
			            }, 2000);
					} else {
						toaster("fails",msg);
					}
				},1000)
			},
			error: function (error) {
				          // console.error("Error:", error);

				},
		    });
	        resolve()
	      }else if(value != "attendance_pin_val") {
	        resolve('Please enter correct pin.')
	      }else{
	      	 resolve('Please enter pin.')
	      }
	    })
	  }
	})
	
}