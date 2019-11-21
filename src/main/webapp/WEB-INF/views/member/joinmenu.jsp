<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>


<style>
	.content{
		margin: 100px 200px;
	}
	.left{
		float: left;
		width:50%;
		height:300px;
		background-color:#f7f7f7;
		/* padding:100px; */
		line-height:200%;
		position: relative;
	}
	.right{
		float: left;
		width:50%;
		height:300px;
		
	}
	.box{
	 position:absolute;
    top:50%; left:50%;
    transform: translate(-50%, -50%);     
    
	}
	.le{
	position:absolute;
    top:50%; left:50%;
    transform: translate(-50%, -50%);
	}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>


<div class="content">
	<div class="left" style="font-size : 20px;">
		<div class="le">
		<h3>일반회원</h3>
		<h1>만 14세 이상의 개인</h1>
		<a href="${path}/member/join.do" class="btn btn-primary" style="font-size:25px;">일반회원가입하기</a>
		</div>
		
		
	</div>
	<div class="right" style="position: relative;">
		<div class="box">
		<a href="${naverurl}" style="display:block;"><img src="${path}/images/naver.png" style="width:100%; height:100px;"></a> 
        <a href="${googleurl}" style="display:block;"><img src="${path}/images/google.png" style="width:100%; height:100px;"></a>
        </div>
	</div>
</div>



</body>
</html>