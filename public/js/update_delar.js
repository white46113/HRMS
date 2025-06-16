
var table = '';
$(document).ready(function () {
	$("#address_info_form").validate({
		rules: {
			state: {
				required: true,
			},
			city: {
				required: true,
			},
			zipcode: {
				required: true,
			},

		},
		messages: {
			state: {
				required: "Please select state.",
			},
			city: {
				required: "Please enter city.",
			},
			zipcode: {
				required: "Please enter zipcode.",
			},

		},
		errorPlacement: function (error, element) {
			var errorId = element.attr("id") + "_error";
			error.appendTo("#" + errorId);


		},
		submitHandler: function (form) {

			var formData = new FormData(form);
			$.ajax({
				type: "POST",
				url: "home/update_address",
				data: formData,
				processData: false,
				contentType: false,
				success: function (response) {
					var responseObject = JSON.parse(response);
					var msg = responseObject.message;
					var success = responseObject.success;
					var id = responseObject.id;
					if (success == 1) {
						toastr.success(msg);
						url = responseObject.redirect_url;
						setTimeout(function () {
							window.location.href = url;
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
