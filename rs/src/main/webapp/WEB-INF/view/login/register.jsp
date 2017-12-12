<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <%@include file="/WEB-INF/view/include/header.jsp"%>

    <body class="hold-transition register-page">
      <div class="register-box">
        <div class="register-logo">
          <a href="/">
            <b>RS PJT</b>
          </a>
        </div>

        <div class="register-box-body">
          <p class="login-box-msg">회원가입</p>

          <form id="registerForm" action="/register/add" method="post">

            <div class="form-group has-feedback">
              <div class="input-group">
                <input type="email" id="user_id" name="user_id" class="form-control" placeholder="Email">
                <div class="input-group-btn">
                  <button type="button" id='emailCheck' class="btn btn-primary">중복확인</button>
                </div>
              </div>
            </div>

            <div class="form-group has-feedback">
              <div class="input-group">
                <input type="text" class="form-control" name="nick_nm" placeholder="닉네임">
                <div class="input-group-btn">
                  <button type="button" id='nickNmCheck' class="btn btn-primary">중복확인</button>
                </div>
              </div>
            </div>

            <div class="form-group has-feedback">
              <input type="password" class="form-control" placeholder="비밀번호">
              <!-- <span class="glyphicon glyphicon-lock form-control-feedback"></span> -->
            </div>

            <div class="form-group has-feedback">
              <input type="password" class="form-control" placeholder="비밀번호 확인">
              <!-- <span class="glyphicon glyphicon-log-in form-control-feedback"></span> -->
            </div>

            <div class="row">
              <div class="col-xs-8">
                <div class="checkbox icheck" id='checkbox_id'>
                  <label>
                    <input type="checkbox" id='agree_check'>
                    <a href="#">약관</a> 동의
                  </label>
                </div>
              </div>
              <!-- /.col -->
              <div class="col-xs-4">
                <button type="submit" class="btn btn-primary btn-block btn-flat">가입하기</button>
              </div>
              <!-- /.col -->
            </div>
          </form>

          <div class="social-auth-links text-center">
          </div>

          <a href="/login" class="text-center">
            <u>로그인 하러 가기</u>
          </a>
        </div>
        <!-- /.form-box -->
      </div>
      <!-- /.register-box -->

      <script>
        $(function () {
          
          function getFormData($form) {
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};

            $.map(unindexed_array, function (n, i) {
              indexed_array[n['name']] = n['value'];
            });

            return indexed_array;
          }
          
          
          $('#agree_check').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%' // optional
          });

          var isConfirmed = true;
          // For oncheck callback
          $('#agree_check').on('ifChecked', (e) => {
            confirm('개인정보 활용 및 회원가입에 동의하시겠습니까?')
          })

          $('#emailCheck').click((e) => {

            // $("#registerForm").validate().element("#email");

            //let form = $('#registerForm');

            // if(email.length < 3) {
            //   alert('email 주소를 입력하세요.');
            //   return;
            // } 
            // console.log(form.serialize());
            // console.log(JSON.stringify(form.serialize()));

            $.ajax({
              type: "POST",
              url: "/register/emailCheck",
              data: $('#registerForm').serialize(),
              dataType: 'text',
              success: function (data) {
                console.log("SUCCESS: ",data);
                console.log("test: ",data.test);

              },
              error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "error:" + error);
              },
              done: function (e) {
                console.log("DONE");
              }
            });

          })

         

        });
      </script>
    </body>

  </html>