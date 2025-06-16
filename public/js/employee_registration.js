$(document).ready(function () {
    if (mode == "Update") {
        // Set the text of the custom file input
        $("#customFileInput input").val(profile_image ? profile_image : "Choose File");

        // Trigger file input click when custom file input is clicked
        $("#customFileInput").click(function () {
            $("#profile_image").click();
        });


       
    }else{
        $(".image-upload-block-box").click(function () {
            $("#profile_image").click();
        });
    }   
    
     // Update custom file input text when a file is selected
    $("#profile_image").change(function () {
        var fileName = $(this).val().split("\\").pop(); // Get the file name
        $("#customFileInput input").val(fileName);

        var file = this.files[0];
        // Check if a file is selected
        if (file) {
            // Create a FileReader object
            var reader = new FileReader();
            // Set up the FileReader onload event
            reader.onload = function (e) {
                // Set the source of the image to the result of the FileReader
                $(".update-imeg-file img").attr("src", e.target.result);
                // Show the image
                $(".update-imeg-file").show();
            };
            // Read the selected file as a URL
            reader.readAsDataURL(file);
        } else {
            $(".update-imeg-file").hide();
        }
    });
    $(".overtime-allow-box .form-check-input").on("change",function(){
        var value = $(this).val();
        if(value == "Yes"){
            $(".overtime_rate").show();
        }else{
            $(".overtime_rate").hide();
        } 
    })

    $(".next").on("click", function () {
        var target = $(this).attr("data-target");
        var current = $(this).attr("data-current");
        var current = $(this).attr("data-current");

        var flag_val = check_validation(current);
        if (flag_val == 0) {
            if (current == "step-third") {
                $("." + current + "-form").addClass("validate-form");
                $("#employee_registration").submit();
            } else {
                /* for step block */
                $("." + target + "-block").addClass("active active_step");
                $("." + current + "-block").removeClass("active_step");

                /* for button */
                $("." + current + "-btn").hide();
                $("." + target + "-btn").show();
                /* for form */
                $("." + current + "-form").addClass("validate-form");
                $("." + current + "-form").hide();
                $("." + target + "-form").show();
            }
        } else {
            $("." + current + "-form").removeClass("validate-form");
        }

        // console.log("."+target+"-form")
    });

    $(document).on("change", ".banck-details-rows .form-check-input", function () {
        var id_val = $(this)[0]["id"];
        if ($(this)[0]["checked"]) {
            $(".banck-details-rows .form-check-input").each(function (i) {
                
                if ($(this)[0]["id"] != id_val) {
                    $(this).prop("checked", false);
                }
            });
        }

    });

    $(".previous").on("click", function () {
        var target = $(this).attr("data-target");
        var current = $(this).attr("data-current");
        /* for step block */
        $("." + current + "-block").removeClass("active active_step");
        $("." + target + "-block").addClass(" active_step");

        /* for button */
        $("." + current + "-btn").hide();
        $("." + target + "-btn").show();

        /* for form */
        $("." + current + "-form").hide();
        $("." + target + "-form").show();
        $("." + current + "-form").removeClass("validate-form");
    });

    $("body").find('[style="text-align: right;position: fixed;z-index:9999999;bottom: 0;width: auto;right: 1%;cursor: pointer;line-height: 0;display:block !important;"]').remove();
    setTimeout(function () {
        $("body").find('a[href*="https://www.000webhost.com/?utm_source=000webhostapp&utm_campaign=000_logo&utm_medium=website&utm_content=footer_img"]').css("display", "none");
    }, 1000);

    $("#passwordIconShow").hide();
    $("#confirmPasswordIconShow").hide();

    $("#passwordIconHide").click(function () {
        showPassword("#passwordIconHide", "#password", "#passwordIconShow");
    });

    $("#passwordIconShow").click(function () {
        hidePassword("#passwordIconShow", "#password", "#passwordIconHide");
    });
    $("#confirmPasswordIconHide").click(function () {
        showPassword("#confirmPasswordIconHide", "#confirm_password", "#confirmPasswordIconShow");
    });

    $("#confirmPasswordIconShow").click(function () {
        hidePassword("#confirmPasswordIconShow", "#confirm_password", "#confirmPasswordIconHide");
    });

    var phoneNumber = mobile_number;
    var countryCode = mobile_code;

    if (mode == "Update") {
        countryCode = countryCode;
    } else {
        countryCode = "IN";
    }

    $("#mobile_number").intlTelInput({
        geoIpLookup: function (callback) {
            $.get("http://ipinfo.io", function () {}, "jsonp").always(function (resp) {
                var countryCode = resp && resp.country ? resp.country : "";
                callback(countryCode);
            });
        },
        initialCountry: countryCode,
        separateDialCode: true,
    });

    $("#mobile_number").on("countrychange", function (e) {
        $(this).val("");
        var selectedCountry = $(this).intlTelInput("getSelectedCountryData");
        var dialCode = selectedCountry.dialCode;
        var maskNumber = intlTelInputUtils.getExampleNumber(selectedCountry.iso2, 0, 0);
        maskNumber = intlTelInputUtils.formatNumber(maskNumber, selectedCountry.iso2, 2);
        maskNumber = maskNumber.replace("+" + dialCode + " ", "");
        mask = maskNumber.replace(/[0-9+]/gi, "0");
    });

    $.validator.addMethod("intlTelNumber", function (value, element) {
        return this.optional(element) || $("#mobile_number").intlTelInput("isValidNumber");
    });

    phoneNumber = secondary_mobile_number;
    countryCode = secondary_mobile_code;
    if (mode == "Update") {
        countryCode = countryCode;
    } else {
        countryCode = "IN";
    }
    $("#secondary_number").intlTelInput({
        geoIpLookup: function (callback) {
            $.get("http://ipinfo.io", function () {}, "jsonp").always(function (resp) {
                var countryCode = resp && resp.country ? resp.country : "";
                callback(countryCode);
            });
        },
        initialCountry: countryCode,
        separateDialCode: true,
    });

    $("#secondary_number").on("countrychange", function (e) {
        $(this).val("");
        var selectedCountry = $(this).intlTelInput("getSelectedCountryData");
        var dialCode = selectedCountry.dialCode;
        var maskNumber = intlTelInputUtils.getExampleNumber(selectedCountry.iso2, 0, 0);
        maskNumber = intlTelInputUtils.formatNumber(maskNumber, selectedCountry.iso2, 2);
        maskNumber = maskNumber.replace("+" + dialCode + " ", "");
        mask = maskNumber.replace(/[0-9+]/gi, "0");
    });

    $.validator.addMethod("secondary_number_validation", function (value, element) {
        return this.optional(element) || $("#secondary_number").intlTelInput("isValidNumber");
    });

    phoneNumber = work_mobile_number;
    countryCode = work_mobile_code;
    if (mode == "Update") {
        countryCode = countryCode;
    } else {
        countryCode = "IN";
    }
    $("#work_mobile_number").intlTelInput({
        geoIpLookup: function (callback) {
            $.get("http://ipinfo.io", function () {}, "jsonp").always(function (resp) {
                var countryCode = resp && resp.country ? resp.country : "";
                callback(countryCode);
            });
        },
        initialCountry: countryCode,
        separateDialCode: true,
    });

    $("#work_mobile_number").on("countrychange", function (e) {
        $(this).val("");
        var selectedCountry = $(this).intlTelInput("getSelectedCountryData");
        var dialCode = selectedCountry.dialCode;
        var maskNumber = intlTelInputUtils.getExampleNumber(selectedCountry.iso2, 0, 0);
        maskNumber = intlTelInputUtils.formatNumber(maskNumber, selectedCountry.iso2, 2);
        maskNumber = maskNumber.replace("+" + dialCode + " ", "");
        mask = maskNumber.replace(/[0-9+]/gi, "0");
    });

    $.validator.addMethod("intlTelNumber1", function (value, element) {
        return this.optional(element) || $("#work_mobile_number").intlTelInput("isValidNumber");
    });

    $("#dob,#employement_date").datepicker({ showButtonPanel: true, changeMonth: true, changeYear: true, showOtherMonths: true, selectOtherMonths: true, yearRange: "c-100:c+100" });
    $("#state").select2({
        placeholder: "Select State",
        // allowClear: true,
    });
    $("#country").select2({
        placeholder: "Select Country",
        // allowClear: true,
    });
    $("#week_off").select2({
        placeholder: "Select Week Off",
        allowClear: false,
        multiple: true,
    });

    

    $("#manager,#account_type_0,#employement_type,#company").select2({
        minimumResultsForSearch: Infinity,
        autocomplete: "off",
    });

    $("#department,#designation").select2({
        // allowClear: true
        autocomplete: "on",
    });

    $("#employement_type").on("change", function () {
        var type = $("#employement_type").val();
        var department = $("#department").val();
        var company_id = $("#company").val();
        if (department > 0 && type != "" && company_id > 0) {
            loader();
            var formData = { department: department, type: type,company_id:company_id };
            $.ajax({
                type: "POST",
                url: "user/get_reporting_senior",
                data: formData,
                success: function (response) {
                    var responseObject = JSON.parse(response);
                    var option_arr = '<option value="">Select Reporting Senior</option>';
                    for (var i = 0; i < responseObject.length; i++) {
                        option_arr += "<option value='" + responseObject[i]["employee_id"] + "'>" + responseObject[i]["name"] + "</option>";
                    }
                    $("#manager").html(option_arr).trigger("change");
                    setTimeout(function(){
                        hide_loader();
                    },500)
                    
                },
                error: function (error) {},
            });
        } else {
        }
    });

    $("#company").on("change", function () {
        var company_id = $("#company").val();
        if (company_id > 0) {
            var formData = { company_id: company_id};
            loader();
            $.ajax({
                type: "POST",
                url: "user/get_department",
                data: formData,
                success: function (response) {
                    var responseObject = JSON.parse(response);
                    
                    var option_arr = '<option value="">Select Department</option>';
                    for (var i = 0; i < responseObject.length; i++) {
                        option_arr += "<option value='" + responseObject[i]["department_id"] + "'>" + responseObject[i]["departmen_name"] + "["+responseObject[i]["department_code"]+"]</option>";
                    }
                    $("#department").html(option_arr).trigger("change");
                    var option_arr = '<option value="">Select Designation</option>';
                    $("#designation").html(option_arr).trigger("change");
                    var option_arr = '<option value="">Select Reporting Senior</option>';
                    $("#manager").html(option_arr).trigger("change");
                    setTimeout(function(){
                        hide_loader();
                    },500)
                },
                error: function (error) {},
            });
        } else {
        }
    });

    $("#department").on("change", function () {
        var department = $("#department").val();
        if (department > 0) {
            var formData = { department: department};
            loader();
            $.ajax({
                type: "POST",
                url: "user/get_designation",
                data: formData,
                success: function (response) {
                    var responseObject = JSON.parse(response);
                    
                    var option_arr = '<option value="">Select Designation</option>';
                    for (var i = 0; i < responseObject.length; i++) {
                        option_arr += "<option value='" + responseObject[i]["id"] + "'>" + responseObject[i]["designation_name"] + "</option>";
                    }
                    $("#designation").html(option_arr).trigger("change");
                    $("#employement_type").trigger("change");
                    setTimeout(function(){
                        hide_loader();
                    },500)
                },
                error: function (error) {},
            });
        } else {
        }
    });
    /* custom validation  */

    // Custom method for PAN card number validation
    $.validator.addMethod("panNumberCheck", function(value, element) {
        return this.optional(element) || /[A-Za-z]{5}\d{4}[A-Za-z]{1}/.test(value);
    }, "Please enter a valid PAN card number");

    $.validator.addMethod("aadharNumberCheck", function(value, element) {
        return this.optional(element) || /^\d{12}$/.test(value);
    }, "Please enter valid aadhar number.");

    $.validator.addMethod("account_holder_name_valid", function(value, element) {
        return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
    }, "Please enter valid account holder name.");

    $.validator.addMethod("valid_ifsc_code", function(value, element) {
        return this.optional(element) || /^[A-Z]{4}0[A-Z0-9]{6}$/.test(value);
    }, "Please enter valid ifsc code.");

    $.validator.addMethod("ageValidation", function (value, element) {
        var today = new Date();
        var dob = new Date(value);
        var age = today.getFullYear() - dob.getFullYear();
        var m = today.getMonth() - dob.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
            age--;
        }
        return age >= 18;
    });

    
    $("#employee_registration").validate({
        rules: {
            first_name: {
                required: true,
            },
            // middle_name: {
            //   required: true,
            // },
            last_name: {
                required: true,
            },
            email: {
                required: true,
                email: true,
                remote: {
                    url: "user/employee_email",
                    type: "post",
                    data: {
                        mode: function () {
                            return $("#mode").val(); // Get value from another input field
                        },
                        employee_id: function () {
                            return $("#employee_id").val(); // Get value from another input field
                        },
                        // Add more parameters as needed
                    },
                },
            },
            work_email: {
                required: true,
                email: true,
                remote: {
                    url: "user/employee_email",
                    type: "post",
                    data: {
                        mode: function () {
                            return $("#mode").val(); // Get value from another input field
                        },
                        employee_id: function () {
                            return $("#employee_id").val(); // Get value from another input field
                        },
                        // Add more parameters as needed
                    },
                },
            },

            mobile_number: {
                required: true,
                // number: true,
                intlTelNumber: true,
                // minlength: 10,
            },
            work_mobile_number: {
                required: true,
                // number: true,
                intlTelNumber1: true,
                // minlength: 10,
            },
            secondary_number: {
                secondary_number_validation: {
                    depends: function (element) {
                        var valid = $("#secondary_number").val() != "" ? true : false;
                        return valid;
                    },
                },
            },
            dob: {
                required: true,
                ageValidation: true,
            },
            company: {
                required: true,
            },
            gender: {
                required: true,
            },
            marital_status: {
                required: true,
            },
            overtime_allow: {
                required: true,
            },
            overtime_rate_per_hour: {
                required: {
                    depends: function (element) {
                        var valid = $(".overtime-allow-box [name='overtime_allow']:checked").val() == "Yes" ? true : false;
                        return valid;
                    },
                },
                min:  {
                        depends: function (element) {
                            var valid = removeFormatterNumber($("#overtime_rate_per_hour").val()) == 0 ? true : false;
                            return valid;
                        },
                    },
            },
            country: {
                required: true,
            },
            state: {
                required: true,
            },
            city: {
                required: true,
            },
            aadhar_number: {
                required: true,
                aadharNumberCheck:true
            },
            pan_card_number: {
                required: true,
                panNumberCheck: true
            },
            degree_name: {
                required: true,
            },
            education_field: {
                required: true,
            },
            college_name: {
                required: true,
            },
            pass_out_year: {
                required: true,
            },
            address: {
                required: true,
            },
            zipcode: {
                required: true,
            },
            department: {
                required: true,
            },
            designation: {
                required: true,
            },
            employement_type: {
                required: true,
            },
            employement_date: {
                required: true,
            },
            password: {
                required: true,
                minlength: 8,
            },
            confirm_password: {
                required: true,
                minlength: 8,
                equalTo: "#password",
            },
            profile_image: {
                required: true,
            },
            week_off: {
                required: true,
            },
            "bank_name[0]": {
                required: true,
            },
            "branch_address[0]": {
                required: true,
            },
            "ifsc_code[0]": {
                required: true,
                valid_ifsc_code: true

            },
            "account_type[0]": {
                required: true,
            },
            "account_number[0]": {
                required: true,
            },
            "account_holder_name[0]": {
                required: true,
                account_holder_name_valid: true
            },
            manager: {
                required: true,
            },
        },
        messages: {
            first_name: {
                required: "Please enter first name.",
            },
            middle_name: {
                required: "Please enter middle name.",
            },
            last_name: {
                required: "Please enter last name.",
            },
            email: {
                required: "Please enter email.",
                email: "Please enter a valid email.",
                remote: "This email is already registered.",
            },
            work_email: {
                required: "Please enter work email.",
                email: "Please enter a valid work email.",
                remote: "This work email is already registered.",
            },
            mobile_number: {
                required: "Please enter mobile number.",
                // intlTelNumber: "Please enter a valid number.",
                // minlength: "Phone number must be at least 10 digits.",
            },
            work_mobile_number: {
                required: "Please enter work mobile number.",
                intlTelNumber: "Please enter a valid work mobile number.",
                // minlength: "Phone number must be at least 10 digits.",
            },
            secondary_number: {
                secondary_number_validation: "Please enter a valid secondary number number.",
            },
            dob: {
                required: "Please enter date of birth.",
                ageValidation: "Age must be greater than or equal to 18 years old."
            },
            company :{
                required: "Please slect comapny.",
            },
            gender: {
                required: "Please select gender.",
            },
            marital_status: {
                required: "Please select marital status.",
            },
            overtime_allow: {
                required: "Please select marital status.",
            },
            overtime_rate_per_hour: {
                required: "Please enter overtime rate.",
                min: "Overtime rate value should be greater than 0."
            },
            country: {
                required: "Please select country.",
            },
            aadhar_number: {
                required: "Please enter aadhar number.",
                aadharNumberCheck: "Please enter valid aadhar number.",
            },
            pan_card_number: {
                required: "Please enter pan card number.",
                panNumberCheck: "Please enter valid pan card number.",
            },
            degree_name: {
                required: "Please enter degree.",
            },
            education_field: {
                required: "Please enter field.",
            },
            college_name: {
                required: "Please enter college name.",
            },
            pass_out_year: {
                required: "Please enter pass out year.",
            },
            state: {
                required: "Please select state.",
            },
            city: {
                required: "Please enter city.",
            },
            address: {
                required: "Please enter address.",
            },
            zipcode: {
                required: "Please enter ZIP code.",
            },
            department: {
                required: "Please enter department.",
            },
            designation: {
                required: "Please enter designation.",
            },
            employement_type: {
                required: "Please select employee type.",
            },
            employement_date: {
                required: "Please enter employment date.",
            },
            password: {
                required: "Please enter password.",
                minlength: "Password must be at least 8 characters long.",
            },
            confirm_password: {
                required: "Please confirm password.",
                minlength: "Password must be at least 8 characters long.",
            },
            profile_image: {
                required: "Please upload profile image.",
            },
            week_off: {
                required: "Please select week off.",
            },
            "bank_name[0]": {
                required: "Please enter bank name.",
            },
            "branch_address[0]": {
                required: "Please enter branch address.",
            },
            "ifsc_code[0]": {
                required: "Please enter ifsc code.",
            },
            "account_type[0]": {
                required: "Please select account type.",
            },
            "account_number[0]": {
                required: "Please enter account number.",
            },
            "account_holder_name[0]": {
                required: "Please enter account holder name.",
                account_holder_name_valid:"Please enter valid account holder name.",
            },
            manager: {
                required: "Please select reporting senior.",
            },
        },

        errorPlacement: function (error, element) {
            
            if (element[0]["id"] == "mobile_number" || element[0]["id"] == "work_mobile_number" || element[0]["id"] == "secondary_number") {
                $("." + element[0]["id"] + " .form-group").after(error);
            } else if (element[0]["id"] == "male" || element[0]["id"] == "single" || element[0]["id"] == "yes") {
                var element_box = "";
                if (element[0]["id"] == "male") {
                    element_box = "gender";
                } else if (element[0]["id"] == "single") {
                    element_box = "marital";
                } else {
                    element_box = "overtime-allow";
                }
                $("." + element_box + "-box .form-group").after(error);
            } else if (element[0]["id"] == "dob" || element[0]["id"] == "employement_date") {
                $("." + element[0]["id"] + " .input-group").after(error);
            } else if (element[0]["id"] == "employement_date") {
                $(".employement-date .input-group").after(error);
            } else if (element[0]["localName"] == "select") {
                var parents = $(element).parent(".col");
                $(parents).find(".select2-container").after(error);
            } else if(element[0]['name'] == 'password' || element[0]['name'] == 'confirm_password'|| element[0]['name'] == 'overtime_rate_per_hour'){
                $("#"+element[0]['id']).parents(".input-group").after(error)
            } else {
                error.insertAfter(element);
            }
        },
        submitHandler: function (form) {
            var step1 = $(".step-first-form").hasClass("validate-form");
            var step2 = $(".step-second-form").hasClass("validate-form");
            var step3 = $(".step-third-form").hasClass("validate-form");
            var flag = 0;
            $(".banck-details-rows .form-contain .action-box .form-check-input").each(function (i) {
               
                if ($(this).prop("checked")) {
                    flag = 1;
                }
            });

            if (step1 && step2 && step3 && flag == 1) {
                var formData = new FormData(form);
                var countryData = $("#mobile_number").intlTelInput("getSelectedCountryData");
                var countryCode = countryData.dialCode;
                formData.append("phone_code", "+" + countryCode);

                var countryData = $("#secondary_number").intlTelInput("getSelectedCountryData");
                var countryCode = countryData.dialCode;
                formData.append("secondary_number_code", "+" + countryCode);

                var countryData = $("#work_mobile_number").intlTelInput("getSelectedCountryData");
                var countryCode = countryData.dialCode;
                formData.append("work_mobile_number_code", "+" + countryCode);

                var selectedValues = $("#week_off").val();
                formData.append("week_off", selectedValues);
                loader();
                $.ajax({
                    type: "POST",
                    url: "user/employee_registration_action",
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
                                // toastr.success(msg);
                                toaster("success", msg);
                                setTimeout(function () {
                                    
                                    if(role == "employee" && mode == 'Update'){
                                        window.location.href = "employee-details.html";
                                    }else{
                                        window.location.href = "employee-list.html"; 
                                    }
                                    
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
            } else if (flag == 0) {
                toaster("warning", "Please select default bank.");
            } else {
                return false;
            }
        },
    });

    $("#add-bank").on("click", function () {
        loader();
        index++;
        $.ajax({
            type: "POST",
            url: "user/get_add_banck_block",
            data: { banck_count: index },
            success: function (response) {
                var responseObject = JSON.parse(response);
                $(".banck-details-rows").append(responseObject.html);
                $("#account_type_" + index).select2({
                    // placeholder: "Select Status",
                    allowClear: true,
                    minimumResultsForSearch: Infinity,
                    autocomplete: "off",
                });
                $("#bank_name_" + index).rules("add", {
                    required: true,
                    messages: {
                        required: "Please enter bank name.",
                    },
                });
                
                $("#branch_address_" + index).rules("add", {
                    required: true,
                    messages: {
                        required: "Please enter branch address.",
                    },
                });
                $("#ifsc_code_" + index).rules("add", {
                    required: true,
                    valid_ifsc_code:true,
                    messages: {
                        required: "Please enter ifsc code.",
                        valid_ifsc_code: "Please enter valid ifsc code."
                    },
                });
                $("#account_type_" + index).rules("add", {
                    required: true,
                    messages: {
                        required: "Please enter account type.",
                    },
                });
                $("#account_number_" + index).rules("add", {
                    required: true,
                    messages: {
                        required: "Please enter account number.",
                    },
                });
                $("#account_holder_name_" + index).rules("add", {
                    required: true,
                    account_holder_name_valid:true,
                    messages: {
                        required: "Please enter account holder name.",
                    },
                });
                hide_loader();
            },
            error: function (error) {},
        });

        // $('input[value="approve"]').prop("checked", true);
    });

    $(document).on("click", ".delete-bank", function () {
        // loader()
        var bank_id = $(this).attr("data-id");
        var element = $(this);
        Swal.fire({
            title: "Delete Bank",
            text: "Are you sure you want to delete this bank?",
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
                var elements = $(".banck-details-rows .form-contain");

                if (elements.length == 1) {
                    toaster("warning", "atleast one banck account is mandatory.");
                } else {
                    $(element).parents(".form-contain").remove();
                }

                // hide_loader();
            } else {
                // hide_loader();
            }
        });
    });

    /* update mode */
    if (mode == "Update") {
        $("#week_off").val(employee_week_off).trigger("change");
        $("#mobile_number").intlTelInput("setNumber", $("#mobile_number").val());
        $("#mobile_number").change(); // Trigger change event to update flag
    }
});

function check_validation(element) {
    var flag = 0;
    $("." + element + "-form .col .form-control").each(function (i) {
        var name_filed = $(this).attr("name");

        if (!$("[name='" + name_filed + "']").valid()) {
            flag = 1;
            
        }
    });
    return flag;
}

function serachParams() {
    var department_name = $("#department_name_search").val();
    table.column(0).search(department_name).draw();
    var department_code = $("#department_code_search").val();
    table.column(1).search(department_code).draw();
    var added_by = $("#added_by_search").val();
    table.column(2).search(added_by).draw();
    var added_date = $("#added_date_search").val();
    table.column(3).search(added_date).draw();
    var updated_by = $("#updated_by_search").val();
    table.column(4).search(updated_by).draw();
    var updated_date = $("#updated_date_search").val();
    table.column(5).search(updated_date).draw();
}
function resetFilter() {
    $("#department_name_search").val("");
    $("#department_code_search").val("");
    $("#added_by_search").val("");
    $("#added_date_search").val("").trigger("change");
    $("#updated_date_search").val("").trigger("change");
    $("#updated_by_search").val("");
    serachParams();
}
