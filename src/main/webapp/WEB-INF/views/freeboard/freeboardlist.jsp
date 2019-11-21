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
</style>
<script>
	$(function() {
		$("#btnWrite").click(function() {
			console.log("aaaa");
			location.href = "${path}/freboard/freboardwrite";
		});
	});
	function list(page) {
		location.href = "${path}/freeboard/freboardlist?curPage=" + page
				+ "&search_option=${map.search_option}"
				+ "&keyword=${map.keyword}";
	}
</script>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>






	<h2
		style="text-align: center; font-weight: 400; font-size: 40px; margin-top: 150px; margin-bottom: 60px">
		자유게시판</h2>





	<div class="container">

		<form name="form1" method="post"
			action="${path}/freboard/freboardlist">
			
			
			<div class="form-group">
			<div class="col-sm-3">
			<select name="search_option" class="form-control">
			<!-- 
			<div class="form-group">
		<label for="kind" class="col-sm-2 control-label">종류</label>
		<div class="col-sm-10">
		<select name="kind" class="form-control id="kind">
			<option value="cpu">cpu</option>
			<option value="gpu">gpu</option>
			<option value="mainboard">mainboard</option>
			<option value="memory">memory</option>
			<option value="ssd">ssd</option>
		</select>
		</div>
		</div>
			 -->
			
			
			
			
			
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
					<div class="col-sm-9">
						<input name="keyword" value="${map.keyword}" class="form-control">
					</div>
					<div class="col-sm-3">
					<input type="submit" value="조회" class="btn btn-primary">
					</div>
						 
				</div>
			</div>
				
			<div style="text-align:right">
				<span style="color:red;">${map.count}</span>개의 게시물이 있습니다.
			</div> 
		</form>


		
		

		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th style="width: 10%">번호</th>
					<th style="width: 50%; text-align: center;">제목</th>
					<th style="width: 15%;">작성자</th>
					<th style="width: 15%;">날자</th>
					<th style="width: 20%">조회수</th>
				</tr>

			</thead>
			<c:forEach var="row" items="${map.list}">

				<tbody>

					<tr>
						<td>${row.fbno}</td>
						<td style="text-align: center">
							<!-- 검색이나페이지를 같이넘기는 이유는 페이지가 풀리지 않게 하기위함이다. 안그러면 페이지가 보이지 않는 상황발생 -->
							<a
							href="${path}/freboard/view?fbno=${row.fbno}&curPage=${map.pager.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">
								${row.title} </a> 
								<!-- 댓글의 갯수  --> 
								<c:if test="${row.cnt >0 }">
								<span style="color: red;">(${row.cnt})</span>
							</c:if>
						</td>
						<td>${row.uname }</td>
						<td><fmt:formatDate value="${row.regdate}"
								pattern="hh-MM-dd HH:mm:ss" /></td>

						<td>${row.viewcnt}</td>
					</tr>

				</tbody>

			</c:forEach>
			<tr>
		<td colspan="5" align="center">
			<c:if test="${pager.curBlock >1 }">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${pager.curBlock >1 }">
				<a href="javascript:list('${pager.prevPage}')">[이전]</a>
			</c:if>	
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == pager.curPage}">
						<span style="color:red">${num}</span>&nbsp;
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
		</td> 
	</tr>

		</table>
		<hr />
		<a href="#" class="btn btn-default pull-right" id="btnWrite">글쓰기</a>
		
	</div>



</body>
</html>