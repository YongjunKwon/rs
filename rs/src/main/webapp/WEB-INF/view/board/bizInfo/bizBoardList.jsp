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
                          <h3 class="form_control_h3">****회원가 적용 받으시려면 밤길보고 전화했다고 말씀해주세요!****</h3>
                          <div class="row">
                            <form:form modelAttribute="board" method="get" action="/board/bizBoardList?categorynm=${board.categorynm}">
                              <input type="hidden" id="pagination" name="pagination.currentPageNo" value="1">
                              <input type="hidden" id="categorynm" name="categorynm" value="${board.categorynm}">
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
                                  <input type="text" class="form-control__" name="title" value="${board.title}" id="title" placeholder="검색내용 입력">
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
                        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                          <div class="row">
                            <div class="col-sm-12">
                              <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                <thead>
                                  <tr role="row">
                                    <th class="align-center wd-50">번호</th>
                                    <!-- <th class=">사진</th> -->
                                    <th class="align-left"> 제목</th>
                                    <th class="align-center wd-100">닉네임</th>
                                    <th class="align-center wd-100">조회수</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${list}" var="list" varStatus="status">
                                    <tr>
                                      <td align="center">${list.seq}
                                      </td>
                                      <!-- <td><img class="wd-50" alt="" src="${list.img_url}"></td> -->
                                      <td class="board_text_color text-align: center;">
                                        <a href="/board/bizBoardDetail?seq=${list.seq}&categorynm=${board.categorynm}">${list.title}</a>
                                      </td>
                                      <td align="center">${list.nick_nm} </td>
                                      <td align="center">${list.cnt} </td>
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
                                <button id="btnWrite" class="btn bg-olive margin">글쓰기</button>
                                <!-- <a class="a-color" href="/board/bizBoardWrite?categorynm=${board.categorynm}">글쓰기</a> -->
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
      $(document).ready(function() {

        $gbPageMap.put("TOTPAGE", "${board.pagination.getTotalPageCount()}");
        $gbPageMap.put("CURRPAGE", "${board.pagination.getCurrentPageNo()}");
        $gbPageMap.put("PERPAGE", "${board.pagination.getRecordCountPerPage()}");
        $gbPageMap.put("PAGESIZE", "${board.pagination.getPageSize()}");

        if ($gbPageMap.get("TOTPAGE") != "0") {
          util.page.set($gbPageMap, 'page_area', 'goPage');
        }

      });

      function goPage(pageNo) {
        $("#pagination").val(pageNo);
        $("#board").submit();
      }

      $('#btnWrite').click(function() {
        window.location.href = '/board/bizBoardWrite?categorynm=${board.categorynm}';
      })
    </script>

  </html>