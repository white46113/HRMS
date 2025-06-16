var holiday_date_ele = "";
var table = '';
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById("employee_holiday_popup"));
    $("#year_drop_down").select2({
          placeholder: "Select Month",
          minimumResultsForSearch: Infinity,  
          autocomplete:'off',
    });
    $(".add-leave").on("click", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        $(".holiday_name").val("");
        $(".holiday_date").val("");
        $(".holiday_id").val("");
        myModal.show();
    });
    holiday_date_ele = $("#holiday_date").datepicker({
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        // yearRange: new Date().getFullYear() + ":" + (new Date().getFullYear() + 1),
        minDate: new Date(new Date().getFullYear(), 0, 1),
        // maxDate: new Date(new Date().getFullYear(), 11, 31),
        beforeShowDay: function(date) {
          var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
          return [holiday_dates.indexOf(string) == -1];
        }
    });

    $(document).on("click", ".edit_holiday", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "holiday/get_holiday_details",
            data: {
                edit: id,
            },

            success: function (response) {
                var responseObject = JSON.parse(response);
                var data = responseObject.data;
                var new_dates = [];
                for (var i = 0; i < holiday_dates.length; i++) {
                    if(holiday_dates[i] != data.holiday_date){
                        new_dates.push(holiday_dates[i])
                    }
                }
                updateDisabledDates(new_dates,holiday_date_ele);
                $(".holiday_name").val(data.holiday_name);
                $(".holiday_date").val(data.holiday_date_fomated);
                $(".holiday_id").val(data.id);
                myModal.show();
            },
            error: function (error) {},
        });
    });

    $(document).on("click",".delete_holiday",function () {
        var id = $(this).data("id");
        loader()
        Swal.fire({
            title: "Delete Holiday",
            text: "Are you sure you want to delete this holiday?",
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
                url: "holiday/delete_holiday",
                data: {
                    id: id,
                },

                success: function (response) {
                    var responseObject = JSON.parse(response);
                    var msg = responseObject.message;
                    console.log(msg);
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
            }else{
                hide_loader();
            }
        });

        
    });

    $("#holidayForm").validate({
        rules: {
            holiday_name: {
                required: true,
            },
            holiday_date: {
                required: true,
            },
        },
        messages: {
            holiday_name: {
                required: "Please enter holiday name.",
            },
            holiday_date: {
                required: "Please select holiday date.",
            },
        },

        errorPlacement: function (error, element) {
            if (element[0]["localName"] == "select") {
                var parents = $(element).parent(".select-box");
                $(parents).find(".chosen-container").after(error);
            } else if (element[0]["id"] == "holiday_date") {
                var parents = $(element).parent(".input-group").after(error);
            } else {
                error.insertAfter(element);
            }
        },
        ignore: ":hidden:not(select)",
        submitHandler: function (form) {
            var formData = new FormData(form);
            var id = $("#holiday_id").val();
            formData.append("id", id);
            loader();
            $.ajax({
                type: "POST",
                url: "holiday/holiday_action",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (response) {
                    var responseObject = JSON.parse(response);
                    var responseObject = JSON.parse(response);
                    var msg = responseObject.message;
                    var success = responseObject.success;

                    if (parseInt(success) === 1) {
                        toaster("success", msg);
                        setTimeout(function () {
                            hide_loader()
                            myModal.hide();
                            table.destroy();
                            var year = {year:$("#year_drop_down").val()}; 
                            makeTable(year);
                        }, 2000);
                    } else {
                        hide_loader()
                        toaster("fails", msg);
                    }
                },
                error: function (error) {
                    // console.error("Error:", error);
                },
            });
        },
    });
    var year = {year:$("#year_drop_down").val()};
    makeTable(year);
    
    // $(".submit-holiday").on("click", function () {
    //     var holiday_name = $("#holiday_name").val();
    //     var holiday_date = $("#holiday_date").val();

    //     if (holiday_name == "") {
    //         toaster("warning", "Please Enter Holiday Title.");
    //     } else if (holiday_date == "") {
    //         toaster("warning", "Please select Holiday Date.");
    //     } else if (holiday_name != "" && holiday_date != "") {
    //         var id = $(".holiday_id").val();
    //         // alert(id)
    //         loader();
    //         var formData = { holiday_name: holiday_name, holiday_date: holiday_date, id: id };
    //         console.log(formData);
    //         $.ajax({
    //             type: "POST",
    //             url: "holiday/holiday_action",
    //             data: formData,
    //             success: function (response) {
    //                 var responseObject = JSON.parse(response);
    //                 var msg = responseObject.message;
    //                 console.log(msg);
    //                 var success = responseObject.success;

    //                 if (parseInt(success) === 1) {
    //                     toaster("success", msg);
    //                     setTimeout(function () {
    //                         hide_loader()
    //                         location.reload(true);
    //                     }, 2000);
    //                 } else {
    //                     toaster("fails", msg);
    //                 }
    //             },
    //             error: function (error) {
    //                 // Handle error if needed
    //             },
    //         });
    //     } else {
    //         toaster("warning", "Please select leave dates.");
    //     }
    // });

    // filter
    $("#year_drop_down").on("change",function(){
        var year = $(this).val();
        year = {year:year};
        table.destroy(); 
        makeTable(year)
    })
});

