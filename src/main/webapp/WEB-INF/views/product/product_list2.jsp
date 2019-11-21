<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>


<style>
#content{
	width:100%;
	height:700px;
}
#productcategory{
	display: inline-block;
	width:50%;
	height:500px;
	overflow-x:scroll;
	overflow-y:scroll;
	
}
#productwrap{
	padding-top:0px;
	margin-top:0px;
	display: inline-block;
	width:40%;
	height:500px;
	overflow-x:scroll;
	overflow-y:scroll;
}

#productlist td img{
	width:56px;
	hight:56px;
}
</style>

<script>


 // serializeObject()만들기 , 이것이 있어야 serializeObject()를 사용가능 즉 객체화해주는 함수를 만드는것이다. 
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
 
 
 
 //비동기식(ajax)를 사용해서 장바구니에 담기 
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
 
	$(function() {
		
		
		
		
		
		var productlist = $("#productlist");
		var selectcontainer = $("#selectcontainer");
		var cpuarray = {
			manufacturer : ["제조사", "인텔", "AMD" ],
			cpukinds : ["cpu종류", "코어i9-9세대", "코어i7-9세대", "코어i5-9세대", "라이젠 9", "라이젠 7",
					"라이젠 5" ],
			core : ["코어형태" ,"24코어", "16코어", "12코어", "8코어", "6코어" ],
			thread : ["쓰레드형태" ,"16쓰레드", "8쓰레드", "6쓰레드", "4쓰레드" ],
			builtingraphics : ["gpu유무" ,"내장존재", "내장없음" ]

		};
		var graphicarray = {
			manufacturer : ["제조사", "sapphire", "이템텍", "gigabyte" ],
			memory : ["메모리", "3gb", "6gb", "8gb" ],
			chipset: ["칫셋 ","gtx 1060","rx 570"]

		};

		function fun(attr) {
			

			selectcontainer.html("");
			productlist.html("");

			if (attr == "cpu") {
				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < cpuarray["manufacturer"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + cpuarray["manufacturer"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+cpuarray["manufacturer"][i]+"''>" + cpuarray["manufacturer"][i]
						+ "</option>");	
					}
					
				}

				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < cpuarray["cpukinds"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + cpuarray["cpukinds"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+cpuarray["cpukinds"][i]+"''>" + cpuarray["cpukinds"][i]
						+ "</option>");	
					}
					
					
				}
				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < cpuarray["core"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + cpuarray["core"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+cpuarray["core"][i]+"''>" + cpuarray["core"][i]
						+ "</option>");	
					}
					
				}
				
				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < cpuarray["thread"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + cpuarray["thread"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+cpuarray["thread"][i]+"''>" + cpuarray["thread"][i]
						+ "</option>");	
					}
					
				}
				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < cpuarray["builtingraphics"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + cpuarray["builtingraphics"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+cpuarray["builtingraphics"][i]+"''>" + cpuarray["builtingraphics"][i]
						+ "</option>");	
					}
					
				}
			} else if (attr == "gpu") {
				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < graphicarray["manufacturer"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + graphicarray["manufacturer"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+graphicarray["manufacturer"][i]+"''>" + graphicarray["manufacturer"][i]
						+ "</option>");	
					}
					
				}

				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < graphicarray["memory"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + graphicarray["memory"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+graphicarray['memory'][i]+"''>" + graphicarray["memory"][i]
						+ "</option>");	
					}
					
				}
				
				var select = $("<select>");
				$("#selectcontainer").append(select);
				for (var i = 0; i < graphicarray["chipset"].length; i++) {
					if(i==0){
						select.append("<option value=''>" + graphicarray["chipset"][i]
						+ "</option>");	
					}
					else{
						select.append("<option value='"+graphicarray['chipset'][i]+"''>" + graphicarray["chipset"][i]
						+ "</option>");	
					}
					
				}
				
			}
			
			function sumprice (){
				var sumprice = $("form").find("li").children("ul li div:nth-child(2)");
				
				 
				//.substring(sumprice[0].length-1,0) 
				
				var sum=0;
				for(var i=0; i<sumprice.length; i++){
					var sumprice_sub = sumprice[i].innerHTML.substring(sumprice[i].innerHTML.length-1,0);
					sum +=Number(sumprice_sub);
				} 
				var $input_sum_div = $("#product_sum").children("div");
				
				
				var $sumtext = $input_sum_div.children("span");
				$sumtext.html(sum);  //span에 가격 보여주기 
				$sumtext.append("<input type='hidden' value='"+sum+"' name='sum'>");  //input으로 총가격을 넘겨준다. 백엔드에서 사용	
				
				
				
				
				
			}
			
			function ajax(attr) {
				
				var sel = $("select");

				var data = new Object();
				
				if(attr=="cpu"){
					var key = [ "manufacturer", "cpukinds", "core", "thread","builtingraphics" ];	
				}
				else if(attr=="gpu"){
					var key = [ "manufacturer", "memory","chipset" ];	
				}
				
				
				
				
				data["kinds"] = attr;

				for (i = 0; i < sel.length; i++) {
					data[key[i]] = sel[i].value;
				}
						$.ajax({
							url : "${path}/product/product_list_selset",
							data : JSON.stringify(data),
							type : "post",
							contentType : 'application/json',
							dataType : "json",
							success : function(result) {
								var a1 = $("<table>");
								$(a1).appendTo(productlist);
								for (a in result) {

									var tr = $("<tr>");
									tr.appendTo(a1);

									for (i = 0; i < Object.keys(result[0]).length; i++) {
										var key = Object.keys(result[0])[i];
										var result1 = result[a];

										var td = $("<td>");
										td.appendTo(tr);
										if (key == "price") {
											td.html(result1[key] + "원");
										} else {

											if (key == "img") {
												td.html("<img src='${path}/images/"+result1[key]+"'>");
											}
											else if(key =="productname"){
												
												td.html("<a href='${path}/product/product_detail?productid="+result1['productid']+"'>"+result1[key]+"</a>");
												
											}
											else {
												td.html(result1[key]);
											}

										}

									}
									
									
									//additem 버튼 추가하기  , 상품 담기 삭제 구현
									var button = $("<button>");
									button.text("담기");
									button.addClass("add");
									
									button.click(function(e){//버튼을 찾고 그버튼의 부모를 찾아서 값을 가져온다
										
										var $targetbutton = $(e.target);
										var classname = $targetbutton.attr("class");
										
										//선택담기
										var $targettr = $targetbutton.parent("td").parent("tr");
										var $tds = $targettr.children("td");
										var productid = $tds.eq(0).text();
										var productname = $tds.eq(2).text();
										var productprice = $tds.eq(3).text();
										var productimg = $tds.children("img").attr("src"); //이미지경로 중 파일명 추출하기
										var productimg_sub = productimg.substring(productimg.indexOf("/images/")+8,productimg.length);
										
										
										var productprice = productprice.substring(productprice.length-1,0);
										console.log(productname);
										console.log(productprice);
										
										
										
										
										if(classname == "add"){  //class이름이 add 인경우 
											
											$targetbutton.removeClass("add");
											$targetbutton.addClass("remove");
											$targetbutton.html("삭제")
											
											
											
											
											var $select_list= $("#"+attr+"_select_list");
											console.log("<<<<<<<",$select_list);
											var $select_list_ul = $select_list.children("ul");
											
											var $li = $("<li>");
											var $div = $("<div>");
											$div.append("<input type='hidden' name= 'productid' value='"+productid+"'>");  //상품을 구별하기위해 id를 넣어준다.
											$div.append("<input type='hidden' name= 'productname' value='"+productname+"'>");  //상품을 구별하기위해 id를 넣어준다.
											$div.append(productname);
											$div.append("<input type='hidden' name='productimg' value='"+productimg_sub+"'>");
											$div.appendTo($li);
											var $div2 = $("<div>");
											$div2.html(productprice+"원");
											$div2.appendTo($li);
											var $div3 = $("<div>");
											
											var $input_qty =  $("<input type='number' name='qty' min='1' max='5' value=1>");
											
											
											$input_qty.on("change", function(e){
												/* var price = productprice.substring(productprice.length-1,0);	 */
												$div2.html($(e.target).val()*productprice+"원");
												
												sumprice();	
												
												
												
											});
											$div3.append($input_qty);
											
											
											$div3.appendTo($li);
											$select_list_ul.append($li);
											
											
											
											
											
											
										}
										else{// class이름이 remove 인경우  , form안의 input 태그중 값이 producid인것을 찾아서 그태그의 부모를 찾아서 제거한다. 
											var $productid_check;
											var $input_productid = $("form").find("input");
											
											for(var i =0; i<$input_productid.length; i++){
												
												if($input_productid[i].value == productid){
												
													$productid_check = $input_productid[i];
												}; 
											};
											
											var itemremove = $($productid_check).parent("div").parent("li");
											
											itemremove.remove();
											
											
											
											
											$targetbutton.removeClass("remove");
											$targetbutton.addClass("add");
											$targetbutton.html("추가");
											sumprice()  // 추가될때 합계 계산
											
										}
										sumprice();	
										
									});
									
									td.html(button);
								}
							}
						});

			};
			ajax(attr);

			$("select").on("change", function() {

				productlist.html("");
				ajax(attr);

			});
		}

		fun("cpu");

		$(".kinds").on("click", function(e) {
			var attr = $(this).attr("id");
			fun(attr);
		});
		$(".kind").css("display", "block");

	})
</script>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>상품목록 페이지</h2>
<body>
	

	<div id="content">
		<div id="productwrap">
			<div id="selectcontainer"></div>
			<div id="productlist"></div>
		</div>
		<div id="productcategory">
			<form action="${path}/order/order_information" method="post">
				<div>
					<div id="cpu_select_list">
						<a href="#" class="kinds" id="cpu">cpu</a><br>
						<ul></ul>
					</div>
					<div id="gpu_select_list">
						<a href="#" class="kinds" id="gpu">그래픽</a><br>
						<ul></ul>	
					</div>
				</div>
				<div id="product_sum">
					<div>총합계 : 
					<span id="span">
					0
					</span>원
					</div>
					<input type="submit" value="구매">
					<input type="button" value="장바구니" onclick="insertbasket()">
				</div>	
			</form>
		</div>
		
	</div>

	









</body>






</body>

</html>