<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <%@include file="/WEB-INF/view/include/header.jsp"%>

    <body class="hold-transition login-page">
      <div class="login-box">
        <div class="login-logo">
          <a href="/">
            <b>밤프리카</b>
          </a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body" style="height: 260px;">

          <form action="/login" method="POST">
            <p class="login-box-msg">로그인</p>
            <div class="form-group has-feedback">
              <input type="email" class="form-control" name="user_id" placeholder="Email">
              <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
              <input type="password" class="form-control" name="pwd" placeholder="Password">
              <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="">
            </div>
            <div class="row">
              <div class="col-xs-8">
                <div class="checkbox icheck">
                  <label>
                    <input type="checkbox" id="idSaveCheck"> Remember Me
                  </label>
                </div>
              </div>
              <!-- /.col -->
              <div class="col-xs-4">
                <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
              </div>
              <!-- /.col -->
            </div>
            <c:if test="${error eq true}">
              <div>
                <i class="fa fa-circle-o text-red pull-left"></i>
                <p class="text-red small pull-left">로그인에 실패했습니다. 다시 로그인 해주세요.</p>
              </div>
            </c:if>
          </form>

          <div>
            <a href="findPassword" class="pull-right">비밀번호 찾기</a>
            <a href="/register" class="text-center pull-left">회원가입</a>
          </div>
        </div>
        <!-- /.login-box-body -->
      </div>
      <!-- /.content-wrapper -->
      <!-- ./wrapper -->
    </body>

    <script type="text/javascript">
      $(document).ready(function () {

        console.log('error message:' + '${error}');

        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });


        /**
         *  로그인 아이디 기억하기.
         *
         * @author 
         * @version 1.0, 2017.1.24 소스 수정
         * @see    None
         */

        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var userInputId = getCookie("userInputId");
        $("input[name='user_id']").val(userInputId);

        if ($("input[name='user_id']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
          $('input').iCheck('check'); // ID 저장하기를 체크 상태로 두기.
        }

        $('input').on('ifChecked', function (e) {
          var userInputId = $("input[name='user_id']").val();
          setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        });

        $('input').on('ifUnchecked', function (e) {
          deleteCookie("userInputId");
        });

        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[name='user_id']").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
          if ($('#idSaveCheck').is(":checked")) {
            var userInputId = $("input[name='user_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
          }
        });
      });

     
    </script>

  </html>