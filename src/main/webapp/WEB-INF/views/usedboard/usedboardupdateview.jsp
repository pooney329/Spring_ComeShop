<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
<!-- ckeditor의 라이브러리 -->
<script src="${path}/ckeditor/ckeditor.js"></script>


<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c19819360e58f7b833caaf8f1aafeca&libraries=services"></script>


<script>


var keywordserach;
var showmap;  //직거래 선택시 지도열기
var closemap;//택배거래선택시 지도닫기
$(function(){
	$(".searchmap" ).toggle( 'slow' );  //페이지들어오면 지도 없애기
	
	 
/* 카카오지도 */
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	
	//글을 게시할때 직거래로 지정한경우 수정시 해당 위치를 변경하지 않으면 이값그대로 다시 돌려주어야한다.
var left = $("<input type='hidden' class='positions' name='leftposition' value='${dto.leftposition}'>");
    var right = $("<input type='hidden' class='positions' name='rightposition' value='${dto.rightposition}'>"); 
    $("#form1 .location").append(left);
    $("#form1 .location").append(right);
    
    
if(${dto.leftposition}==0){
	var left = 37.86958227995236;
	var right = 127.15617504649477;
	
}
else{
	var left = ${dto.leftposition};
	var right = ${dto.rightposition};
}
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(left ,right), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
   };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
// 키워드로 장소를 검색합니다
keywordserach = function(){
	var keyword = $("#search").val();
	ps.keywordSearch(keyword, placesSearchCB);	
	marker.setMap(null );
}
// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
		console.log(data);
        for (var i=0; i<data.length; i++) {
	        //displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    marker.setMap(map);
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px; text-align:center;">위치지정</div>');
        infowindow.open(map, marker);
    });
    if($(".positions").length){
    	$(".positions").remove(); 
    	
    	
    }
    else{
    	console.log($(".positions").length);
    	
    }
    var left = $("<input type='hidden' class='positions' name='leftposition' value='"+latlng.getLat()+"'>");
    var right = $("<input type='hidden' class='positions' name='rightposition' value='"+latlng.getLng()+"'>"); 
    $("#form1 .location").html(left);
    $("#form1 .location").append(right);
    console.log($(".positions"));
	var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
});	
	
	/* 카카오지도 끝*/

	
	$("#btnSave").click(function(){
		document.form1.action="${path}/usedboard/usedboardupdate";
		document.form1.submit();
	});
	$(".fileDrop").on("dragenter dragover",function(e){
		//기본 효과 막음
		e.preventDefault();
	});
	//태그.on("이벤트", "자손태그", 이벤트핸들러)
	//data : "fileName"+$(this).attr("data-src")
	//태그.attr("속성")
	//$('#userid').attr("type")
	//첨부파일 삭제 함수
	$(".picture").on("click","button",function(event){
		
		var that=$(this); //현재 클릭한  span태그
		
		$.ajax({
			url: "${path}/upload/deleteFile",
			type: "post",
			data: {
				fileName: $(this).attr("data-src")
			},
			dataType: "text",
			success: function(result){
				if(result=="deleted"){
					that.parent("div").remove();  //클릭한 span태그가 속한 div제거
				}
			}
		});
	});
	
	
	/* 썸네일 넣어주기 */
	var fileInfo=getFileInfo('${dto.img}');
	var str="";
	str="<div><a href='${path}/upload/displayFile?fileName="
		+getImageLink('${dto.img}')+"'>";
	str+="<img src='${path}/upload/displayFile?fileName=${dto.img}'></a>"; 
		
	str+="<button type='button' data-src='${dto.img}' class='btn btn-primary'>삭제</button>"; 
	
	str+="<input type='hidden' class='file' name='file' value='"
		+fileInfo.fullName+"'></div>";
	$("#uploadedList").html(str);

	
	
	
	
});

function getOriginalName(fileName){
	if(checkImageType(fileName)){ //이미지 파일이면 skip
		return;
	}
	var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름
	return fileName.substr(idx);
}
function getImageLink(fileName){
	if(!checkImageType(fileName)){//이미지 파일이 아니면 skip
		return;
	}
	//이미지 파일이면 
	var front=fileName.substr(0,12);//연월일 경로 추출
	var end=fileName.substr(14);// s_ 제거
	return front+end;
}
function checkImageType(fileName){
	//i : ignore case (대소문자 무관)
	var pattern=/jpg|png|jpeg/i; //정규표현식
	return fileName.match(pattern); //규칙에 맞으면 true
}



function uploadFile(){
	
	//e.preventDefault();
	//첫번째 첨부파일
	var fileObject =  document.getElementById("file"); 
	var file= fileObject.files[0]
	
	
	//폼 데이터에 첨부파일 추가
	var formData=new FormData();
	formData.append("file",file);
	$.ajax({
		type: "post",
		url: "${path}/upload/uploadAjax",
		data: formData,
		dataType: "text",
		processData: false,
		contentType: false,
		success: function(data,status,req){
			console.log("data:"+data); //업로드된 파일 이름
			console.log("status:"+status); //성공,실패 여부
			console.log("req:"+req.status);//요청코드값
			var fileInfo=getFileInfo(data);
			var str="";
			if(checkImageType(data)){ //이미지 파일일 경우
str="<div><a href='${path}/upload/displayFile?fileName="
	+getImageLink(data)+"'>";
str+="<img src='${path}/upload/displayFile?fileName="
	+data+"'></a>"; 
			}else{ //이미지가 아닌 경우
				str="<div>";
str+="<a href='${path}/upload/displayFile?fileName="
	+data+"'>"+getOriginalName(data)+"</a>";
			}
			str+="<button type='button' data-src="+data+" class='btn btn-primary'>삭제</button>"; 
			
			
			
			str+="<input type='hidden' class='file' name='file' value='"
				+fileInfo.fullName+"'></div>";
			$("#uploadedList").html(str);
			
			
			
			
			
		}
	});
	
	
	
	
	/* // 라디오버튼 클릭시 이벤트 발생
    $(".tradechoice").click(function(){
 		console.log("aaaa");
        if($("input[name=trade]:checked").val() == "직거래"){
            //$("input:radio[name=text]").attr("disabled",false);
             	conosole.log("직거래")
 
        }else if($("input[name=radio]:checked").val() == "택배거래"){
              //$("input:text[name=text]").attr("disabled",true);
              conosole.log("택배거래")
        }
    }); */
    
    
    	
    }
    
