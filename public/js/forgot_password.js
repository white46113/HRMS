$(document).ready(function () {
 $('body').find('[style="text-align: right;position: fixed;z-index:9999999;bottom: 0;width: auto;right: 1%;cursor: pointer;line-height: 0;display:block !important;"]').remove()
 setTimeout(function(){
        $('body').find('a[href*="https://www.000webhost.com/?utm_source=000webhostapp&utm_campaign=000_logo&utm_medium=website&utm_content=footer_img"]').css("display","none")
    },1000)

  $("#user_verify").validate({
    rules: {
      username: {
        required: true,
         email: true,
      },
    },
    messages: {
      username: {
        required: 'Please enter email.',
        email: 'Please enter a valid email.'
      },
    },
    errorPlacement: function (error, element) {
      
        $("#"+element[0]['id']).parents(".input-group").after(error)
      
    },
    submitHandler: function (form) {

      loader()
      var formData = new FormData(form);
      $.ajax({
        type: "POST",
        url: "user/verify_user",
        data: formData,
        cache: false,
        processData: false,
        contentType: false,
        success: function (response) {
          var responseObject = JSON.parse(response);
          var msg = responseObject.message;
          var success = responseObject.success;
          setTimeout(function(){
              hide_loader();
              if (parseInt(success) == 1) {
                toaster("success",msg);
                $("#user_email").val(responseObject.email)
                $("#otp_verify").removeClass("hide");
                $("#user_verify").addClass("hide");
              } else {
                toaster("fails",msg);
              }
           },1000)
        },
        error: function (error) {
          // console.error("Error:", error);
        },
      });
    },
  });
  $("#otp_verify").validate({
    rules: {
      otp: {
        required: true,
      },
      password: {
        required: true,
        minlength: 8,
      },
      confirm_password: {
        required: true,
        minlength: 8,
        equalTo: '#password'
      }
    },
    messages: {
      otp: {
        required: "Please enter otp.",
      },
      password: {
        required: "Please enter new password.",
        minlength: "New password must be at least 8 characters long.",
      },
      confirm_password: {
        required: "Please confirm password.",
        minlength: "Password must be at least 8 characters long.",
        equalTo: "Confirm password must be same as new password."
      }
    },

    errorPlacement: function (error, element) {
    
        // if(element[0]['name'] == 'password' || element[0]['name'] == 'confirm_password'){
          $("#"+element[0]['id']).parents(".input-group").after(error)
        // }else{
        //   error.insertAfter(element);
        // }
      
    },
    submitHandler: function (form) {

    

      var formData = new FormData(form);
      loader()
      $.ajax({
        type: "POST",
        url: "user/change_password",
        data: formData,
        cache: false,
        processData: false,
        contentType: false,
        success: function (response) {
          var responseObject = JSON.parse(response);
          var msg = responseObject.message;
          var success = responseObject.success;
          setTimeout(function(){
            hide_loader();
            if (parseInt(success) == 1) {
              toaster("success",msg);
              setTimeout(function () {
                window.location.href = "login.html";
              }, 2000);
            } else {
              // toastr.error(msg);
              toaster("fails",msg);
            }
           },1000)
        },
        error: function (error) {
          // console.error("Error:", error);

        },
      });
    },
  });
  $(".password-icon").on('click',function(){
    var element = $(this).parents("div.password-box");

     if($(this).hasClass('ti-eye')){
        $(this).removeClass("ti-eye").addClass('ti-eye-off');
        element.find('input').attr("type","text");
        var element_val = $(this);
        setTimeout(function(){
          element_val.removeClass("ti-eye-off").addClass('ti-eye');
      element.find('input').attr("type","password");
      },5000)
    }else{
      $(this).removeClass("ti-eye-off").addClass('ti-eye');
      element.find('input').attr("type","password");
    }
    
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

function validate() {

    var number = $("#mobile_number").intlTelInput('getNumber');
    iso = $("#mobile_number").intlTelInput('getSelectedCountryData').iso2;
   
    var exampleNumber = intlTelInputUtils.getExampleNumber(iso, 0, 0);
    if (number == '')
        number = exampleNumber;

    var formattedNumber = intlTelInputUtils.formatNumber(number, iso, intlTelInputUtils.numberFormat.NATIONAL);
    var isValidNumber = intlTelInputUtils.isValidNumber(number, iso);
    var validationError = intlTelInputUtils.getValidationError(number, iso);

    console.log(number);
    console.log(formattedNumber);
    console.log(intlTelInputUtils.formatNumber(number, iso, intlTelInputUtils.numberFormat.INTERNATIONAL));
    console.log(intlTelInputUtils.formatNumber(number, iso, intlTelInputUtils.numberFormat.E164));
    console.log(intlTelInputUtils.formatNumber(number, iso, intlTelInputUtils.numberFormat.RFC3966));
    console.log(isValidNumber);
    console.log(validationError);

}