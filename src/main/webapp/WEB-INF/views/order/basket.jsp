<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="../include/table.css"/>
<style>

table td img {
	width: 56px;
	hight: 56px;
}

#color {
	background-color: red;
}

.bgimg-1 {
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	background-image: url(../images/computer-3308075_1920.jpg);
	min-height: 50vh;
}

.top_title {
	color: white;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
	padding-left: 30px;
	padding-right: 30px;
	font-size:50px;
}
input[type="number"]{
	width:70px;
}
.container-table100 {
	min-height: auto;
	padding: 0px 30px;
}
</style>
<script>




function totalprice(th){
	var $target = $(th);
	var $tr = $($target.parents("tr").children("td")[3]).children("input");
	if($target.prop("checked")){
		$tr.attr("name","qty");
		
	}
	else{
		
		$tr.attr("name","");
		
	}
	
	
	
	
	
	
	
	var $prd_ord_sum = $(".prd_ord_sum");
	var prd_ord_sum =0;
	for(var i=0; i<$prd_ord_sum.length; i++){
		
		if($($prd_ord_sum[i]).siblings()[0].children[0].checked){
			
			prd_ord_sum += Number($prd_ord_sum[i].innerText.substring($prd_ord_sum[i].innerText.length-1,0));	
		} 
		
		
		
	}
	
	
	$("#totalprice").children()[0].innerText = prd_ord_sum+"원";
}

	$(function(){
		totalprice();
		
		
		$("#checkall").on("click",function(){
			if($("#checkall").prop("checked")){
				$("input[name=productid]").prop("checked",true);
				$(".qty").attr("name","qty")		
				 	
			}
			else{
				$("input[name=productid]").prop("checked",false);
				
				$(".qty").attr("name","")
			}
			totalprice(); 
			
			
		});
		
		$(".qty").on("change",function(event){
			
			var $td = $(this).parent().siblings();
			var $qty = $(this).val();
			 
			var price = $td[3].innerText.substring($td[3].innerText.length-1,0);
			
			var sum = $td[4];
			
			//sum.innerHtml($qty*price+"원");
			sum.innerText=$qty*price+"원";
			
			
			totalprice();
			/* sum.innerText=$qty*price+"원";//제이쿼리 객체가 아님으로 Text()가 아니라 innerText()를 사용
			
			var $prd_ord_sum = $(".prd_ord_sum");
			var prd_ord_sum =0;
			for(var i=0; i<$prd_ord_sum.length; i++){
				prd_ord_sum += Number($prd_ord_sum[i].innerText.substring($prd_ord_sum[i].innerText.length-1,0));
			}
			$("#totalprice").children()[0].innerText = prd_ord_sum+"원"; */
			 
			
		});
	});

</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>


	<div class="bgimg-1" style="position: relative">
		<div class="top_title">장바구니</div>

	</div>

	<%-- <table>
	<c:forEach var="i" begin="0" end="${basketlist.size()-1}">
		<tr>
			<td><img src="${path}/images/${productimg[i]}"></td>
			<td>${productname[i]}</td>
			<td>${qty[i]}개</td>
			<c:if test="${i==0}">
			<td rowspan="${productid.size()}" id="color">배송비</td>
			</c:if>
		</tr>
	</c:forEach>
</table>
 --%>
	<form action="${path}/order/order_information" method="get">
		<div class="container-table100">
<div class="wrap-table100">
<div class="table100 ver1 m-b-110">
<div class="table100-head">
		
		<table>
			<tr>
				<th class="cell100 column2"><input type="checkbox" name="checkall" id="checkall"
					checked></td>
				<th class="cell100 column2">이미지</td>
				<th class="cell100 column2">제품명</td>
				<th class="cell100 column2">수량</td>
				<th class="cell100 column2">제품가격</td>
				<th class="cell100 column2">주문금액</td>
				<th class="cell100 column2"></td>
			</tr>
		</table>
		</div>
<div class="row100">
		<table>
				<c:forEach var="i" items="${basketlist}">
					<tr>

						<%-- <input type="hidden" value="${i.productid}" name="productid"> --%>
						<td class="cell100 column2">
						<input type="checkbox" name="productid" value="${i.productid}" checked onclick="totalprice(this);"></td>
						<td class="cell100 column2"><img src="${path}/images/${i.img}"></td>
						<td class="cell100 column2"> ${i.productname}</td>
						<td class="cell100 column2"><input type="number" name="qty" class="qty" value="${i.qty}"></td>
						<td class="cell100 column2">${i.price}원</td>
						<td class="prd_ord_sum cell100 column2">${i.sum}원</td>
						<td class="cell100 column2"><a
							href="${path}/order/deletebasket?productid=${i.productid}">삭제</a></td>

					</tr>
				</c:forEach>
		</table>
		</div>
		</div>
		</div>
		</div>
		<div id="totalprice" style="display:block; text-align:center;">총합계 : 
		<span style="font-size:30px;">
			<span>0원</span></span>
			<div style="text-align:center;">
			<input type="submit" value="구매" style="display: inline-block; background-color:#da524e;" class="btn btn-outline-danger">
			</div>
		</div>
		
		
	</form>




</body>
</html>