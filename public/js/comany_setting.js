$(document).ready(function(){

	$(".submit-config").on("click",function(){
		var flag  = 0;
		var config_arr = [];
		loader()
		var company_id = $("#company_id").val()
		$(".setting-block .config-box .value-box").each(function (i) {
			var value = '';
			if($(this).find("input")[0]['type'] == "checkbox"){
				 value =  $(this).find("input").is(":checked") ? "Yes" : "No";
			}else{
				value =  $(this).find("input").val();
			}
			var id = $(this).attr("data-id");
			var name = $(this).attr("data-name");
			if(value == ""){
				flag = 1;
			}else{
				config_arr.push({"id":id,"value":value,"company_id":company_id,"name":name})
			}
			
		})

		if(flag == 0 && config_arr.length > 0){
			var data = {config_arr:config_arr}
			$.ajax({
		        type: "POST",
		        url: "master/update_company_config",
		        data: data,
		        success: function (response) {
		          var responseObject = JSON.parse(response);
		          var msg = responseObject.message;
		          var success = responseObject.success;
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
		}else{
			hide_loader();
			toaster("warning","Please Enter all value.")
		}

		console.log(config_arr)
	})
	
})