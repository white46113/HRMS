$(document).ready(function () {
  var myModal = new bootstrap.Modal(document.getElementById("leave_allocation_popup"));
  $(".department_id").chosen()
  // $(".designation_id").chosen()
  $(".add-leave").on("click", function () {
    $(".error").removeClass(".error");
        $("label.error").remove();
    $(".sick_leave").val("");
    $(".paid_leave").val("");
    $(".casual_leave").val("");
    $(".leave_allocation_id").val("");
    $(".department_id").val("").prop( "disabled", false ).trigger('chosen:updated');
    $(".designation_id").val("").prop( "disabled", false ).trigger('chosen:updated');
    myModal.show();
  });

  $("#designation_id").chosen();

  $("#department_id").change(function(){
    var department_id = $(this).val();
    $.ajax({
      type: "POST",
      url: "leave/get_designation",
      data: {
        department_id: department_id,
      },

      success: function (response) {
        var responseObject = JSON.parse(response);
        var designations = responseObject.designation;
        console.log(designations);
        var selectElement = $("#designation_id");
        selectElement.html("");
        selectElement.append('<option value="">Select Designation</option>');
        $.each(designations, function(index, item) {
          selectElement.append('<option value="' + item.id + '">' + item.designation_name + ' (Grade - ' + item.grads + ')</option>');
        });
        $("#designation_id").trigger("chosen:updated")

      },
      error: function (error) {},
    });

  });
  $(document).on("click", ".edit_leave_allocation", function () {
    $(".error").removeClass(".error");
        $("label.error").remove();
    var id = $(this).data("id");
    $.ajax({
      type: "POST",
      url: "leave/get_leave_allocation_details",
      data: {
        edit: id,
      },

      success: function (response) {
        var responseObject = JSON.parse(response);
        var data = responseObject.data;
        
        $(".leave_allocation_id").val(data.id);
        $(".sick_leave").val(data.sick_leave);
        $(".paid_leave").val(data.paid_leave);
        $(".casual_leave").val(data.casual_leave);
        var designation = $("#designation_id");
        designation.html("");
        designation.append('<option value='+data.designation_id+'>'+data.designation_name + ' (Grade - ' + data.grads + ')</option>');
        $(".department_id").val(data.department_id).prop( "disabled", true ).trigger('chosen:updated');
        $(".designation_id").val(data.designation_id).prop( "disabled", true ).trigger('chosen:updated');
        myModal.show();
      },
      error: function (error) {},
    });
  });

  $(document).on("click",".delete_leave_allocation",function () {
    var id = $(this).data("id");
    loader()
    Swal.fire({
      title: "Delete Leave Allocation",
      text: "Are you sure you want to delete this Leave Allocation?",
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
          url: "leave/delete_leave_allocation",
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

  $("#leaveallocationForm").validate({
    rules: {
      department_id: {
        required: true,
      },
      designation_id: {
        required: true,
      },
      sick_leave: {
        required: true,
        min:-1
      },
      paid_leave: {
        required: true,
        min:-1
      },
      casual_leave: {
        required: true,
        min:-1
      }
    },
    messages: {
      department_id: {
        required: "Please select department."

      },
      designation_id: {
        required: "Please select designation."

      },
      sick_leave: {
        required: 'Please enter sick leave.',
        min:'Please enter positive value for sick leave.',
      },
      paid_leave: {
        required: 'Please enter paid leave.',
         min:'Please enter positive value for paid leave.',
      },
      casual_leave: {
        required: 'Please enter casual leave.',
         min:'Please enter positive value for casual leave.',
      }
    },

    errorPlacement: function (error, element) {

        if (element[0]["localName"] == "select") {
                var parents = $(element).parent(".select-box");
                $(parents).find(".chosen-container").after(error);
        }else{
        error.insertAfter(element);
        }
    },
    ignore: ":hidden:not(select)",
    submitHandler: function (form) {
      var formData = new FormData(form);
      var id = $(".leave_allocation_id").val();
      formData.append('id',id );
      if(id > 0){
          var department_id = $("#department_id").val();
          var designation_id = $("#designation_id").val();
          formData.append('department_id',department_id );
          formData.append('designation_id',designation_id );
      }
      loader()
      $.ajax({
        type: "POST",
        url: "leave/leave_allocation_action",
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

  // $(".submit-leave-allocation").on("click", function () {
  //   var sick_leave = $("#sick_leave").val();
  //   var paid_leave = $("#paid_leave").val();
  //   var casual_leave = $("#casual_leave").val();
  //   var department_id = $("#department_id").val();

  //   var designation_id = $("#designation_id").val();


  //   if (department_id == "") {
  //     toaster("warning", "Please select department.");
  //   } else if (designation_id == "") {
  //     toaster("warning", "Please select designation.");
  //   }else if (sick_leave == "") {
  //     toaster("warning", "Please enter sick leave.");
  //   } else if (paid_leave == "") {
  //     toaster("warning", "Please enter paid leave.");
  //   }else if (casual_leave == "") {
  //     toaster("warning", "Please enter casual leave.");
  //   } else if (sick_leave != "" && paid_leave != "" && casual_leave != "" && department_id != "" && designation_id != "") {
  //     var id = $(".leave_allocation_id").val();
  //     loader();
  //     var formData = {
  //       sick_leave: sick_leave,
  //       paid_leave: paid_leave,
  //       casual_leave: casual_leave,
  //       department_id:department_id,
  //       designation_id: designation_id,
  //       id: id
  //     };
  //     console.log(formData);
  //     $.ajax({
  //       type: "POST",
  //       url: "leave/leave_allocation_action",
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

  //   }
  // });
  $(document).on("keypress", ".sick_leave,.paid_leave,.casual_leave", function (e) {
    if (String.fromCharCode(e.keyCode).match(/[^0-9]/g)) return false;
  });

  // datatable initialisation
  table = $("#leave-allocation-table").DataTable({
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
                    filename : 'leave_allocation_list'
                },
          
            {
                extend: "pdf",
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download Pdf");
                },
                filename: "leave_allocation_list",
                customize: function (doc) {
                    doc.pageMargins = [15, 15, 15, 15];
                    doc.content[0].text = "Leave Allocation List";
                    doc.content[0].color = "#5d87ff";
                    doc.content[1].table.widths = ["24%", "24%", "13%", "13%", "13%", "13%"];
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
    $("#designation_name_search,#department_name_search").chosen();
    $(".search-filter").on("click", function () {
        serachParams();
        $(".close-filter-btn").trigger("click");
    });
    $(".reset-filter").on("click", function () {
        resetFilter();
    });
});
function serachParams() {
    var department_name_search = $("#department_name_search").val();
    table.column(0).search(department_name_search).draw();
    var designation_name_search = $("#designation_name_search").val();
    table.column(1).search(designation_name_search).draw();
    var sick_leave_search = $("#sick_leave_search").val();
    table.column(2).search(sick_leave_search).draw();
    var paid_leave_search = $("#paid_leave_search").val();
    table.column(3).search(paid_leave_search).draw();
    var casual_leave_search = $("#casual_leave_search").val();
    table.column(4).search(casual_leave_search).draw();
}
function resetFilter() {
    $("#department_name_search").val("").trigger("chosen:updated");
    $("#designation_name_search").val("").trigger("chosen:updated");
    $("#sick_leave_search").val("");
    $("#paid_leave_search").val("");
    $("#casual_leave_search").val("");
    serachParams();
}

