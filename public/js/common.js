$( document ).ready(function() {
  // remove server advetisemnt block
  $('body').find('[style="text-align: right;position: fixed;z-index:9999999;bottom: 0;width: auto;right: 1%;cursor: pointer;line-height: 0;display:block !important;"]').remove()
  setTimeout(function(){
    $('body').find('a[href*="https://www.000webhost.com/?utm_source=000webhostapp&utm_campaign=000_logo&utm_medium=website&utm_content=footer_img"]').css("display","none")
  },1000)
  // $(".bottom-container").after('<footer class="footer-box text-center text-lg-start bg-body-tertiary text-muted" "><!-- Copyright --><div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">© 2023, <a href="./home.html">Sharad Institute of Technology College of Engineering</a> Inc. or its affiliates</div><!-- Copyright --></footer>');
  var btn_html = $(".btn-div").html();
  // setHeigt()
  $('.dataTables_length').after(btn_html)
  if(page_name != ''){
    $(".side-nav li#"+page_name).addClass('side-nav__item-active')
  }
  $(document).on('click','.la-bars',function(){

    $(".side-menu").animate({
      width: "toggle"
    });
  });
  $(document).on('click',".filter-icon,.close-filter",function(){
    $(".filter-div").animate({
      width: "toggle"
    });
  });
  $(document).on('click',"#logout_acount",function(){
    $.ajax({
      url: "home/logout",
      data : {},
      type: "POST",
      success: function(response) {
        // task ...
        toastr.success("Log Out successfully.");
        setTimeout(function(){
          window.location.href = "login.html";
        },1000)


      }
    })
  });


})
function setHeigt(){
  var height = $(".main-content").height();
  console.log(height)
  $(".footer-box").css("top","calc(103% - "+height+"px)").addClass("ok")
}

const getCurrenctDate = () => {
  // below funciton is used to get the current date in y -m -d formate.
  const today = new Date();
  const year = today.getFullYear();
  const month = String(today.getMonth() + 1).padStart(2, '0');
  const day = String(today.getDate()).padStart(2, '0');
  const formattedDate = `${year}-${month}-${day}`;
  return formattedDate;
}