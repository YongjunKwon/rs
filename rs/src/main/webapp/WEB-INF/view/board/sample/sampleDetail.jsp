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
                                    [Page Header]
                                    <small> [Optional description] </small>
                                </h1>
                                <ol class="breadcrumb">
                                    <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                                    <li class="active">Here</li>
                                </ol>
                            </section>

                            <!-- Main content -->
                            <section class="content">


                                <div itemprop="description" class="view-content">${contents.content}</div>

                                <br/>

                                <div class="view-comment font-18 en">
                                    <i class="fa fa-commenting"></i><span class="orangered">${fn:length(replyList)} </span> Comments
                                </div>

                                <section id="bo_vc" class="comment-media">
                                    <!-- Loop start -->
                                    <c:if test="${!empty replyList}">
                                        <c:forEach var="reply" items="${replyList}">
                                            <div class="media" id="c_126">
                                                <div class="photo pull-left">
                                                    <div class="media-object"><i class="fa fa-user"></i></div>
                                                </div>
                                                <div class="media-body">
                                                    <div class="media-heading" id="div_del" name="div_del">
                                                        <b><span class="member">${reply.nick_nm}</span></b>
                                                        <span class="font-11 text-muted">
														                                <span class="media-info"><i class="fa fa-clock-o"></i>${reply.yyyymmdd}</span>
                                                        </span>

                                                        <c:if test="${reply.check_del_flag eq 'true' }">
                                                            <input type="button" id="deleteBtn" name="deleteBtn" value="삭제" data-values='{ "reply_seq" : "${reply.reply_seq}", "check_del_flag" : "${reply.check_del_flag}" }'></input>
                                                            <input type="password" id="pwd" name="pwd" value="" />
                                                        </c:if>
                                                    </div>
                                                    <div class="media-content">${reply.content}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <!-- Loop end -->
                                </section>

                                <br/>
                                <!-- 코멘트 시작 -->
                                <form id="commFrm" name="commFrm" action="">
                                    <input type="hidden" id="seq" name="seq" value="${contents.seq}">
                                    <input type="hidden" id="user_id" name="user_id" value="">
                                    <div class="comment-box">
                                        <div class="pull-left help-block hidden-xs">
                                            <i class="fa fa-smile-o fa-lg"></i> 댓글은 자신을 나타내는 '얼굴'입니다. *^^*
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <div class="col-xs-6">
                                                <label for="nick_nm" class="sound_only"><strong class="sound_only">필수</strong></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user gray"></i></span>
                                                    <input type="text" name="nick_nm" value="" id="nick_nm" class="form-control input-sm" size="5" maxlength="20" placeholder="닉네임" value="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group comment-content">
                                            <div class="comment-cell">
                                                <textarea tabindex="13" id="content" name="content" maxlength="10000" rows="5" class="form-control input-sm" title="내용">

												</textarea>
                                            </div>

                                            <div><input type="button" name="btnReplyReg" id="btnReplyReg" value="등록"><label></label></div>


                                        </div>
                                        <!--<a role="button" href="./board.php?bo_table=oph&amp;page=" class="btn btn-black btn-sm">-->
                                        <a role="button" href="/board/sample/sampleList" class="btn btn-black btn-sm">

                                            <i class="fa fa-bars"></i><span class="hidden-xs"> 목록</span>
                                        </a>



                                        <div class="comment-btn">
                                            <div class="form-group pull-right">
                                                <span class="cursor">
						<label class="checkbox-inline"><input type="checkbox" name="wr_secret" value="secret" id="wr_secret"> 비밀글</label>
					</span>
                                                <span class="cursor" title="이모티콘" onclick="apms_emoticon();">
						<i class="fa fa-smile-o fa-lg"></i><span class="sound_only">이모티콘</span>
                                                </span>
                                                <span class="cursor" title="새댓글" onclick="comment_box('','c');">
						<i class="fa fa-pencil fa-lg"></i><span class="sound_only">새댓글 작성</span>
                                                </span>
                                                <span class="cursor" title="새로고침" onclick="apms_page('viewcomment','');">
						<i class="fa fa-refresh fa-lg"></i><span class="sound_only">댓글 새로고침</span>
                                                </span>
                                                <span class="cursor" title="늘이기" onclick="apms_textarea('wr_content','down');">
						<i class="fa fa-plus-circle fa-lg"></i><span class="sound_only">입력창 늘이기</span>
                                                </span>
                                                <span class="cursor" title="줄이기" onclick="apms_textarea('wr_content','up');">
						<i class="fa fa-minus-circle fa-lg"></i><span class="sound_only">입력창 줄이기</span>
                                                </span>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </form>
                                <!-- 코멘트 종료 -->



                                <div class="view-btn text-right">
                                    <div class="btn-group" role="group">
                                        <a role="button" href="./board.php?bo_table=oph&amp;wr_id=347" class="btn btn-black btn-sm" title="이전글">
                                            <i class="fa fa-chevron-circle-left"></i><span class="hidden-xs"> 이전</span>
                                        </a>
                                        <a role="button" href="./board.php?bo_table=oph&amp;wr_id=345" class="btn btn-black btn-sm" title="다음글">
                                            <i class="fa fa-chevron-circle-right"></i><span class="hidden-xs"> 다음</span>
                                        </a>
                                        <a role="button" href="./password.php?w=d&amp;bo_table=oph&amp;wr_id=346&amp;page=" class="btn btn-black btn-sm" title="삭제" onclick="del(this.href); return false;">
                                            <i class="fa fa-times"></i><span class="hidden-xs"> 삭제</span>
                                        </a>
                                        <a role="button" href="./password.php?w=u&amp;bo_table=oph&amp;wr_id=346&amp;page=" class="btn btn-black btn-sm" title="수정">
                                            <i class="fa fa-plus"></i><span class="hidden-xs"> 수정</span>
                                        </a>

                                        <a role="button" href="./write.php?w=r&amp;bo_table=oph&amp;wr_id=346" class="btn btn-black btn-sm">
                                            <i class="fa fa-commenting"></i><span class="hidden-xs"> 답변</span>
                                        </a>
                                        <a role="button" href="./write.php?bo_table=oph" class="btn btn-color btn-sm">
                                            <i class="fa fa-pencil"></i><span class="hidden-xs"> 글쓰기</span>
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>


                            </section>
                            <!-- /.content -->
                        </div>
                        <!-- /.content-wrapper -->
                        <form id="commDelFrm" name="commDelFrm" action="">
                            <input type="hidden" id="seq" name="seq" value="${contents.seq}">
                            <input type="hidden" id="reply_seq" name="reply_seq" value="" />
                            <input type="hidden" id="pwd" name="pwd" value="" />

                        </form>

                        <%@include file="../../include/bottom.jsp"%>
            </div>
            <!-- ./wrapper -->
        </body>








        <script type="text/javascript">
            $(document).ready(function() {


                // if ("${success}" == -99) {
                //     alert(aslang[2]);
                // }

                // if ("${success}" == -98) {
                //     alert(aslang[3]);
                // }

                // if ("${success}" == 1) {
                //     alert(aslang[4]);
                // }



                $("#area_cd").val("${sampleBoard.area_cd}");
                console.log("${contents.seq}");
                var $seq = "${contents.seq}";



                $("#div_del #deleteBtn").on("click", function() {

                    var $dataTag = $(this).data('values');
                    console.log($dataTag.reply_seq);
                    if (trim($(this).next().val()) == "") {
                        alert(aslang[1]);
                        return false;
                    }

                    var params = {
                        "reply_seq": $dataTag.reply_seq,
                        "seq": $seq,
                        "pwd": $(this).next().val()
                    };



                    $.ajax({
                        url: "/board/sample/delFalgUpadaeReply",
                        method: "post",
                        type: "json",
                        data: params,
                        success: function(data) {
                            if (data.success == -99) {
                                alert(aslang[2]);
                                return;
                            }

                            if (data.success == -98) {
                                alert(aslang[3]);
                                return;
                            }

                            if (data.success == 1) {
                                alert(aslang[4]);
                                location.reload();
                            }
                        },
                        error: function(error) {
                            alert("error : " + eval(error));
                        }
                    });
                });

                // 댓글삭제
                $("#div_del > a").on("click", function() {
                    var $dataTag = $(this).data('values');
                    console.log("---- 게시글 댓글 삭제 @@@@@ " + $dataTag.reply_seq);

                    //$(".tr_on").find("td").eq(0).find("[name$=h_cuslSeq]").val()
                    console.log(" //// " + $(this));
                    console.log("비밀번호 ::: " + $(this).next().val());

                    if (trim($(this).next().val()) == "") {
                        alert(aslang[1]);
                        return false;
                    }

                    $("#commDelFrm #pwd").val($(this).next().val());
                    $("#commDelFrm #reply_seq").val($dataTag.reply_seq);

                    $("#commDelFrm").attr("action", "/board/sample/delFalgUpadaeReply");
                    $("#commDelFrm").attr("method", "post");
                    $("#commDelFrm").submit();

                });


                // 댓글등록
                $("#btnReplyReg").on("click", function() {
                    $("#commFrm").attr("action", "/board/sample/saveReply");
                    $("#commFrm").attr("method", "post");
                    $("#commFrm").submit();
                });


            });
        </script>

    </html>