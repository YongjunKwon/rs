<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <%@include file="../include/header.jsp"%>

    <body class="hold-transition skin-black sidebar-mini">
      <div class="wrapper">
        <%@include file="../include/top.jsp"%>
          <%@include file="../include/adminSideMenu.jsp"%>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="min-height: 959.8px;">
              <!-- Content Header (Page header) -->
              <section class="content-header">
                <h1>관리자 페이지
                </h1>
                <ol class="breadcrumb">
                  <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
                  <li><a href="/board/bizBoardList?categorynm="> </a></li>
                </ol>
              </section>
              <!-- Main content -->
              <section class="content">                
                <!-- /.row -->
              </section>
              <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <%@include file="../include/bottom.jsp"%>
      </div>
      <!-- ./wrapper -->
    </body>

    <script type="text/javascript">
    
      $(document).ready(function() {
    	  
          $("#frm").submit(function(e) {
        	  var chkYnCount = 0;

              $("#frm").find("input[type='checkbox']").each(function() {
                  if ($(this).val() == "Y") {
                	  chkYnCount++; 
                  }
        	  });
              
              if(chkYnCount < 1) {
                  alert("선택 정보가 없습니다.");
                  e.preventDefault();
                  return;
              }
            });

          	// event table check
    	    $("#frm :checkbox").click(function() {
    	        if($(this).is(":checked")) {
    	        	console.log("checkded~~~~");
    	            $(this).next("input").val("Y");
    	        	$(this).val("Y");
    	        } else {
    	        	console.log("un un un checkded~~~~");
    	        	$(this).next("input").val("N");
    	        	$(this).val("N");
    	        }
    	    });

      });

    </script>

  </html>