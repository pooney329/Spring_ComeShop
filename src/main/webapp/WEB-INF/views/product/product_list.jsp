<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<!-- 테이블 -->

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#content {
	width: 100%;
	height: 700px;
	display: flex;
	padding: 0 30px;
}

#productcategory {
	display: inline-block;
	position: relative;
	width: 100%;
	height: 90%;
	text-align:center;
	overflow-x: scroll;
	overflow-y: scroll;
}


/* cpu,그래픽등 카테고리  */
.select_list a {
	display: block;	
	background-color: #553de8;
	height: 50px;
	font-size:30px;
	padding-top:auto;
	padding-bottom:auto;
	border-radius: 17px;
	color:black;
	text-decoration:none;
}

.select_list div{
	padding : 0 30px;
	border-radius: 17px;
}

#productwrap {
	padding-top: 0;
	margin-top: 0;
	display: inline-block;
	width: 60%;
	height: 500px;
}

#productlist {
	height: 600px;
	width: 100%;
	overflow-x: scroll;
	overflow-y: scroll;
}

#productlist td img {
	width: 56px;
	height: 56px;
}

#content-right{
	width:40%;
	height: 100%
}

#product_sum{
	height: 10%;
	right:10px;
	text-align:right;
	
	
}
#product_sum div:first-child{
	color:#553de8;
	font-size:20px;
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

/* 검색폼 */
.box {
	margin: 100px auto;
	width: 300px;
	height: 50px;
}

.container-1 {
	width: 300px;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
}

.container-1 input#search {
	width: 300px;
	height: 50px;
	background: #2b303b;
	border: none;
	font-size: 10pt;
	float: left;
	color: #63717f;
	padding-left: 45px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.container-1 input#search::-webkit-input-placeholder {
	color: #65737e;
}

.container-1 input#search:-moz-placeholder { /* Firefox 18- */
	color: #65737e;
}

.container-1 input#search::-moz-placeholder { /* Firefox 19+ */
	color: #65737e;
}

.container-1 input#search:-ms-input-placeholder {
	color: #65737e;
}

.container-1 .icon {
	position: absolute;
	top: 50%;
	right: 0px;
	margin-right: 17px; margin-top : 17px;
	z-index: 1;
	color: #4f5b66;
	margin-top: 17px;
}

