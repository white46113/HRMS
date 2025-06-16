$(document).ready(function () {
    $("#passwordIconShow").hide();

    $("#passwordIconHide").click(function () {
        showPassword("#passwordIconHide", "#password", "#passwordIconShow");
    });

    $("#passwordIconShow").click(function () {
        hidePassword("#passwordIconShow", "#password", "#passwordIconHide");
    });

    $("#user_login_form").validate({
        rules: {
            email: {
                required: true,
                email: true,
            },
            password: {
                required: true,
                minlength: 8,
            },
        },
        messages: {
            email: {
                required: "Please enter your email.",
                email: "Please enter a valid email address.",
            },
            password: {
                required: "Please enter your password.",
                minlength: "Password must be at least 8 characters long.",
            },
        },
        errorPlacement: function (error, element) {
            var errorId = element.attr("id") + "_error";
            error.appendTo("#" + errorId);
        },
        submitHandler: function (form) {
            var formData = {
                email: $("#email").val(),
                password: $("#password").val(),
                user_login: "user_login",
            };

            $.ajax({
                type: "POST",
                url: "user/login_action",
                data: formData,
                success: function (response) {
                    var responseObject = JSON.parse(response);
                    var msg = responseObject.msg;
                    var success = responseObject.success;

                    if (success == 1) {
                        var url = "";
                        toastr.success("User Login Successfully.");
                        if(responseObject.user_type == "Dealer"){
                            if(responseObject.redirect == "Yes"){
                                url = "dealer-address.html?id="+responseObject.id;
                            }else{
                                url = "dealer-profile.html?id="+responseObject.id;
                            }
                        }else{
                             url = "dealer.html";
                        }
                        setTimeout(function () {
                            window.location.href = url;
                        }, 2000);
                    } else {
                        toastr.error("Invalid email or password. Please try again");
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
