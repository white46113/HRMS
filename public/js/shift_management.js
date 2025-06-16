var table = "";
var department_id = "";
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById("Shift_popup"));
    $(".add-leave").on("click", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        department_id = "";
        $(".shift_name").val("");
        $("#shift_type").val("");
        $("#start_time").val("");
        $("#end_time").val("");
        $("#company_id").val(selected_company).prop("disabled", false).trigger("chosen:updated");
        $("#department_id").val("").prop("disabled", false).trigger("chosen:updated");
        $("#shift_type").val("").prop("disabled", false).trigger("chosen:updated");
        myModal.show();
    });

    $("#start_time,#end_time").mdtimepicker();

    $("#company_id").chosen();
    $(document).on("change", "#company_id", function () {
        var id = $(this).val();
        var opt_val = '<option value="">Select Department</option>';
        if (id > 0) {
            $.ajax({
                type: "POST",
                url: "shift/get_department",
                data: {
                    company_id: id,
                },

                success: function (response) {
                    var responseObject = JSON.parse(response);
                    var departments = responseObject.departments;
                    $("#department_id").html("");
                    if (departments.length > 0) {
                        for (var i = 0; i < departments.length; i++) {
                            opt_val += `<option value="${departments[i]["department_id"]}">${departments[i]["departmen_name"]} [${departments[i]["department_code"]}]</option>`;
                        }
                    }
                    $("#department_id").html(opt_val);

                    if (department_id > 0) {
                        $("#department_id").val(department_id).prop("disabled", true).trigger("chosen:updated");
                    } else {
                        $("#department_id").trigger("chosen:updated");
                    }
                },
                error: function (error) {},
            });
        } else {
            $("#department_id").html(opt_val);
            $("#department_id").trigger("chosen:updated");
        }
    });
    $(document).on("click", ".edit_shift", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "shift/get_shift_details",
            data: {
                edit: id,
            },

            success: function (response) {
                var responseObject = JSON.parse(response);
                var data = responseObject.data;
                $("#start_time,#end_time").mdtimepicker("destroy");
                $("#company_id").val(data.company_id).prop("disabled", true).trigger("chosen:updated");
                department_id = data.department_id;
                $("#company_id").trigger("change");
                $(".shift_id").val(data.id);
                $(".shift_name").val(data.shift_name);
                $(".shift_type").val(data.shift_type).prop("disabled", true).trigger("chosen:updated").prop("disabled", true);
                $(".start_time").val(data.start_time);
                $(".end_time").val(data.end_time);
                $("#start_time,#end_time").mdtimepicker();
                myModal.show();
            },
            error: function (error) {},
        });
    });

    $("#shift_type,#department_id").chosen();

    $(document).on("click", ".delete_shift", function () {
        var id = $(this).data("id");
        loader();
        Swal.fire({
            title: "Delete Shift",
            text: "Are you sure you want to delete this Shift?",
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
                $.ajax({
                    type: "POST",
                    url: "shift/delete_shift",
                    data: {
                        id: id,
                    },

                    success: function (response) {
                        var responseObject = JSON.parse(response);
                        var msg = responseObject.message;
                        var success = responseObject.success;
                        if (parseInt(success) == 1) {
                            toaster("success", msg);
                            setTimeout(function () {
                                location.reload(true);
                            }, 2000);
                        } else {
                            toaster("fails", msg);
                        }
                    },
                    error: function (error) {},
                });
            } else {
                hide_loader();
            }
        });
    });
    $("#shiftForm").validate({
        rules: {
            shift_name: {
                required: true,
            },
            company_id: {
                required: true,
            },
            department_id: {
                required: true,
            },
            shift_type: {
                required: true,
            },
            start_time: {
                required: true,
            },
            end_time: {
                required: true,
            },
        },
        messages: {
            shift_name: {
                required: "Please enter shift name.",
            },
            company_id: {
                required: "Please select company.",
            },
            department_id: {
                required: "Please select department.",
            },
            shift_type: {
                required: "Please select shift type.",
            },
            start_time: {
                required: "Please select start time.",
            },
            end_time: {
                required: "Please select end time.",
            },
        },

        errorPlacement: function (error, element) {
            if (element[0]["localName"] == "select") {
                var parents = $(element).parent(".select-box");
                $(parents).find(".chosen-container").after(error);
            } else if (element[0]["id"] == "start_time" || element[0]["id"] == "end_time") {
                var parents = $(element).parent(".input-group").after(error);
            } else {
                error.insertAfter(element);
            }
        },
        ignore: ":hidden:not(select)",
        submitHandler: function (form) {
            var formData = new FormData(form);
            var id = $(".shift_id").val();
            formData.append("id", id);
            if (id > 0) {
                var department_id = $("#department_id").val();
                var shift_type = $("#shift_type").val();
                formData.append("department_id", department_id);
                formData.append("shift_type", shift_type);
            }
            loader();
            $.ajax({
                type: "POST",
                url: "shift/shift_action",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (response) {
                    var responseObject = JSON.parse(response);
                        var msg = responseObject.message;
                        console.log(msg);
                        var success = responseObject.success;

                        if (parseInt(success) === 1) {
                          toaster("success", msg);
                          setTimeout(function () {
                            hide_loader()
                            location.reload(true);
                          }, 2000);
                        } else {

                          toaster("fails", msg);
                          hide_loader()
                        }
                },
                error: function (error) {
                    // console.error("Error:", error);
                },
            });
        },
    });
    // $(".submit-shift").on("click", function () {
    //   var shift_name = $("#shift_name").val();
    //   var shift_type = $("#shift_type").val();
    //   var start_time = $("#start_time").val();
    //   var end_time = $("#end_time").val();
    //   var department = $("#department").val();

    //   if (shift_name == "") {
    //     toaster("warning", "Please enter shift name.");
    //   } else if (shift_type == "") {
    //     toaster("warning", "Please select shift type.");
    //   }else if (start_time == "") {
    //     toaster("warning", "Please select start time.");
    //   }else if (end_time == "") {
    //     toaster("warning", "Please select end time.");
    //   }else if (!(department > 0)) {
    //     toaster("warning", "Please select department.");
    //   } else if (shift_name != "" && shift_type != "" && start_time != "" && end_time != "") {
    //     var id = $(".shift_id").val();

    //     loader();
    //     var formData = {
    //       shift_name: shift_name,
    //       shift_type: shift_type,
    //       start_time: start_time,
    //       end_time: end_time,
    //       id: id,
    //       department_id:department
    //     };
    //     $.ajax({
    //       type: "POST",
    //       url: "shift/shift_action",
    //       data: formData,
    //       success: function (response) {
    //         var responseObject = JSON.parse(response);
    //         var msg = responseObject.message;
    //         console.log(msg);
    //         var success = responseObject.success;

    //         if (parseInt(success) === 1) {
    //           toaster("success", msg);
    //           setTimeout(function () {
    //             hide_loader()
    //             location.reload(true);
    //           }, 2000);
    //         } else {

    //           toaster("fails", msg);
    //           hide_loader()
    //         }
    //       },
    //       error: function (error) {
    //         // Handle error if needed
    //       },
    //     });
    //   } else {
    //     toaster("warning", "Please select leave dates.");
    //   }
    // });
    table = $("#shift_management").DataTable({
        dom: "Bfrtilp",
        buttons: [
            {
                extend: "csv",
                text: '<i class="ti ti-file-type-csv"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download CSV");
                },
                customize: function (csv) {
                    var lines = csv.split("\n");
                    var modifiedLines = lines.map(function (line) {
                        var values = line.split(",");
                        values.splice(5, 1);
                        return values.join(",");
                    });
                    return modifiedLines.join("\n");
                },
                filename: "shift_management",
            },
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download Pdf");
                },
                filename: "shift_management",
                customize: function (doc) {
                    doc.content[0].text = "Shift Management List";
                    doc.content[0].color = "#5d87ff";
                    doc.content[1].table.widths = ["30%", "25%", "15%", "15%", "15%"];
                    doc.content[1].table.body[0].forEach(function (cell) {
                        cell.fillColor = "#5d87ff";
                    });
                    doc.content[1].table.body.forEach(function (row, index) {
                        row.splice(5, 1);
                        row.forEach(function (cell) {
                            // Set alignment for each cell
                            cell.alignment = "center"; // Change to 'left' or 'right' as needed
                        });
                    });
                    doc.pageSize = "A4";
                },
                orientation: "landscape",
            },
        ],
        searching: true,
        scrollX: true,
        scrollY: true,
        bScrollCollapse: true,
        columnDefs: [{ sortable: false, targets: 3 }],
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
    $("#start_time_search,#end_time_search").mdtimepicker();
    $("#shift_name_search,#department_name_search,#shift_type_search").select2();
    $(".search-filter").on("click", function () {
        serachParams();
        $(".close-filter-btn").trigger("click");
    });
    $(".reset-filter").on("click", function () {
        resetFilter();
    });
});

function updateDisabledDates(newDisabledDates, element) {
    element.datepicker("option", "beforeShowDay", function (date) {
        var string = jQuery.datepicker.formatDate("yy-mm-dd", date);
        return [newDisabledDates.indexOf(string) == -1];
    });
}
function serachParams() {
    var designation_name = $("#department_name_search").val();
    table.column(0).search(designation_name).draw();
    var department_name = $("#shift_name_search").val();
    table.column(1).search(department_name).draw();
    var shift_type_search = $("#shift_type_search").val();
    if (shift_type_search == "") {
        table.column(2).search(shift_type_search).draw();
    } else {
        table
            .column(2)
            .search("^" + $.fn.dataTable.util.escapeRegex(shift_type_search) + "$", true, false)
            .draw();
    }

    var start_time_search = $("#start_time_search").val();
    table.column(3).search(start_time_search).draw();
    var end_time_search = $("#end_time_search").val();
    table.column(4).search(end_time_search).draw();
}
function resetFilter() {
    $("#shift_name_search").val("").trigger("change");
    $("#department_name_search").val("").trigger("change");
    $("#shift_type_search").val("").trigger("change");
    $("#start_time_search").val("").trigger("change");
    $("#end_time_search").val("").trigger("change");

    serachParams();
}