li{
list-style: none;
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
//페이지 이동시 담은상품 유지하기 
function disable_add(){
	var $select_num =$(".select_list div ul li div input[name='productid']");
	var $productid = $(".productid");
	
	for(var i=0; i < $select_num.length; i++){
		for(var j=0; j< $productid.length; j++){
			if( $productid[j].value==$select_num[i].value){
				console.log($productid[j]);
				var td = $($productid[j]).parent().nextAll()[5];
				var $button = $(td).children();
				$button.attr("class","remove");
				$button.text("삭제");
				
			}
		}
	}
	
	
}
$(function(){
			
/* 호환성체크박스디자인 */
$('.button-checkbox').each(function () {
	// Settings
       var $widget = $(this),
           $button = $widget.find('button'),
           $checkbox = $widget.find('input:checkbox'),
           color = $button.data('color'),
           settings = {
               on: {
                   icon: 'glyphicon glyphicon-check'
               },
               off: {
                   icon: 'glyphicon glyphicon-unchecked'
               }
           };

       // Event Handlers
       $button.on('click', function () {
           $checkbox.prop('checked', !$checkbox.is(':checked'));
           $checkbox.triggerHandler('change');
           updateDisplay();
       });
       $checkbox.on('change', function () {
           updateDisplay();
       });

       // Actions
       function updateDisplay() {
           var isChecked = $checkbox.is(':checked');
		// Set the button's state
           $button.data('state', (isChecked) ? "on" : "off");
		// Set the button's icon
           $button.find('.state-icon').removeClass().addClass('state-icon ' + settings[$button.data('state')].icon);
		// Update the button's color
           if (isChecked) {
               $button.removeClass('btn-default').addClass('btn-' + color + ' active');
           }
           else {
               $button.removeClass('btn-' + color + ' active').addClass('btn-default');
           }
       }
	// Initialization
       function init() {
		updateDisplay();
		// Inject the icon if applicable
           if ($button.find('.state-icon').length == 0) {
               $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
           }
       }
       init();
});
/* 호환성체크박스디자인끝 */
		
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
var ssdarray = {
		manufacturer : [ "제조사", "삼성전자", "마이크론", "Western Digital" ,"Seagate","ADATA","GIGABYTE"],
		capacity : [ "디스크 용량", "240GB", "256GB", "500GB","1TB" ],
		producttype : [ "제품분류", "내장형SSD","SSD/HDD 주변기기", "산업용SSD" ],
		memorytype : [ "메모리 타입 ", "MLC(토글)", "MLC(기타)","TLC(토글)","TLC(기타)","QLC","SLC"]
};
var mainboardarray = {
		manufacturer : [ "제조사", "ASRock", "ASUS", "MSI" ,"GIGABYTE","BIOSTAR","NVIDIA","이엠텍"],
		producttype : [ "제품분류", "인텔 CPU용 ","AMD CPU용", "임베디드","주변기기" ],
		memorytype : [ "메모리 종류 ", "DDR4", "DDR3","DDR3/DDR3L","DDR3/DDR2","DDR2","DDR2/DDR"],
		memoryslot : [ "메모리 슬롯", "5개 이상", "4개", "3개","2개 이하" ],
		memorycapacity : [ "메모리 슬롯", " 최대 128GB 이상", "최대 64GB", "최대 48GB","최대 32GB","최대 24GB","최대 16GB","최대 12GB","최대 8GB","최대 4GB","최대 2GB" ],
		graphicoutput : [ "그래픽 출력", "D-SUB", "DVI", "HDMI","DP" ],
};
var memoryarray = {
		manufacturer : [ "제조사", "삼성전자", "ADATA", "G.SKILL" ,"GeIL","TeamGroup","ACPI","GIGABYTE"],
		memorytype : [ "제품분류", "DDR4","DDR3", "DDR","DDR2","RDRAM" ],
		producttype : [ "사용장치 ", "PC용", "노트북용","서버용","프린터용","라우터용"],
		memorycapacity : [ "메모리 용량", "32GB", "16GB", "8GB","4GB" ],
		clock : [ "메모리 슬롯", "3200MHz", "3000MHz", "2666MHz","2400MHz","2133MHz"]
};
function fun(attr) {//fun시작
	selectcontainer.html("");
	productlist.html("");
	if (attr == "cpu") {
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < cpuarray["manufacturer"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ cpuarray["manufacturer"][i]+ "</option>");
			} else {
				select.append("<option value='" + cpuarray["manufacturer"][i] + "'>"+ cpuarray["manufacturer"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < cpuarray["cpukinds"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ cpuarray["cpukinds"][i]+ "</option>");
			} else {
				select.append("<option value='" + cpuarray["cpukinds"][i] + "'>"+ cpuarray["cpukinds"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < cpuarray["core"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ cpuarray["core"][i] + "</option>");
			} else {
				select.append("<option value='" + cpuarray["core"][i] + "'>"+ cpuarray["core"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < cpuarray["thread"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ cpuarray["thread"][i] + "</option>");
			} else {
				select.append("<option value='" + cpuarray["thread"][i] + "'>"+ cpuarray["thread"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < cpuarray["builtingraphics"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+cpuarray["builtingraphics"][i]+ "</option>");
			} else {
				select.append("<option value='" + cpuarray["builtingraphics"][i] + "'>"+ cpuarray["builtingraphics"][i]+ "</option>");
			}
		}
	} else if (attr == "gpu") {
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < graphicarray["manufacturer"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ graphicarray["manufacturer"][i]+ "</option>");
			} else {
				select.append("<option value='" + graphicarray["manufacturer"][i] + "'>"+ graphicarray["manufacturer"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < graphicarray["memory"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ graphicarray["memory"][i]+ "</option>");
			} else {
				select.append("<option value='" + graphicarray['memory'][i] + "'>"+ graphicarray["memory"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < graphicarray["chipset"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ graphicarray["chipset"][i]+ "</option>");
			} else {
				select.append("<option value='" + graphicarray['chipset'][i] + "'>"+ graphicarray["chipset"][i]+ "</option>");
			}
		}
	}else if (attr == "ssd") {
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < ssdarray["manufacturer"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ ssdarray["manufacturer"][i]+ "</option>");
			} else {
				select.append("<option value='" + ssdarray["manufacturer"][i] + "'>"+ ssdarray["manufacturer"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < ssdarray["producttype"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ ssdarray["producttype"][i]+ "</option>");
			} else {
				select.append("<option value='" + ssdarray['producttype'][i] + "'>"+ ssdarray["producttype"][i]+ "</option>");
			}
		}
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < ssdarray["capacity"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ ssdarray["capacity"][i]+ "</option>");
			} else {
				select.append("<option value='" + ssdarray['capacity'][i] + "'>"+ ssdarray["capacity"][i]+ "</option>");
			}
		}
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < ssdarray["memorytype"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ ssdarray["memorytype"][i]+ "</option>");
			} else {
				select.append("<option value='" + ssdarray['memorytype'][i] + "'>"+ ssdarray["memorytype"][i]+ "</option>");
			}
		}
	}
	
	else if (attr == "mainboard") {
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < mainboardarray["manufacturer"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ mainboardarray["manufacturer"][i]+ "</option>");
			} else {
				select.append("<option value='" + mainboardarray["manufacturer"][i] + "'>"
								+ mainboardarray["manufacturer"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < mainboardarray["producttype"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ mainboardarray["producttype"][i]+ "</option>");
			} else {
				select.append("<option value='" + mainboardarray['producttype'][i] + "'>"+ mainboardarray["producttype"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < mainboardarray["memorytype"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ mainboardarray["memorytype"][i]+ "</option>");
			} else {
				select.append("<option value='" + mainboardarray['memorytype'][i] + "'>"+ mainboardarray["memorytype"][i]+ "</option>");
			}
		}
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < mainboardarray["memoryslot"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ mainboardarray["memoryslot"][i]+ "</option>");
			} else {
				select.append("<option value='" + mainboardarray['memoryslot'][i] + "'>"+ mainboardarray["memoryslot"][i]+ "</option>");
			}
		}
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < mainboardarray["memorycapacity"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ mainboardarray["memorycapacity"][i]+ "</option>");
			} else {
				select.append("<option value='" + mainboardarray['memorycapacity'][i] + "'>"+ mainboardarray["memorycapacity"][i]+ "</option>");
			}
		}
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < mainboardarray["graphicoutput"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ mainboardarray["graphicoutput"][i]+ "</option>");
			} else {
				select.append("<option value='" + mainboardarray['graphicoutput'][i] + "'>"+ mainboardarray["graphicoutput"][i]+ "</option>");
			}
		}
		
	}
	else if (attr == "memory") {
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < memoryarray["manufacturer"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ memoryarray["manufacturer"][i]+ "</option>");
			} else {
				select.append("<option value='" + memoryarray["manufacturer"][i] + "'>"+ memoryarray["manufacturer"][i]+ "</option>");
			}
		}
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < memoryarray["memorytype"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ memoryarray["memorytype"][i]+ "</option>");
			} else {
				select.append("<option value='" + memoryarray['memorytype'][i] + "'>"+ memoryarray["memorytype"][i]+ "</option>");
			}
		}
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < memoryarray["producttype"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ memoryarray["producttype"][i]+ "</option>");
			} else {
				select.append("<option value='" + memoryarray['producttype'][i] + "'>"+ memoryarray["producttype"][i]+ "</option>");
			}
		}
		
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < memoryarray["memorycapacity"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ memoryarray["memorycapacity"][i]+ "</option>");
			} else {
				select.append("<option value='" + memoryarray['memorycapacity'][i] + "'>"+ memoryarray["memorycapacity"][i]+ "</option>");
			}
		}
		
		var select = $("<select>");
		$("#selectcontainer").append(select);
		for (var i = 0; i < memoryarray["clock"].length; i++) {
			if (i == 0) {
				select.append("<option value=''>"+ memoryarray["clock"][i]+ "</option>");
			} else {
				select.append("<option value='" + memoryarray['clock'][i] + "'>"+ memoryarray["clock"][i]+ "</option>");
			}
		}
	}
	function sumprice() {  //총합계 보여주기
		var sumprice = $("form").find("li").children("ul li div:nth-child(2)");
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
		} 
		else if (attr == "gpu") {
			var key = [ "manufacturer", "memory", "chipset" ];
		}
		else if (attr == "ssd") {
			var key = [ "manufacturer", "producttype", "capacity" ,"memorytype"];
		}
		else if (attr == "mainboard") {
			var key = [ "manufacturer", "producttype", "memorytype" ,"memoryslot","memorycapacity","graphicoutput"];
		}
		else if (attr == "memory") {
			var key = [ "manufacturer", "memorytype", "producttype" ,"memorycapacity","clock"];
		}
		data["kinds"] = attr;
		data["curPage"] = curpage;
		for (i = 0; i < sel.length; i++) {
			data[key[i]] = "%"+sel[i].value+"%";
		}
		$.ajax({
			url : "${path}/product/product_list_selset",
			data : JSON.stringify(data),
			type : "post",
			contentType : 'application/json',
			dataType : "json",
			async:false,
			success : function(result) {
				
				var a1 = $("<table>");
				a1.addClass("table table-striped table-hover");
				$(a1).appendTo(productlist);
				for (a in result['selectdlist']) {
					var tr = $("<tr>");
					tr.appendTo(a1);
					for (i = 0; i < Object.keys(result['selectdlist'][0]).length; i++) {
						var key = Object.keys(result['selectdlist'][0])[i];
						if(key !="shippingfee" && key !="standard" &&key !="shipping"){
							var result1 = result['selectdlist'][a];
							var td = $("<td>");
							td.appendTo(tr);
							if (key == "price") {
								td.html(result1[key] + "원");
							} 
							else {
								if(key == "img") {
									td.html("<img src='${path}/images/" + result1[key] + "' class='avatar'>");
								} 
								else if (key == "productname") {
									td.html("<a href='${path}/product/product_detail?productid="+ result1['productid']+ "'>"+ result1[key]+ "</a>");
								} else if( key == 'productid'){
									td.html("<input type='hidden' class='productid' value='"+result1[key]+"'>" + result1[key]);	
								} 	
								else {
									td.html(result1[key]);	
								}
							}
						}
					}
					// additem 버튼 추가하기  , 상품 담기 삭제 구현
					var button = $("<button>");
					button.text("담기");
					button.addClass("add");
					button.click(function(e) { // 버튼을 찾고 그버튼의 부모를 찾아서 값을 가져온다
								var $targetbutton = $(e.target);
								var classname = $targetbutton.attr("class");
								// 선택담기
								var $targettr = $targetbutton.parent("td").parent("tr");
								var $tds = $targettr.children("td");
								var productid = $tds.eq(0).text();
								var productname = $tds.eq(2).text();
								var productprice = $tds.eq(3).text();
								var productimg = $tds.children("img").attr("src"); // 이미지경로 중 파일명 추출하기
								var productimg_sub = productimg.substring(productimg.indexOf("/images/") + 8,productimg.length);
								var productprice = productprice.substring(productprice.length - 1,0);
								console.log(productname);
								console.log(productprice);
								if (classname == "add") {// class이름이 add 인경우
									$targetbutton.removeClass("add");
									$targetbutton.addClass("remove");
									$targetbutton.html("삭제")
									var $select_list = $("#"+ attr+ "_select_list");
									var $select_list_ul = $select_list.children("ul");
									var $li = $("<li>");
									var $div = $("<div>");
									$div.append("<input type='hidden' name='ordernum' value='" + ordernum++ + "'>"); // 순서번호
									$div.append("<input type='hidden' name= 'productid' value='" + productid + "'>"); // 상품을 구별하기위해 id를 넣어준다.
									$div.append("<input type='hidden' name= 'productname' value='" + productname + "'>"); // 상품을 구별하기위해 id를 넣어준다.
									$div.append(productname);
									$div.append("<input type='hidden' name='productimg' value='" + productimg_sub + "'>");
									$deletebutton = $("<button>x</button>");
									$deletebutton.addClass("btn btn-primary");
									
									$deletebutton.click(function(e){
										$li.remove();
										$targetbutton.removeClass("remove");
										$targetbutton.html("담기")
										sumprice();
									});
									$div.append($deletebutton);
									$div.appendTo($li);
									var $div2 = $("<div>");
									$div2.html(productprice+ "원");
									$div2.appendTo($li);
									var $div3 = $("<div>");
									var $input_qty = $("<input type='number' name='qty' min='1' max='5' value=1>");
									$input_qty.on("change",function(e) { /* var price = productprice.substring(productprice.length-1,0);	 */
										$div2.html($(e.target).val()* productprice+ "원");
										sumprice();
									});
									$div3.append($input_qty);
									$div3.appendTo($li);
									$select_list_ul.append($li);

									// 호환성여부검사
									if ($("#compatibility").is(":checked") == true) {
										var form = $("form").serializeObject();
										console.log(form);
										$.ajax({
											url : "${path}/product/checkcompatibility",
											data : JSON.stringify(form),
											type : "post",
											contentType : 'application/json',
											dataType : "json",
											success : function(result) {
												var check = result['check'];
												if (check != null&& typeof check != "undefined") {
													var checkname = "";
													check.forEach(function(item) {
															checkname += item+ "/";
													});
													alert(checkname);
													$li.remove();
													sumprice();
												}
											},
											error : function() {
												alert("에러남");
											}
										});
									}
									
								}
								else{ // class이름이 remove 인경우  , form안의 input 태그중 값이 producid인것을 찾아서 그태그의 부모를 찾아서 제거한다.
									var $productid_check;
									var $input_productid = $("form").find("input");
									for (var i = 0; i < $input_productid.length; i++) {
										if ($input_productid[i].value == productid) {
											$productid_check = $input_productid[i];
										};
									};
									var itemremove = $($productid_check).parent("div").parent("li");
									itemremove.remove();
									$targetbutton.removeClass("remove");
									$targetbutton.addClass("add");
									$targetbutton.html("담기");
									sumprice(); // 추가될때 합계 계산
								}
								sumprice();
							});
					td.html(button);
				}
				/* 페이징 */
				$("#productpaging").html("");
				var $pagin_ul = $("<ul>");
				$pagin_ul.addClass("pagination");
				$("#productpaging").append($pagin_ul);
				for(var i=result['page'].blockBegin; i<=result['page'].blockEnd; i++){
					var $li = $("<li>");
					$li.addClass("page-item");
					if(result['page'].curPage==i){
						var page = $("<span style='color:red'>"+i+"</span>");
						$li.addClass("active");	
					}
					else{
						var page = $("<a href='#'>"+i+"</a>");
						page.click(function(e){
							var selectpage = $(e.target);
							ajax(attr,Number(selectpage.html()));
						});
					}
					$li.append(page);
					$pagin_ul.append($li);
				}
			}
		})
		disable_add();	
	}//ajax 끝
	//검색창
	function search(keyword,curpage) {  //ajax시작
		console.log(keyword);
		productlist.html("");
		var data = new Object();
		data['keyword'] = keyword;
		data['curPage'] = curpage;
		$.ajax({
					url : "${path}/product/product_search",
					data : JSON.stringify(data),
					type : "post",
					contentType : 'application/json',
					dataType : "json",
					async:false,
					success : function(result) {
						var a1 = $("<table>");
						a1.addClass("table table-striped table-hover");
						$(a1).appendTo(productlist);
						for (a in result['selectdlist']) {
							attr = result['selectdlist'][a].kinds;
							var tr = $("<tr>");
							tr.appendTo(a1);
							for (i = 0; i < Object.keys(result['selectdlist'][0]).length; i++) {
								var key = Object.keys(result['selectdlist'][0])[i];
								if(key !="shippingfee" && key !="standard" &&key !="shipping"){
									var result1 = result['selectdlist'][a];
									var td = $("<td>");
									td.appendTo(tr);
									if (key == "price") {
										td.html(result1[key] + "원");
									}else {
										if (key == "img") {
											td.html("<img src='${path}/images/" + result1[key] + "' class='avatar'>");
										}else if (key == "productname") {
											td.html("<a href='${path}/product/product_detail?productid="+ result1['productid']+ "'>"+ result1[key]+ "</a>");
										}
										else if( key == 'productid'){
											td.html("<input type='hidden' class='productid' value='"+result1[key]+"'>" + result1[key]);	
										} 	
										else {
											td.html(result1[key]);	
										}
									}
								}
							}
							// additem 버튼 추가하기  , 상품 담기 삭제 구현
							var button = $("<button>");
							button.text("담기");
							button.addClass("add");
							button.click(function(e) { // 버튼을 찾고 그버튼의 부모를 찾아서 값을 가져온다
										var $targetbutton = $(e.target);
										var classname = $targetbutton.attr("class");
										// 선택담기
										var $targettr = $targetbutton.parent("td").parent("tr");
										var $tds = $targettr.children("td");
										var productid = $tds.eq(0).text();
										var productname = $tds.eq(2).text();
										var productprice = $tds.eq(3).text();
										var productimg = $tds.children("img").attr("src"); // 이미지경로 중 파일명 추출하기
										var productimg_sub = productimg.substring(productimg.indexOf("/images/") + 8,productimg.length);
										var productprice = productprice.substring(productprice.length - 1,0);
										if (classname == "add") {// class이름이 add 인경우
											$targetbutton.removeClass("add");
											$targetbutton.addClass("remove");
											$targetbutton.html("삭제")
											var $select_list = $("#"+ attr+ "_select_list");
											var $select_list_ul = $select_list.children("ul");
											var $li = $("<li>");
											var $div = $("<div>");
											$div.append("<input type='hidden' name='ordernum' value='" + ordernum++ + "'>"); // 순서번호
											$div.append("<input type='hidden' name= 'productid' value='" + productid + "'>"); // 상품을 구별하기위해 id를 넣어준다.
											$div.append("<input type='hidden' name= 'productname' value='" + productname + "'>"); // 상품을 구별하기위해 id를 넣어준다.
											$div.append(productname);
											$div.append("<input type='hidden' name='productimg' value='" + productimg_sub + "'>");
											$deletebutton = $("<button class='btn btn-primary'>x</button>");
											$deletebutton.click(function(e){
												$li.remove();
												$targetbutton.removeClass("add");
												$targetbutton.html("담기")
											});
											$div.append($deletebutton);
											$div.appendTo($li);
											var $div2 = $("<div>");
											$div2.html(productprice+ "원");
											$div2.appendTo($li);
											var $div3 = $("<div>");
											var $input_qty = $("<input type='number' name='qty' min='1' max='5' value=1>");
											$input_qty.on("change",function(e) {
																$div2.html($(e.target).val()* productprice+ "원");
																sumprice();
											});
											$div3.append($input_qty);
											$div3.appendTo($li);
											$select_list_ul.append($li);
											// 호환성여부검사
											if ($("#compatibility").is(":checked") == true) {
												var form = $("form").serializeObject();
												$.ajax({
															url : "${path}/product/checkcompatibility",
															data : JSON.stringify(form),
															type : "post",
															contentType : 'application/json',
															
															dataType : "json",
															success : function(result) {
																var check = result['check'];
																console.log("된다.");
																if (check != null && typeof check != "undefined") {
																	var checkname = "";
																	check.forEach(function(item) {
																		checkname += item+ "/";
																	});
																	alert(checkname);
																	$li.remove();
																	sumprice();																				
																}
																sumprice();
															},
															error : function() {
																alert("에러남");
															}
												});
											}
											
										} 
										else { // class이름이 remove 인경우  , form안의 input 태그중 값이 producid인것을 찾아서 그태그의 부모를 찾아서 제거한다.
											var $productid_check;
											var $input_productid = $("form").find("input");
											for (var i = 0; i < $input_productid.length; i++) {
												if ($input_productid[i].value == productid) {
													$productid_check = $input_productid[i];
												};
											};
											var itemremove = $($productid_check).parent("div").parent("li");
											itemremove.remove();
											$targetbutton.removeClass("remove");
											$targetbutton.addClass("add");
											$targetbutton.html("담기");
											sumprice() // 추가될때 합계 계산
										}
										sumprice();
									});
							td.html(button);
						}
						
						/* 페이징 */
						$("#productpaging").html("");
						var $pagin_ul = $("<ul>");
						$pagin_ul.addClass("pagination");
						$("#productpaging").append($pagin_ul);
						for(var i=result['page'].blockBegin; i<=result['page'].blockEnd; i++){
							var $li = $("<li>");
							$li.addClass("page-item");
							if(result['page'].curPage==i){
								var page = $("<span style='color:red'>"+i+"</span>");
								$li.addClass("active");	
								
							}
							else{
								var page = $("<a href='#'>"+i+"</a>");
								page.click(function(e){
									var selectpage = $(e.target);
									search(keyword,Number(selectpage.html()));
								});
								
							}
							$li.append(page);
							$pagin_ul.append($li);
						}
					}
				})
				 disable_add();
	};
	ajax(attr,1);
	$("select").on("change", function() {
		productlist.html("");
		ajax(attr,1);
	});
	
	//검색창 엔터키 
	$("#search").keypress(function (e) {
        if (e.which == 13){
        	search(e.target.value,1);	  
    	}
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
	<div id="content">
		<!-- 왼쪽 -->
		<div id="productwrap">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-5">
							<h2>
								<b>상품목록</b>
							</h2>
						</div>
						<div class="col-sm-7">

							<div class="container-1">
								<span class="icon"><i class="fa fa-search"></i></span> <input
									type="search" id="search" placeholder="Search..." />
							</div>
						</div>
					</div>
				</div>
				<div id="selectcontainer"></div>
				<div id="productlist"></div>
				<div id="productpaging" class="clearfix"></div>
			</div>
		</div>
		<!-- 오른쪽 -->
		<div id="content-right">
			<div id="productcategory">
				<form action="${path}/order/order_information" method="post"
					name="form">
					<div class="select_list">
					<span class="button-checkbox">
				        <button type="button" class="btn btn-lg" data-color="primary">호환성여부</button>
				        <input type="checkbox" class="hidden"   name="compatibility" id="compatibility"/>
				    </span>
						<div id="cpu_select_list">
							<a href="#" class="kinds" id="cpu">cpu</a> <br>
							<ul></ul>
						</div>
						<div id="gpu_select_list">
							<a href="#" class="kinds" id="gpu">그래픽</a> <br>
							<ul></ul>
						</div>
						<div id="ssd_select_list">
							<a href="#" class="kinds" id="ssd">SSD</a> <br>
							<ul></ul>
						</div>
						<div id="mainboard_select_list">
							<a href="#" class="kinds" id="mainboard">mainboard</a> <br>
							<ul></ul>
						</div>
						<div id="memory_select_list">
							<a href="#" class="kinds" id="memory">memory</a> <br>
							<ul></ul>
						</div>
						
					</div>
			</div>
			<div id="product_sum">
						<div>
							총합계 : <span id="span"> 0 </span>원
						</div>
						<input type="submit" value="구매" class="btn btn-default btn-warning"> <input type="button"
							value="장바구니" onclick="insertbasket()" class="btn btn-default btn-info">
					</div>
			</form>
		</div>
	</div>
</body>
</body>
</html>