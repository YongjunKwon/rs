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
              <h3 class="box-title">Bordered Table ${classActiveSettings}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Task</th>
                  <th>Progress</th>
                  <th style="width: 40px">Label</th>
                </tr>
                <c:forEach items="${list}" var= "list" varStatus="status">
	
				<tr>
				<td align="center">
				   ${status.count}
				</td>
				<td>
				${list.name}
				</td>
				</tr>
				</c:forEach>                
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
            	
	            <button type="button" class="btn btn-default btn-xs pull-right">
				  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 글쓰기
				</button>
				<!-- <span class="glyphicon glyphicon-pencil pull-right" aria-hidden="true"></span> -->
              <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
              </div>
            </div>
          <!-- /.box -->
		</div></div>
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
  }); 
</script>

</html>


