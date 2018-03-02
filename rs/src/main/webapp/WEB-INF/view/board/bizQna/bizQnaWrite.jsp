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
                            
                          </div>
                        </div>
                      </div>
                      <!-- /.box-header -->
                      <div class="box-body">
                        <form id="frm" name="frm" method="post" class="form-inline" action="/board/bizSaveBoard">
                          <input type="hidden" id="categorynm" name="categorynm" value="${board.categorynm}">
                          <input type="hidden" id="user_id" name="user_id" value="${loginUser.user_id}">
                          <input type="hidden" id="category" name="category" value="${board.category}">
                          <input type="hidden" id="biz_nm" name="biz_nm" value="${loginUser.biz_nm}">
                          <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="form-group has-feedback area_select">
                              <select class="form-control" id="area_cd" name="area_cd">
																<option value="">지역 선택</option>
																<c:forEach var="item" items="${comboAreaCdList}" varStatus="status">
																	<option value="${item.cd}">${item.cd_nm}</option>
																</c:forEach>
															</select>
                            </div>
                          </div>
                          <div class="row">
                            <label class="col-sm-1 form_control_lebel">제목</label>
                            <div class="col-sm-11">
                              <input type="text" id="title" name="title" class="form_control_edit2" placeholder=" 제목을 입력하세요.">
                            </div>
                          </div>
                          <div class="row">
                            <label class="col-sm-1 form_control_lebel">내용</label>
                            <div class="col-sm-11">
                              <textarea class="form_control_textarea" name="content" id="content" rows="27"></textarea>
                            </div>
                          </div>
                          <div class="row">
                            <label class="col-sm-1 form_control_lebel"></label>
                            <div id="example1_filter" class="col-sm-11">
                              <input class="btn btn-primary pull-right" type="submit" value="저장">
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
            </div>
            <!-- /.content-wrapper -->
            <%@include file="../../include/bottom.jsp"%>
      </div>
    </body>
    <script type="text/javascript">
      var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
      $(document).ready(function() {
        $("#frm").submit(function(e) {

          if (trim($('#area_cd').val()) == "" || trim($('#area_cd').val()).length < 1) {
            alert("지역은 필수 항목 입니다.");
            e.preventDefault();
            $('#area_cd').focus();
            return;
          }

          if (validation()) {
            oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

            if (!confirm(aslang[4])) {
              return false;
            } else {
              return true;
            }
          }
        });

        nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors, // 전역변수 명과 동일해야 함.
          elPlaceHolder: "content", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
          sSkinURI: "/se2/SmartEditor2Skin.html", // Editor HTML
          fCreator: "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
          htParams: {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar: true,
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer: true,
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger: true,
          }
        });
      });

      //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
      function submitContents(elClickedObj) {
        // 에디터의 내용이 textarea에 적용된다.

        alert("submitContents");
        // 에디터의 내용에 대한 값 검증은 이곳에서
        // document.getElementById("textAreaContent").value를 이용해서 처리한다.
        alert(document.getElementById("content").value);
        try {
          elClickedObj.form.submit();
        } catch (e) {

        }
      }

      //textArea에 이미지 첨부
      function pasteHTML(filepath) {
        var sHTML = '<img src="/se2/upload/' + filepath + '">';
        oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
      }

      // 필수값 Check
      function validation() {
        var contents = $.trim(oEditors[0].getContents());
        var title = $.trim(document.getElementById("title").value);

        if (title === '<p>&nbsp;</p>' || title === '') { // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음.
          alert("제목을 입력하세요.");
          $("#title").focus();
          return false;
        }

        if (contents === '<p>&nbsp;</p>' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
          alert("내용을 입력하세요.");
          oEditors.getById['content'].exec('FOCUS');
          return false;
        }

        return true;
      }
    </script>

  </html>