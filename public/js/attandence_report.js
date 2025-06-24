var table = '';
var file_name = "part_stocks";
var pdf_title = "Supplier Parts (Item) Stock";
var filter_id = '';
// var myModal = new bootstrap.Modal(document.getElementById('child_part_update'))
const page = {
    init: function(){
        this.dataTable();
        this.filter();
        this.initDateRangePicker();
        this.initSelect2()
    },
    dataTable: function(){
        var data = this.serachParams();
        table = new DataTable("#attandence_report", {
        dom: 'Bfrtilp',
        buttons: [
        {     
            extend: 'csv',
            text: '<i class="ti ti-file-type-csv"></i>',
            titleAttr: 'Download CSV',
            filename: 'attendance_report',
            exportOptions: {
                columns: [0, 1, 2, 3] // Only export visible columns
            },
            customize: function (csv) {
                // Remove header if needed
                return csv.replace(/^"Employee Name"/, 'Name');
            }
        },
        {
            extend: 'pdf',
            text: '<i class="ti ti-file-type-pdf"></i>',
            titleAttr: 'Download PDF',
            filename: 'attendance_report',
            title: 'Employee Attendance Report',
            exportOptions: {
                columns: [0, 1, 2, 3] // Only export visible columns
            },
            customize: function (doc) {
                doc.pageMargins = [15, 15, 15, 15];
                doc.content[0].text = 'Employee Attendance Report';
                doc.content[0].alignment = 'center';
                doc.content[0].color = '#5d87ff';
                
                // Style header row
                doc.content[1].table.body[0].forEach(function(cell) {
                    cell.fillColor = '#5d87ff';
                    cell.color = '#ffffff';
                    cell.alignment = 'center';
                });
                
                // Center-align all cells
                doc.content[1].table.body.forEach(function(row) {
                    row.forEach(function(cell) {
                        cell.alignment = 'center';
                    });
                });
                
                // Adjust column widths if needed
                doc.content[1].table.widths = ['*', '*', '*', '*'];
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
            url: "reports/attendenceReport",
            type: "POST",
        },
        "columnDefs": [
		    { "sortable": true, "targets": 0 },
		  ],
		  order: [[1, 'asc']],


        scroller: {
            loadingIndicator: true,
        },
        "drawCallback": function( settings, json ) {
          var data = settings.jqXHR.responseJSON.data;
          var html = "<div class='container grid-block-container'><div class='row w-100'>";
          for (var i = 0; i < data.length; i++) {
            var action_html = "";
            if(data[i]['action'] != "--"){
                action_html = '<a hijacked="yes" href="javascript:void(0)" data-id="'+data[i]['employee_id']+'" context="" title="Login As" class="btn view-btn  btn  la-calendar">Week Off</a>';
                action_html = data[i]['other_Action'];
            }
            
             html += '<div class="col-3"><div class="card mb-4"><div class="grid_view_warehouse"><div class="grid_view_warehouse_box h-auto"><div class="grid_view_warehouse_title mb-0"><div class="grid_view_warehouse_title_lt"><div class="grid_view_warehouse_title_icon"><div class="status-radius '+(data[i]['status_val'])?.toLowerCase()+'"></div><img src="'+data[i]['image_url']+'" width="62" height="62" class="list-image ma_profile_image" /></div><div class="grid_view_warehouse_title_cnt p-3"><h5 class="trim-characters"><a href="'+data[i]['employee_url']+'" class="inline-edit-link" title="'+data[i]['name']+'">'+data[i]['name']+'</a></h5><h6 class="trim-characters">'+data[i]['employee_code']+'</h6></div></div></div><div class="grid-types"><div class="request_type"><strong>Group Name</strong>Employee</div><div class="other-actions-list-btn mt-0 mr-2">'+action_html+'</div></div><div class="usage_type_box"><div class="label_text" ><span>User Email</span><label>'+data[i]['email']+'</label></div><div class="label_text" ><span>Department</span><label>'+data[i]['department']+'</label></div><div class="label_text" ><span>Designation</span><label>'+data[i]['designation']+'</label></div><div class="label_text"><span>Joining Date</span><label>'+data[i]['joining_date']+'</label></div></div></div></div></div></div>';
          }
          $(".dropdown-menu li").removeClass("active");
          html += '</div></div>';
          $("#example_wrapper .grid-block").remove();
          $("#example_wrapper .dataTables_scroll").after("<div class='grid-block' style='display:none'>"+html+"</div>")
         
            $(".dropdown-menu li.table").addClass("active");
            $("#example_wrapper .dataTables_scroll").show()
            $(".grid-block").hide()
        
          setTimeout(function(){
            hide_loader()
          },1000)
         
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
        $('#serarch-filter-input').on('keyup', function() {
            table.search(this.value).draw();
        });
        table.on('init.dt', function() {
            $(".dataTables_length select").select2({
                minimumResultsForSearch: Infinity
            });
        });
    },
    
    filter: function(){
        let that = this;
        $('#selectPart').select2();
        $(".search-filter").on("click",function(){
            table.destroy(); 
            that.dataTable();
            $(".close-filter-btn").trigger( "click" )
        })
        $(".reset-filter").on("click",function(){
            that.resetFilter();
        })
    },
    serachParams: function(){
        let employee_id = $("#employee_drop_down").val();
        let date_range = $('#daterange').val();
        const [startDate, endDate] = date_range.split(' - ');
        var params = {employee_id:employee_id,startDate:startDate,endDate:endDate};
        return params;
    },
    resetFilter: function(){
        $("#employee_drop_down").val('').trigger('change');
        table.destroy(); 
        this.dataTable();
        $('#daterange').data('daterangepicker').remove();
        this.initDateRangePicker();
    },
    initDateRangePicker: function(){
        const start = moment().startOf('month'); // e.g., 01-06-2025
        const end = moment().endOf('month');     // e.g., 30-06-2025
        $('#daterange').daterangepicker({
            startDate: start,
            endDate: end,
            opens: 'right',
            locale: {
                format: 'DD-MM-YYYY',
                cancelLabel: 'Clear'
            }
        });
    },
    initSelect2:function(){
        $("#employee_drop_down").select2({
        placeholder: "Please select Employee",
        allowClear: true,
    });
    }
}

$( document ).ready(function() {
    page.init();
    
});
