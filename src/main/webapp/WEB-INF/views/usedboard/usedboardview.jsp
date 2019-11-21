<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c19819360e58f7b833caaf8f1aafeca&libraries=services"></script>

<script>

$(function(){
	

/* 카카오맵  */
if(${dto.leftposition}!=0){
	
// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${dto.leftposition}, ${dto.rightposition}); 

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(${dto.leftposition}, ${dto.rightposition}), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	
	
	/* 카카오맵 끝 */
}
	
	//댓글 쓰기 
	$("#btnReply").click(function(){
		reply();	
	});
	//목록 버튼 클릭
	$("#btnList").click(function(){
		location.href="${path}/usedboard/usedboardlist";	
	});
	
	
	
	$("#btnUpdate").click(function(){
		
		
		document.form1.action="${path}/usedboard/usedboardupdateview";
		document.form1.submit();
		
	});
	
	
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/usedboard/usedboarddelete";
			document.form1.submit();
		}
	});
	
	listReply("1");  //responseRext 방식
	
	
});

function reply(){
	console.log("aaa");
	
	var replytext=$("#replytext").val();  //댓글내용
	var ubno="${dto.ubno}";  //게시물번호
	/* var param = "replytext="+replytext+"&bno="+bno */
	var param={ "replytext": replytext , "ubno":ubno};
	
	 $.ajax({
		type:"post",
		url:"${path}/usedboard/usedreplyinsert",
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
		url : "${path}/usedboard/usedreplylist?ubno=${dto.ubno}&curPage="+num,
		success:function(result){
			console.log(result);
			$("#listReply").html(result);
		}				

	});
}

function replydelete(th){
	var target = th;
	var urno = target.dataset["id"];
	var data = {
		"ubno" : ${dto.ubno},
		"urno" : urno,
	}
	$.ajax({
		type:"post",
		data: data,
		url : "${path}/usedboard/usedreplydel",
		success:function(result){
			
			listReply(1);
			
		}				

	}); 
	
};



</script>

<style>

.picture img{
	width:100%;
	height:100%;
}
.content,.reply{
	width:100%;
  	margin:0 auto;
}

#listReply img{	
		width:100%;
		height:100%;
	
}

/*  그리드 레이아웃*/
.grid{
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 10px;
  grid-auto-rows: 70px;
  width:100%;
  margin:0 auto;
}
.title{
	 grid-column: 2 / 3;
  	 grid-row: 1/2;
}
.kind{
	grid-column: 2/ 3;
  	 grid-row: 2/3;
}
.productname{
	grid-column: 2 / 3;
  	 grid-row: 3/4;

}
.price{
	grid-column: 2 / 3;
  	 grid-row: 4/5;
}
.trade{
	grid-column: 2 / 3;
  	 grid-row: 5/6;
	
}
.writer{
	grid-column: 2 / 3;
  	 grid-row: 6/7;
	
}
.phone{
grid-column: 2 / 3;
  	 grid-row: 7/8;
  	 
}

.picture{
	height:100%;
	grid-column: 1 / 2;
  	 grid-row: 1/8;

}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h2 style="text-align: center; font-weight: 400; font-size: 40px; margin-top: 150px; margin-bottom: 60px"> 중고게시판 </h2>
    
    
<div class="container">
	<form name="form1">
		<%-- <div class="row">
				
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
							<td>종류</td>
							<td colspan="2">${dto.kind}</td>
						</tr>
						<tr>
							<td>제품명</td>
							<td colspan="2">${dto.productname}</td>
						</tr>
						<tr>
							<td>가격</td>
							<td colspan="2">${dto.price}</td>
						</tr>
						<tr>
							<td>거래방법</td>
							<td colspan="2">${dto.trade}</td>
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
				</div> --%>



			<div class="grid">
				<div class="title">
					<div class="form-group">
						<label for="inputtitle" class="col-sm-3 control-label">제목</label>
						<div class="col-sm-9">
							<input readonly value="${dto.title}" class="form-control">
						</div>
					</div>
				</div>
				<div class="kind" id="kind">
					<div class="form-group">
						<label for="kind" class="col-sm-3 control-label">종류</label>
						<div class="col-sm-9">
							<input readonly value="${dto.kind}" class="form-control">
						</div>
					</div>

				</div>
				<div class="productname">
					<div class="form-group">
						<label for="productname" class="col-sm-3 control-label">제품명</label>
						<div class="col-sm-9">
							<input readonly value="${dto.title}" class="form-control">
						</div>
					</div>


				</div>
				<div class="price">

					<div class="form-group">
						<label for="inputprice" class="col-sm-3 control-label">가격</label>
						<div class="col-sm-9">
							<input readonly value="${dto.price}" class="form-control">
						</div>
					</div>


				</div>
				<div class="trade">


					<label for="productname" class="col-sm-3 control-label">거래방법</label>
					<div class="form-group col-sm-9" style="display: inline-block">
						<input readonly value="${dto.trade}" class="form-control">
					</div>



				</div>
				<div class="writer">


					<label for="writer" class="col-sm-3 control-label">작성자</label>
					<div class="form-group col-sm-9" style="display: inline-block">
						<input readonly value="${dto.uname}" class="form-control">
					</div>



				</div>
				
				<div class="phone">


					<label for="phone" class="col-sm-3 control-label">전화번호</label>
					<div class="form-group col-sm-9" style="display: inline-block">
						<input readonly value="${dto.phonenumber}" class="form-control">
					</div>



				</div>
				
				
				<div class="picture">
						
						<img src="${path}/upload/displayFile?fileName=${dto.img}"/>
				</div>
			

			</div>
			
			
			<div class="content">
			<c:if test="${dto.trade=='직거래'}">
			<div id="staticMap" style="width:100%;height:350px;"></div>
			</c:if>
			<div style="margin-top:50px; border:1px solid #337ab7;">
				<div style="display:block; width:100%; height:50px; padding: 20px 0px; background-color:#eeeeee;"><label class="col-sm-3 control-label">내용</label></div>
				<div style="height:500px;">
				
					${dto.content}
				</div>
			</div>

			

			<input type="hidden" name="ubno" value="${dto.ubno}">
			<div style="text-align:right; margin:30px 0px;">
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
		



<%-- <div style="width:100%; height:80px; text-align:center; margin-top:100px;">
<c:if test="${sessionScope.loginuser.uid != null }">
	<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요" class="col-sm-10" style="height:80px;"></textarea>
	
	<button type="button" id ="btnReply" class="col-sm-2 btn btn-primary" style="height:100%;">댓글쓰기</button>
	
</c:if>
</div>
<div id="listReply"></div> --%>


	
				




		
	</div>
    


</body>
</html>