<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../../include/header.jsp"%>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../../include/top.jsp"%>
<%@include file="../../include/sideMenu.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 959.8px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>오피스텔
        	<small>각 지역의 오피를 소개해 드립니다.${classActiveSettings}</small>
      	</h1>
      	<ol class="breadcrumb">
        	<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        	<li><a href="#">Tables</a></li>
        	<li class="active">Data tables</li>
      	</ol>
	</section>
    <!-- Main content -->
    <section class="content">
		<div class="row">
        	<div class="col-xs-12">          
          		<div class="box">
            		<div class="box-header">
              			<h3 class="box-title">****회원가 적용 받으시려면 밤길보고 전화했다고 말씀해주세요!****</h3>
            		</div>
            		<!-- /.box-header -->
            		<div class="box-body">
              			<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              				<div class="row">
              					<form:form modelAttribute="commCodeSearch" method="post" action="/board/sample/sampleList">
									<input type="hidden" name="bo_table" value="gunma">
									<input type="hidden" name="sca" value="">
		              				<div class="col-sm-4">
		              					<div class="dataTables_length" id="example1_length">
		              						<label>지역
		              							<form:select path="area_cd" class="form-control input-sm" data-placeholder="지역" disabled="false">
													<option value="">선택</option>
													<form:options items="${comboAreaCdList}" itemValue="cd" itemLabel="cd_nm" />
												</form:select>
		              							
											</label>
										</div>
									</div>
									<div class="col-sm-6">
										<div id="example1_filter" class="dataTables_filter">
											<input type="text" name="stx" value="" id="stx" class="form-control input-sm" maxlength="20" placeholder="내용">
		              					</div>
		              				</div>
		              				<div class="col-sm-2">
										<div id="example1_filter" class="dataTables_button">
											<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-red btn-sm btn-block"><i class="fa fa-search"></i> 검색</button>
		              					</div>
		              				</div>
		              			</form:form>
			              	</div>
              				<div class="row">
              					<div class="col-sm-12">
              						<table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                						<thead>
                						<tr role="row">
	                						<th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">번호
	                						</th>
	                						<th class="board_header-text">사진
	                						</th>
	                						<th class="board_header-text">제목
	                						</th>
	                						<th class="board_header-text">글쓴이
	                						</th>
	                						<th class="board_header-text">날짜
	                						</th>
	                						<th class="board_header-text">조회수
	                						</th>
                						</tr>
                						</thead>
										<tbody>
										<c:forEach items="${list}" var="list" varStatus="status">
											<tr>
												<td align="center">${list.seq}													
												</td>
												<td><img class="wd-50" alt="" src="${list.img_url}"> 
												</td>
												<td class="board_text_color"><a href="/board/sample/sampleDetail?seq=${list.seq}">${list.title}</a>
												</td>
												<td>${list.user_id}
												</td>
												<td>${list.seq}
												</td>
												<td>${list.recomm_cnt}
												</td>
											</tr>
										</c:forEach>
										</tbody>
              						</table>
              					</div>
              				</div>
              				<div class="row">
              					<div class="col-sm-5">
              						<div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries
              						</div>
              					</div>
              					<div class="col-sm-7">
		              				<div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
			              				<ul class="pagination">
			              					<li class="paginate_button previous disabled" id="example1_previous">
				              					<a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a>
			              					</li>
			              					<li class="paginate_button active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a>
			              					</li>
			              					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0">2</a>
			              					</li>
			              					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0">3</a>
			              					</li>
			              					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="4" tabindex="0">4</a>
			              					</li>
			              					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="5" tabindex="0">5</a>
			              					</li>
			              					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="6" tabindex="0">6</a>
			              					</li>
			              					<li class="paginate_button next" id="example1_next">
			              						<a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a>
			              					</li>
			              				</ul>
			              			</div>
		              			</div>
              				</div>
              			</div>
		            </div>
		            <!-- /.box-body -->
				</div>
		          <!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
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

		$("#area_cd").val("${sampleBoard.area_cd}");
		console.log($("#area_cd").val());

	  $("#btn_write").on("click",function(){
		  console.log("---- 글쓰기 클릭 @@@@@ ");
		  
	  });
  }); 
</script>

</html>