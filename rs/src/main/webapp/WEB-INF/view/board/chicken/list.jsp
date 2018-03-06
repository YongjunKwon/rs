<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../../include/header.jsp"%>

<body class="hold-transition skin-black sidebar-mini">
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
    <section class="content">
    
    
	<div class="page-title">
		<h2><a href="http://bk0011.com/bbs/board.php?bo_table=gunma"><span>건마</span></a></h2>
								<span class="page-desc hidden-xs">
				각 지역의 건마를 소개해 드립니다						</span>
							<div class="clearfix"></div>
	</div>
	

					<div class="at-content">
								<p><span style="color: rgb(255, 0, 0); font-size: 12pt;"><b>****회원가 적용 받으시려면 밤프리카보고 전화했다고 말씀해주세요!****</b></span></p>
<section class="board-list"> 

	
			<div class="list-tsearch">
			<form name="fhsearch" method="get" role="form" class="form">
				<input type="hidden" name="bo_table" value="gunma">
				<input type="hidden" name="sca" value="">
				<div class="row row-15">
					<div class="col-sm-2 col-xs-5 col-15">
						<div class="form-group">
							<label for="sfl" class="sound_only">검색조건</label>
							<select name="sfl" id="sfl" class="form-control input-sm">
								<option value="wr_subject">제목</option>
								<option value="wr_content">내용</option>
								<option value="wr_subject||wr_content">제목+내용</option>
								<option value="mb_id,1">회원아이디</option>
								<option value="mb_id,0">회원아이디(코)</option>
								<option value="wr_name,1">글쓴이</option>
								<option value="wr_name,0">글쓴이(코)</option>
							</select>
						</div>
					</div>
					<div class="col-sm-6 col-xs-7 col-15">
						<div class="form-group">
							<div class="form-group">
								<label for="stx" class="sound_only">검색어</label>
								<input type="text" name="stx" value="" id="stx" class="form-control input-sm" maxlength="20" placeholder="검색어">
							</div>
						</div>
					</div>
					<div class="col-sm-2 col-xs-5 col-15">
						<div class="form-group">
							<select name="sop" id="sop" class="form-control input-sm">
								<option value="or">또는</option>
								<option value="and" selected="selected">그리고</option>
							</select>	
						</div>
					</div>
					<div class="col-sm-2 col-xs-7 col-15">
						<div class="form-group">
							<button type="submit" class="btn btn-red btn-sm btn-block"><i class="fa fa-search"></i> 검색</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	
	
<aside class="list-category">
	<div class="tabs div-tab trans-top hidden-xs">
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="./board.php?bo_table=gunma">
					전체(25)				</a>
			</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EC%84%9C%EC%9A%B8">
						서울					</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EA%B2%BD%EA%B8%B0">
						경기					</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EC%B6%A9%EC%B2%AD">
						충청					</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EC%A0%84%EB%9D%BC">
						전라					</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EA%B2%BD%EC%83%81">
						경상					</a>
				</li>
					</ul>
	</div>
	<div class="dropdown visible-xs">
		<a id="categoryLabel" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-block btn-color">
			전체(25)
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="categoryLabel">
			<li class="selected">
				<a href="./board.php?bo_table=gunma">전체</a>
			</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EC%84%9C%EC%9A%B8">서울</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EA%B2%BD%EA%B8%B0">경기</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EC%B6%A9%EC%B2%AD">충청</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EC%A0%84%EB%9D%BC">전라</a>
				</li>
							<li>
					<a href="./board.php?bo_table=gunma&amp;sca=%EA%B2%BD%EC%83%81">경상</a>
				</li>
					</ul>
	</div>
</aside>

	<div class="list-wrap">
		<form name="fboardlist" id="fboardlist" action="./board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post" role="form" class="form">
			<input type="hidden" name="bo_table" value="gunma">
			<input type="hidden" name="sfl" value="">
			<input type="hidden" name="stx" value="">
			<input type="hidden" name="spt" value="">
			<input type="hidden" name="sca" value="">
			<input type="hidden" name="sst" value="wr_num, wr_reply">
			<input type="hidden" name="sod" value="">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="sw" value="">
				<style>
		.list-board .list-body .thumb-icon a { 
		color:rgb(51, 51, 51); 
	}
			</style>
