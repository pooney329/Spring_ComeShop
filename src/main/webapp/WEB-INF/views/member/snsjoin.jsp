<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>


<style>

</style>

<script>
$(function(){
	$('#join-submit').click(function(e){
        e.preventDefault();
        
        
       
       /*  if($("#inputId").val() ==''){
            alert('아이디를 입력하세요');
            $("#inputId").focus();
            return false;
        }

          

        if($("#inputMobile").val() ==''){
            alert('휴대폰 번호를 입력하세요');
            $("#inputMobile").focus();
            return false;
        }
         */
        
        
       //구글 인지 네이버 인지 확인하기위함 이후 googleid , navarid 에 알맞게 insert한다 
    	var stringVal = "@gmail";
        var substring = "${email}";
        console.log(substring);
        console.log(substring.indexOf(stringVal));
        
        var $form = $("#form1");
    	if(substring.indexOf(stringVal)==-1){
    		
    		$form.append($("<input type='hidden' name='naverid' value='${email}'>"));
		
		
		}else{
			$form.append($("<input type='hidden' name='googleid' value='${email}'>"));
		} 
        
        
        
    	$form.submit();
        
        
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




<article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>Sns회원가입</h3>
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
					<label for="inputName">성명</label> <input type="text" name="uname"
						class="form-control" id="inputName" value="${uname}" readonly>
				</div>
				<div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input type="email"
						name="email" class="form-control" id="InputEmail"
						value="${email}" readonly>
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