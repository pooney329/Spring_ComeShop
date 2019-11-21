<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="../include/table.css"/>
</head>
<body>
<%@ include file="../include/menu.jsp" %>






<script>
function list(page){
	location.href="${path}/mypage/mypage_main?curPage="+page;
}
function order_read(orderid){
	  window.open("${path}/mypage/order_read?orderid="+orderid , "newWindow", "width=930, height=700, scrollbar=yes");
	  
}
function orderremove(orderid){
	$ordremoveform = $("#ordremoveform");
	$ordremoveform.children("input[name='orderid']");
	$ordremoveform.attr("method", "post");   
	$ordremoveform.attr("action", "${path}/order/orderremove");
	$ordremoveform.submit();   
	
}

</script>

<style>
table,th{
		text-align:center;
}

</style>
<h2>현재진행중인 my주문정보</h2>
<div class="container-table100">
<div class="wrap-table100">
<div class="table100 ver1 m-b-110">
<div class="table100-head">
<table border="1">
	<tr clsss="row100 head">
		<th class="cell100 column2">주문일/주문번호</th>
		<th class="cell100 column2" style="width:5%">수령자</th>
		<th class="cell100 column3">상품정보</th>
		<th class="cell100 column2" style="width:5%">결제금액</th>
		<th class="cell100 column2">진행상태</th>
	</tr>
</table>	
</div>
<div class="row100">
<table>
	<c:forEach var="j" items="${orderlist}">
		 
		
			
				<tr>
					<td class="cell100 column2">
						 ${j.orderdate}<br>
						 ${j.orderid}
						 <form id="ordremoveform">
						 	<input type="hidden" name="orderid" value="${j.orderid}">
						 	<input type="hidden" name="impuid" value="${j.impuid}">
						 </form>
						 <a href="javascript:orderremove('${j.impuid}')">주문삭제</a>
					</td>
					<td class="cell100 column2" style="width:5%">
						 ${j.reciever}
					</td>
					<td class="cell100 column3">
					<a href="javascript:order_read('${j.orderid}')"> ${j.productname}
						 <c:if test="${j.cnt>1}">
						 	<span style="color:red;">(외 ${j.cnt} 건)</span>
						 </c:if> </a>
						 
					</td>
					<td class="cell100 column2" style="width:5%">
						 ${j.sumprice}
					</td>
					<td class="cell100 column2">
						${j.processingstatus}
					</td>
				</tr>
	</c:forEach>
	<if: test="${page.totPage != 0}">
	 
	
	<tr>
		
		<td colspan="5" align="center">
			<c:if test="${page.curBlock >1 }">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${page.curBlock >1 }">
				<a href="javascript:list('${page.prevPage}')">[이전]</a>
			</c:if>	
			<c:forEach var="num" begin="${page.blockBegin}" end="${page.blockEnd}">
				<c:choose>
					<c:when test="${num == page.curPage}">
						<span style="color:red">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.curBlock < page.totBlock}">
				
				<a href="javascript:list('${page.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${page.curPage < page.totPage}">
				<a href="javascript:list('${page.totPage}')">[끝]</a>
			</c:if>
		</td> 
		
	</tr>
	</if:>
	<c:if test="${page.totPage == 0}">
		<tr>
			<div style="padding:200px; font-size:30px; text-align:center;"> 주문한 정보가 없습니다 </div>
		</tr>
	</c:if>
	
</table>
</div>
</div>
</div>
</div>
<div style="height:5000px;"></div>

</body>
</html>