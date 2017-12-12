<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@include file="../../include/header.jsp"%>
	<%@include file="../../include/top.jsp"%>
	<%@include file="../../include/sideMenu.jsp"%>
	<headers>
  		<frame-options policy="SAMEORIGIN"/>
  		<hsts disable="true"/>
	</headers>	
	<body class="hold-transition skin-red sidebar-mini">
		<div class="wrapper">
  			<div class="content-wrapper left content-white">
	    			<div class="write-wrap">
		    			<div class="well">
		    				<h3>텔/립/핸플/키스 후기 쓰기</h3>
		    			</div>   
		    			<!-- Main content -->
		    			<section class="content">
		      				<div class="row">
		        				<div class="col-md-12">
		            				<form class="form-horizontal" action="/board/chicken/sample_write_insert" method="post" id="frm">
										<div class="form-group">
											<label class="col-sm-1 control-label" for="wr_subject">제목</label>             
											<div class="input-group col-md-10">
		                   							<input type="text" class="form-control" id="" placeholder="Text input">
		                   					</div>
		                 				</div>																				
										<textarea class="smarteditor2" id="content" name="content" maxlength="65536" style="width:100%;height:300px"></textarea>
									</form>
									<div class="btn-group">
										<div class="col-sm-2">
											<button type="button" class="btn btn-info">저장</button>
										</div>
									</div>								
		          				</div>          
		     				</div>
		     			</section>
		     		</div>
	     		</div>
      		</div>	
		</div>
	<!-- ./wrapper -->
	</body>
		<%@include file="../../include/bottom.jsp"%>
<script type="text/javascript">

$(document).ready(function() {



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

//Editor Setting
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors, // 전역변수 명과 동일해야 함.
	elPlaceHolder : "content", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
	sSkinURI : "/se2/SmartEditor2Skin.html", // Editor HTML
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

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}


//textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="/se2/upload/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

// 필수값 Check
function validation(){
	var contents = $.trim(oEditors[0].getContents());
	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
		alert("내용을 입력하세요.");
		oEditors.getById['content'].exec('FOCUS');
		return false;
	}

	return true;
}

</script>
</html>