var overtime_date = [];
var myModal = '';
var table = "";
$(document).ready(function () {
	myModal = new bootstrap.Modal(document.getElementById("employee_combo_off_popup"));
	combo_off.init();
	for(let i = 0;i < overtime_date_arr.length ; i++){
		overtime_date.push(overtime_date_arr[i]['date']);

	}
});
var end_date_ele = '';
const combo_off = {
	init : function(){
		let that = this;
		this.initiatePlugin();
		this.validation();
		this.dataTable();

		// add combo off
		$(".add-combo-off").on("click",function(){
			$("#mode").val("Add");
			$("#employee_combo_off_id").val('');
			$("#reference_date").val('').prop("disabled", false);
			$(".overtimes-value-block").html('--')
			$("#overtime_hours").val('--');
			$("#combo_off_date").val('');
			$("#combo_off_reason").val('');
			that.updateDisableDate(overall_combo_off_dates)
			myModal.show();
		})

		$("#reference_date").on("change",function(){
			var date = $(this).val();
			let box_val = '--';
			for(let i = 0;i < overtime_date_arr.length ; i++){
				overtime_date.push(overtime_date_arr[i]['date']);
				if(overtime_date_arr[i]['formated_date'] == date){
					box_val = overtime_date_arr[i]['over_time'];
				}
			}
			$(".overtimes-value-block").html(box_val)
			$("#overtime_hours").val(box_val)
		})

		//edit combo off
		$('.edit-combo-off').on('click',function(){
			var reference_date = $(this).attr("data-reference-date");
			var combo_off_date = $(this).attr("data-combo-off-date");
			var combo_off_id = $(this).attr("data-combo-off-id");
			var combo_off_reason = $.trim($(this).parents(".combo-off-request-row").find(".combo-off-reason").html());
			var over_time = $.trim($(this).parents(".combo-off-request-row").find(".over_time_row").html());
			$("#reference_date").val(reference_date).prop("disabled", true);
			$(".overtimes-value-block").html(over_time)
			$("#overtime_hours").val(over_time);
			$("#combo_off_date").val(combo_off_date);
			$("#combo_off_reason").val(combo_off_reason);
			$("#mode").val("Update")
			$("#employee_combo_off_id").val(combo_off_id)
			var disabledDates = [];
			combo_off_date = formateDate(combo_off_date,"yy-mm-dd");
			for (var i = 0; i < overall_combo_off_dates.length; i++) {
				if(combo_off_date != overall_combo_off_dates[i]){
					disabledDates.push(overall_combo_off_dates[i]);
				}
			}
			that.updateDisableDate(disabledDates)
			myModal.show();
		})
	},
	initiatePlugin: function(){
		//initiate datepicker
		
		let that = this;
		$("#reference_date").datepicker({
            beforeShowDay: that.enableSpecificReferenceDates
		});
		$('#combo_off_date').datepicker({
			showButtonPanel: true,
			changeMonth: true,
			changeYear: true,
			showOtherMonths: true,
			selectOtherMonths: true , 
			yearRange: 'c-100:c+100',
			minDate: new Date(),
			beforeShowDay: that.disableSpecificDates
		})

	},
	enableSpecificReferenceDates: function(date){
		 var dateString = $.datepicker.formatDate('yy-mm-dd', date);
         return [overtime_date.indexOf(dateString) != -1];
	},
	disableSpecificDates: function(date){
		 var dateString = $.datepicker.formatDate('yy-mm-dd', date);
         return [overall_combo_off_dates.indexOf(dateString) == -1];
	},
	updateDisableDate: function(dateArray){
		$("#combo_off_date").datepicker("option", "beforeShowDay", function(date) {
        var dateString = $.datepicker.formatDate('yy-mm-dd', date);
	        return [dateArray.indexOf(dateString) === -1];
	    });
	},
	validation: function(){
		$("#comboOffForm").validate({
	        rules: {
	            reference_date: {
	                required: true,
	            },
	            combo_off_date: {
	                required: true,
	            },
	            combo_off_reason: {
	                required: true,
	            },
	        },
	        messages: {
	            reference_date: {
	                required: "Please select reference date.",
	            },
	            combo_off_date: {
	                required: "Please select como off date."
	            },
	            combo_off_reason: {
	                required: "Please enter como off reason.",
	            },
	        },

	        errorPlacement: function (error, element) {
	            if (element[0]["localName"] == "input") {
	                var parents = $(element).parent(".date-box-block");
	                $(parents).after(error);
	            } else {
	                error.insertAfter(element);
	            }
	        },
	        submitHandler: function (form) {
	            var formData = new FormData(form);
	            loader();
	            $.ajax({
	                type: "POST",
	                url: "leave/add_update_combo_off",
	                data: formData,
	                cache: false,
	                processData: false,
	                contentType: false,
	                success: function (response) {
	                    var responseObject = JSON.parse(response);
	                    var msg = responseObject.message;
	                    var success = responseObject.success;
	                    setTimeout(function () {
	                        
	                        if (parseInt(success) == 1) {
	                        	myModal.hide();
	                            toaster("success", msg);
	                            setTimeout(function () {
	                                window.location.reload();
	                            }, 2000);
	                        } else {
	                        	hide_loader();
	                            // toastr.error(msg);
	                            toaster("fails", msg);
	                        }
	                    }, 1000);
	                },
	                error: function (error) {
	                    // console.error("Error:", error);
	                },
	            });
	        },
	    });
	},
	dataTable: function(){
		table = $(".combo-off-list-table").DataTable({
        dom: "Bfrtilp",
        buttons: [
            {
                extend: "csv",
                text: '<i class="ti ti-file-type-csv"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download CSV");
                },
                customize: function (csv) {
                        var lines = csv.split('\n');
                        var modifiedLines = lines.map(function(line) {
                            var values = line.split(',');
                            values.splice(6, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename : 'combo_off_list'
                },
          
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download Pdf");
                },
                filename: "combo_off_list",
                customize: function (doc) {
                    doc.pageMargins = [15, 15, 15, 15];
                    doc.content[0].text = "Combo Off List";
                    doc.content[0].color = "#5d87ff";
                    doc.content[1].table.widths = ["19%", "19%", "13%", "16%", "18%", "15%"];
                    doc.content[1].table.body[0].forEach(function (cell) {
                        cell.fillColor = "#5d87ff";
                    });
                    doc.content[1].table.body.forEach(function (row, index) {
                        row.splice(6, 1);
                        row.forEach(function (cell) {
                            // Set alignment for each cell
                            cell.alignment = "center"; // Change to 'left' or 'right' as needed
                        });
                    });
                },
            },
        ],
        searching: true,
        scrollX: true,
        scrollY: true,
        bScrollCollapse: true,
        columnDefs: [{ sortable: false, targets: 6 }],
        language: {
            loadingRecords: "&nbsp;",
            processing: '<div class="spinner"></div>',
            emptyTable: no_data_message,
            paginate: {
                first: "<<",
                last: ">>",
                next: ">",
                previous: "<",
            },
        },
        infoCallback: function (settings, start, end, max, total, pre) {
            // Get the count of visible rows after search
            var api = this.api();
            var rowCount = api.rows({ search: "applied" }).count();
            if (rowCount == 0) {
                $(".dataTables_empty").html(no_data_message);
            }
            // Construct the info string with the actual count
            var info = "Showing " + start + " to " + end + " of " + rowCount + " entries";

            // Optionally, you can append any other information you want to show
            // For example: 'Showing 1 to 10 of 57 entries'

            return info;
        },
    });

    $(".dataTables_length")
        .find("label")
        .contents()
        .filter(function () {
            return this.nodeType === 3; // Filter out text nodes
        })
        .remove();
	}
}