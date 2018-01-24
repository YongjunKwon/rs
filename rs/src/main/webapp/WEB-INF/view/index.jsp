<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="include/header.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="include/top.jsp"%>
<%@include file="include/sideMenu.jsp"%>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Welcome!!
        <small> 환영합니다. </small>
      </h1>
<!--       <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol> -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->
      <!-- <img src="/images/main.png" /> -->
      <div class="big-box"><h1>Page 1</h1></div>
      <div class="big-box"><h1>Page 2</h1></div>
     
      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<%@include file="include/bottom.jsp"%>
</div>
<!-- ./wrapper -->
</body>

<style>
  .big-box {
    width: 100%;
    background-color: gray;
    height: 100vh;
    border-top: 1px solid black;
  }

  body { 
    margin: 0px;
    padding: 0px;
  } 
</style>

    <script type="text/javascript">
      var page = 2;

      $(window).scroll(function() {
          if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            console.log(++page);
            $("body").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');
            
          }
      });
// $(document).ready(function () {
//       $(document).scroll(function() {
//           var maxHeight = $(document).height();
//           var currentScroll = $(window).scrollTop() + $(window).height();

//           if (maxHeight <= currentScroll + 100) {
//             console.log("1121212");
//             $.ajax({
//               // Append next contents
            
//             });
//           }
//         });
// });
    </script>
</html>


