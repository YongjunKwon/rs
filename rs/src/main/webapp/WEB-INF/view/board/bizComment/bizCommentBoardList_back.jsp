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
                <h1>${captionTitle}
                  <small>각 지역의 ${captionTitle}를 소개해 드립니다.</small>
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
                        <div class="row">
                          <div class="col-sm-12">
                            <div class="row form_control_h3">
                              
                            </div>
                            <div class="row">
                              <form:form modelAttribute="board" method="post" action="/board/bizBoardList">
                                <input type="hidden" id="pagination" name="pagination.currentPageNo" value="1">
                                <input type="hidden" id="categorynm" name="categorynm" value="${board.categorynm}">
                                <div class="col-sm-4 pull-left">
                                  <div class="form-group" id="example1_length">
                                    <form:select path="area_cd" class="form-control__" data-placeholder="지역" disabled="false">
                                      <option value="">지역선택</option>
                                      <form:options items="${comboAreaCdList}" itemValue="cd" itemLabel="cd_nm" />
                                    </form:select>
                                  </div>
                                </div>
								<div class="col-sm-8 ">                                
									<div class="input-group input-group-sm">
										<input type="text" class="form-control__" name="title" value="${board.title}" id="title" placeholder="검색내용 입력">
										<span class="input-group-btn">
											<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-info btn-flat">검색</button>
										</span>
									</div>
								</div>
                              </form:form>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- /.box-header -->
                      <div class="box-body">
                        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
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
                                      <td class="board_text_color"><a href="/board/bizBoardDetail?seq=${list.seq}&categorynm=${board.categorynm}">${list.title}</a>
                                      </td>
                                      <td>${list.user_id}
                                      </td>
                                      <td>${list.seq}
                                      </td>
                                      <td>${list.cnt}
                                      </td>
                                    </tr>
                                  </c:forEach>
                                </tbody>
                              </table>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-sm-12">

                              <!-- //페이징 -->
                              <div class="text-center" id="page_area"></div>
                              <!-- //페이징 -->

                              <div class="pull-right" id="example1_info" role="status" aria-live="polite">
                                <button class="btn bg-olive margin">
									<a class="a-color" href="/board/bizCommentBoardWrite?categorynm=${board.categorynm}">글쓰기</a>
								</button>								
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
            var $gbPageMap = new Map();
            
            //$('#side_bizComment').addClass('active');

            $gbPageMap.put("TOTPAGE", "${board.pagination.getTotalPageCount()}");
            $gbPageMap.put("CURRPAGE", "${board.pagination.getCurrentPageNo()}");
            $gbPageMap.put("PERPAGE", "${board.pagination.getRecordCountPerPage()}");
            $gbPageMap.put("PAGESIZE", "${board.pagination.getPageSize()}");

            $(document).ready(function() {
                if ($gbPageMap.get("TOTPAGE") != "0") {
                    util.page.set($gbPageMap, 'page_area', 'goPage');
                }
            });

            function goPage(pageNo) {
                $("#pagination").val(pageNo);
                $("#board").submit();
            }
        </script>

  </html>