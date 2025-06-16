

$(document).ready(function() {
	if(type != "listing"){
		loader()
		tinymce.init({
		  selector: "textarea",
		  height: 500,
		  plugins: "print preview fullpage powerpaste searchreplace autolink directionality advcode visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount tinymcespellchecker a11ychecker imagetools mediaembed linkchecker contextmenu colorpicker textpattern help",
		  toolbar1: "formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent | removeformat | code",
		  image_advtab: true,
		  templates: [
		    { title: "Test template 1", content: "Test 1" },
		    { title: "Test template 2", content: "Test 2" },
		  ],
		  content_css: [
		    "//fonts.googleapis.com/css?family=Lato:300,300i,400,400i",
		  ],
		});
		setTimeout(function(){
			hide_loader();
			$(".mce-tinymce").show()
		},1000)
	}
  $(".star_required").css("color","red");

  $('#announcement_date').datepicker({
    showButtonPanel: true,
    changeMonth: true,
    changeYear: true,
    showOtherMonths: true,
    selectOtherMonths: true,
    minDate: new Date(),
  });

  $(".submit-announcement").click(function() {
    // var content = $(".main-middle-container iframe").contents().find("html").html()
    var content = tinymce.activeEditor.getContent();;
    var  announcement_date =$("#announcement_date").val();
    var  title = $("#title").val();
    if (title == "") {
      toaster("warning", "Please Enter Announcement Title.");
    } else if (announcement_date == "") {
      toaster("warning", "Please select Announcement Date.");
    }else if (content.trim()  == "") {
      toaster("warning", "Please Enter Announcement Content.");
    } else if (title != "" && announcement_date != ""  && content.trim()  != "") {
      var id = $("#announcement_id").val();
      console.log(content);
      // alert(content);
      $.ajax({
        type: "POST",
        url: "activities/add_update_announcement",
        data: {
          id:id,
          title:title,
          content:content,
          announcement_date:announcement_date,
        },

        success: function (response) {
          var responseObject = JSON.parse(response);
          var msg = responseObject.message;
          console.log(msg);
          var success = responseObject.success;
          if (parseInt(success) == 1) {
            toaster("success", msg);
            setTimeout(function () {
              // location.reload(true)
              window.location.href = "announcement_list.html";
            }, 2000);
          } else {
            toaster("fails", msg);
          }
        },
        error: function (error) {},
      });
    }
  });


  $(document).on("click",".delete_announcement", function () {
    var id = $(this).data("id");

    var confirmDelete = confirm("Are you sure you want to delete this announcement?");

    if (confirmDelete) {
      $.ajax({
        type: "POST",
        url: "activities/delete_announcement",
        data: {
          id:id,
        },

        success: function (response) {
          var responseObject = JSON.parse(response);
          var msg = responseObject.message;
          console.log(msg);
          var success = responseObject.success;
          if (parseInt(success) == 1) {
            toaster("success", msg);
            setTimeout(function () {
              location.reload(true)

              // window.location.href = "announcement_list.html";
            }, 2000);
          } else {
            toaster("fails", msg);
          }
        },
        error: function (error) {},
      });
    }
  });

});