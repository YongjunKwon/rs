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
                  <span style='color: black;'>
                      ${loginUser.nick_nm}                    
                  </span>
                  <c:if test="${!empty loginUser.nick_nm}">님</c:if>
                  <span style='color: salmon;'>♥ </span>
                  <span style='color: black;'>Welcome</span>
                  <span style='color: salmon;'>♥</span>
                  <small style='color: salmon;'>♥</small>
                </h1>
                <!--       <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol> -->
              </section>

              <!-- Main content -->
              <section class="content">
                <div class="grid js-masonry" id="js-masonry">
                  <img class="grid-item" src="https://i.imgur.com/laIuV0D.jpg">
                  <img class="grid-item" src="https://i.imgur.com/777dcVU.jpg">
                  <img class="grid-item" src="https://i.imgur.com/ZPPFND3.jpg">
                  <img class="grid-item" src="https://i.imgur.com/EpYbuG7.jpg">
                  <img class="grid-item" src="https://i.imgur.com/kXUHDn5.jpg">
                  <img class="grid-item" src="https://i.imgur.com/Qmz61wo.jpg">
                  <img class="grid-item" src="https://i.imgur.com/aPia86B.jpg">
                  <img class="grid-item" src="https://i.imgur.com/iQRKg2a.jpg">
                  <img class="grid-item" src="https://i.imgur.com/XREWwIc.jpg">
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

    <script type="text/javascript">
      jQuery(function($) {

        var $container = $('#js-masonry');
        
        $container.imagesLoaded(function() {
          $container.masonry({
            itemSelector: '.grid-item',
            columnWidth: 200,
            gutter: 5
          });
        });

      });
    </script>

  </html>