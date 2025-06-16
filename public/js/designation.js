var table = "";
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById("designation_popup"));

    $(".add-designation").on("click", function () {
        $(".designation_name").val("");
        $(".designation_id").val("");
        $("#department").val("").prop( "disabled", false ).trigger('chosen:updated');
        $("#grads").val("").prop( "disabled", false ).trigger('chosen:updated');
        $(".error").removeClass(".error");
        $("label.error").remove();
        myModal.show();
    });

    $("#department").chosen({placeholder_text_single:'Select Department'})
    $("#grads").chosen({disable_search: true,placeholder_text_single:'Select Grade'});

    $(document).on("click", ".edit_holiday", function () {
        $(".error").removeClass(".error");
        $("label.error").remove();
        var id = $(this).attr("data-id");
        var department = $(this).attr("data-departmet");
        var department = $(this).attr("data-departmet");
        $("#department").val(department).trigger('chosen:updated');
        var grads = $(this).attr("data-grads");
        $("#grads").val(grads).trigger('chosen:updated');
        var designation = $(this).attr("data-designation");
        $(".designation_name").val(designation);
        $(".designation_id").val(id);
        myModal.show()
        // $.ajax({
        // type: "POST",
        // url: "home/get_designation_details",
        // data: {
        // edit:id,
        // },

        // success: function (response) {
        // var responseObject = JSON.parse(response);
        // var data = responseObject.data;
        // console.log(data);
        // $(".designation_name").val(data.designation_name)
        // $(".designation_id").val(data.id)
        // myModal.show()

        // },
        // error: function (error) {},
        // });
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
                    url: "master/delete_designation",
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
            }else{
            	hide_loader();
            }
        });
    });


    $("#designation_form").validate({
    rules: {
      designation_name: {
        required: true,
      },
      grads: {
        required: true,
      },
      department: {
        required: true
      }
    },
    messages: {
      designation_name: {
        required: "Please enter designation name."

      },
      grads: {
        required: "Please enter grade."

      },
      department: {
        required: 'Please select department.',
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
      var designation_id = $(".designation_id").val();
      formData.append('id',designation_id );
      if(designation_id > 0){
        var department = $("#department").val();
        formData.append('department',department );
        var grads = $("#grads").val();
        formData.append('grads',grads );
      }
      loader()
      $.ajax({
        type: "POST",
        url: "master/designation_action",
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
                window.location.reload();
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

    table = $('#designation-table').DataTable({
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
                            values.splice(3, 1);
                            return values.join(',');
                        });
                        return modifiedLines.join('\n');
                    },
                    filename : 'designation_list'
                },
            {
                extend: 'pdf',
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function(api, node, config) {
                    $(node).attr('title', 'Download Pdf');
                },
                filename: 'designation_list',
                customize: function (doc) {
                    doc.content[0].text = 'Designation List';
                    doc.content[0].color = '#5d87ff';
                    doc.content[1].table.widths = ['33.333333333%', '33.333333333%', '33.333333333%'];
                    doc.content[1].table.body[0].forEach(function(cell) {
                        cell.fillColor = '#5d87ff';
                    });
                    doc.content[1].table.body.forEach(function(row, index) {
                        row.splice(3, 1);
                        row.forEach(function(cell) {
                            // Set alignment for each cell
                            cell.alignment = 'center'; // Change to 'left' or 'right' as needed
                        });
                        
                    });
                    doc.pageSize = 'A4';
                },
                orientation : 'landscape',
                
            }
        ],
        searching : true,
        scrollX: true,
        scrollY: true,
        bScrollCollapse: true,
        "columnDefs": [
        { "sortable": false, "targets": 3 }],
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
        infoCallback: function(settings, start, end, max, total, pre) {
            // Get the count of visible rows after search
            var api = this.api();
            var rowCount = api.rows({search:'applied'}).count();
            if(rowCount == 0){
                $(".dataTables_empty").html(no_data_message)
            }
            // Construct the info string with the actual count
            var info = 'Showing ' + start + ' to ' + end + ' of ' + rowCount + ' entries';

            // Optionally, you can append any other information you want to show
            // For example: 'Showing 1 to 10 of 57 entries'

            return info;
        }

    });

    // Grade filter
    $('#grad_search').on('change', function () {
        var selectedGrade = $(this).val();
        if (selectedGrade) {
            // Use column index 2 for 'Grade'
            table.column(2).search('^' + selectedGrade + '$', true, false).draw();
        } else {
            table.column(2).search('').draw();
        }
    });
    // Designation Name Filter
    $('#designation_name_search').on('keyup change', function () {
        table.column(0).search(this.value).draw();
    });

    // Department Name Filter
    $('#department_name_search').on('change', function () {
        table.column(1).search(this.value).draw();
    });


     $(".dataTables_length")
        .find("label")
        .contents()
        .filter(function () {
            return this.nodeType === 3; // Filter out text nodes
        })
        .remove();
    $("#grad_search,#department_name_search").select2();
    $(".search-filter").on("click", function () {
        serachParams();
        $(".close-filter-btn").trigger("click");
    });
    $(".reset-filter").on("click", function () {
        resetFilter();
    });
    
    
    
});
function serachParams() {
    var designation_name = $("#designation_name_search").val();
    table.column(0).search(designation_name).draw();
    var department_name = $("#department_name_search").val();
    table.column(1).search(department_name).draw();
    var grad_search = $("#grad_search").val();
    table.column(2).search(grad_search).draw();
}
function resetFilter() {
    $("#designation_name_search").val("");
    $("#department_name_search").val("").trigger("change");
    $("#grad_search").val("").trigger("change");
    serachParams();
}
