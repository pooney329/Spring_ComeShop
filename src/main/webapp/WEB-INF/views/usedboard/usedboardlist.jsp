<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>



<style>
.title {
	width: 400px;
	text-align: center;
}

.thumbnails:before, .thumbnails:after {
	content: "";
	display: table;
}

.thumbnails {
	height: 800px;
	width: 1000px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.thumbnails li {
	float: left;
	margin-bottom: 20px;
	margin-left: 20px;
	list-style: none;
	display: inline-block;
}

.thumbnails img {
	width: 300px;
	height: 300px;
}



/* hover시 애니메이션 */
figcaption {
	position: absolute;
	top: 50%;
	left: 46.5px;
	right: 47.5px;
	width: 200px;
	opacity: 0;
	z-index: 1;
	transition: all 0.8s ease-out;
	transition-delay: 0.2s;
}

.test {
	display: inline-block;
	position: relative;
	overflow: hidden;
	text-align: center;
	cursor: pointer;
}

.test:after {
	display: inline-block;
	position: absolute;
	content: "";
	top: 7%;
	left: 10%;
	right: 10%;
	bottom: 7%;
	background: white;
	opacity: 0;
	transition: all 0.8s ease-out;
}

.test:hover:after {
	opacity: 0.9;
}

.test:hover figcaption {
	transform: translateY(-50%);
	opacity: 1;
}

.main_header{
	text-align: center; 
	font-weight: 400; 
	font-size: 40px; 
	margin-top: 150px; 
	margin-bottom: 60px
}
</style>
<script>
$(function() {
	$("#btnWrite").click(function() {
		
		location.href = "${path}/usedboard/usedboardwrite";
	});
});
function list(page) {
	location.href = "${path}/usedboard/usedboardlist?curPage=" + page
			+ "&search_option=${map.search_option}"
			+ "&keyword=${map.keyword}";
}
</script>

</head>
<body>
<%@ include file="../include/menu.jsp"%>
<h2 class="main_header">중고게시판</h2>
<div class="container">
	<form name="form1" method="post" action="${path}/usedboard/usedboardlist" style="padding:20px 150px;">
		<div class="form-group">
			<div class="col-sm-3">
				<select name="search_option" class="form-control">
					<c:choose>
						<c:when test="${map.search_option=='all' }">
							<option value="all" selected>이름+내용+제목</option>
							<option value="writer">이름</option>
							<option value="content">내용</option>
							<option value="title">제목</option>
						</c:when>
						<c:when test="${map.search_option=='writer' }">
							<option value="all">이름+내용+제목</option>
							<option value="writer" selected>이름</option>
							<option value="content">내용</option>
							<option value="title">제목</option>
						</c:when>
						<c:when test="${map.search_option=='content' }">
							<option value="all">이름+내용+제목</option>
							<option value="writer">이름</option>
							<option value="content" selected>내용</option>
							<option value="title">제목</option>
						</c:when>
						<c:when test="${map.search_option=='title' }">
							<option value="all">이름+내용+제목</option>
							<option value="writer">이름</option>
							<option value="content">내용</option>
							<option value="title" selected>제목</option>
						</c:when>
					</c:choose>
			</select>
									
			</div>
		<div class="col-sm-9">
			<div class="col-sm-8">
				<input name="keyword" value="${map.keyword}" class="form-control">
			</div>
			<div class="col-sm-4">
			<input type="submit" value="조회" class="btn btn-primary">
			<a href="#" class="btn btn-warning pull-right" id="btnWrite">글쓰기</a>
			</div>
		</div>
		</div>
		<div style="text-align:right; margin-top:50px;">
			<span style="color:red;">${map.count}</span>개의 게시물이 있습니다.
		</div> 
	</form>
	<ul class="thumbnails" style="margin-top:20px;">
		<c:forEach var="row" items="${map.list}">
			<li>
				<div class="test">
					<img src="${path}/upload/displayFile?fileName=${row.img}"/>
					<h3 style="text-align: left;">${row.productname}</h3>
					<p style="text-align: justify">${row.title}</p>
					<p style="text-align: right">
						<span style="color: red">${row.price}</span>원
					</p>
					<a href="${path}/usedboard/view?ubno=${row.ubno}&curPage=${map.pager.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">
						<figcaption>
							<h1>${row.trade}</h1>
							
						</figcaption>
					</a>
				</div>


			</li>
	</c:forEach>
	</ul>
</div>
	<div class="container">
			<div style="text-align:center">
				<c:if test="${pager.curBlock >1 }">
					<a href="javascript:list('1')">[처음]</a>
				</c:if>
				<c:if test="${pager.curBlock >1 }">
					<a href="javascript:list('${pager.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}"
					end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == pager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pager.curBlock < pager.totBlock}">
	
					<a href="javascript:list('${pager.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${pager.curPage < pager.totPage}">
					<a href="javascript:list('${pager.totPage}')">[끝]</a>
				</c:if>
			</div>
			<hr />
		</div>
</body>
</html>