<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- navbar  -->
<nav class="navbar navbar-inverse" style="margin-bottom:0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${path}">ComeShop</a>
    </div>
    <ul class="nav navbar-nav">
      <%-- <li class="active"><a href="${path}/lowsearch/lowsearchlist">최저가검색</a></li> --%>
      <li><a href="${path}/product/product_list.do" >상품목록</a></li>
	  <li><a href="${path}/mypage/mypage_main" >마이페이지</a></li>
	  <li><a href="${path}/order/basket" >장바구니</a></li>
	  <li><a href="${path}/freboard/freboardlist" >자유게시판</a></li>
	  <li><a href="${path}/usedboard/usedboardlist" >중고게시판</a></li>
	  
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <c:choose>
      <c:when test="${sessionScope.loginuser.uid == null}">
      <li><a href="${path}/member/login.do" >로그인</a></li>
      <li><a href="${path}/member/join.do" >회원가입</a></li>
      </c:when>
      <c:otherwise>
		<li><a href="#" >${sessionScope.loginuser.uid}</a></li>
		<li><a href="${path}/member/logout.do" >로그아웃</a></li>
	  </c:otherwise>
	  </c:choose>
    </ul>
  </div>
</nav>








	<%-- <div>
	<c:choose>
	
		<c:when test="${sessionScope.loginuser.uid == null}">	
			<a href="${path}/member/login.do" class="btn btn-primary">로그인</a>
			<a href="${path}/member/join.do" class="btn btn-primary">회원가입</a>
			
		</c:when>
		<c:otherwise>
			${sessionScope.loginuser.uid}님이 로그인 중입니다.
			<a href="${path}/member/logout.do" class="btn btn-primary">로그아웃</a>
		</c:otherwise>
	</c:choose>
	<a href="${path}/product/product_list.do" class="btn btn-primary">상품목록</a>
	<a href="${path}/mypage/mypage_main" class="btn btn-primary">마이페이지</a>
	</div>
	
 --%>

	



</body>
</html>