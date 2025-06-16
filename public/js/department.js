var table = "";
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById("designation_popup"));

    $(".add-department").on("click", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        $(".department_name").val("");
        $(".department_id").val("");
        $("#company_id").val(selected_company).trigger("change").prop("disabled", false);
        $("#department_code").val('').trigger("change").prop("disabled", false);

        $(".mode").val("Add");
        myModal.show();
    });
    $("#company_id").select2();
    $(document).on("click", ".edit_department", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        var id = $(this).attr("data-id");
        var company_id = $(this).attr("data-company-id");
        var parent_div = $(this).parents(".department-request-row");
        var department_name = $(parent_div).find(".departmen_name").html();
        var department_code = $(parent_div).find(".department_code").html();
        $("#department_name").val(department_name);
        $("#department_code").val(department_code).prop("disabled", true);
        $("#department_id").val(id);
        $("#company_id").val(company_id).trigger("change").prop("disabled", true);
        $("#mode").val("Update");
        myModal.show();
    });

    $(".delete_designation").on("click", function () {
        var id = $(this).data("id");
        loader();
        Swal.fire({
            title: "Delete Designation",
            text: "Are you sure you want to delete this designation?",
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
                    url: "home/delete_designation",
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
                                hide_loader();
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

    $("#DepartmentForm").validate({
        rules: {
            department_name: {
                required: true,
            },
            department_code: {
                required: true,
                remote: {
                    url: "master/check_department_code",
                    type: "post",
                    data: {
                        company_id: function () {
                            return $("#company_id").val(); // Get value from another input field
                        },
                    },
                },
            },
            company_id: {
                required: true,
            },
        },
        messages: {
            department_name: {
                required: "Please enter department name.",
            },
            department_code: {
                required: "Please enter department code.",
                remote: "This department code is already registered.",
            },
            company_id: {
                required: "Please select company.",
            },
        },

        errorPlacement: function (error, element) {
            if (element[0]["localName"] == "select") {
                var parents = $(element).parent(".select-box-block");
                $(parents).find(".select2-container").after(error);
            } else {
                error.insertAfter(element);
            }
        },
        submitHandler: function (form) {
            var formData = new FormData(form);
            loader();
            $.ajax({
                type: "POST",
                url: "master/add_update_department",
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
                                window.location.reload();
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
        },
    });

    

    table = $(".leave-list-table").DataTable({
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
                    filename : 'department_list'
                },
          
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download Pdf");
                },
                filename: "department_list",
                customize: function (doc) {
                    doc.pageMargins = [15, 15, 15, 15];
                    doc.content[0].text = "Department List";
                    doc.content[0].color = "#5d87ff";
                    doc.content[1].table.widths = ["19%", "19%", "13%", "13%", "15%", "15%"];
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
    // filter
    $("#updated_date_search,#added_date_search").datepicker({
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: "yy-mm-dd"
    });
    $(".search-filter").on("click", function () {
        serachParams();
        $(".close-filter-btn").trigger("click");
    });
    $(".reset-filter").on("click", function () {
        resetFilter();
    });
});

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
