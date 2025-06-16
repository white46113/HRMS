var table = '';
$(document).ready(function(){
    data_table_obj.init();
});

const data_table_obj = {
    init:function(){
        let that = this;
        that.makeTable();
        $('.search-filter').off('click');
        $('.search-filter').on('click',function(e){
           that.getSearchParams();
           $(".close-filter-btn").trigger( "click" )
        })
        $('.reset-filter').off('click');
        $(".reset-filter").on("click",function(){
            $('.filter-input input').each(function(index,data){
                $(this).val('');
            })
            that.getSearchParams();
        })
        $('#founding_search').datepicker({
          showButtonPanel: true,
          changeMonth: true,
          changeYear: true,
          showOtherMonths: true,
          selectOtherMonths: true,
          dateFormat: "yy-mm-dd"
        })

    },
    makeTable:function(){
      let sort_arr = [{ "sortable": false, "targets": 0 }]
      let  width_arr = ['24%', '24%', '19%', '13%','22%'];
      if(role == 'arom'){
         sort_arr = [{ "sortable": false, "targets": 0 },{ "sortable": false, "targets": 6 }]
           width_arr = ['19%', '19%', '13%', '13%','15%', '15%'];
        
      }
        table =  new DataTable("#company_table", {
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
                                values.splice(5, 1);
                                return values.join(',');
                            });
                            return modifiedLines.join('\n');
                        },
                        filename : 'company_list'
                    },
                  
                  {
                      extend: 'pdf',
                      text: '<i class="ti ti-file-type-pdf"></i>',
                      init: function(api, node, config) {
                          $(node).attr('title', 'Download Pdf');
                      },
                      filename: 'company_list',
                      customize: function (doc) {
                          doc.content[0].text = 'Company List';
                          doc.content[0].color = '#5d87ff';
                        //   doc.content[1].table.widths = width_arr;
                        doc.content[1].table.widths = ['20%', '20%', '20%', '20%','20%'];

                          doc.content[1].table.body[0].forEach(function(cell) {
                              cell.fillColor = '#5d87ff';
                          });
                          doc.content[1].table.body.forEach(function(row, index) {
                              row.splice(0, 1);
                              row.splice(5, 1);
                              row.forEach(function(cell) {
                                  // Set alignment for each cell
                                  cell.alignment = 'center'; // Change to 'left' or 'right' as needed
                              });
                              
                          });
                      }
                  }
              ],
              searching : true,
              fixedHeader: true,
              scrollX: true,
              scrollY: true,
              bScrollCollapse: true,
              "columnDefs": sort_arr,
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
    },
    getSearchParams:function(){
        $('.filter-input input').each(function(index,val){
            let cur_val = $(this).val();
            let cur_col = $(this).attr('data-column');
            table.column(cur_col).search(cur_val).draw();
        })
        
    }
}