<div class="list-board">
	<div class="list-head div-head border-black">
							<span class="wr-num hidden-xs">번호</span>
							<span class="wr-thumb">포토</span>
				<span class="wr-subject">제목</span>
									<span class="wr-hit hidden-xs"><a href="/bbs/board.php?bo_table=gunma&amp;sop=and&amp;sst=wr_hit&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">조회</a></span>
											</div>
	<ul id="list-body" class="list-body">
		<li class="list-item">
							<div class="wr-num hidden-xs">25</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=91">
																				<img src="http://i.imgur.com/DoS9NNG.gif">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=91" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				■■■■▬ 로그인 ▬■■▶ NF▶[은지,가령,혜교,세경,아름,예린,은별,하늘,자연]外[도희,은주,가희,유진,…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 21931</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2017.05.31					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				21931			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">24</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=90">
																				<img src="http://bk0011.com/data/editor/1705/thumb-thumb-2feee4d7f4895d25624b2a929a0ecc25_1494552242_5178_600x1173_50x50.jpg" title="">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=90" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[평촌-터치] [터치아로마]◀◀100% HD실사UP✔NF주아,산이 출근✔단체할인✔20대초반✔와꾸보장✔내상제로…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 18317</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2017.05.12					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				18317			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">23</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=88">
																				<img src="https://www.opzoa1.net/data/editor/1611/2372228519_onDTuJEb_3692294e03fe9309a3b856ad72248b1d7780a09b.png">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=88" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[선릉-선릉설레임] ■□■▶선릉-설레임◀■□■ ♥ 일상에서 지친 심신을 푸는곳!! 짜릿한설레임 ♥									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 52566</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.21					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				52566			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">22</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=87">
																				<img src="https://www.opzoa1.net/data/editor/1611/1822614973_NQXt7VM2_2ef09270fa16a1f007f06d30e40e8652e033207f.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=87" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[강남-강남아우디] ★★[강남 아우디]▶★품격있는 서비스★사이즈나오는 와꾸★깔끔한 오피★◀명품아우디!! 아우…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 41318</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.21					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				41318			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">21</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=83">
																				<img src="https://i.imgur.com/gVbxyi0.gif">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=83" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[인덕원-비비] ■■■■ 인덕원 비비 ■■■■ ★010 . 7264 . 4560 ★ ■■■■ 주야 한달간 A…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 39397</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				39397			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">20</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=82">
																				<img src="https://i.imgur.com/8R98myK.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=82" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[분당-H아로마] 극강컨셉 ★★★=== ★재방률NO.1 ★ 하드컨셉슈얼마사지									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 44994</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				44994			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">19</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=81">
																				<img src="https://i.imgur.com/iJ19mRc.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=81" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[판교-아브뉴마사지] ■■■■■■■■■■[ 왁구 &amp; 하드컨셉 두마리 토끼를 잡는다 ]									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 40021</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				40021			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">18</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=80">
																				<img src="http://hwllove.speedgabia.com/new/cho11.jpg" title="">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=80" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[일산-벤츠] █████████ 『일산 벤츠』 ██████████『100% 실사프로필』NF 및 최강팀 풀출근…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 34521</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				34521			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">17</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=79">
																				<img src="https://www.kakaobam.net/data/file/info1/thumbView/160422_92f291c25e67459356ff5f40a608aa68_FTO5qGxyV.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=79" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[부천-라떼]◆◆◆◆◆◆◆◆◆◆◆◆◆☞부천 라떼☜ 부천 NO1◆◆◆◆◆◆◆◆◆◆◆◆◆									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 35014</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				35014			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">16</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=78">
																				<img src="https://www.kakaobam.net/data/cheditor5/1507/150716_207fb32fd5943bed4a60755233f48ebb_dsSVovjBSC2P8dBOTCiPYKcH3SDjmsWK.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=78" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[부천-티슈] 【 부천 티슈】☆☆━━━━★ 관리사들과의 짜릿한만남~부천티슈★━━━━☆☆									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 35764</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				35764			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">15</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=77">
																				<img src="http://minho823.img.or.kr/문/0.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=77" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[부천-문] ★부천MOON스파 365일 할인★주간10만원, 야간11만원 이벤트!!★ 1. 『 Unbeliev…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 34749</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				34749			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">14</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=70">
																				<img src="http://xka12345.diskn.com/26obDcWv4e">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=70" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[방이-슈퍼맨] ◀▶[ 방이-슈퍼맨 ]◀▶업소번호변경 : 010-2155-7278◀▶NF대거출근◀▶상위1%내…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 45478</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				45478			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">13</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=67">
																				<img src="http://minho823.img.or.kr/%EB%8B%A4%EC%9B%90/Dongspa1.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=67" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[압구정-다원스파] 압구정[다원스파★조조할인EVENT!!&amp;심야천사EVENT!!★피로회복,호텔식 마사지+ VI…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 47461</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				47461			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">12</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=66">
																				<img src="https://3.bp.blogspot.com/-TMTZW4ybbmw/Vx4HnGZD48I/AAAAAAAABB0/RgPFCteud2sWwCABsKWMjOp0g3iN8KS9QCLcB/s1600/Roll.gif">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=66" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[선릉-아쿠아] ██ &lt;&lt;선릉건마&gt;&gt; 아쿠아 ██ 강남대표 ██ 대박!! ★할인이벤트★ 진행중 ██									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 35784</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				35784			</div>
											</li>
	<li class="list-item">
							<div class="wr-num hidden-xs">11</div>
							<div class="wr-thumb">
										<div class="thumb-img">
							<div class="img-wrap" style="padding-bottom:100%;">
								<div class="img-item">
									<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=63">
																				<img src="https://2.bp.blogspot.com/-rMed5px-6w4/WBLdvfxk6zI/AAAAAAAAAcc/ofoa6kgPZO4_U40PBubVk4scgLLAX_8ogCLcB/s1600/01.jpg">
									</a>
								</div>
							</div>
						</div>
												</div>
				<div class="wr-subject">
			<a href="http://bk0011.com/bbs/board.php?bo_table=gunma&amp;wr_id=63" class="item-subject">
									<span class="orangered visible-xs pull-right wr-comment">
						<i class="fa fa-comment lightgray"></i>
						<b>1</b>
					</span>
												<span class="wr-icon wr-hot"></span>				[강남-디바]████████ ❤강남디바❤ ████████ ⭐⭐⭐⭐ ☎ 06월24일 ☎ ⭐⭐⭐⭐ ⭐⭐⭐☎ 할인…									<span class="count orangered hidden-xs">1</span>
							</a>
							<div class="item-details text-muted font-12 visible-xs ellipsis">
										<span><i class="fa fa-eye"></i> 39039</span>
																									<span>
						<i class="fa fa-clock-o"></i>
						2016.12.19					</span>
				</div>
					</div>
									<div class="wr-hit hidden-xs">
				39039			</div>
											</li>
	</ul>
	<div class="clearfix"></div>
		</div>
			<div class="list-btn">
				<div class="form-group pull-right">
					<div class="btn-group dropup" role="group">
						<ul class="dropdown-menu sort-drop" role="menu" aria-labelledby="sortLabel">
							<li>
								<a href="./board.php?bo_table=gunma&amp;sca=">
									<i class="fa fa-power-off"></i> 초기화
								</a>
							</li>
							<li>
								<a href="/bbs/board.php?bo_table=gunma&amp;sop=and&amp;sst=wr_datetime&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">									<i class="fa fa-clock-o"></i> 날짜순
								</a>
							</li>
							<li>
								<a href="/bbs/board.php?bo_table=gunma&amp;sop=and&amp;sst=wr_hit&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">									<i class="fa fa-eye"></i> 조회순
								</a>
							</li>
																																																														</ul>
						<a id="sortLabel" role="button" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-black btn-sm">
							<i class="fa fa-sort"></i> 정렬						</a>
																	</div>
				</div>
				<div class="form-group pull-left">
					<div class="btn-group" role="group">
												<a role="button" href="#" class="btn btn-black btn-sm" data-toggle="modal" data-target="#searchModal" onclick="return false;"><i class="fa fa-search"></i><span class="hidden-xs"> 검색</span></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="list-page text-center">
				<ul class="pagination en no-margin">
										<li class="disabled"><a><i class="fa fa-angle-double-left"></i></a></li><li class="disabled"><a><i class="fa fa-angle-left"></i></a></li><li class="active"><a>1</a></li><li><a href="./board.php?bo_table=gunma&amp;page=2">2</a></li><li class="disabled"><a><i class="fa fa-angle-right"></i></a></li><li><a href="./board.php?bo_table=gunma&amp;page=2"><i class="fa fa-angle-double-right"></i></a></li>									</ul>
			</div>

			<div class="clearfix"></div>
			
		</form>

		<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
						<div class="text-center">
							<h4 id="myModalLabel"><i class="fa fa-search fa-lg"></i> Search</h4>
						</div>
						<form name="fsearch" method="get" role="form" class="form" style="margin-top:20px;">
							<input type="hidden" name="bo_table" value="gunma">
							<input type="hidden" name="sca" value="">
							<div class="row row-15">
								<div class="col-xs-6 col-15">
									<div class="form-group">
										<label for="sfl" class="sound_only">검색대상</label>
										<select name="sfl" id="sfl" class="form-control input-sm">
											<option value="wr_subject">제목</option>
											<option value="wr_content">내용</option>
											<option value="wr_subject||wr_content">제목+내용</option>
											<option value="mb_id,1">회원아이디</option>
											<option value="mb_id,0">회원아이디(코)</option>
											<option value="wr_name,1">글쓴이</option>
											<option value="wr_name,0">글쓴이(코)</option>
										</select>
									</div>
								</div>
								<div class="col-xs-6 col-15">
									<div class="form-group">
										<select name="sop" id="sop" class="form-control input-sm">
											<option value="or">또는</option>
											<option value="and" selected="selected">그리고</option>
										</select>	
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
								<input type="text" name="stx" value="" required="" id="stx" class="form-control input-sm" maxlength="20" placeholder="검색어">
							</div>
							<div class="row row-15">
								<div class="col-xs-6 col-15">
									<button type="submit" class="btn btn-color btn-sm btn-block"><i class="fa fa-check"></i> 검색</button>
								</div>
								<div class="col-xs-6 col-15">
									<button type="button" class="btn btn-black btn-sm btn-block" data-dismiss="modal"><i class="fa fa-times"></i> 닫기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
	</div>

	
</section>

<!-- } 게시판 목록 끝 -->

<div class="h20"></div>													</div><!-- .at-content -->
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
                <c:forEach items="${list}" var= "list" varStatus="status">
	
				<tr>
				<td align="center">
				   ${status.count}
				</td>
				<td>
				<a href="/board/chicken/sample_detail_index">${list.title}</a>
				</td>
				</tr>
				</c:forEach>                
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
	            <button type="button" id="btn_write" name="btn_write" class="btn btn-default btn-xs pull-right">
	              <a href="/board/chicken/sample_w_index">
				  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 글쓰기</a>
				</button>
				<!-- <span class="glyphicon glyphicon-pencil pull-right" aria-hidden="true"></span> -->
				<div class="text-center">
	              <ul class="pagination pagination-sm no-margin">
	                <li><a href="#">&laquo;</a></li>
	                <li><a href="#">1</a></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li><a href="#">&raquo;</a></li>
	              </ul>
              	</div>
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
  $(document).ready(function() {
	  $("#btn_write").on("click",function(){
		  console.log("---- 글쓰기 클릭 @@@@@ ");
		  
	  });
  }); 
</script>

</html>


