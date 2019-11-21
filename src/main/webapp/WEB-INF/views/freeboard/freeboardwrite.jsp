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
<script>
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
	$(".fileDrop").on("dragenter dragover",function(e){
		//기본 효과 막음
		e.preventDefault();
	});
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();
		//첫번째 첨부파일
		var files=e.originalEvent.dataTransfer.files;
		var file=files[0];
		//폼 데이터에 첨부파일 추가
		var formData=new FormData();
		formData.append("file",file);
		$.ajax({
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){
				//console.log(data);
				//data : 업로드한 파일 정보와 Http 상태 코드
				var fileInfo=getFileInfo(data);
				//console.log(fileInfo);
				var html="<a href='"+fileInfo.getLink+"'>"+
					fileInfo.fileName+"</a><br>";
				html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
				$("#uploadedList").append(html);
			}
		});
	});
});
</script>

<style>
.container{}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>글쓰기</h2>
<form id="form1" name="form1" method="post"
action="${path}/freboard/freboardinsert">
	<div class="container">
			<div class="form-group">
				<label for="inputtitle" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputtitle"
						placeholder="title" name="title">
				</div>
			</div>
			<!-- 제목 <input name="title" id="title" size="80"
					placeholder="제목을 입력하세요">
	</div> -->
			<div class="form-group">
				<div style="width:100%; height:100px; margin-top:20px;">
				<label for="inputcontent" class="col-sm-2 control-label" style="bottom:-61px;">내용</label>
				</div>
				<textarea id="content" name="content" rows="3" cols="200"
					placeholder="내용을 입력하세요"></textarea>
				<script>
					// ckeditor 적용
					CKEDITOR.replace("content", {
						filebrowserUploadUrl : "${path}/upload/imageUpload"
					});
				</script>
			</div>
			<div style="text-align:right;">
				<input type="submit" value="글등록" class="btn btn-primary" style="text-align">
			</div>
	</div>
	
</form>



</body>
</html>



