function updateDisabledDates(newDisabledDates,element) {

    element.datepicker("option", "beforeShowDay", function(date) {
        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
        return [newDisabledDates.indexOf(string) == -1];
    });
}
function makeTable(data) {
  loader()
    var data = data;
    table = new DataTable("#holiday-management-table", {
      dom: 'Bfrtilp',
      buttons: [
            {     
              extend: 'csv',
                text: '<i class="ti ti-file-type-csv"></i>',
                init: function(api, node, config) {
                $(node).attr('title', 'Download CSV');
                },
                customize: function (csv) {
                        var lines = csv.split('\n');
                        var modifiedLines = lines.map(function(line) {
                            var values = line.split(',');
                            values.splice(0, 1);
                            values.splice(7, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename : 'leave_request'
                },
            
            {
                extend: 'pdf',
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function(api, node, config) {
                    $(node).attr('title', 'Download Pdf');
                },
                filename: 'leave_request',
                customize: function (doc) {
                  doc.pageMargins = [15, 15, 15, 15];
                  doc.content[0].text = 'Leave Request';
                  doc.content[0].color = '#5d87ff';
                    for (var i = 1; i < doc.content[1].table.body.length; i++) {
                        // Change the value of the first field in each row to "New Value"
                        var cellElement = $('#example').DataTable().cell(i-1, 0).node();
                        var image = $(cellElement).find("img").attr("src");
                        doc.content[1].table.body[i][0].text = image;
                    }
                    doc.content[1].table.widths = ['15%', '19%', '13%', '13%','15%', '15%', '10%'];
                    doc.content[1].table.body[0].forEach(function(cell) {
                        cell.fillColor = '#5d87ff';
                    });
                    doc.content[1].table.body.forEach(function(row, index) {
                        row.splice(8, 1);
                        row.splice(0, 1);
                        row.forEach(function(cell) {
                            // Set alignment for each cell
                            cell.alignment = 'center'; // Change to 'left' or 'right' as needed
                        });
                        
                    });
                }
            }
        ],
        orderCellsTop: true,
        fixedHeader: true,
        lengthMenu: page_length_arr,
        // "sDom":is_top_searching_enable,
        columns: column_details,
        processing: false,
        serverSide: is_serverSide,
        sordering: true,
        searching: is_searching_enable,
        ordering: is_ordering,
        bSort: true,
        orderMulti: true,
        pagingType: "full_numbers",
        scrollCollapse: true,
        scrollX: true,
        scrollY: true,
        paging: is_paging_enable,
        fixedHeader: false,
        info: true,
        autoWidth: true,
        lengthChange: true,
        
        ajax: {
            data: {'search':data},    
            url: "holiday/holiday_management_data",
            type: "POST",
        },
        "columnDefs": [
            { "sortable": false, "targets": 2 },
          ],
        order: [[1, 'asc']],
        scroller: {
            loadingIndicator: true,
        },
        "drawCallback": function( settings, json ) {
            if(settings.jqXHR.responseJSON.holiday_dates.length > 0){
                holiday_dates =  settings.jqXHR.responseJSON.holiday_dates;
            }
            setTimeout(function(){
                hide_loader();
            },300)
            
        },
        language: {
            
            emptyTable: no_data_message,
            paginate: {
                first: "<<",
                last: ">>",
                next: ">",
                previous: "<",
            },
        },
    });
$('.dataTables_length').find('label').contents().filter(function() {
        return this.nodeType === 3; // Filter out text nodes
    }).remove();
}
