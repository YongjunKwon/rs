<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <%@include file="include/header.jsp"%>

    <body class="hold-transition skin-black sidebar-mini">
      <div class="wrapper">
        <%@include file="include/top.jsp"%>
          <%@include file="include/sideMenu.jsp"%>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
              <!-- Content Header (Page header) -->
              <section class="content-header">
                <h1>
                  <span style='color: salmon;'>${loginUser.nick_nm}</span>♥ Welcome ♥
                  <small>♥ ♥</small>
                </h1>
                <!--       <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol> -->
              </section>

              <!-- Main content -->
              <section class="content">

                <div class="grid js-masonry" data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 200, "gutter": 5 }'>
                  <img class="grid-item" src="https://i.imgur.com/laIuV0D.jpg">
                  <img class="grid-item" src="https://i.imgur.com/777dcVU.jpg">
                  <img class="grid-item" src="https://i.imgur.com/ZPPFND3.jpg">
                  <img class="grid-item" src="https://i.imgur.com/EpYbuG7.jpg">
                  <img class="grid-item" src="https://i.imgur.com/kXUHDn5.jpg">
                  <img class="grid-item" src="https://i.imgur.com/Qmz61wo.jpg">
                  <img class="grid-item" src="https://i.imgur.com/aPia86B.jpg">
                  <img class="grid-item" src="https://i.imgur.com/iQRKg2a.jpg">
                  <img class="grid-item" src="https://i.imgur.com/XREWwIc.jpg">
                  <img class="grid-item" src="https://i.imgur.com/MV9SvaP.jpg">
                  <img class="grid-item" src="https://i.imgur.com/qjQ9XWl.jpg">
                  <img class="grid-item" src="https://i.imgur.com/ZJ088Tk.jpg">
                  <img class="grid-item" src="https://i.imgur.com/SuZLV2U.jpg">
                  <img class="grid-item" src="https://i.imgur.com/71H2B0k.jpg">
                  <img class="grid-item" src="https://i.imgur.com/vxOA4hg.jpg">
                  <img class="grid-item" src="https://i.imgur.com/8kLXqdP.jpg">
                </div>
                <!-- /.grid -->
                <!-- /.container -->

              </section>
              <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <%@include file="include/bottom.jsp"%>
      </div>
      <!-- ./wrapper -->
    </body>

    <style>
      .grid-item {
        margin-bottom: 10px;
        border-radius: 4px;
        border: 1px;
      }

      /* .grid-item--width2 { width: 400px; }  */
    </style>

    <script type="text/javascript">
      $(document).ready(function() {});
    </script>

  </html>