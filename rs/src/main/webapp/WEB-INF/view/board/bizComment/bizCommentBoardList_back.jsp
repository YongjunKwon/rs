<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <%@include file="../../include/header.jsp"%>

    <body class="hold-transition skin-black sidebar-mini">
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
                    <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li><a href="/board/bizBoardList?categorynm=${board.categorynm}">${captionTitle}</a></li>
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
                              <form:form modelAttribute="board" method="post" action="/board/bizBoardList">
                                <input type="hidden" id="pagination" name="pagination.currentPageNo" value="1">
                                <input type="hidden" id="categorynm" name="categorynm" value="${board.categorynm}">
                                <input type="hidden" id="category" name="category" value="${board.category}">
                                <div class="col-sm-6 pull-left search-group">
                                  <div class="form-group" id="example1_length">
                                    <form:select path="area_cd" class="form-area" data-placeholder="지역" disabled="false" onchange="javascript:submit()">
                                      <option value="">지역선택</option>
                                      <form:options items="${comboAreaCdList}" itemValue="cd" itemLabel="cd_nm" />
                                    </form:select>
                                  </div>
                                </div>       
                                <!-- <div class="col-sm-4"></div> -->
                                <div class="col-sm-6 pull-right">
                                  <div class="form-group pull-right">                                  
                                    <button type="submit" id="btnSearch" name="btnSearch" class="btn btn-info btn-flat pull-right">검색</button>                                  
                                    <input type="text" class="search-area pull-right" name="title" value="${board.title}" id="title" placeholder="검색내용" />
                                  </div>
                                </div>
                              </form:form>
                            </div>
                          </div>
                        </div>
                      
                      <!-- /.box-header -->
                      <div class="box-body">
                        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                          <div class="row">
                            <div class="col-sm-12">
                                <table id="example1" class="table table-bordered table-hover dataTable board-table" role="grid" aria-describedby="example1_info">
                                    <thead>
                                      <tr role="row">
                                        <th class="align-center wd-50">번호</th>
                                        <th class="align-center wd-50 font-12">사진</th>
                                        <th class="align-left"> 제목</th>
                                        <th class="align-center wd-50 font-12">닉네임</th>
                                        <th class="align-center wd-50 font-12">조회수</th>
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
                                <button class="btn btn-primary margin">
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