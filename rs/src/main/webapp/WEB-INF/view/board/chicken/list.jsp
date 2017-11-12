<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../../include/header.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../../include/top.jsp"%>
<%@include file="../../include/sideMenu.jsp"%>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        치킨집
        <small> 리스트 </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">치킨집</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">${classActiveSettings}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>제목</th>
                </tr>
                <c:forEach items="${list}" var= "list" varStatus="status">
	
				<tr>
				<td align="center">
				   ${status.count}
				</td>
				<td>
				<a href="/board/chicken/sample_detail_index">${list.title}</a>
				</td>
				</tr>
				</c:forEach>                
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
	            <button type="button" id="btn_write" name="btn_write" class="btn btn-default btn-xs pull-right">
	              <a href="/board/chicken/sample_w_index">
				  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 글쓰기</a>
				</button>
				<!-- <span class="glyphicon glyphicon-pencil pull-right" aria-hidden="true"></span> -->
				<div class="text-center">
	              <ul class="pagination pagination-sm no-margin">
	                <li><a href="#">&laquo;</a></li>
	                <li><a href="#">1</a></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li><a href="#">&raquo;</a></li>
	              </ul>
              	</div>
            </div>
         </div>
          <!-- /.box -->
		</div>
	  </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<%@include file="../../include/bottom.jsp"%>
</div>
<!-- ./wrapper -->
</body>

<script type="text/javascript"> 
  $(document).ready(function() {
	  $("#btn_write").on("click",function(){
		  console.log("---- 글쓰기 클릭 @@@@@ ");
		  
	  });
  }); 
</script>

</html>


