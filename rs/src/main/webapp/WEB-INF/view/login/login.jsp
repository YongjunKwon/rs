<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/view/include/header.jsp"%>

<http auto-config="true">
    <intercept-url pattern="/admin/**" access="ROLE_ADMIN" />
    <form-login
        username-parameter="loginid"
        password-parameter="loginpwd"
        login-page="/login"
        default-target-url="/"
        authentication-failure-url="/login.do?fail=true"
    />
</http>

<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/"><b>로그인</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">

    <form action="/WEB-INF/view/index.jsp" method="post">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <a href="#">비밀번호 찾기</a><br>
    <a href="#" class="text-center">회원가입</a>

  </div>
  <!-- /.login-box-body -->
</div>
  <!-- /.content-wrapper -->
<!-- ./wrapper -->
</body>

<script type="text/javascript"> 
  $(document).ready(function() {
   
	  $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
	  
  }); 
</script>

</html>


