var table = '';
$(document).ready(function () {
    // if(is_searching_enable == true){
    //     $('#data_table thead tr')
    //     .clone(true)
    //     .addClass('filters')
    //     .appendTo('#data_table thead');
    // }
    $(".la-power-off").on("click",function(){
        
        let text = "Are you want to sure logout?";
        if (confirm(text) == true) {
          toastr.success("Logout successful. You have been logged out.");
          setTimeout(function () {
            window.location.href = 'user/log_out';
          }, 3000);
        }
        
    })

    makeTable('');
});
function makeTable(data) {
    var data = data;
    console.log("ok")
    table = new DataTable("#example", {
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


        ajax: {
            data: {'search':data},    
            url: "home/get_listing_data",
            type: "POST",
        },

        scroller: {
            loadingIndicator: true,
        },
        // "drawCallback": function( settings, json ) {
        //     setHeigt();
        // },
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
}

