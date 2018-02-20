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
          <p class="login-box-msg text-bold">일반 회원가입</p>

          <form id="registerForm" action="/register/add" method="post">

            <div class="form-group has-feedback">
              <div class="input-group">
                <input type="email" id="user_id" name="user_id" maxlength="50" class="form-control" placeholder="Email" />
                <div class="input-group-btn">
                  <button type="button" id='checkEmail' class="btn btn-primary">중복확인</button>
                </div>
              </div>
            </div>

            <div class="form-group has-feedback">
              <div class="input-group">
                <input type="text" class="form-control" id="nick_nm" name="nick_nm" maxlength="10" placeholder="닉네임" />
                <div class="input-group-btn">
                  <button type="button" id='checkNickNm' class="btn btn-primary">중복확인</button>
                </div>
              </div>
            </div>

            <div class="form-group has-feedback">
              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" />
              <!-- <span class="glyphicon glyphicon-lock form-control-feedback"></span> -->
            </div>

            <div class="form-group has-feedback">
              <input type="password" class="form-control" id="pwd_again" name="pwd_again" placeholder="비밀번호 확인" />
              <!-- <span class="glyphicon glyphicon-log-in form-control-feedback"></span> -->
              <font name="check" size="2" color="red"></font>
            </div>

            <div class="row">
              <div class="col-xs-8">
                <div class="checkbox icheck" id='checkbox_id'>
                  <label>
                    <input type="checkbox" id='agree_check'>
                    <a href="#" id="provision">약관</a> 동의
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
          <a href="/biz/register" class="text-center pull-right">
            <u>업체 회원가입</u>
          </a>

        </div>
        <!-- /.form-box -->
      </div>
      <!-- /.register-box -->

      <!-- 약관 Modal -->
      <%@include file="/WEB-INF\view\login\provision.jsp"%>

        <script>
          $(function () {

            /**
             * Open Modal
             *
             * @author 
             * @version 1.0, 2018.2.19 추가
             */
            $('#provision').click(() => {
              console.log("provision click");
              $('#provisionModal').modal();
            });


            //$('#user_id').focus();

            //중복체크 및 약관 동의
            var isCheckedEmailDupl = false;
            var isCheckedNickNmDupl = false;

            /**
             * Email, 닉네임 수정시 중복체크 초기화
             *
             * @author 
             * @version 1.0, 2017.12.16 소스 수정
             */
            $('#user_id').change(function (e) {
              isCheckedEmailDupl = false;
              e.preventDefault();
            });

            $('#nick_nm').change(function (e) {
              isCheckedNickNmDupl = false;
              e.preventDefault();
            });


            /* formData로 데이터 변환
            function getFormData($form) {
              var unindexed_array = $form.serializeArray();
              var indexed_array = {};

              $.map(unindexed_array, function (n, i) {
                indexed_array[n['name']] = n['value'];
              });

              return indexed_array;
            }
            */

            $('#agree_check').iCheck({
              checkboxClass: 'icheckbox_square-blue',
              increaseArea: '20%' // optional
            });


            /**
             * 이메일 중복 체크 버튼 클릭
             *
             * @author 
             * @version 1.0, 2017.12.16 소스 수정
             */
            $('#checkEmail').click((e) => {
              var trimEmail = trim($('#user_id').val());

              //email null check
              if (trimEmail == "") {
                alert("Email을 입력 해 주세요.");
                $('#user_id').val(trimEmail).focus();
                return;
              }

              console.log("isimail:", isEmail(trimEmail));
              //email validation
              if (!isEmail(trimEmail)) {
                alert("Email 형식이 맞지 않습니다.");
                $('#user_id').val(trimEmail).focus();
                return;
              }

              $.ajax({
                url: "/register/checkEmail",
                method: "post",
                type: "json",
                data: objectifyForm($('#registerForm').serializeArray()),
                success: function (data) {
                  if (!data.isDuplicated) {
                    isCheckedEmailDupl = true;
                    alert('"' + $('#user_id').val() + '" 사용 가능한 Email 입니다.');
                  } else {
                    alert('"' + $('#user_id').val() + '" 중복된 Email 입니다.');
                    isCheckedEmailDupl = false;
                    $('#user_id').focus();
                  }
                },
                error: function (error) {
                  alert("error : " + eval(error));
                }
              });
            });

            /**
             * 닉네임 중복 체크 버튼 클릭.
             *
             * @author 
             * @version 1.0, 2017.12.16 소스 수정
             * @see    None
             */
            $('#checkNickNm').click((e) => {
              var trimNickNm = trim($('#nick_nm').val());

              //nick_nm null check
              if (trimNickNm == "") {
                alert("닉네임을 입력해 주세요.");
                $('#nick_nm').val(trimNickNm).focus();
                return;
              }

              //TODO: 특수기호 못쓰게 처리 추가
              if (!regExp(trimNickNm)) {
                $('#nick_nm').focus();
                return;
              }

              console.log("isimail:", isEmail(trimNickNm));
              // //nick_nm validation
              // if(!isEmail(trimEmail)){
              //   alert("닉네임 형식이 맞지 않습니다.");
              //   $('#nick_nm').val(trimEmail).focus();
              //   return;
              // }

              $.ajax({
                url: "/register/checkNickNm",
                method: "post",
                type: "json",
                data: objectifyForm($('#registerForm').serializeArray()),
                success: function (data) {
                  if (!data.isDuplicated) {
                    isCheckedNickNmDupl = true;
                    alert('"' + $('#nick_nm').val() + '" 사용 가능한 닉네임 입니다.');
                  } else {
                    isCheckedNickNmDupl = false;
                    alert('"' + $('#nick_nm').val() + '" 중복된 닉네임 입니다.');
                    $('#nick_nm').focus();
                  }
                },
                error: function (error) {
                  alert("error : " + eval(error));
                }
              });

            })


            /**
             * 비밀번호 체크
             */
            $('#pwd').keyup(function () {
              $('font[name=check]').text('');
            }); //#pwd.keyup

            $('#pwd_again').keyup(function () {
              if ($('#pwd').val() != $('#pwd_again').val()) {
                $('font[name=check]').text('');
                $('font[name=check]').html("비밀번호가 다릅니다.");
              } else {
                $('font[name=check]').text('');
                $('font[name=check]').html("비밀번호가 일치합니다.");
              }
            }); //#pwd_again.keyup


            /**
             * Form Submit.
             *
             * @author 
             * @version 1.0, 2017.12.16 소스 수정
             * @see    None
             */

            $("#registerForm").submit(function (e) {
              var trimPwd = trim($('#pwd').val());

              if (!isCheckedEmailDupl) {
                alert("Email 중복확인을 해주세요.");
                $('#user_id').focus();
                e.preventDefault();
                return;
              } else if (!isCheckedNickNmDupl) {
                alert("닉네임 중복확인을 해주세요.");
                $('#nick_nm').focus();
                e.preventDefault();
                return;
              } else if ($('#pwd').val() != $('#pwd_again').val() || trimPwd == "") {
                alert("비밀번호를 확인해주세요.");
                $('#pwd').focus();
                e.preventDefault();
                return;
              } else if (!$('#agree_check').iCheck('update')[0].checked) {
                alert("약관동의를 체크 해주세요.");
                e.preventDefault();
                return;
              }
            });


          }); //end jquery
        </script>
    </body>

  </html>