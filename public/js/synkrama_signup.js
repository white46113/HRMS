$(document).ready(function () {
    $("#passwordIconShow").hide();

    $("#passwordIconHide").click(function () {
        showPassword("#passwordIconHide", "#password", "#passwordIconShow");
    });

    $("#passwordIconShow").click(function () {
        hidePassword("#passwordIconShow", "#password", "#passwordIconHide");
    });

    $("#user_form").validate({
        rules: {
            first_name: {
                required: true,
            },
            last_name: {
                required: true,
            },
            country_id: {
                required: true,
            },
            mobile_number: {
                required: true,
                number: true,
                minlength: 10,
            },
            email: {
                required: true,
                email: true,
            },
            user_type: {
                required: true,
            },
            password: {
                required: true,
                minlength: 8,
            },
            Color:{ required:true }
        },
        messages: {
            first_name: {
                required: "Please enter your first name.",
            },
            last_name: {
                required: "Please enter your last name.",
            },
            country_id: {
                required: "Please select a country code.",
            },
            mobile_number: {
                required: "Please enter your mobile number.",
                number: "Please enter a valid number.",
                minlength: "Phone number must be at least 10 digits.",
            },
            email: {
                required: "Please enter your email.",
                email: "Please enter a valid email address.",
            },
            user_type: {
                required: "Please select user type.",
            },
            password: {
                required: "Please enter your password.",
                minlength: "Password must be at least 8 characters long.",
            },
           
        },
        errorPlacement: function (error, element) {
          var errorId = element.attr("id") + "_error";
          error.appendTo("#" + errorId);
          console.log(error,errorId)
          if ( element.is(":radio") ) 
            {
                error.appendTo( "#user_type_error");
            }

        },
        submitHandler: function (form) {

             var formData = new FormData(form);
            $.ajax({
                type: "POST",
                url: "user/signup_action",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (response) {
                    var responseObject = JSON.parse(response);
                    var msg = responseObject.message;
                    var success = responseObject.success;
                    if (parseInt(success) == 1) {
                        toastr.success(msg);
                        setTimeout(function () {
                            window.location.href = "login.html";
                        }, 2000);
                    } else {
                        toastr.error(msg);
                    }
                },
                error: function (error) {
                    console.error("Error:", error);
                },
            });
        },
    });
});

function showPassword(hidePasswordIcon, passwordAttributeId, showPasswordIcon) {
    $(passwordAttributeId).attr("type", "text");
    $(hidePasswordIcon).hide();
    $(showPasswordIcon).show();
}

function hidePassword(hidePasswordIcon, passwordAttributeId, showPasswordIcon) {
    $(passwordAttributeId).attr("type", "password");
    $(hidePasswordIcon).hide();
    $(showPasswordIcon).show();
}
