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
                        <div class="row">
                          <div class="col-sm-12">
                            <div class="row form_control_h3">

                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- /.box-header -->
                      <div class="box-body">
                        <div class="row">
                          <div class="for_control_title">
                            <h1 class="form_control_h1">
                              ${list.title}
                            </h1>
                            <div class="panel panel-default view-head">
                              <div class="panel-heading">
                                <div class="ellipsis text-muted font-12 pull-left">
                                  <span class="sv_merber">${list.nick_nm}</span>
                                  <span class="sp"></span>
                                  <i class="fa fa-eye"></i> ${list.cnt}
                                  <span class="sp"></span>
                                  <i class="fa fa-clock-o"></i>
                                  <span class="sp">${list.reg_dtime}</span>
                                  </span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="view-content">${list.content}</div>
                        </div>
                        <div class="view-comment font-18 en">
                          <i class="fa fa-commenting"></i>
                          <span class="orangered">${fn:length(replyList)}</span> Comments
                        </div>
                        <section class="comment-media">
                          <!-- Loop start -->
                          <c:if test="${!empty replyList}">
                            <c:forEach var="reply" items="${replyList}">
                              <div class="media">
                                <div class="photo pull-left">
                                  <div class="media-object">
                                    <i class="fa fa-user"></i>
                                  </div>
                                </div>
                                <div class="media-body">
                                  <div class="media-heading">
                                    <b><span class="member">${reply.nick_nm}</span></b>
                                    <span class="font-11 text-muted"><span class="media-info">
                                      <i class="fa fa-clock-o"></i>${reply.yyyymmdd} ${reply.check_del_flag}</span>
                                    </span>
                                    <div class="print-hide pull-right font-11" id="replyDelete" name="replyDelete">
                                      <c:if test="${reply.check_del_flag eq 'true' or loginUser.roles[0] eq 'ROLE_ADMIN' }">
                                        <a href="#" data-values='{ "reply_seq" : "${reply.reply_seq}", "check_del_flag" : "${reply.check_del_flag}" }'><span>삭제</span></a>
                                      </c:if>
                                    </div>
                                  </div>
                                  <div class="media-content">${reply.content}
                                  </div>
                                </div>
                              </div>
                            </c:forEach>
                          </c:if>
                          <!-- Loop end -->
                        </section>
                        <div class="box-footer">
                          <form id="commFrm" name="commFrm" action="/board/bizBoardReplyReg">
                            <input type="hidden" id="seq" name="seq" value="${list.seq}">
                            <input type="hidden" id="user_id" name="user_id" value="">
                            <input type="hidden" id="categorynm" name="categorynm" value="${categorynm}">
                            <div class="comment-box">
                              <div class="clearfix"></div>
                              <div class="form-group row">
                                <div class="col-xs-6">
                                </div>
                              </div>
                              <div class="form-group comment-content">
                                <div class="comment-cell">
                                  <textarea tabindex="13" id="content" name="content" maxlength="200" rows="5" class="form-control input-sm" title="내용"></textarea>
                                </div>
                                <div tabindex="14" class="comment-cell comment-submit" id="btnReplyReg">
                                  등록
                                </div>

                              </div>
                              <div class="view-btn">
                                <div class="pull-right">
                                  <div class="btn-group" role="group">
                                    <!-- <a role="button" href="./board.php?bo_table=oph&amp;wr_id=347" class="btn btn-black btn-sm" title="이전글">
                                    <i class="fa fa-chevron-circle-left"></i>
                                    <span class="hidden-xs"> 이전</span>
                                    </a>
                                    <a role="button" href="./board.php?bo_table=oph&amp;wr_id=345" class="btn btn-black btn-sm" title="다음글">
                                    <i class="fa fa-chevron-circle-right"></i><span class="hidden-xs"> 다음</span> 
                                    </a> -->
                                    <c:if test="${loginUser.user_id eq list.user_id or loginUser.roles[0] eq 'ROLE_ADMIN'}">
                                      <a role="button" id="btn_del" class="btn btn-black btn-sm" title="삭제">
                                      <i class="fa fa-times"></i><span class="hidden-xs"> 삭제</span>
                                      </a>
                                      <a role="button" id="btn_modify" class="btn btn-black btn-sm" title="수정">
                                      <i class="fa fa-plus"></i><span class="hidden-xs"> 수정</span>
                                    </c:if>
                                    </a>
                                      </a>
                                  </div>
                                </div>
                                <div class="clearfix"></div>
                              </div>
                            </div>
                          </form>
                        </div>
                        <!-- ./box-footer -->
                        <div class="pull-left">
                          <a role="button" href="/board/bizBoardList?categorynm=${categorynm}" class="btn btn-black btn-sm pull-left">
                          <i class="fa fa-bars"></i>
                          <span class="hidden-xs"> 목록</span>
                          </a>
                        </div>
                      </div>
                      <!-- ./box-body -->
                    </div>
                    <!-- ./box -->
                  </div>
                  <!-- ./col -->
                </div>
                <!-- ./row -->
              </section>
              <br/>
            </div>

      </div>
      <!-- /.content-wrapper -->
      <form id="commDelFrm" name="commDelFrm" method="post" action="/board/delFalgUpadaeReply">
        <input type="hidden" id="del_seq" name="seq" value="${list.seq}">
        <input type="hidden" id="reply_seq" name="reply_seq" value="" />
        <input type="hidden" id="del_categorynm" name="categorynm" value="${categorynm}" />
        <!-- <input type="hidden" id="pwd" name="pwd" value="" /> -->
      </form>
      <%@include file="../../include/bottom.jsp"%>
        </div>
    </body>
    <script type="text/javascript">
      var gv_auth = "";
      $(document).ready(function() {
        
        gv_auth = "${loginUser.roles[0]}";
        var $seq = "${contents.seq}";

        // 댓글삭제
        $("#replyDelete > a").on("click", function() {
          var $dataTag = $(this).data('values');

          if (!confirm(aslang[11])) return;

          $("#commDelFrm #reply_seq").val($dataTag.reply_seq);
          $("#commDelFrm").submit();

        });

        // 댓글등록
        $("#btnReplyReg").on("click", function() {
          if (checkReplyEmpty($(this))) return;
          
          $("#commFrm").attr("action", "/board/bizBoardReplyReg");
          $("#commFrm").attr("method", "post");
          $("#commFrm").submit();
        });

        //게시글 삭제
        $("#btn_del").on("click", function() {
          if (confirm("게시글을 삭제 하시겠습니까?"))
            window.location.href = "/board/bizBoardDelete?user_id=${loginUser.user_id}&seq=${list.seq}&categorynm=${categorynm}";
        });

        //게시글 수정
        $("#btn_modify").on("click", function() {
          window.location.href = "/board/bizBoardModify?user_id=${loginUser.user_id}&seq=${list.seq}&categorynm=${categorynm}&area_cd=${list.area_cd}&dtl_area_cd=${list.dtl_area_cd}";
        });

      });
    </script>

  </html>