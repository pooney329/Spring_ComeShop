<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style>
body{
	padding:0 50px;
}
#top {
	width: 100%;
	height: 500px;
}

#product_img img {
	width: 100%;
	height: 100%;
}

#product_img {
	width: 100%;
	height: 100%;
}

#product_detail_left {
	width: 50%;
	height: 100%;
	float: left;
}

#product_detail_right {
	
	float: right;
	width: 50%;
	height: 100%;
}
#price_inner, #delivery_inner{
	display:inline-block;
	padding-left:200px;
}

#product_price span, #product_delivery span{
	
	font-size: 18px;
}
#product_price{
	text-align:center;
	padding : 30px;
}

#product_delivery{
	text-align:center;
	padding : 30px;

}
#product_name{
	height:100px;
	font-size:20px;
	font-weight:bold;
	padding: 80px;
}
#product_header{
	padding:30px;
	text-align:right;
}
#product_result{
	position: relative;
	
}
#product_buyprice{
	float:right;
	font-size:20px;
	color:#ff4a4a;
}	
#product_result{
	padding : 20px;
	background-color : #323232;
	color:white;
}
#qty , #product_result button{
	color:black;
}
.choice{
	width:100%;
	padding-top:0px;
	
}
.choice button{
	float:left;
	
	width:20%;
	height:50px;
}
.prd_info img{
	width:100%;
}
.bg-color{
	background-color:#808080;
	color:white;
}

</style>



<script>
function add(){
	var qty = Number($("#qty").val());
	qty+=1;
	$("#qty").val(qty);
	
	$("#product_result span").html(${productdetail.price}*qty);
}

function sub(){
	var qty = Number($("#qty").val());
	qty+=-1;
	$("#qty").val(qty);
	$("#product_result span").html(${productdetail.price}*qty);
	
}
//serializeObject()만들기 , 이것이 있어야 serializeObject()를 사용가능 즉 객체화해주는 함수를 만드는것이다. 
$.fn.serializeObject = function() {
		  "use strict"
		  var result = {}
		  var extend = function(i, element) {
		    var node = result[element.name]
		    if ("undefined" !== typeof node && node !== null) {
		      if ($.isArray(node)) {
		        node.push(element.value)
		      } else {
		        result[element.name] = [node, element.value]
		      }
		    } else {
		      result[element.name] = element.value
		    }
		  }
	
		  $.each(this.serializeArray(), extend)
		  return result
		} 
function insertbasket(){
	
	
	if(""=="${sessionScope.loginuser.uid}"){
 		if(confirm("로그인이 필요합니다 로그인하시겠습니까?")){
 			location.href="${path}/member/login.do";	
 		}
 		else{
 			return;
 		}
 	}
 	else{
 		var form = $("form").serializeObject();
		console.log(form);
		//jQuery.each(form, function(i, field){ console.log(field.value) });
		
		 $.ajax({
			url : "${path}/order/insertbasket",
			data : JSON.stringify(form),
			type : "post",
			contentType : 'application/json',
	        dataType: 'text',
			success : function(data,status,req) {
				console.log(data,">>>>>>>>>>");
				console.log(status,"<<<<<<<<<<<<<<");
				
				
				if(confirm("장바구니로 이동하시겠습니까?")){
					location.href="${path}/order/basket"
				}else{
					return;
				}
			},
			 error : function(error) {
			        alert("Error!");
			    }

		}); 
 	}
	
} 



</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
	
	<div ic="content">
		<div id="top">
			<div id="product_name">
				${productdetail.productname}
			</div>
			<div id="product_detail_left">
				<div id="product_img">
					<img src="${path}/images/${productdetail.img}">
				</div>
	
			</div>
			<div id="product_detail_right">
				<form method="post" action="${path}/order/order_information" id="form1">
					<div id="product_header" class="bg-color">
						<span>상품번호 : ${productdetail.productid}</span>
						<input type="hidden" value="${productdetail.productid}" name="productid">
					</div>
					
					<div id="product_price">
						<span>판매가 </span><div id="price_inner"> ${productdetail.price}원 </div>
					</div>
					<div id="product_delivery" class="bg-color"> 
						<span>배송비</span><div id="delivery_inner">2500원</div>
						<%-- ${productdetail.shipping} --%> 
					</div>
					<div id="product_result">
						<p>수량</p>
						<button type="button" onclick="add();">+</button><input type="text" size="1" value="1" id="qty" name="qty"><button type="button" onclick="sub();">-</button> <div id="product_buyprice"><span>${productdetail.price}</span>원</div>
					</div>
					<div style="text-align:right;">
						
						<button type="submit" form="form1" value="Submit" class="btn btn-danger">구매</button>
						
						<button type="button" onclick="insertbasket();" class="btn btn-primary">담기</button>
						
						
					</div>						 
				</form>
			
									
			</div>
		</div>
		<div class="prd_info">
			<img src="${path}/images/${productdetail.information}">
		</div>
	</div>
	
	


</body>
</html>