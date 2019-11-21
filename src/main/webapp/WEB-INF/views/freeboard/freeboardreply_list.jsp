<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
</head>

<script>

var replyadd;

$(function(){
	replyadd = function(th){
		
		
		var target = th;
		
		
		var addreplytarget  = $($(target).parents("div")[1]).parent("li")[0];
		
		console.log(addreplytarget);
		
		//<textarea>aaaa</textarea>
		var li = $("<li>");
		var text = $("<textarea rows='5' cols='80'></textarea>");
		text.addClass("col-sm-10")
		var button = $("<button>");
		button.html("댓글달기");
		button.addClass("col-sm-2");
		button.addClass("btn btn-warning");
		button.css("height","100px");
		button.click(function(){
			
			var data = target.dataset;
			data["fbno"] = "${list[0].fbno}";
			data["replytext"]  = text.val();
			console.log(data);
			
			$.ajax({
				type:"post",
				data: data,
				url : "${path}/freboard/freereplyadd",
				success:function(result){
					alert("성공");
					listReply(1);
					
				}			
			
			}) 
			
			
			
		});
		
		li.append(text);
		li.append(button);
		
		
		$(addreplytarget).after(li);
		
		
		
		
		
		
		
	}
});
	
	
	
</script>
<style>
.box{
	border:1px solid black;
	width:100%;
	height:100%;
	display:inline-block;
}
</style>
<body>


	
	
	<ol style="list-style:none; height:100%;" >
		<c:forEach var="row" items="${list}">
		<c:set var="name" value="${row.findent*29}"/>


		<li style="padding-left:${name}px; width:100%; height:100% ;display:inline-block;">
			<div class="box" style="position:relative;">
				<div  class="col-sm-2" style="height:100px" ><img src="${path}/images/icon.png"></div>
				<div class="col-sm-10" style="height:100px; padding:30px; font-size:20px;">${row.uname}(<fmt:formatDate value="${row.regdate}"
					pattern="yyyy-MM-dd HH:mm:ss"/>)
				<br>
				${row.replytext}
				</div>
				<div style="position: absolute; bottom:0px; right:0px;">
			<c:if test="${row.replyer!=sessionScope.loginuser.uid}"><button onclick="replyadd(this)" class="btn btn-primary" data-fgroup="${row.fgroup}" data-fstep="${row.fstep}" data-findent="${row.findent}">댓글</button></c:if>
			<c:if test="${row.replyer==sessionScope.loginuser.uid}">
				<button class="btn btn-primary">수정</button>
				<button onclick="replydelete(this);" data-id="${row.frno}" class="btn btn-primary">삭제</button>
			</c:if>
			</div>
			</div>
		</li>
		</c:forEach>
	</ol>
	
		
		
		</div>
		
		
		
	
	
	

</body>
</html>