showmap=function(th){
	var target=th;
	
	if($(target).hasClass("showingmap")){
		 
		 
		 
	}
	else{
		 $(target).addClass("showingmap");
		 $(".searchmap" ).toggle( 'slow' );
		
		
	}
}
	
closemap=function(th){
	 $(".shmap").removeClass("showingmap");
	 $(".searchmap" ).hide();
	 var left2 = $("<input type='hidden' class='positions' name='leftposition' value='0'>");
 	console.log(left2+"aaaa");
     var right2 = $("<input type='hidden' class='positions' name='rightposition' value='0'>"); 
     $("#form1 .location").html(left2);
     $("#form1 .location").append(right2);
     console.log($(".positions").length);
	 //$(".positions").remove();
	
	
}	
	
		





</script>

<style>
#uploadedList{
	width:100%;
	height:100%;

}

#uploadedList img{
	
	width:100%;
	height:300px;

}
#uploadedList button{
	display:block;
	width:100%;
}

 .btn-file{
            position: relative;
            overflow: hidden;
        }
        .btn-file input[type=file] {
            position: absolute;
            top: 0;
                right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }




/*  그리드 레이아웃*/
.grid{
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 10px;
  grid-auto-rows: 70px;
  width:80%;
  margin:0 auto;
}
.title{
	 grid-column: 2 / 3;
  	 grid-row: 1/2;
}
.kind{
	grid-column: 2/ 3;
  	 grid-row: 2/3;
}
.productname{
	grid-column: 2 / 3;
  	 grid-row: 3/4;

}
.price{
	grid-column: 2 / 3;
  	 grid-row: 4/5;
}
.trade{
	grid-column: 2 / 3;
  	 grid-row: 5/6;
	
}
.picture{
	height:100%;
	grid-column: 1 / 2;
  	 grid-row: 1/6;

}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>글쓰기</h2>

<form id="form1" name="form1" method="post"
action="${path}/usedboard/usedboardinsert">
<input type="hidden" name="ubno" value="${dto.ubno}">
<div class="location"></div>
<div class="grid">
	<div class="title">
				<div class="form-group">
					<label for="inputtitle" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputtitle"
							placeholder="title" name="title" value="${dto.title}">
					</div>
				</div>
	</div>
	<div class="kind" id="kind">
		<div class="form-group">
		<label for="kind" class="col-sm-2 control-label">종류</label>
		<div class="col-sm-10">
		<select name="kind" class="form-control id="kind">
			<option value="cpu">cpu</option>
			<option value="gpu">gpu</option>
			<option value="mainboard">mainboard</option>
			<option value="memory">memory</option>
			<option value="ssd">ssd</option>
		</select>
		</div>
		</div>
		
	</div>
	<div class="productname">
		<div class="form-group">
					<label for="productname" class="col-sm-2 control-label">제품명</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="productname" id="productname"
							placeholder="productname" value="${dto.productname}" >
					</div>
				</div>
	
		
	</div>
	<div class="price">
	
		<div class="form-group">
					<label for="inputprice" class="col-sm-2 control-label">가격</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="inputprice"
							placeholder="price" name="price" value="${dto.price}">
					</div>
		</div>
	
		
	</div>
	<div class="trade">
		
			
			<label for="productname" class="col-sm-2 control-label">거래방법</label>
			<div class="form-group col-sm-10" style="display: inline-block">
					
					<div class="btn-group tradechoice" data-toggle="buttons">
						<label class="btn btn-primary active shmap" onclick="showmap(this);"> 
						<input type="radio" name="trade"  autocomplete="off" value="직거래" onclick="showmap(this);">직거래
						</label> 
						<label class="btn btn-primary  active" onclick="closemap(this);"> 
						<input type="radio" name="trade"  autocomplete="off" value="택배거래" onclick="closemap(this);">택배거래
						</label>

					</div>
			</div>
				
			

			</div>
			
			<div class="picture">
	   <label class="btn btn-primary btn-file">
        파일추가 <input type="file" style="display: none;" id="file">
    </label>
	<a class="ui-shadow ui-btn ui-corner-all btn btn-primary" href="javascript:uploadFile();" >전송</a>
	<div id="uploadedList"></div>
		
	
		
	</div>
	
	
	
	
	
	
	
	
	
</div>

	<div class="searchmap" style="width:80%;  margin:0 auto;">
		<div style="text-align:right;">
		<input type="text" id="search"  size="20"><button type="button" onclick="keywordserach();" class="btn btn-primary" >검색</button>
		</div>
		<div id="map" style="width:100%;height:400px;"></div>
		<div id="clickLatlng"></div>
	</div>

	
	
	<div style="width:80%; margin:0 auto;">
		내용 <textarea id="content" name="content"
rows="3" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
<script>
// ckeditor 적용
CKEDITOR.replace("content",{
	filebrowserUploadUrl: "${path}/upload/imageUpload"
});  
</script>


	</div>
	
	<div style="width:700px; text-align:center;">
		<button type="button" id="btnSave">수정</button>
	</div>
</form>


</body>
</html>



















