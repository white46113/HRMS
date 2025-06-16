<div class="main-middle-container">
  <div class="sub-header att-sub-header">
		<div class="sub-header-left pull-left">
			<h3>Announcement</h3>
		</div>
    {if    $role == "admin"}
		<div class="sub-header-right pull-right">
			<div class="timesheet-summary">
				<div class="timesheet-summary-lst">
					<!-- <button type="button" class="btn btn-primary add-leave">
						<i class="ti ti-plus"></i>
						<span>Add announcement</span>
					</button> -->
          <a href="announcement.html" class="btn btn-primary add-leave add-action">
						<i class="ti ti-plus"></i>
						<span>Add Announcement</span>
					</a>
				</div>
			</div>
		</div>
    {/if}

	</div>
  <div class="inner-container mt-2">
    <div class="timesheet-container">
      <div class="row p-2 ">
        {if count($announcement) > 0}
        {foreach $announcement as $announcement_index => $announcement_row}
        {if !empty($announcement_row)}
        <div class="col-4">
          <div class=" shadow-sm p-3 mb-2 bg-body rounded announcement_row">
            <div class="title">
              <p><b>{$announcement_row.title}</b><span class="float-end ext-end">{$announcement_row.announcement_date|date_format:"%d %B %Y"}</span> </p>
            </div>
            <div class="action">
              {if isset($announcement_row.action)}
              <span>{$announcement_row.action}</span>
              {/if}

            </div>
          </div>

        </div>
        {/if}
        {/foreach}

        {else}
        <div class="no-data no-data-found-block">
        <div class="d-flex justify-content-center">
          <img alt="" src="{{$base_url}}public/assets/images/images/no_data_found_new.png" height="150" width="150" class="mt-5" />
        </div>
          <p class="mb-4 no-data-found-message text-center">No announcement data found!</p>
        </div>
        {/if}
      </div>
    </div>
  </div>
</div>
</div>
<script type="text/javascript" >
  var type = "listing";
</script>
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/leave.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/announcement.js"></script>
{include file="footer.tpl" }
