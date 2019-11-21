
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 테이블 -->

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>


table td img {
	width: 56px;
	hight: 56px;
}

#color {
	background-color: red;
}

#delivery_select li {
	margin-right: 25px;
	float: left;
}

ul {
	list-style: none;
}

#delivery_select label:hover {
	cursor: pointer;
}

#AddReceiveTelNumber {
	display: none;
}

#payment h2 {
	font-size: 17px;
	font-weight: bold;
	letter-spacing: -1px;
	color: #000000;
	margin: 0 0 5px 0 !important;
}

#payment ul {
	margin: 0;
	padding: 0;
}

#payment li {
	/* display: list-item; */
	text-align: -webkit-match-parent;
}

#paymentprice li {
	display: block !important;
}

#delivery td, #payment td{
	padding: 10px;
}
#message2 {
	display: none;
}

.subtitle{
	font-size:25px;
}

/* 테이블 */
.table-wrapper {
	background: #fff;
	margin: 0px 0;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	width: 100%;
}

.table-title {
	padding-bottom: 15px;
	background: #299be4;
	color: #fff;
	padding: 16px 30px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn {
	color: #566787;
	float: right;
	font-size: 13px;
	background: #fff;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn:hover, .table-title .btn:focus {
	color: #566787;
	background: #f2f2f2;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.settings {
	color: #2196F3;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
</style>
<%@ include file="../include/header.jsp"%>
<!-- 다음 api 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<script>




	function showPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때  실행할 코드를 작성하는 부분.
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 
						//이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						// 사용자가 도로명 주소를 선택했을 경우         
						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('post_code').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address2').focus();
					}
				}).open();
	}
	
	
		
	function addrecivetell(a) { //추가연락처 
		if (a.checked) {
			$("#AddReceiveTelNumber").show();
		} else {
			$("#AddReceiveTelNumber").hide();
		}
		;
	}
	function changepayment(num, th) { //결제방법 
		var payment = [ "신용카드", "무통장입금" ];
		var $paymenttop = $("#paymenttop");
		var $paymentcontents = $("#paymentcontents");
		var $ul = $paymentcontents.children();
		$("input[name=pay]").attr("value", "");
		$ul.html("");

		if (num == 0) {
			$(th).attr("value", "신용카드");
			var card = [ "bc카드", "국민카드" ];
			$paymenttop.html(payment[num]);

			var $li = $("<li>");
			var $select = $("<select>");
			$select.attr("name","cardtype");
			var text = document.createTextNode("카드선택");
			console.log(text);
			$li.append(text);
			for (var i = 0; i < card.length; i++) {
				
				var $option = $('<option>');
				$option.attr("value",card[i]);
				$option.html(card[i]);
				$select.append($option);
			}
			;
			var $li2 = $("<li>");
			$li2
					.html("구매자 : <input type='text' value='${sessionScope.loginuser.uname}' name='cardbuyer'/>");
			$li.append($select);
			$ul.append($li);
			$ul.append($li2);
			$paymentcontents.append($ul);
		}
		/* <div id="paymenttop">무통장입금</div>
		<div id="paymentcontents">
			<ul>
				<li>무통장 입금 
					<select>
						<option>은행선택</option>
						<option>국민은행</option>
						<option>신한은행</option>
					</select>
				</li>
				<li>
					입금자명 : <input type="text" value="${sessionScope.loginuser.uname}">
				</li>
			</ul>
		</div> */
		else if (num == 1) {
			$(th).attr("value", "무통장입금")
			var bank = [ "은행선택", "국민은행", "신한은행" ];
			$paymenttop.html(payment[num]);
			var $li = $("<li>");
			var $select = $("<select>");
			$select.attr("name","depositbank");
			var text = document.createTextNode("무통장입금");
			console.log(text);
			$li.append(text);
			for (var i = 0; i < bank.length; i++) {
				var $option = $('<option>')
				$option.html(bank[i]);
				$option.attr("value",bank[i]);
				$select.append($option);
			}
			;
			var $li2 = $("<li>");
			$li2
					.html("입금자명 : <input type='text' value='${sessionScope.loginuser.uname}' name='depositor'/>");
			$li.append($select);
			$ul.append($li);
			$ul.append($li2);
			$paymentcontents.append($ul);
		}

	};
	function getsum(){
		var sum=0;
		<c:forEach var="i" items="${ord_prd_info}">
		
		sum += ${i.sum};

		</c:forEach>
		return sum;
	}
	function paymentprice() {//총결제금액 
		var sum = getsum();
		var q = $("#paymentprice li:first-child span");
		q.html(sum + "원");
		
		sum=sum+2500;
		
		
		var $orderprice = $("#orderprice span");
		$orderprice.text(sum+"원");
		
		return sum;

	}

	$(function() {
		paymentprice();
		
		
		
		
		
		

	});
	
	function paymentcall(){
		
		var $orderprice = $("#orderprice span").html();  //결제금액 
		ordprice= $orderprice.substring(0,$orderprice.length-1);
		
		
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp17596829'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		if($("input:radio[name=paymenttype]:checked").val()=="신용카드"){
			console.log("aaa");
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : ordprice,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '${sessionScope.loginuser.uname}',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        console.log(rsp.vbank_num);
		        console.log(rsp.vbank_name);
		        
		        var $cardnum = $("<input type='hidden' name='cardnumber' value='"+rsp.apply_num+"'>")
		        
		        var $impuid = $("<input type='hidden' name='imp_uid' value='"+rsp.imp_uid+"'>")
		        console.log(msg);
		        $("#form1").append($cardnum);
		        $("#form1").append($impuid);
		        
		        $("#form1").submit(); 
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		    }
			    
			    
		    
		    
		    
		    
		    
		}); 
		
		}
		else if($("input:radio[name=paymenttype]:checked").val()=="무통장입금"){
			$("#form1").submit();
		}
		
		
	}
	
	
	function paymodal(){
		console.log("시작중");
		
		if($("input:radio[name=paymenttype]:checked").val() =='무통장결제'){
			
			$("#form1").submit();	
		}
		return;
		
			
			


	}

	
	
	function deliverymessage(message){//배송메시지
		
		if(message=="직접입력"){
			$("#message2").css("display","table-row");
			$("#message2").children("td:nth-child(2)").children().attr("name","message");
			$("#message1").removeAttr("name");
		} 
		else{
			$("#message2").css("display","none");
			$("#message1").attr("name","message");
			$("#message2").children("td:nth-child(2)").children().removeAttr("name"); 
			
		}
	}
	function allpointuse(th){//모든 포인트사용
		var $point =$("input[name=point]");
		var q = $("#paymentprice li:last-child span");
		var $orderprice = $("#orderprice span");
		var setpoint =0;  //포인트 금액 
		var setsum = getsum()+2500; //상풍총액
		if($(th).prop("checked")){
			q.text(${sessionScope.loginuser.point});
			$point.val(${sessionScope.loginuser.point});
			setpoint = ${sessionScope.loginuser.point};  //포인트전액사용 	
			
		}
		else{
			$point.val(0);
			q.text("0원");
			setpoint =0;  //포인트 사용 x
		}
		
		
		console.log((setsum-setpoint));
		$orderprice.text((setsum-setpoint)+"원");
		
	}
	
	
	
	
