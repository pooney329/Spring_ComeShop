<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
 
<style>
         
    .login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
    .loginlogo{
    	text-align:center;
    	
    }
    .loginlogo img{
    	margin:0 20px;
    }
   
    
    </style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="login-form">
    <form action="${path}/member/loginpost" method="post">
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Username" required="required" name='uid'>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Password" required="required" name="upw">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Log in</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox" name="logincookie" id="logincookie" value="true"> Remember me</label>
            <a href="#" class="pull-right">Forgot Password?</a>
        </div>
        <div class="form-group">
             <div style="text-align:center">or login with</div>
		</div>   
		<div class="form-group">
		<div class="loginlogo">
				             
          <a href="${naverurl}"><img src="${path}/images/icon_naver.png" style="width:30px; height:30px;"></a> 
          <a href="${googleurl}"><img src="${path}/images/icon-google.png" style="width:30px; height:30px;"></a>
        </div>
        </div>        
    
    <p class="text-center"><a href="${path}/member/joinmenu">Create an Account</a></p>
</div>
	

	

<!-- 로그인 -->
	<%-- <form action="${path}/member/loginpost" method="post">
		아이디 : <input type="text" name="uid"> <br> 비밀번호 : <input
			type="passwd" name="upw"> <br> <label for="logincookie"><input
			type="checkbox" name="logincookie" id="logincookie" value="true">자동기억하기</label>
		<input type="submit" value="확인">

	</form> --%>

	<%-- <a href="${naverurl}">네이버</a>
	<a href="${googleurl}">구글</a>
	<a href="${path}/member/join.do">회원가입</a>
 --%>
 	
</body>
</html>
