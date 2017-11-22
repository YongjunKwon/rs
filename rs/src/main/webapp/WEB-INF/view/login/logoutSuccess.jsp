<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/view/include/header.jsp"%>
<body>
</body>

<script type="text/javascript"> 
  $(document).ready(function() {
    console.log("logout success!")
    alert("로그아웃 되었습니다.");
    window.location.replace("/");
	  
  }); 
</script>

</html>


