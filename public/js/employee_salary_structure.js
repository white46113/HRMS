var table = '';
$(document).ready(function(){
    employee_salary_structure.init();
    
})

var employee_salary_structure = {
	init : function(){
		this.iniateDataTable();
		this.initiatePlagin();
		let that = this;
		$(document).off('change','.default-check');
        $(document).on('change','.default-check',function(){
            if($(this).is(":checked")){
                let id = $(this).attr('id');
                $(`.default-check:not(#${id})`).prop('checked',false);
            }
         })
		 $('.set-default-structure').off('click');
		 $('.set-default-structure').on('click',function(e){

			that.setdefaultStructure(e);
		 });

		 // filter
		$(".search-filter").on("click", function () {
	        that.serachParams();
	        $(".close-filter-btn").trigger("click");
		});
	    $(".reset-filter").on("click", function () {
	        that.resetFilter();
	    });
	},
	setdefaultStructure:function(e){
		if($('.default-check:checked').length == 0){
			toaster("fails",'Please select atleast one Default Structure');
			return 0;
		}
		let id = $('.default-check:checked').attr('data-structure-id');
		let params = {};
		params['id'] = id;
		params['e_id'] = $('.default-check:checked').attr('data-employee_id');
		$.ajax({
			type: "POST",
			url: "salary/updateDefaultStructure",
			data: params,
			success: function (response) {
				response = response ?? '';
				if (response == '') return 0;
				var responseObject = JSON.parse(response);
				var msg = responseObject.msg;
				var success = responseObject.success;
				setTimeout(function(){
				hide_loader();
				if (parseInt(success) == 1) {
					// toaster.success(msg);
					toaster("success",msg);
					setTimeout(function () {
					window.location.reload();
					}, 2000);
				} else {
					// toastr.error(msg);
				//   toaster("fails",msg);
				}
				},1000)
			},
		  })
	},
	initiatePlagin: function(){
		$("#year_drop_down").select2();
		$("#year_drop_down").select2();
		$("#year_drop_down").select2();
		$("#year_drop_down").select2();

		//filter
		$("#updated_date_search,#effective_from_search,#effective_to_search,#added_date_search").datepicker({
	        showButtonPanel: true,
	        changeMonth: true,
	        changeYear: true,
	        showOtherMonths: true,
	        selectOtherMonths: true,
	        dateFormat: "yy-mm-dd"
	    });
	},
	iniateDataTable: function(){
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
	                            values.splice(10, 1);
	                            values.splice(0, 1);
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
	                    doc.content[1].table.widths = ["10%", "12%", "14%", "11%", "11%", "10%","11%","10%","11%"];
	                    doc.content[1].table.body[0].forEach(function (cell) {
	                        cell.fillColor = "#5d87ff";
	                    });
	                    // for (var i = 1; i < doc.content[1].table.body.length; i++) {
	                       
	                    //     doc.content[1].table.body[i][2].text = format_number(doc.content[1].table.body[i][2].text);
	                    // }
	                    doc.content[1].table.body.forEach(function (row, index) {
	                        row.splice(10, 1);
	                        row.splice(0, 1);
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
	        columnDefs: [{ sortable: false, targets: 10},{ sortable: false, targets: 0 }],
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
	serachParams: function(){
		var employee_name_search = $("#employee_name_search").val();
	    table.column(1).search(employee_name_search).draw();
	    var reference_number_search = $("#reference_number_search").val();
	    table.column(2).search(reference_number_search).draw();
	    var ctc_search = $("#ctc_search").val();
	    table.column(3).search(ctc_search).draw();
	    var effective_from_search = $("#effective_from_search").val();
	    table.column(4).search(effective_from_search).draw();
	    var effective_to_search = $("#effective_to_search").val();
	    table.column(5).search(effective_to_search).draw();
	    var added_by_search = $("#added_by_search").val();
	    table.column(6).search(added_by_search).draw();
	    var added_date_search = $("#added_date_search").val();
	    table.column(7).search(added_date_search).draw();
	    var updated_by_search = $("#updated_by_search").val();
	    table.column(8).search(updated_by_search).draw();
	    var updated_date = $("#updated_date_search").val();
	    table.column(9).search(updated_date).draw();
	},
	resetFilter: function(){
		$("#employee_name_search").val('');
		$("#reference_number_search").val('');
		$("#ctc_search").val('');
		$("#effective_from_search").val('').trigger("change");
		$("#effective_to_search").val('').trigger("change");
		$("#added_by_search").val('');
		$("#added_date_search").val('').trigger("change");
		$("#updated_by_search").val('');
		$("#updated_date_search").val('').trigger("change");
		this.serachParams();
	}
}