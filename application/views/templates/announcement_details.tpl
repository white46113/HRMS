<div class="main-middle-container">
  <div class="sub-header att-sub-header">
		<div class="sub-header-left pull-left">
			<h3>Announcement</h3>
		</div>


	</div>
  <div class="container">
      <div class="row p-2 shadow-sm p-3 mb-2 bg-body rounded">
        <h5><span class="float-start">{$announcement.title}</span>
        <span class="float-end">{$announcement.announcement_date|date_format:"%d %B %Y"}</span></h5>
        <hr>
        <div class="content">
          {$announcement.content}
        </div>
  </div>
  </div>
</div>
</div>
<link rel="stylesheet" href="public/css/attendance_sheet.css" />
<link rel="stylesheet" href="public/css/leave.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- <script src="public/js/announcement.js"></script> -->
{include file="footer.tpl" }
