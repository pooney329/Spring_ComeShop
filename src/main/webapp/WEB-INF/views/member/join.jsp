<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<!-- 다음 api 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

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


$(function(){
	$('#join-submit').click(function(e){
        e.preventDefault();
        
        
       
        if($("#inputId").val() ==''){
            alert('아이디를 입력하세요');
            $("#inputId").focus();
            return false;
        }

        
        if($("#inputName").val() ==''){
            alert('이름을 입력하세요');
            $("#inputName").focus();
            return false;
        }

        var email = $('#InputEmail').val();
        if(email == ''){
            alert('이메일을 입력하세요');
            $("#InputEmail").focus();
            return false;
        } else {
            var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!emailRegex.test(email)) {
                alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
                $("#inputEmail").focus();
                return false;
            }
        }

        if($("#inputPassword").val() ==''){
            alert('비밀번호를 입력하세요');
            $("#inputPassword").focus();
            return false;
        }

        if($("#inputPasswordCheck").val() ==''){
            alert('비밀번호를 다시 한번 더 입력하세요');
            $("#inputPasswordCheck").focus();
            return false;
        }
        
        if($("#inputPassword").val()!== $("#inputPasswordCheck").val()){
            alert('비밀번호를 둘다 동일하게 입력하세요');
            return false;
        }

        if($("#inputMobile").val() ==''){
            alert('휴대폰 번호를 입력하세요');
            $("#inputMobile").focus();
            return false;
        }
        
        $("#form1").submit();
        
        
    });


	
	
	   $('#uidcheck').on('click', function(){
		   var uid = $("#inputId").val();
		   if(uid==""){
			   alert("아이디를 입력해주세요");
			   $("#inputId").focus();
	            return false;
		   }
		   
	        /* var form = {
	                name: "jamong",
	                age: 23
	        } */
	        $.ajax({
	            url: "${path}/member/uidcheck",
	            type: "POST",
	            data: "uid="+uid,
	            success: function(data){
	            	console.log(data);
	                if(data != ""){
	                	alert("중복됩니다.");
	                	$("#inputId").val("");
	                }
	                else{
	                	alert("사용가능합니다.");
	                }
	            },
	            error: function(){
	                alert("simpleWithObject err");
	            }
	        });
	    });
	
	
	
})
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<%-- <h2>회원가입</h2>
<form action="${path}/member/joinaction.do" method="post">
	이름: <input type="text" name="name" size="20"> <br>
	아이디 : <input type="text" name="uid" size="20">  <br>
	비번 : <input type="password" name="pwd" size="20">  <br>
	<input type="submit" value="회원가입">
</form>
 --%>

<article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>일반회원가입</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
			<form role="form" action="${path}/member/memberinsert" method="post"
				id="form1">
				<div class="form-group">
					<label for="inputId">아이디</label> <input type="text" name="uid"
						class="form-control" id="inputId" placeholder="아이디을 입력해 주세요">
					<button type="button" class="btn btn-primary" id="uidcheck">중복확인</button>
				</div>

				<div class="form-group">
					<label for="inputPassword">비밀번호</label> <input type="password"
						name="upw" class="form-control" id="inputPassword"
						placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="inputPasswordCheck">비밀번호 확인</label> <input
						type="password" class="form-control" id="inputPasswordCheck"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
				</div>

				<div class="form-group">
					<label for="inputName">성명</label> <input type="text" name="uname"
						class="form-control" id="inputName" placeholder="이름을 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input type="email"
						name="email" class="form-control" id="InputEmail"
						placeholder="이메일 주소를 입력해주세요">
				</div>

				<div class="form-group">
					<label for="inputMobile">휴대폰 번호</label> <input type="tel"
						name="phonenumber" class="form-control" id="inputMobile"
						placeholder="휴대폰번호를 입력해 주세요">
				</div>
				
				<div class="form-group">
					<label for="inputMobile">휴대폰 번호</label> <input type="tel"
						name="phonenumber" class="form-control" id="inputMobile"
						placeholder="휴대폰번호를 입력해 주세요">
				</div>




				<div class="form-group text-center">
					<button type="submit" id="join-submit" class="btn btn-primary">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-warning">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>

        </article>







</body>
</html>