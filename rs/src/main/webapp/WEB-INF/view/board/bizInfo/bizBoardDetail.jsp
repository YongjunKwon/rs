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
              			<div class="row">
              				<div class="col-sm-12">
              					<div class="row form_control_h3">
              						<h3 class="form_control_h3">****회원가 적용 받으시려면 밤길보고 전화했다고 말씀해주세요!****</h3>
              					</div>
	       					</div>
	       				</div>
	       			</div>
	       			<!-- /.box-header -->
            		<div class="box-body">            			
            			<div class="row">
            				<div class="for_control_title">
            					<h1 class="form_control_h1">
            						■■■■▬ 로그인 ▬■■▶ NF▶[은지,가령,혜교,세경,아름,예린,은별,하늘,자연]外[도희,은주,가희,유진,혜지,제희,청아]세…
            					</h1>
            					<div class="panel panel-default view-head">
	            					<div class="panel-heading">
										<div class="ellipsis text-muted font-12">
											<span itemprop="publisher" content="관리자">										
												<span class="sv_merber">관리자
												</span>
											</span>
											<span class="hidden-xs">	
												<span class="sp"></span>
													<i class="fa fa-tag"></i>경기									
											</span>										
											<span class="sp"></span>
											<i class="fa fa-comment"></i>
											<b class="red">3</b>														
											<span class="sp"></span>
											<i class="fa fa-eye"></i>
											25903
											<span class="pull-right">
												<i class="fa fa-clock-o"></i>
												<span itemprop="datePublished" content="2017-05-31KST08:25:57">
													05.31 08:25						</span>
											</span>
										</div>
									</div>
								</div>
							</div>							
						</div>
						<div class="row">
							<div itemprop="description" class="view-content">${contents.content}</div>
							<div class="ht-50"></div>
							<div class="view-author-none"></div>
						</div>
						<div class="view-comment font-18 en">
							<i class="fa fa-commenting"></i>
							<span class="orangered">${fn:length(replyList)}</span>
							Comments
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
												<span class="font-11 text-muted">
													<span class="media-info">
														<i class="fa fa-clock-o"></i>
														${reply.yyyymmdd}
													</span>
												</span>
												<div class="print-hide pull-right font-11" id="replyDelete" name="replyDelete">
													<c:if test="${reply.check_del_flag eq 'true' }">
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
							<form id="commFrm" name="commFrm" action="">
								<input type="hidden" id="seq" name="seq" value="${contents.seq}">
								<input type="hidden" id="user_id" name="user_id" value="">
								<div class="comment-box">									
									<div class="clearfix"></div>
										<div class="form-group row">
										<div class="col-xs-6">
											<!-- label for="nick_nm" class="sound_only"><strong class="sound_only">필수</strong></label>
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user gray"></i></span>
													<input type="text" name="nick_nm" value="" id="nick_nm" class="form-control input-sm" size="5" maxlength="20" placeholder="닉네임" value="">
											</div-->
										</div>
									</div>
									<div class="form-group comment-content">
						            	<div class="comment-cell">
						               		<textarea tabindex="13" id="content" name="content" maxlength="200" rows="5" class="form-control input-sm" title="내용"></textarea>
										</div>
										
										<div tabindex="14" class="comment-cell comment-submit" onkeydown="apms_comment_onKeyDown();" id="btnReplyReg">
											등록
										</div>										
										
									</div>																		
						            <div class="view-btn">						            	
										<div class="pull-right">										
											<div class="btn-group" role="group">
												<a role="button" href="./board.php?bo_table=oph&amp;wr_id=347" class="btn btn-black btn-sm" title="이전글">
													<i class="fa fa-chevron-circle-left"></i>
													<span class="hidden-xs"> 이전</span>
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
<!-- 코멘트 종료 -->                   

</div>
<!-- /.content-wrapper -->
<form id="commDelFrm" name="commDelFrm" action="">
    <input type="hidden" id="seq" name="seq" value="${contents.seq}">
    <input type="hidden" id="reply_seq" name="reply_seq" value="" />
    <input type="hidden" id="pwd" name="pwd" value="" />

</form>
<%@include file="../../include/bottom.jsp"%>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function() {
        $("#area_cd").val("${sampleBoard.area_cd}");
        console.log("${contents.seq}");
        var $seq = "${contents.seq}";

        $("#replyDelete > a").on("click", function() {
        //$("#addBtn").on("click", function() {
			//e.preventDefault();
			
            var $dataTag = $(this).data('values');            

            var params = {
                "reply_seq": $dataTag.reply_seq,
                "seq": $seq
            };
            
            if(!confirm(aslang[11]))return;;
            
            $.ajax({
                url: "/board/sample/delFalgUpadaeReply",
                method: "post",
                type: "json",
                data: params,
                success: function(data) {
                    if (data.success == -99) {
                        alert(aslang[1]);
                        return;
                    }
                },
                error: function(error) {
                    alert("error : " + eval(error));
                }
            });
        });

        // 댓글삭제
        $("#div_del1111 > a").on("click", function() {
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
            
        	$("#commFrm").attr("action", "/board/bizBoardReplyReg");
            $("#commFrm").attr("method", "post");
            $("#commFrm").submit();
        });
    });
</script>
</html>