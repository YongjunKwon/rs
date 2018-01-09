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
		       			<form id="frm" name="frm" method="post" class="form-inline" action="/board/sample/saveBoard">		                    	                    			              					
							<div class="row">
             					<label class="col-sm-1 form_control_lebel">
             						제목
             					</label>             				
             					<div class="col-sm-11">
             						<input type="text" name="title" value="" id="title" class="form_control_edit2" maxlength="20" placeholder="제목을 입력하세요.">
             					</div>			             					
		                    </div>
		                    <div class="row">
		                    	<div class="col-sm-12">		                    
									<textarea class="form_control_textarea" name="content" id="content" rows="27" style="width:100%; hegith:595px"></textarea>
								</div>
							</div>																	
							<div class="row">
								<div id="example1_filter" class="col-sm-12 pull-left">										
									<input class="form_control_edit" type="submit" value="저장" />
								</div>
							</div>																					
						</form>							
	       			</div>
		            <!-- /.box-body -->
	       		</div>
		        <!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
</div>
  <!-- /.content-wrapper -->
<%@include file="../../include/bottom.jsp"%>
</div>
</body>
<script type="text/javascript">
// Editor Setting
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
$(document).ready(function() {
    $("#frm").validate({
        rules: {
            category: {
                required: true
            },
            title: {
                required: true
            },
            content: {
                required: true
            }
        },
        messages: {
            category: {
                required: "카테고리는 필수입력값입니다."
            },
            title: {
                required: "제목은 필수입력값입니다."
            },
            content: {
                required: "내용은 필수입력값입니다."
            }
        },
        submitHandler: function(form) {
            if (!confirm(aslang[4]))
                return false;
            else {
                form.submit();
            }
        }
    });
    // });
});

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