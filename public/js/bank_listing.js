var table = '';
var grid_type = "Table";
$(document).ready(function () {
    var myModal = new bootstrap.Modal(document.getElementById('week_off_add'))
    var activeModal = new bootstrap.Modal(document.getElementById('active_block'))

    makeTable('');

     // filter 
    $("#account_status_down,#entity_drop_down,#account_type_drop_down").select2({
          placeholder: "Select Status",
          allowClear: true,
          minimumResultsForSearch: Infinity,
          autocomplete:'off'
    });

    $(".search-filter").on("click",function(){
        var data = serachParams();
        table.destroy(); 
        makeTable();
        $(".close-filter-btn").trigger( "click" )
    })
    $(".reset-filter").on("click",function(){
        resetFilter()
    })

});


function makeTable(data) {
    var data = serachParams();
    loader();
    table = new DataTable("#example", {
      dom: 'Bfrtilp',
      buttons: [
            {
              extend: "csv",
                text: '<i class="ti ti-file-type-csv"></i>',
                init: function (api, node, config) {
                    $(node).attr("title", "Download CSV");
                },
                    filename : 'bank_list'
                
            },
            {
                extend: 'pdf',
                text: '<i class="ti ti-file-type-pdf"></i>',
                init: function(api, node, config) {
                    $(node).attr('title', 'Download Pdf');
                },
                filename: 'bank_list',
                customize: function (doc) {
                  doc.content[0].text = 'Bank List';
                  doc.content[0].color = '#5d87ff';
                    // doc.content[1].table.widths = ['15%', '19%', '13%', '13%','15%', '15%', '10%'];
                    doc.content[1].table.body[0].forEach(function(cell) {
                        cell.fillColor = '#5d87ff';
                    });

                }
            }
        ],
        orderCellsTop: true,
        fixedHeader: true,
        lengthMenu: page_length_arr,
        // "sDom":is_top_searching_enable,
        columns: column_details,
        processing: true,
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
        "scrollY": "68vh",
        ajax: {
            data: {'search':data},
            url: "bank/get_bank_listing_data",
            type: "POST",
        },
        "columnDefs": [ ],
order: [[1, 'asc']],


        scroller: {
            loadingIndicator: true,
        },
        "drawCallback": function( settings, json ) {
          hide_loader()
            // setHeigt();
        },
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
    });

    $('.dataTables_length').find('label').contents().filter(function() {
        return this.nodeType === 3; // Filter out text nodes
    }).remove();
}

function serachParams(){
  var status = $("#account_status_down").val();
  var entity_type = $("#entity_drop_down").val();
  var bank_name = $("#bank_name_search").val();
  var branch_name = $("#branch_name_search").val();
  var ifsc_code = $("#ifsc_code_search").val();
  var account_type = $("#account_type_drop_down").val();
  var account_number = $("#account_number_search").val();
  var account_holder = $("#account_holder_search").val();
  var emp_com_code = $("#emp_com_code_search").val();
  var params = {emp_com_code:emp_com_code,status:status,entity_type:entity_type,bank_name:bank_name,branch_name:branch_name,ifsc_code:ifsc_code,account_type:account_type,account_number:account_number,account_holder:account_holder};
  return params;
}
function resetFilter(){
  $("#account_status_down").val('').trigger('change');
  $("#entity_drop_down").val('').trigger('change');
  $("#account_type_drop_down").val('').trigger('change');
  $("#bank_name_search").val('');
  $("#branch_name_search").val('');
  $("#ifsc_code_search").val('');
  $("#account_number_search").val('');
  $("#account_holder_search").val('');
  $("#emp_com_code_search").val('');
  table.destroy(); 
        makeTable()
  
}