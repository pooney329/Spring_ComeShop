<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.example.Computer.model.member.dto.UserDTO" %> 

    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Nanum+Pen+Script|Sunflower:300&display=swap" rel="stylesheet">
</head>
<%@ include file="include/menu.jsp" %>
<style>
.wrap {
	width: 100%;
	position: relative;
	background: #7f7f7f;
	background-color: #ffb500;
	height: 60vh;
}

.align_center {
	width: 700px;
	height: 200px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -100px 0 0 -150px;
	text-align: center;
}

.main_title {
	font-size: 100px;
}

.w3-third {
	font-weight: 400;
	font-size: 20px;
}
</style>
<body>



<div class="wrap container">
    <div class="align_center container">
        <span class="main_title">COMESHOP</span> <br>
        <span style="text-align:right; font-size: 30px; color:#ff5d5e; font-family: 'Sunflower', sans-serif;">I order Hardware</span>
    </div>
</div>


<div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
    
    <p class="w3-opacity" style="font-size: 30px; font-family: 'Sunflower', sans-serif; margin-top: 20px; margin-bottom: 50px;"><i>컴숍의 목적</i></p>
    <p class="w3-justify" style="font-size: 30px; font-family: 'Nanum Pen Script', cursive;">자신의 컴퓨터 견적을 낼 수 있는 웹사이트로 하드웨어를 업그레이드가 필요 할 시 더 이상 판매자로 하여금 호환성 여부를 질문을 할 필요가 없어 많은 시간이 단축 될 수 있고 또한 제품을 주문 할 때 한 제품 당 다양한 가격대가 존재를 하는데 가격에 초점을 맞추어 가장 낮은 쇼핑몰을 추천을 하여 다양 한 쇼핑몰을 찾아야하는 노력을 줄 일 수 있습니다 더불어 사용자들이 자신의 정보를 공유할 수 있는 게시판 , 중고제품을 팔 수 있는 별도의 카테고리를 통하여 많은 사용자의 유입을 기대할 수 있습니다.  </p>
    <div class="w3-row w3-padding-32">
      <div class="w3-third">
        <p>하드웨어</p>
        <img src="${path}/images/hard.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:200px; height: 200px;">
      </div>
      <div class="w3-third">
        <p>최저가</p>
        <img src="${path}/images/low.jpg" alt="Random Name" style="width:200px; height: 200px;">
      </div>
      <div class="w3-third">
        <p>게시판</p>
        <img src="${path}/images/note.jpg" class="w3-round" alt="Random Name" style="width:200px; height: 200px;">
      </div>
    </div>
  </div>




	<div class="container" style="width: 100%; padding: 0px;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<a href="/computer/product/product_detail?productid=11"> <img
						src="${path}/images/ryzen5_3600.jpg"
						style="width: 100%; height: 500px;">
					</a>
				</div>
				<div class="item">
					<a href="/computer/product/product_detail?productid=13"><img
						src="${path}/images/SAPPHIRE 라데온 RX 570 PULSE Optimized OC D5 4GB Dual-X_img.jpg"
						style="width: 100%; height: 500px;"></a>

				</div>



				<div class="item">
					<a href="/computer/product/product_detail?productid=20"> <img
						src="${path}/images/ASRock B365M PRO4 에즈윈_img.jpg"
						style="width: 100%; height: 500px;">
					</a>

				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>



	<div id="test"></div>

</body>
</html>