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

                            <section class="board-list">
                                <!-- select box 공통코드 구현 -->
                                <div class="list-tsearch">
                                    <form:form modelAttribute="sampleBoard" method="post" action="/board/sample/sampleList">
                                        <input type="hidden" name="bo_table" value="gunma">
                                        <input type="hidden" name="sca" value="">
                                        <input type="hidden" id="pagination" name="pagination.currentPageNo" value="1">
                                        <div class="row row-15">

                                            <div class="col-sm-2 col-xs-5 col-15">
                                                <div class="form-group">
                                                    <label for="sfl" class="sound_only">지역</label>
                                                    <form:select path="area_cd" class="chosen-select" data-placeholder="지역" disabled="false">
                                                        <option value="">선택</option>
                                                        <form:options items="${comboAreaCdList}" itemValue="cd" itemLabel="cd_nm" />
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-xs-7 col-15">
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <label for="stx" class="sound_only">제목</label>
                                                        <input type="text" name="title" value="${sampleBoard.title}" id="title" class="form-control input-sm" maxlength="20" placeholder="제목">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-xs-7 col-15">
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <label for="stx" class="sound_only">내용</label>
                                                        <input type="text" name="stx" value="" id="stx" class="form-control input-sm" maxlength="20" placeholder="내용">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 col-xs-7 col-15">
                                                <div class="form-group">
                                                    <button type="submit" id="btnSearch" name="btnSearch" class="btn btn-red btn-sm btn-block"><i class="fa fa-search"></i> 검색</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>


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
                                                    <c:forEach items="${list}" var="list" varStatus="status">

                                                        <tr>
                                                            <td align="center">
                                                                ${list.seq}
                                                            </td>
                                                            <td>
                                                                <a href="/board/sample/sampleDetail?seq=${list.seq}">${list.title}</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                            <!-- /.box-body -->
                                            <div class="box-footer clearfix">
                                                <a href="/board/sample/write?tname=sample">
                                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 글쓰기</a>
                                                </button>
                                                <!-- //페이징 -->
                                                <div class="text-center" id="page_area"></div>
                                                <!-- //페이징 -->
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
            var $gbPageMap = new Map();
            $(document).ready(function() {
                //console.log("${sampleBoard.pagination.getFirstPageNoOnPageList()}");
                //console.log("${sampleBoard.pagination.getLastPageNo()}");
                //console.log("${sampleBoard.pagination.getTotalPageCount()}"); // 페이지수

                $gbPageMap.put("TOTPAGE", "${sampleBoard.pagination.getTotalPageCount()}");
                $gbPageMap.put("CURRPAGE", "${sampleBoard.pagination.getCurrentPageNo()}");
                $gbPageMap.put("PERPAGE", "${sampleBoard.pagination.getRecordCountPerPage()}");
                $gbPageMap.put("PAGESIZE", "${sampleBoard.pagination.getPageSize()}");

                console.log("페이지 수" + $gbPageMap.get("TOTPAGE"));
                console.log("현재페이지번호" + $gbPageMap.get("CURRPAGE"));
                console.log("페이지사이즈" + $gbPageMap.get("PAGESIZE"));
                console.log("한페이지에 게시될 게시글수" + $gbPageMap.get("PERPAGE"));

                if ($gbPageMap.get("TOTPAGE") != "0") {
                    util.page.set($gbPageMap, 'page_area', 'goPage');
                }

            });

            function goPage(pageNo) {
                console.log("버튼클릭시 번호 ::::" + pageNo);
                $("#pagination").val(pageNo);

                console.log($("#pagination.currentPageNo").val());
                //return false;
                $("#sampleBoard").submit();
            }
        </script>




    </html>