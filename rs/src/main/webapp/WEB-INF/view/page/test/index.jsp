<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../../include/header.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../../include/top.jsp"%>
<%@include file="../../include/sideMenu.jsp"%>

<!-- Smart Editor -->
<script src="/SE2/js/HuskyEZCreator.js"></script>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
<br>
    <!-- Content Header (Page header) -->
    <!-- <form action="/page/test/send.jsp" method="post" id="frm"> -->
    <form action="/board/chicken/sample_write_insert" method="post" id="frm">
    	제목<input type="text" name="title" id="title" /> 
    	조회수<input type="text" name="cnt" id="cnt" value="" /> 
    	카테고리<input type="text" name="category" id="category" value="CG0101" /> 
    	지역코드<input type="text" name="areaCd" id="areaCd" value="AA30" /> 
    	업체명<input type="text" name="bizNm" id="bizNm" value="할리스커피" />
    	</br> 
    	추천수<input type="text" name="recommCnt" id="recommCnt" value="" /> 
    	삭제여부<input type="text" name="delFlag" id="delFlag" value="N" /> 
    	이미지URL<input type="text" name="imgUrl" id="imgUrl" value="" /> 
    	등록자NICK<input type="text" name="regNickNm" id="regNickNm" value="홍길동" /> 
    	</br>
		내용<textarea name="content" id="content" rows="10" cols="100" style="width:100%"></textarea> 
	</form>
	<input type="button" id="savebutton" value="서버전송" />
    <!-- Main content -->
  </div>
  <!-- /.content-wrapper -->
<%@include file="../../include/bottom.jsp"%>
</div>
<!-- ./wrapper -->
</body>


<script type="text/javascript">
// Editor Setting
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
$(document).ready(function() {

nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors, // 전역변수 명과 동일해야 함.
	elPlaceHolder : "content", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
	sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
	fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
	htParams : {
		// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseToolbar : true,
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true, 
	}
});

	// 전송버튼 클릭이벤트
	$("#savebutton").click(function(){
		//if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증
			if(validation()) {
				$("#frm").submit();
			}
		//}
	})
});

	// 필수값 Check
	function validation(){
		var contents = $.trim(oEditors[0].getContents());
		if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}
	
		return true;
	}

// 글쓰기 저장 & 수정
// function fWrite() {
// 	if(validation()){
// 		if(confirm("저장하시겠습니까?")) {
// 			oEditors[0].exec("UPDATE_CONTENTS_FIELD", []); // Editor내용을 DB에 가져가기 위해 필수로 작성!
// 														   // oEditors << 전역변수로 선언한 변수명과 동일해야 함.
// 			$("#boardForm").attr('action','${pageContext.request.contextPath}/save').submit();
// 		}
// 	}
// }
</script>
</html>