<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="../include/table.css" />
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
	background: #ef5350;
	margin: 10px 30px;
	margin-top: 30px;
	padding: 20px;
	border-radius: 30px;
	color: white;
}

.info {
	padding-top: 0px !important;
}

th.column2 {
	padding: 18px;
}

.container-table100 {
	min-height: auto;
	padding: 0px 30px;
}

.order_title {
	font-size: 30px;
	padding: 0px 30px
}

body {
	background: linear-gradient(45deg, #49a09d, #5f2c82);
}
</style>
<script>
	$(function() {
		$(".container-table100").css({
			"background" : "none"
		});
	});
</script>
</head>
<body>
	<h2>주문/배송 현황</h2>
	<div>
		<div class="order_title">주문상품</div>

		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver3 m-b-110">

					<div class="table100-head">
						<table border="1">
							<tr clsss="row100 head">
								<th class="cell100 column2">주문정보
								</td>
								<th class="cell100 column1">상품정보
								</td>
								<th class="cell100 column2">상품금액
								</td>
								<th class="cell100 column2">상태
								</td>
							</tr>
						</table>
					</div>
					<div class="row100">
						<table>

							<c:forEach var="i" items="${order_read}" varStatus="status">


								<tr>
									<c:if test="${status.index==0}">
										<td rowspan="${order_read.size()}" class="cell100 column2">
											<!--날짜가 String이여서 Date로 바꾸고 이후 형변환 진행한다 --> <fmt:parseDate
												var="toDay_D" value="${i.orderdate}"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${toDay_D}" pattern="yyyy-MM-dd" /> <span
											style="border: 1px solid #81a0c0; padding: 2px 5px 3px 5px; margin: 5px 0; display: block">${i.orderid}</span>
										</td>
									</c:if>

									<td class="cell100 column1">${i.productname }
										<div
											style="border-top: 1px dotted #ddd; margin-top: 10px; padding: 5px 0; font-size: 11px;">${i.price}원
											/ 수량 : ${i.qty}</div>
									</td>
									<td class="cell100 column2">${i.price*i.qty}</td>
									<c:if test="${status.index==0}">
										<td rowspan="${order_read.size()}" class="cell100 column2">${i.processingstatus }</td>
									</c:if>
								</tr>
							</c:forEach>

						</table>

					</div>
				</div>
			</div>
		</div>


		<div class="order_title">주문자정보</div>
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver3 m-b-110 info">

					<div class="row100">

						<table border="1">
							<tr>
								<th class="cell100 column2">주문자정보
								</td>
								<td colspan="3">${sessionScope.loginuser.uname}</td>
							</tr>
							<tr>
								<th class="cell100 column2">연락처
								</td>
								<td>${sessionScope.loginuser.phonenumber}</td>
								<th class="cell100 column2">이메일 주소
								</td>
								<td>${sessionScope.loginuser.email}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="order_title">배송정보</div>
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver3 m-b-110 info">

					<div class="row100">

						<table border="1">
							<tr>
								<th class="cell100 column2">받는사람</td>
								<td colspan="3">${order_read[0].reciever}</td>
							</tr>

							<tr>
								<th class="cell100 column2">주소</td>
								<td colspan="3">${order_read[0].address1}
									${order_read[0].address2}</td>
							</tr>
							<tr>
								<th class="cell100 column2">연락처</td>
								<td>${order_read[0].phonenumber}</td>
								<th class="cell100 column2">추가 연락처</td>
								<td>---</td>

							</tr>
							<tr>
								<th class="cell100 column2">배송요청사항</td>
								<td colspan="3">${order_read[0].message}</td>
							</tr>

						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="order_title">결제정보</div>
		<div style="float: left; width: 100%; padding:0px 30px;">
			<div style="width: 40%; float: left">
				
				<div class="table100 ver3 m-b-110 info">

					<div class="row100">
				
				<table width="40%" height="200px;" border="1">
					<tbody>
						<tr>
							<th>주문금액</th>
							<td>${order_read[0].sumprice -2500 + order_read[0].usepoint}</td>

						</tr>
						<tr>
							<th>할인금액</th>
							<td>
								<ul>
									<li>적립금 사용 &nbsp; -${order_read[0].usepoint}</li>
									

								</ul>

							</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>+2,500원</td>
						</tr>
						<tr>
							<th style="border-top: 1px solid #b1b1b1">총 결제금액</th>
							<td style="border-top: 1px solid #b1b1b1;">${order_read[0].sumprice}</td>
						</tr>
					</tbody>
				</table>
				</div>
				</div>
				
			</div>
			
			
			
			
			<div style="width: 60%; float: right">
				<div class="table100 ver3 m-b-110 info">

					<div class="row100">
				
				<table width="60%" height="222" border="1">
					<tbody>
						<tr>
							<th width="85">결제방법</th>
							<td style="position: relative">

								<p style="margin: 15px 0 10px;">
									<span class="blue16B" style="">${order_read[0].paymenttype}</span>
								</p>
								
								
								
								
								
																	<c:choose>
									 
									    <c:when test="${order_read[0].paymenttype eq '신용카드'}">
									    
									    	<p>
												<span style="width: 80px; float: left">·&nbsp;카드사</span> <span>${order_read[0].cardtype}
												</span>
											</p>
											
											<p>
												<span style="width: 80px; float: left">·&nbsp;승인번호</span> <span>${order_read[0].cardnumber}
												</span>
											</p>
											<p>
												<span style="width: 80px; float: left">·&nbsp;구매자</span><span>${order_read[0].cardbuyer}</span>
											</p>
								
									        
									    </c:when>
									 
									    <c:when test="${order_read[0].paymenttype eq '무통장입금'}">
												<p>
													<span style="width: 80px; float: left">·&nbsp;입금계좌</span> <span>${order_read[0].depositbank} 015-25-0043-448
													</span>
												</p>
												<p>
													<span style="width: 80px; float: left">·&nbsp;예금주</span><span>컴숍</span>
												</p>
												<p>
													<span style="width: 80px; float: left">·&nbsp;진행상태</span><span>
														<span class="red12B">${order_read[0].processingstatus}</span>
													</span>
												</p>
											</c:when>
									 
									    <c:otherwise>
									        
									    </c:otherwise>
									 
									</c:choose>



								
								
								
							




							</td>
						</tr>
					</tbody>
				</table>
				</div>
				</div>
			</div>




		</div>

	</div>
</body>
</html>