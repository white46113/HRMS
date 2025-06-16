<div class="main-middle-container">
  <div class="sub-header att-sub-header">
    <div class="sub-header-left pull-left">
      <h3>Add Announcement</h3>
    </div>
  </div>
  <div class="container shadow-sm p-3 mb-5 bg-body rounded">

    <form action="javascript:void(0)" method="POST" id="announcement-form">
      <div class="row p-2">
        <div class="col-6 mb-2">
          <div class="form-group">
            <label for="title">Title <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter Title " value="{$announcement.title}" >
          </div>
        </div>
        <div class="col-6 mb-2">
          <div class="form-group">  
            <label for="announcement_date">Announcement Date <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="announcement_date" name="announcement_date" placeholder="dd-mm-yyyy" value="{$announcement.announcement_date}">
          </div>
        </div>
        <div class="col-12 mt-2">
          <div class="form-group">
            <label for="first_name">Announcement Content <span class="star_required">*</span></label>
            <textarea id="edit_content_block " class="hide">{$announcement.content}</textarea>
          </div>
        </div>

        <div class=" text-center p-2">
          <button type="submit" class="btn btn-primary submit-announcement">Submit</button>
          <input type="hidden" class="form-control announcement_id"  name="announcement_id" id="announcement_id" value="{$announcement.id}" >
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript" >
  var type = "form";
</script>
<style>
  .mce-tinymce,.mce-container-body.mce-flow-layout .mce-branding,.mce-container-body.mce-flow-layout .mce-wordcount,.mce-container-body.mce-flow-layout .mce-first ,#mceu_27-open{
    display:none ;
  }
</style>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=i9e2imv487t0kc60h51kifxcwx9rfyt1885tu8hen370pkf6"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="public/js/announcement.js"></script>
{include file="footer.tpl" }
