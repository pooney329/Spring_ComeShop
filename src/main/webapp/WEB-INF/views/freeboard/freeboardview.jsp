<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>


<script>

$(function(){
	//댓글 쓰기 
	$("#btnReply").click(function(){
		reply();	
	});
	//목록 버튼 클릭
	$("#btnList").click(function(){
		location.href="${path}/freboard/freboardlist";	
	});
	
	
	
	$("#btnUpdate").click(function(){
		
		
		document.form1.action="${path}/freboard/freboardupdateview";
		document.form1.submit();
		
	});
	
	
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/freboard/freboarddelete";
			document.form1.submit();
		}
	});
	
	listReply("1");  //responseRext 방식
	
	
});

function reply(){
	
	var replytext=$("#replytext").val();  //댓글내용
	var fbno="${dto.fbno}";  //게시물번호
	/* var param = "replytext="+replytext+"&bno="+bno */
	var param={ "replytext": replytext , "fbno":fbno};
	
	 $.ajax({
		type:"post",
		url:"${path}/freboard/freereplyinsert",
		data: param,
		success:function(){
			alert("댓글이 등록되었습니다.");
			listReply("1");
			
		}
	});  
}
function listReply(num){
	$.ajax({
		type:"post",
		url : "${path}/freboard/freereplylist?fbno=${dto.fbno}&curPage="+num,
		success:function(result){
			
			$("#listReply").html(result);
		}				

	});
}

function replydelete(th){
	var target = th;
	var frno = target.dataset["id"];
	var data = {
		"fbno" : ${dto.fbno},
		"frno" : frno,
	}
	$.ajax({
		type:"post",
		data: data,
		url : "${path}/freboard/freereplydel",
		success:function(result){
			
			listReply(1);
			
		}				

	}); 
	
};



</script>
<style>
	#listReply img{	
		width:100%;
		height:100%;
	
	}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h2 style="text-align: center; font-weight: 400; font-size: 40px; margin-top: 150px; margin-bottom: 60px"> 자유게시판 </h2>
    
    
<div class="container">
	<form name="form1">
		<div class="row">
				
				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글 보기</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width:20%;">제목</td>
							<td colspan="2">${dto.title}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2">${dto.uname}</td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><fmt:formatDate value="${dto.regdate}"
								pattern="hh-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<!-- xss공격을 막기위해 replaceall로  치환해준다. -->
							<td colspan="2" style="min-height:200px; text-align:left;">
                                ${dto.content}
                                
                            </td>
						</tr>
						
							
						
					</tbody>
					
					
				</table>

				<input type="hidden" name="fbno" value="${dto.fbno}">
				<div style="text-align:right;">
				<c:if test="${sessionScope.loginuser.uid == dto.writer}">
					<button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
					<button type="button" id="btnDelete" class="btn btn-primary">삭제</button>

				</c:if>
				<button type="button" id="btnList" class="btn btn-primary">목록</button>
				</div>
				
				
						
						
					
			</div>
			</form>
			
						<!-- 댓글쓰기  -->
<div style="width:100%; height:80px; text-align:center; margin-top:100px;">
<c:if test="${sessionScope.loginuser.uid != null }">
	<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요" class="col-sm-10" style="height:80px;"></textarea>
	
	<button type="button" id ="btnReply" class="col-sm-2 btn btn-primary" style="height:100%;">댓글쓰기</button>
	
</c:if>
</div>
<div id="listReply"></div>
		

				
			
</div>
				




		
	</div>
    


</body>
</html>