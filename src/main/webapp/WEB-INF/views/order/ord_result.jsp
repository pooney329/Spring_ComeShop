<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style>
#content_left {
	background-color: #f7f7f7;
	width: 30%
}

#content_right {
	background-color: #e8e8e8	;	
	width: 70%
}

#content_top_r {
	background-color: #fefefe	;	

	
}

table {
	width:100%;
	height: 200px;
}

ul {
	list-style: none;
	margin:0;
	padding:0;
}
.content{
	padding : 20px 300px;
}
td{
	padding:50px;
	font-size:20px;
	text-align:center;
}
h2{
	text-align:center;
	margin-top:100px;
	margin-bottom:100px;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
<H2> 주문이 정상적으로 완료되었습니다 </H2>
<div class="content">
	<table>
		<tr>
			<td rowspan="2" id="content_left">주문번호<br>(${ordinfo.orderid})</td>
			<td id="content_right">총 결제금액 <span>${ordinfo.sumprice+ordinfo.point}</span></td>
		<tr>
			<td id="content_top_r">
				<ul> 
					<li>${paymenttype} ${ordinfo.sumprice}</li>
					<li>적립금 사용 ${ordinfo.point}</li>
					<c:if test="${paymenttype == '무통장입금'}">
					<li>입금계좌 ${ordinfo.depositbank} 015-25-0043-448 </li>
					</c:if>
				</ul>
			</td>
		</tr>
	</table>
	<div style="text-align:right;">
	<button class="btn btn-danger">쇼핑계속하기</button><button onclick="location.href='${path}/mypage/mypage_main'" class="btn btn-primary">구매내역확인하기</button>
	</div>
</div>
</body>
</html>