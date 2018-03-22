<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <%@include file="../include/header.jsp"%>

    <body class="hold-transition skin-black sidebar-mini">
      <div class="wrapper">
        <%@include file="../include/top.jsp"%>
          <%@include file="../include/sideMenu.jsp"%>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="min-height: 959.8px;">
              <!-- Content Header (Page header) -->
              <section class="content-header">
                <h1>관리자
                  <small>관리자님</small>
                </h1>
                <ol class="breadcrumb">
                  <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
                  <li><a href="/board/bizBoardList?categorynm="> </a></li>
                </ol>
              </section>
              <!-- Main content -->
              <section class="content">
                <div class="row">
                  <div class="col-xs-12">
                    <div class="box">
                      <div class="box-header">
                        <div class="col-sm-12">
                          <div class="row">
                            <form:form modelAttribute="user" method="get" action="/admin/">
                              <input type="hidden" id="pagination" name="pagination.currentPageNo" value="1">
                              
<%--                               <input type="hidden" id="categorynm" name="categorynm" value="${board.categorynm}"> --%>
<%--                               <input type="hidden" id="category" name="category" value="${board.category}"> --%>

                              <div class="col-sm-4 pull-left">
                                <div class="form-group" id="example1_length">
                                  <form:select path="area_cd" class="form-area" data-placeholder="지역" disabled="false" onchange="javascript:submit()">
                                    <option value="">지역선택</option>
                                    <form:options items="${comboAreaCdList}" itemValue="cd" itemLabel="cd_nm" />
                                  </form:select>
                                </div>
                              </div>
                              <div class="col-sm-8 ">
                                <div class="input-group input-group-sm">
                                  <input type="text" class="search-area" name="biz_nm" value="${user.biz_nm}" id="biz_nm" placeholder="검색내용">
                                  <div class="input-group-btn">
                                    <button type="submit" id="btnSearch" name="btnSearch" class="btn btn-info btn-flat">검색</button>
                                  </div>
                                </div>
                              </div>
                            </form:form>
                          </div>
                        </div>
                      </div>
                      <!-- /.box-header -->
                      <div class="box-body">
	                      <form id="frm" name="frm" method="post" class="form-inline" action="/admin/saveData">
	                        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
	                          <div class="row">
	                            <div class="col-sm-12">
	                              <table id="example1" class="table table-bordered table-hover dataTable board-table" role="grid" aria-describedby="example1_info">
	                                <thead>
	                                  <tr role="row">
	                                    <th class="align-center wd-50 font-12">선택</th>
	                                    <th class="align-center wd-50 font-12">지역</th>
	                                    <th class="align-center wd-50 font-12">상세지역</th>
	                                    <th class="align-center wd-50 font-12">업종구분</th>
	                                    <th class="align-center wd-100 font-12">업체명</th>
	                                    <th class="align-center wd-50 font-12">닉네임</th>
	                                    <th class="align-center wd-100 font-12">아이디</th>
	                                    <th class="align-center wd-50 font-12">휴대전화번호</th>
	                                    <th class="align-center wd-50 font-12">이미지</br>노출기간</th>
	                                    <th class="align-center wd-50 font-12">유효기간</th>
	                                  </tr>
	                                </thead>
	                                <tbody>
	                                  <c:if test="${!empty list}">
	                                    <c:forEach items="${list}" var="list" varStatus="status">
	                                    <input type = "hidden" name ="user_id" value ="${list.user_id}">
	                                      <tr>
	                                        <td class="align-center wd-50 font-11">
	                                        	<input type="checkbox" name= "chkval" id="chk_${status.index}" value="N" style="cursor: pointer;">
	                                        	<input type="hidden" name= "hiddenChkval" value="N">
	                                        </td>
	                                        <td class="align-center wd-50 font-11">${list.area_cd}</td>
	                                        <td class="align-center wd-50 font-11">-</td>
	                                        <td class="align-center wd-50 font-11">${list.category}</td>
	                                        <td class="align-center wd-50 font-11">${list.biz_nm}</td>
	                                        <td class="align-center wd-50 font-11">${list.nick_nm}</td>
	                                        <td class="align-center wd-50 font-11">${list.user_id}</td>
	                                        <td class="align-center wd-50 font-11">${list.mobile}</td>
	                                        <td class="align-center wd-50 font-11">
	                                        	<input name="img_visible_date" type="date" value="${list.img_visible_date}" />
	                                        </td>
	                                        <td class="align-center wd-50 font-11">
	                                        	<input name="expire_date" type="date" value="${list.expire_date}" />
	                                        </td>
	                                      </tr>
	                                    </c:forEach>
	                                  </c:if>
	                                  <c:if test="${empty list}">
	                                    <tr>
	                                      <td colspan="10" class="text-center">게시글이 없습니다.</td>
	                                    </tr>
	                                  </c:if>
	                                </tbody>
	                              </table>
	                            </div>
	                          </div>
	                          <div class="row">
	                            <div class="col-sm-12">
	
	                              <!-- //페이징 -->
	                              <div class="text-center" id="page_area"></div>
	                              <!-- //페이징 -->
	                              <c:if test="${loginUser.roles[0] ne 'ROLE_USER'}">
	                                <div class="pull-right" id="example1_info" role="status" aria-live="polite">
	                                  <button id="btnSave" class="btn bg-olive margin" type="submit">저장</button>
	                                  <!-- <a class="a-color" href="/board/bizBoardWrite?categorynm=${board.categorynm}">글쓰기</a> -->
	                                </div>
	                              </c:if>
	                            </div>
	                          </div>
	                        </div>
	                      </form>
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