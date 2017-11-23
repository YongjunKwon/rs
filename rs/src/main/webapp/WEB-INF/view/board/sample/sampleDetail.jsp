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

<div class="view-comment font-18 en">
	<i class="fa fa-commenting"></i> <span class="orangered">2</span> Comments
</div>


<section id="bo_vc" class="comment-media">
					<div class="media" id="c_126">
				<div class="photo pull-left"><div class="media-object"><i class="fa fa-user"></i></div></div>
				<div class="media-body">
					<div class="media-heading">
												<b><span class="member">핫실장</span></b>
						<span class="font-11 text-muted">
							<span class="media-info">
								<i class="fa fa-clock-o"></i>
								05.25 16:32							</span>
													</span>
						&nbsp;
						<div class="print-hide pull-right font-11 ">
																	<a href="./board.php?bo_table=op&amp;wr_id=125&amp;c_id=126&amp;w=c#bo_vc_w" onclick="comment_box('126', 'c'); return false;">
										<span class="text-muted">답변</span>
									</a>
																																															</div>
											</div>
					<div class="media-content">
																		===========&nbsp; 당분간 시간제한 없이 할인행사 합니다&nbsp; 전화주세요 =============																				<span id="edit_126"></span><!-- 수정 -->
							<span id="reply_126"></span><!-- 답변 -->
							<input type="hidden" value="" id="secret_comment_126">
							<textarea id="save_comment_126" style="display:none">===========  당분간 시간제한 없이 할인행사 합니다  전화주세요 =============</textarea>
											</div>
			  </div>
			</div>
								<div class="media" id="c_128">
				<div class="photo pull-left"><div class="media-object"><i class="fa fa-user"></i></div></div>
				<div class="media-body">
					<div class="media-heading">
												<b><span class="member">sjdkljf</span></b>
						<span class="font-11 text-muted">
							<span class="media-info">
								<i class="fa fa-clock-o"></i>
								09.20 03:21							</span>
													</span>
						&nbsp;
																									<div class="print-hide pull-right font-11 ">
																	<a href="./board.php?bo_table=op&amp;wr_id=125&amp;c_id=128&amp;w=c#bo_vc_w" onclick="comment_box('128', 'c'); return false;">
										<span class="text-muted">답변</span>
									</a>
																																															</div>
											</div>
					<div class="media-content">
																		좋은 정보 감사합니다 
<br>　　　　　　　　　　　　　　　　 
<br>솔직 담백한 그녀와의 1 대1 대화 <a href="http://bit.ly/2hmcX7u" target="_blank">http://bit.ly/2hmcX7u</a>																				<span id="edit_128"></span><!-- 수정 -->
							<span id="reply_128"></span><!-- 답변 -->
							<input type="hidden" value="" id="secret_comment_128">
							<textarea id="save_comment_128" style="display:none">좋은 정보 감사합니다 
　　　　　　　　　　　　　　　　 
솔직 담백한 그녀와의 1 대1 대화 http://bit.ly/2hmcX7u</textarea>
											</div>
			  </div>
			</div>
						</section>


<!-- 코멘트 시작 -->
<div class="comment-box">
						<div class="pull-left help-block hidden-xs">
				<i class="fa fa-smile-o fa-lg"></i> 댓글은 자신을 나타내는 '얼굴'입니다. *^^*
			</div>
						<div class="clearfix"></div>
							<div class="form-group row">
					<div class="col-xs-6">
						<label for="wr_name" class="sound_only">이름<strong class="sound_only"> 필수</strong></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user gray"></i></span>
							<input type="text" name="wr_name" value="" id="wr_name" class="form-control input-sm" size="5" maxlength="20" placeholder="이름">
						</div>
					</div>
					<div class="col-xs-6">
						<label for="wr_password" class="sound_only">비밀번호<strong class="sound_only"> 필수</strong></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock gray"></i></span>
							<input type="password" name="wr_password" id="wr_password" class="form-control input-sm" size="10" maxlength="20" placeholder="비밀번호">
						</div>
					</div>
				</div>
			
			<div class="form-group comment-content">
				<div class="comment-cell">
					<textarea tabindex="13" id="wr_content" name="wr_content" maxlength="10000" rows="5" class="form-control input-sm" title="내용"></textarea>
										<script>
					$("textarea#wr_content[maxlength]").live("keyup change", function() {
						var str = $(this).val()
						var mx = parseInt($(this).attr("maxlength"))
						if (str.length > mx) {
							$(this).val(str.substr(0, mx));
							return false;
						}
					});
					</script>
				</div>
				<div tabindex="14" class="comment-cell comment-submit" onclick="apms_comment_submit();" onkeydown="apms_comment_onKeyDown();" id="btn_submit">
					등록
				</div>
			</div>

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
														<a role="button" href="./board.php?bo_table=oph&amp;page=" class="btn btn-black btn-sm">
					<i class="fa fa-bars"></i><span class="hidden-xs"> 목록</span>
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
<%@include file="../../include/bottom.jsp"%>
</div>
<!-- ./wrapper -->









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


