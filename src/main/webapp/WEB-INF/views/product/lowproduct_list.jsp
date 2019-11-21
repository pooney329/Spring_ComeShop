<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style>
	* {
            box-sizing: border-box;
        }

        ul {
            list-style: none;
            margin: 0;
            padding: 0;
            
        }

        .category_wrap {
            display: inline-block;
            
            width: 50%;
            height: 100%;
        }

       .lowproductlsit {
            display: inline-block;
            width: 50%;
            height: 100%;
            float: right;
        }
       .shop_content{
            height: 300px;
            display : flex;
        }
</style>
<script>

	
	
		var cpuarray = {
			manufacturer : [ "제조사", "인텔", "AMD" ],
			cpukinds : [ "cpu종류", "코어i9-9세대", "코어i7-9세대", "코어i5-9세대", "라이젠 9",
					"라이젠 7", "라이젠 5" ],
			core : [ "코어형태", "24코어", "16코어", "12코어", "8코어", "6코어" ],
			thread : [ "쓰레드형태", "16쓰레드", "8쓰레드", "6쓰레드", "4쓰레드" ],
			builtingraphics : [ "gpu유무", "내장존재", "내장없음" ]
		};
		var graphicarray = {
			manufacturer : [ "제조사", "sapphire", "이템텍", "gigabyte" ],
			memory : [ "메모리", "3gb", "6gb", "8gb" ],
			chipset : [ "칫셋 ", "gtx 1060", "rx 570" ]
		};
		
		function changeoption(num){
			if(num=="cpu"){
				alert("cpu");
				
			}
			else if(num=="gpu"){
				alert("gpu");
			}
			
		}
		
		
		
		
	
</script>


</head>
<body>

<%@ include file="../include/menu.jsp"%>
	<h2>상품목록 페이지</h2>
<body>


	<div class="shop_content">
		<div class="category_wrap">
			<ul>
				<li><a href="#" onclick="changeoption('cpu');">cpu</a></li>
				<li><a href="#" onclick="changeoption(2);">메인보드</a></li>
				<li><a href="#" onclick="changeoption('gpu');">그래픽카드</a></li>
				<li><a href="#" onclick="changeoption(4);">하드디스크</a></li>
			</ul>
		</div>
		<div class="lowproductlsit">
		
		</div>

	</div>

</body>
</html>