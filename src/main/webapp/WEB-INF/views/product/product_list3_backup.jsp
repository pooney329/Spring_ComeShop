<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style>
#content {
	width: 100%;
	height: 700px;
	display: flex;
}

#productcategory {
	display: inline-block;
	width: 50%;
	height: 500px;
	overflow-x: scroll;
	overflow-y: scroll;
}

#productwrap {
	padding-top: 0;
	margin-top: 0;
	display: inline-block;
	width: 40%;
	height: 500px;
	
}
#productlist{
	height: 400px;
	overflow-x: scroll;
	overflow-y: scroll;
}

#productlist td img {
	width: 56px;
	height: 56px;
}

</style>
<script>
	var ordernum = 0;// 순서번호

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
					result[element.name] = [ node, element.value ]
				}
			} else {
				result[element.name] = element.value
			}
		}
		$.each(this.serializeArray(), extend)
		return result
	}
	// 비동기식(ajax)를 사용해서 장바구니에 담기
	function insertbasket() {
		if ("" == "${sessionScope.loginuser.uid}") {
			if (confirm("로그인이 필요합니다 로그인하시겠습니까?")) {
				location.href = "${path}/member/login.do";
			} else {
				return;
			}
		} else {
			var form = $("form").serializeObject();
			console.log(form);
			// jQuery.each(form, function(i, field){ console.log(field.value) });
			$.ajax({
				url : "${path}/order/insertbasket",
				data : JSON.stringify(form),
				type : "post",
				contentType : 'application/json',
				dataType : 'text',
				success : function(data, status, req) {
					console.log(data, ">>>>>>>>>>");
					console.log(status, "<<<<<<<<<<<<<<");
					if (confirm("장바구니로 이동하시겠습니까?")) {
						location.href = "${path}/order/basket"
					} else {
						return;
					}
				},
				error : function(error) {
					alert("Error!");
				}
			});
		}
	}
	$(
			function() {
				var productlist = $("#productlist");
				var selectcontainer = $("#selectcontainer");
				var cpuarray = {
					manufacturer : [ "제조사", "인텔", "AMD" ],
					cpukinds : [ "cpu종류", "코어i9-9세대", "코어i7-9세대", "코어i5-9세대",
							"라이젠 9", "라이젠 7", "라이젠 5" ],
					core : [ "코어형태", "24코어", "16코어", "12코어", "8코어", "6코어" ],
					thread : [ "쓰레드형태", "16쓰레드", "8쓰레드", "6쓰레드", "4쓰레드" ],
					builtingraphics : [ "gpu유무", "내장존재", "내장없음" ]
				};
				var graphicarray = {
					manufacturer : [ "제조사", "sapphire", "이템텍", "gigabyte" ],
					memory : [ "메모리", "3gb", "6gb", "8gb" ],
					chipset : [ "칫셋 ", "gtx 1060", "rx 570" ]
				};
				function fun(attr) {//fun시작
					selectcontainer.html("");
					productlist.html("");
					if (attr == "cpu") {
						var select = $("<select>");
						
						$("#selectcontainer").append(select);
						for (var i = 0; i < cpuarray["manufacturer"].length; i++) {
							if (i == 0) {
								select.append("<option value=''>"
										+ cpuarray["manufacturer"][i]
										+ "</option>");
							} else {
								select
										.append("<option value='" + cpuarray["manufacturer"][i] + "''>"
												+ cpuarray["manufacturer"][i]
												+ "</option>");
							}
						}
						var select = $("<select>");
						$("#selectcontainer").append(select);
						for (var i = 0; i < cpuarray["cpukinds"].length; i++) {
							if (i == 0) {
								select
										.append("<option value=''>"
												+ cpuarray["cpukinds"][i]
												+ "</option>");
							} else {
								select
										.append("<option value='" + cpuarray["cpukinds"][i] + "''>"
												+ cpuarray["cpukinds"][i]
												+ "</option>");
							}
						}
						var select = $("<select>");
						$("#selectcontainer").append(select);
						for (var i = 0; i < cpuarray["core"].length; i++) {
							if (i == 0) {
								select.append("<option value=''>"
										+ cpuarray["core"][i] + "</option>");
							} else {
								select
										.append("<option value='" + cpuarray["core"][i] + "''>"
												+ cpuarray["core"][i]
												+ "</option>");
							}
						}
						var select = $("<select>");
						$("#selectcontainer").append(select);
						for (var i = 0; i < cpuarray["thread"].length; i++) {
							if (i == 0) {
								select.append("<option value=''>"
										+ cpuarray["thread"][i] + "</option>");
							} else {
								select
										.append("<option value='" + cpuarray["thread"][i] + "''>"
												+ cpuarray["thread"][i]
												+ "</option>");
							}
						}
						var select = $("<select>");
						$("#selectcontainer").append(select);
						for (var i = 0; i < cpuarray["builtingraphics"].length; i++) {
							if (i == 0) {
								select.append("<option value=''>"
										+ cpuarray["builtingraphics"][i]
										+ "</option>");
							} else {
								select
										.append("<option value='" + cpuarray["builtingraphics"][i] + "''>"
												+ cpuarray["builtingraphics"][i]
												+ "</option>");
							}
						}
					} else if (attr == "gpu") {
						var select = $("<select>");
						$("#selectcontainer").append(select);
						for (var i = 0; i < graphicarray["manufacturer"].length; i++) {
							if (i == 0) {
								select.append("<option value=''>"
										+ graphicarray["manufacturer"][i]
										+ "</option>");
							} else {
								select
										.append("<option value='" + graphicarray["manufacturer"][i] + "''>"
												+ graphicarray["manufacturer"][i]
												+ "</option>");
							}
						}
						var select = $("<select>");
						$("#selectcontainer").append(select);
						for (var i = 0; i < graphicarray["memory"].length; i++) {
							if (i == 0) {
								select.append("<option value=''>"
										+ graphicarray["memory"][i]
										+ "</option>");
							} else {
								select
										.append("<option value='" + graphicarray['memory'][i] + "''>"
												+ graphicarray["memory"][i]
												+ "</option>");
							}
						}
						var select = $("<select>");
						$("#selectcontainer").append(select);
						for (var i = 0; i < graphicarray["chipset"].length; i++) {
							if (i == 0) {
								select.append("<option value=''>"
										+ graphicarray["chipset"][i]
										+ "</option>");
							} else {
								select
										.append("<option value='" + graphicarray['chipset'][i] + "''>"
												+ graphicarray["chipset"][i]
												+ "</option>");
							}
						}
					}
					function sumprice() {
						var sumprice = $("form").find("li").children(
								"ul li div:nth-child(2)");
						// .substring(sumprice[0].length-1,0)
						var sum = 0;
						for (var i = 0; i < sumprice.length; i++) {
							var sumprice_sub = sumprice[i].innerHTML.substring(
									sumprice[i].innerHTML.length - 1, 0);
							sum += Number(sumprice_sub);
						}
						var $input_sum_div = $("#product_sum").children("div");
						var $sumtext = $input_sum_div.children("span");
						$sumtext.html(sum); // span에 가격 보여주기
						$sumtext
								.append("<input type='hidden' value='" + sum + "' name='sum'>"); // input으로 총가격을 넘겨준다. 백엔드에서 사용
					}
					function ajax(attr,curpage) {  //ajax시작
						productlist.html("");
						var sel = $("select");
						var data = new Object();
						if (attr == "cpu") {
							var key = [ "manufacturer", "cpukinds", "core",
									"thread", "builtingraphics" ];
						} else if (attr == "gpu") {
							var key = [ "manufacturer", "memory", "chipset" ];
						}
						data["kinds"] = attr;
						data["curPage"] = curpage;
						for (i = 0; i < sel.length; i++) {
							data[key[i]] = sel[i].value;
						}
						$
								.ajax({
									url : "${path}/product/product_list_selset",
									data : JSON.stringify(data),
									type : "post",
									contentType : 'application/json',
									dataType : "json",
									success : function(result) {
										
										var a1 = $("<table>");
										$(a1).appendTo(productlist);
										for (a in result['selectdlist']) {
											
											var tr = $("<tr>");
											tr.appendTo(a1);
											for (i = 0; i < Object
													.keys(result['selectdlist'][0]).length; i++) {
												var key = Object
														.keys(result['selectdlist'][0])[i];
												var result1 = result['selectdlist'][a];
												var td = $("<td>");
												td.appendTo(tr);
												if (key == "price") {
													td.html(result1[key] + "원");
												} else {
													if (key == "img") {
														td
																.html("<img src='${path}/images/" + result1[key] + "'>");
													} else if (key == "productname") {
														td
																.html("<a href='${path}/product/product_detail?productid="
																		+ result1['productid']
																		+ "'>"
																		+ result1[key]
																		+ "</a>");
													} else {
														td.html(result1[key]);
													}
												}
											}
											// additem 버튼 추가하기  , 상품 담기 삭제 구현
											var button = $("<button>");
											button.text("담기");
											button.addClass("add");
											button
													.click(function(e) { // 버튼을 찾고 그버튼의 부모를 찾아서 값을 가져온다
														var $targetbutton = $(e.target);
														var classname = $targetbutton
																.attr("class");
														// 선택담기
														var $targettr = $targetbutton
																.parent("td")
																.parent("tr");
														var $tds = $targettr
																.children("td");
														var productid = $tds
																.eq(0).text();
														var productname = $tds
																.eq(2).text();
														var productprice = $tds
																.eq(3).text();
														var productimg = $tds
																.children("img")
																.attr("src"); // 이미지경로 중 파일명 추출하기
														var productimg_sub = productimg
																.substring(
																		productimg
																				.indexOf("/images/") + 8,
																		productimg.length);
														var productprice = productprice
																.substring(
																		productprice.length - 1,
																		0);
														console
																.log(productname);
														console
																.log(productprice);
														if (classname == "add") {// class이름이 add 인경우

															/* $.ajax({
																			url : "${path}/product/checkcompatibility",
																			data : JSON.stringify(form),
																			type : "post",
																			contentType : 'application/json',
																			dataType : "text",
																			success : function() {
																				alert("성공함");
																			},error: function(){
																				alert("에러남");
																			}
																		}); */

															$targetbutton
																	.removeClass("add");
															$targetbutton
																	.addClass("remove");
															$targetbutton
																	.html("삭제")
															var $select_list = $("#"
																	+ attr
																	+ "_select_list");

															var $select_list_ul = $select_list
																	.children("ul");
															var $li = $("<li>");
															var $div = $("<div>");
															$div
																	.append("<input type='hidden' name='ordernum' value='" + ordernum++ + "'>"); // 순서번호
															$div
																	.append("<input type='hidden' name= 'productid' value='" + productid + "'>"); // 상품을 구별하기위해 id를 넣어준다.
															$div
																	.append("<input type='hidden' name= 'productname' value='" + productname + "'>"); // 상품을 구별하기위해 id를 넣어준다.
															$div
																	.append(productname);
															$div
																	.append("<input type='hidden' name='productimg' value='" + productimg_sub + "'>");
															$div.appendTo($li);
															var $div2 = $("<div>");
															$div2
																	.html(productprice
																			+ "원");
															$div2.appendTo($li);
															var $div3 = $("<div>");
															var $input_qty = $("<input type='number' name='qty' min='1' max='5' value=1>");
															$input_qty
																	.on(
																			"change",
																			function(
																					e) { /* var price = productprice.substring(productprice.length-1,0);	 */
																				$div2
																						.html($(
																								e.target)
																								.val()
																								* productprice
																								+ "원");
																				sumprice();
																			});
															$div3
																	.append($input_qty);
															$div3.appendTo($li);
															$select_list_ul
																	.append($li);

															// 호환성여부검사
															if ($(
																	"#compatibility")
																	.is(
																			":checked") == true) {
																var form = $(
																		"form")
																		.serializeObject();
																console
																		.log(form);
																$
																		.ajax({
																			url : "${path}/product/checkcompatibility",
																			data : JSON
																					.stringify(form),
																			type : "post",
																			contentType : 'application/json',
																			dataType : "json",
																			success : function(
																					result) {
																				var check = result['check'];
																				if (check != null
																						&& typeof check != "undefined") {
																					var checkname = "";
																					check
																							.forEach(function(
																									item) {
																								checkname += item
																										+ "/";
																							});
																					alert(checkname);
																					$li
																							.remove();
																				}
																			},
																			error : function() {
																				alert("에러남");
																			}
																		});
															}
															//
														} else { // class이름이 remove 인경우  , form안의 input 태그중 값이 producid인것을 찾아서 그태그의 부모를 찾아서 제거한다.
															var $productid_check;
															var $input_productid = $(
																	"form")
																	.find(
																			"input");
															for (var i = 0; i < $input_productid.length; i++) {
																if ($input_productid[i].value == productid) {
																	$productid_check = $input_productid[i];
																}
																;
															}
															;
															var itemremove = $(
																	$productid_check)
																	.parent(
																			"div")
																	.parent(
																			"li");
															itemremove.remove();
															$targetbutton
																	.removeClass("remove");
															$targetbutton
																	.addClass("add");
															$targetbutton
																	.html("추가");
															sumprice() // 추가될때 합계 계산
														}
														sumprice();
													});
											td.html(button);
										}
										
										/* paging */
										$("#productpaging").html("");
										for(var i=result['page'].blockBegin; i<=result['page'].blockEnd; i++){
											if(result['page'].curPage==i){
												var page = $("<span style='color:red'>"+i+"</span>");	
											}
											else{
												var page = $("<a href='#'>"+i+"</a>");
												page.click(function(e){
													var selectpage = $(e.target);
													
													ajax(attr,Number(selectpage.html()));
												});
												
											}
											$("#productpaging").append(page);
											
											
										}
										
										
										
										
										
										
										
										
										
									}
									
								});
					}//ajax 끝 
					;
					ajax(attr,1);
					
					
					$("select").on("change", function() {
						productlist.html("");
						ajax(attr,1);
					});
				}//fun끝 
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
	<div class="fresh-table full-color-orange">
    <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange
            Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
    -->

        <div class="toolbar">
            <button id="alertBtn" class="btn btn-default">Alert</button>
        </div>

        <table id="fresh-table" class="table">
            <thead>
                <th data-field="id">ID</th>
            	<th data-field="name">Name</th>
            	<th data-field="salary">Salary</th>
            	<th data-field="country">Country</th>
            	<th data-field="city">City</th>
            	<th data-field="actions" data-formatter="operateFormatter" data-events="operateEvents">Actions</th>
            </thead>
            <tbody>
                <tr>
                	<td>1</td>
                	<td>Dakota Rice</td>
                	<td>$36,738</td>
                	<td>Niger</td>
                	<td>Oud-Turnhout</td>
                	<td></td>
                </tr>
                <tr>
                	<td>2</td>
                	<td>Minerva Hooper</td>
                	<td>$23,789</td>
                	<td>Curaçao</td>
                	<td>Sinaai-Waas</td>
                	<td></td>
                </tr>
                <tr>
                	<td>3</td>
                	<td>Sage Rodriguez</td>
                	<td>$56,142</td>
                	<td>Netherlands</td>
                	<td>Baileux</td>
                	<td></td>
                </tr>
                <tr>
                	<td>4</td>
                	<td>Philip Chaney</td>
                	<td>$38,735</td>
                	<td>Korea, South</td>
                	<td>Overland Park</td>
                	<td></td>
                </tr>
                <tr>
                	<td>5</td>
                	<td>Doris Greene</td>
                	<td>$63,542</td>
                	<td>Malawi</td>
                	<td>Feldkirchen in Kärnten</td>
                	<td></td>
                </tr>
                <tr>
                	<td>6</td>
                	<td>Mason Porter</td>
                	<td>$78,615</td>
                	<td>Chile</td>
                	<td>Gloucester</td>
                	<td></td>
                </tr>
                <tr>
                	<td>7</td>
                	<td>Alden Chen</td>
                	<td>$63,929</td>
                	<td>Finland</td>
                	<td>Gary</td>
                	<td></td>
                </tr>
                <tr>
                	<td>8</td>
                	<td>Colton Hodges</td>
                	<td>$93,961</td>
                	<td>Nicaragua</td>
                	<td>Delft</td>
                	<td></td>
                </tr>
                <tr>
                	<td>9</td>
                	<td>Illana Nelson</td>
                	<td>$56,142</td>
                	<td>Heard Island</td>
                	<td>Montone</td>
                	<td></td>
                </tr>
                <tr>
                	<td>10</td>
                	<td>Nicole Lane</td>
                	<td>$93,148</td>
                	<td>Cayman Islands</td>
                	<td>Cottbus</td>
                	<td></td>
                </tr>
                <tr>
                	<td>11</td>
                	<td>Chaim Saunders</td>
                	<td>$5,502</td>
                	<td>Romania</td>
                	<td>New Quay</td>
                	<td></td>
                </tr>
                <tr>
                	<td>12</td>
                	<td>Josiah Simon</td>
                	<td>$50,265</td>
                	<td>Christmas Island</td>
                	<td>Sint-Jans-Molenbeek</td>
                	<td></td>
                </tr>
                <tr>
                	<td>13</td>
                	<td>Ila Poole</td>
                	<td>$67,413</td>
                	<td>Montenegro</td>
                	<td>Pontevedra</td>
                	<td></td>
                </tr>
                <tr>
                	<td>14</td>
                	<td>Shana Mejia</td>
                	<td>$58,566</td>
                	<td>Afghanistan</td>
                	<td>Ballarat</td>
                	<td></td>
                </tr>
                <tr>
                	<td>15</td>
                	<td>Lana Ryan</td>
                	<td>$64,151</td>
                	<td>Martinique</td>
                	<td>Portobuffolè</td>
                	<td></td>
                </tr>
                <tr>
                	<td>16</td>
                	<td>Daquan Bender</td>
                	<td>$91,906</td>
                	<td>Sao Tome and Principe</td>
                	<td>Walhain-Saint-Paul</td>
                	<td></td>
                </tr>
                <tr>
                	<td>17</td>
                	<td>Connor Wagner</td>
                	<td>$86,537</td>
                	<td>Germany</td>
                	<td>Solihull</td>
                	<td></td>
                </tr>
                <tr>
                	<td>18</td>
                	<td>Boris Horton</td>
                	<td>$35,094</td>
                	<td>Laos</td>
                	<td>Saint-Mard</td>
                	<td></td>
                </tr>
                <tr>
                	<td>19</td>
                	<td>Winifred Ryan</td>
                	<td>$64,436</td>
                	<td>Ireland</td>
                	<td>Ronciglione</td>
                	<td></td>
                </tr>
            </tbody>
        </table>
    </div>
	
	
</body>
</body>
</html>