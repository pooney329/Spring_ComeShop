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
		document.form1.action="${path}/freboard/freboardupdate";
		document.form1.submit();
	});
	
});
</script>

<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>글수정</h2>
<form id="form1" name="form1" method="post"
action="#">
<div class="container">
	<input type="hidden" name="fbno" value="${dto.fbno}">
	
	
	<div class="form-group">
				<label for="inputtitle" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputtitle"
						placeholder="title" name="title" value="${dto.title}">
				</div>
	</div>
	
	<%-- <div>제목 <input name="title" id="title" size="80"
					value="${dto.title}">
	</div> --%>
			<div class="form-group">
				<div style="width: 100%; height: 100px; margin-top: 20px;">
					<label for="inputcontent" class="col-sm-2 control-label"
						style="bottom: -61px;">내용</label>
				</div>

				<textarea id="content" name="content" rows="3" cols="80"
					value="내용을 입력하세요">${dto.content}</textarea>
				<script>
					// ckeditor 적용
					CKEDITOR.replace("content", {
						filebrowserUploadUrl : "${path}/upload/imageUpload"
					});
				</script>
			</div>


			<div style="text-align:right;">
		<button type="button" id="btnSave" class="btn btn-primary">확인</button>
	</div>
	
	
	
	
</div>
</form>



</body>
</html>



