</script>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	
	<div style="padding : 100px 200px;">
	<form action="${path}/order/order_payment" method="get" id="form1">
		<div class="sectionbox">
			<div class="subtitle">주문목록</div>
			<div id="cartprdlist">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th></th>
							<th>상품명</th>
							<th>수량</th>
							<th>1개당가격</th>
							<th>총가격</th>

						</tr>
					</thead>

					<c:forEach var="i" items="${ord_prd_info}">
						<tr>
							<input type="hidden" name="productid" value="${i.productid}">
							<input type="hidden" name="qty" value="${i.qty}">
							<td><img src="${path}/images/${i.img}"></td>
							<td>${i.productname}</td>
							<td>${i.qty}개</td>
							<td>${i.price}</td>
							<td>${i.sum}</td>

						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
		<div class="sectionbox">
			<div class="subtitle">배송정보</div>
			<div id="delivery">
				<table border="2">
					<tr>
						<!-- <td>배송지 선택</td>
						<td>
							<ul id="delivery_select">

								<li><input type="radio" name="delivery" id="del1" /><label
									for="del1"> 최근주소 </label></li>
								<li><input type="radio" name="delivery" id="del2" /><label
									for="del2">회원정보와 동일</label></li>
								<li><input type="radio" name="delivery" id="del3" /><label
									for="del3">새로운 주소</label></li>
							</ul>
						</td>
 -->					</tr>

					<tr>
						<td>수령인</td>
						<td><input type="text"
							value="${sessionScope.loginuser.uname}" name="reciever"></td>

					</tr>
					<tr>
						<td>핸드폰번호</td>
						<td><select name="phonenumber">
								<option value='010'>010</option>
								<option value='011'>011</option>
								<option value='013'>013</option>
						</select> -&nbsp;<input type="text" size="3" name="phonenumber">&nbsp;-&nbsp;<input
							type="text" size="3" name="phonenumber"> <!-- <input
							type="checkbox" onclick="addrecivetell(this)"> 추가연락처 입력</td> -->

					</tr>
					<tr id="AddReceiveTelNumber">
						<td>추가 연락처</td>
						<td><select>
								<option>010</option>
								<option>011</option>
								<option>013</option>
						</select> -&nbsp;<input type="text" size="3">&nbsp;-&nbsp;<input
							type="text" size="3"></td>

					</tr>

					<tr>
						<td>배송지</td>
						<td>우편번호 : <input name="zipcode" id="post_code" readonly
							size="10" name="zipcode"> <input type="button"
							onclick="showPostcode()" value="우편번호 찾기"><br> 주소 : <input
							name="address1" id="address1" size="60"><br> 상세주소 :
							<input name="address2" id="address2">
						</td>

					</tr>
					<tr>
						<td>배송메시지</td>
						<td><select onchange="deliverymessage(this.value)"
							name="message" id="message1">
								<option>------배송메시지를 입력해주세요------</option>
								<option value="부재시 문앞에 두고 가주세요">부재시 문앞에 두고 가주세요</option>
								<option value="배송전에 연락주세요">배송전에 연락주세요</option>
								<option value="직접입력">직접입력</option>
						</select></td>
					</tr>
					<tr id="message2">
						<td></td>
						<td><input type="text"></td>
					</tr>

				</table>
			</div>
		</div>

		<div id="sectionbox">
			<div class="subtitle">결제정보</div>
			<div id="payment">
				<table border="2">
					<tr>
						<td>
							<h2>01.결제정보</h2>
							<ul>
								<li><label><input type="radio" name="paymenttype"
										onclick="changepayment(0,this)" value="신용카드"/>신용카드</label></li>
								<li><label><input type="radio" name="paymenttype"
										onclick="changepayment(1,this)" value="무통장입금">무통장입금</label></li>
							</ul>
						</td>
						<td id="paymentbox">
							<div>
								<div id="paymenttop"></div>
								<div id="paymentcontents">
									<ul>

									</ul>
								</div>
							</div>

						</td>
						<td rowspan="2" style="background-color: #DFE5F2; width: 300px; text-align:center">
							<h2>03. 결제금액</h2>
							<ul id="paymentprice" style="display: block important!;">
								<li>총주문금액 <span>원</span></li>
								<li>배송비 <span>2500원</span></li>
								<li>적립금 사용 <span>0원</span></li>
							</ul>

							<div id="orderprice" style="display: block important!;">
								총결제금액 <span>196500원</span>
							</div> <!-- id값이랑 onclick 값이 랑 같으면안됨 --> <input type="button"
							name="add" class="btn btn-warning"
							onclick="paymentcall();" value="결제하기"> <!-- <input type="submit" value="결제하기"> -->
						</td>
					</tr>
					<tr>
						<td><h2>02.할인정보</h2></td>
						<td>
							<ul>
								
								<li>기존적립근할인 : <input type="number" name="point" value="0"
									readonly> <input type="checkbox" id="pointuse"
									onclick="allpointuse(this);">모두사용
									(${sessionScope.loginuser.point}원 사용가능)
								</li>
							</ul>
						</td>
					</tr>

				</table>

			</div>
			
			
			
			
			



		</div>
	</form>
	

	
	</div>
</body>
</html>