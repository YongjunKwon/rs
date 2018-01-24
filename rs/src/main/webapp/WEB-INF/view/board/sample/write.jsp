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

      

        
</script>
</html>