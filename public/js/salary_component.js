var table = "";
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById("salary_component_popup"));
    // $(".add-department").on("click", function () {
    //     $(".error").removeClass(".error");
    //     $("label.error").remove();
    //     $("#company_id").val(selected_company).prop("disabled", false).trigger("chosen:updated");
    //     $("#component_name").val('');
    //     $("#component_value").val('');
    //     $("#year").val('');
    //     $("#value_type").val('').trigger("chosen:updated");
    //     $("#component_type").val('').trigger("chosen:updated");
    //     $("#is_compulsory").val('').trigger("chosen:updated");
    //     $("#description").val('');
    //     $("#salary_component_id").val('');        
    //     $(".mode").val("Add");
    //     myModal.show();
    // });

    $("#company_id,#value_type,#component_type,#is_compulsory,#year").chosen();
    $("#year_drop_down").select2()

    $(document).on("click", ".edit_salary_componet", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        var id = $(this).attr("data-id");
        $.ajax({
            type: "POST",
            url: "salary/get_salary_details",
            data: {
                id: id,
            },
            success: function (response) {
                var responseObject = JSON.parse(response);
                console.log(responseObject)
                var salary_component = responseObject.salary_component;
                var success = responseObject.success;
                if (parseInt(success) == 1) {
                        $("#company_id").val(salary_component.company_id).prop("disabled", true).trigger("chosen:updated");
                        $("#component_name").val(salary_component.component_name);
                        $("#component_value").val(format_number(salary_component.component_value));
                        $("#year").val(salary_component.year).trigger("chosen:updated");;
                        $("#value_type").val(salary_component.value_type).trigger("chosen:updated");
                        $("#component_type").val(salary_component.component_type).trigger("chosen:updated");
                        $("#is_compulsory").val(salary_component.is_compulsory).trigger("chosen:updated");
                        $("#description").val(salary_component.description);
                        $("#salary_component_id").val(salary_component.salary_component_id)
                        $("#mode").val("Update")

                        hide_loader();
                        myModal.show();
                     
                    } else {
                        toaster("fails", msg);
                    }
                },
                error: function (error) {},
            });
    });

    $("#year_drop_down").on("change",function(){
        serachParams()
    })

    $("#SalaryComponentForm").validate({
        rules: {
            company_id: {
                required: true,
            },
            component_name: {
                required: true
            },
            component_value: {
                required: true
            },
            value_type: {
                required: true
            },
            component_type: {
                required: true
            },
            year: {
                required: true
            },
            is_compulsory: {
                required: true
            },
            description: {
                required: true
            },
            company_id: {
                required: true,
            },
        },
        messages: {
            company_id: {
                required: "Please select company.",
            },
            component_name: {
                required: "Please enter component name."
            },
            component_value: {
                required: "Please enter component value."
            },
            value_type: {
                required: "Please select type."
            },
            component_type: {
                required: "Please select component type."
            },
            year: {
                required: "Please enter year."
            },
            is_compulsory: {
                required: "Please select is compulsory."
            },
            description: {
                required: "Please enter description."
            },
            company_id: {
                required: "Please select company.",
            },
        },

        errorPlacement: function (error, element) {
            if (element[0]["localName"] == "select") {
                var parents = $(element).parent(".select-box");
                $(parents).find(".chosen-container").after(error);
            } else if (element[0]["id"] == "start_date" || element[0]["id"] == "end_date") {
                var parents = $(element).parent(".input-group").after(error);
            } else {
                error.insertAfter(element);
            }
        },
        ignore: ":hidden:not(select)",
        submitHandler: function (form) {
            var formData = new FormData(form);
            var mode = $("#mode").val();
            if(mode == 'Update'){
                var company_id = $("#company_id").val();
                formData.append("company_id", company_id);
            }
            
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

    $(document).on("keypress", "#component_value,#year,#component_value_search", function (e) {
    if (String.fromCharCode(e.keyCode).match(/[^0-9.]/g)) return false;
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
                            values.splice(7, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename : 'salary_component_list'
                },
          
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download Pdf");
                },
                filename: "salary_component_list",
                customize: function (doc) {
                    doc.pageMargins = [15, 15, 15, 15];
                    doc.content[0].text = "Salary Component List";
                    doc.content[0].color = "#5d87ff";
                    doc.content[1].table.widths = ["16%", "14%", "14%", "14%", "14%", "14%","14%"];
                    doc.content[1].table.body[0].forEach(function (cell) {
                        cell.fillColor = "#5d87ff";
                    });
                    // for (var i = 1; i < doc.content[1].table.body.length; i++) {
                       
                    //     doc.content[1].table.body[i][2].text = format_number(doc.content[1].table.body[i][2].text);
                    // }
                    doc.content[1].table.body.forEach(function (row, index) {
                        row.splice(7, 1);
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
        columnDefs: [{ sortable: false, targets: 7 }],
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
    // $("#updated_date_search,#added_date_search").datepicker({
    //     showButtonPanel: true,
    //     changeMonth: true,
    //     changeYear: true,
    //     showOtherMonths: true,
    //     selectOtherMonths: true,
    //     dateFormat: "yy-mm-dd"
    // });
    
    $("#type_search,#is_compulsory_search,#component_type_search").chosen()
    $(".search-filter").on("click", function () {
        serachParams();
        $(".close-filter-btn").trigger("click");
    });
    $(".reset-filter").on("click", function () {
        console.log("k")
        resetFilter();
    });
});

function serachParams() {
    var year_drop_down = $("#year_drop_down").val();
    table.column(4).search(year_drop_down).draw();
    var component_name_search = $("#component_name_search").val();
    table.column(0).search(component_name_search).draw();
    var component_type_search = $("#component_type_search").val();
    table.column(1).search(component_type_search).draw();
    var component_value_search = $("#component_value_search").val();
    table.column(2).search(component_value_search).draw();
    var type_search = $("#type_search").val();
    table.column(3).search(type_search).draw();
    var is_compulsory_search = $("#is_compulsory_search").val();
    table.column(5).search(is_compulsory_search).draw();
    var description_search = $("#description_search").val();
    table.column(6).search(description_search).draw();
    // var searchValue = $("#component_value_search").val().replace(/,/g, ''); // Remove commas from the search value
    //     $.fn.dataTable.ext.search.push(
    //         function(settings, data, dataIndex) {
    //             var columnData = data[2].replace(/,/g, ''); // Remove commas from the column data
    //             return columnData.indexOf(searchValue) !== -1;
    //         }
    //     );
    //     table.draw();
    //     $.fn.dataTable.ext.search.pop();
}
function resetFilter() {
    $("#component_name_search").val("");
    $("#component_value_search").val("");
    $("#type_search").val("").trigger("chosen:updated");
    $("#component_type_search").val("").trigger("chosen:updated");
    $("#is_compulsory_search").val("").trigger("chosen:updated");
    $("#description_search").val("");
    serachParams();
}
