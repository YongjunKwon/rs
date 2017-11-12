<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../../include/header.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../../include/top.jsp"%>
<%@include file="../../include/sideMenu.jsp"%>

<!-- Smart Editor -->
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <form action="/page/test/send.jsp" method="post" id="frm">
		<textarea style="width: 100%" rows="10" name="content" id="textAreaContent" cols="80"></textarea>
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
var oEditors = [];

	$(document).ready(function() {
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "textAreaContent",
		    sSkinURI: "/se2/SmartEditor2Skin.html",
		    fCreator: "createSEditor2",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true, 
				}
		});
		 
		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
		    // 에디터의 내용이 textarea에 적용된다.
		    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
		 
		    // 에디터의 내용에 대한 값 검증은 이곳에서
		    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
		  
		    try {
		        elClickedObj.form.submit();
		    } catch(e) {
		     
		    }
		}
		 
		// textArea에 이미지 첨부
		function pasteHTML(filepath){
			console.log("11111");
		    var sHTML = '<img src="<%=request.getContextPath()%>+'/image/test/+filepath+'">';
		    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
		}
	}); 
</script>

</html>


