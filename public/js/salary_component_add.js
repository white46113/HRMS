var index = 0;
$(document).ready(function(){

    salary_structure.init();
    
})
const salary_structure = {
	init:function(){
		let that = this;
		that.initiatePlugin();
		that.validation();
		$(".add-action").on("click",function(){
			index++;
			$.ajax({
                type: "POST",
                url: "salary/salary_component_row",
                data: {"index":index},
                success: function (response) {
                    var responseObject = JSON.parse(response);
                    $("#component-table tbody").append(responseObject.html);
                    that.addRules(index);
                    that.initiatePlugin();
                },
                error: function (error) {
                    // console.error("Error:", error);
                },
            });
		})
		$(document).on("click",".delete-row",function(){
			var element = $("#component-table tbody tr");
			var current_ele = $(this);
			if(element.length > 1){
				Swal.fire({
		            title: "Delete Component",
		            text: "Are you sure you want to delete this component?",
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
		                $(current_ele).parents("tr").remove()
		            } else {
		                // hide_loader();
		            }
		        });
		    }else{
		    	toaster("warning","Please ensure that at least one component is required.")
		    }
		})
        
	},
	initiatePlugin:function(){
		$(".company_id,.value_type,.component_type,#year_drop_down").chosen();
	},
	addRules:function(index){
        
        $('#component_name_'+index).rules('add', {
            required: true,
            messages: {
                required: "Please enter component name"
            }
        });
        $('#component_type_'+index).rules('add', {
            required: true,
            messages: {
                required: "Please select component type."
            }
        });
        $('#value_type_'+index).rules('add', {
            required: true,
            messages: {
                required: "Please select type."
            }
        });
        $('#component_value_'+index).rules('add', {
            required: true,
            messages: {
                required: "Please enter component value.",
                
            }
        });
        // $('#is_compulsory_'+index).rules('add', {
        //     required: true,
        //     messages: {
        //         required: "Please select is compulsory.",
                
        //     }
        // });
        $('#description_'+index).rules('add', {
            required: true,
            messages: {
                required: "Please enter description.",
                
            }
        });


    },
	validation:function(){
		$("#SalaryComponentForm").validate({
        rules: {
            company_id: {
                required: true,
            },
            year_drop_down:{
                required: true,
            },
            'component_name[0]': {
                required: true
            },
            'component_value[0]': {
                required: true
            },
            'value_type[0]': {
                required: true
            },
            'component_type[0]': {
                required: true
            },
            'year[0]': {
                required: true
            },
            // 'is_compulsory[0]': {
            //     required: true
            // },
            'description[0]': {
                required: true
            },
            
        },
        messages: {
            company_id: {
                required: "Please select company.",
            },
            year_drop_down:{
                required: "Please select year."
            },
            'component_name[0]': {
                required: "Please enter component name."
            },
            'component_value[0]': {
                required: "Please enter component value."
            },
            'value_type[0]': {
                required: "Please select type."
            },
            'component_type[0]': {
                required: "Please select component type."
            },
            'year[0]': {
                required: "Please enter year."
            },
            'is_compulsory[0]': {
                required: "Please select is compulsory."
            },
            'description[0]': {
                required: "Please enter description."
            },
            
        },
        errorPlacement: function (error, element) {
            if (element[0]["localName"] == "select") {
                var parents = $(element).parent(".select-box");
                // $(parents).find(".chosen-container").after(error);
            } else if (element[0]["id"] == "start_date" || element[0]["id"] == "end_date") {
                // var parents = $(element).parent(".input-group").after(error);
            } else {
                // error.insertAfter(element);
            }
        },
        ignore: ":hidden:not(select)",
        submitHandler: function (form) {
            var flag = 0;
            var component_name_arr = [];
            $("#salary-component-row-box tr").each(function(){
                var value  = $(this).find(".component_name").val();

                if($.inArray(value, component_name_arr) != -1){
                    flag = 1;
                }else{
                    component_name_arr.push(value);
                }
                
            });
            if(flag == 0){
                var formData = new FormData(form);
                var mode = $("#mode").val();
                loader();
                $.ajax({
                    type: "POST",
                    url: "salary/salary_component_action",
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        var responseObject = JSON.parse(response);
                        var msg = responseObject.message;
                        var success = responseObject.success;
                        setTimeout(function () {
                            hide_loader();
                            if (parseInt(success) == 1) {
                                toaster("success", msg);
                                setTimeout(function () {
                                    window.location.href = "salary-component.html";
                                }, 2000);
                            } else {
                                // toastr.error(msg);
                                toaster("fails", msg);
                            }
                        }, 1000);
                    },
                    error: function (error) {
                        // console.error("Error:", error);
                    },
                });
            }else{
                toaster("warning","Component name should be unique.")
            }
        },
    });

	}

}
