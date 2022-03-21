<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>회원가입</title>
</head>
<body>

<div id="wrap">

	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	
	<form id="signupForm">
	<section>
	
		<div class="join-bigBox d-flex justify-content-center">
			
				<div class="join-box my-5 p-5">
					<div>
						<h3 class=" text-center"><b>회원가입</b></h3>
						<div class="my-5">
							<label><b>아이디</b></label><input type="text" class="underline form-control mb-5" placeholder="아이디" id="loginIdInput" >
							<label><b>비밀번호</b></label><input type="password" class="underline form-control mb-5" placeholder="비밀번호" id="passwordInput">
							<label><b>비밀번호 확인</b></label><input type="password" class="underline form-control mb-5" placeholder="비밀번호 확인" id="passwordConfirmInput">
							<label><b>이름</b></label><input type="text" class="underline form-control mb-5" placeholder="이름 " id="userNameInput">
							<label><b>전화번호</b></label><input type="text" class="underline form-control mb-5" placeholder="전화번호" id="phoneNumberInput">
							<label><b>이메일</b></label><input type="text" class="underline form-control mb-5"  placeholder="이메일 주소" id="emailInput">
							<button type="submit"  class="btn btn-secdondary btn-block my-5">가입하기</button> 
						</div>
						
					</div>
				</div>
		</div>
	
	</section>
	</form>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
</div>

<script>
	$(document).ready(function(){
		
		$("#signupForm").on("submit",function(e){
			e.preventDefault();
			
			var loginId = $("#loginIdInput").val();
			var password= $("#passwordInput").val();
			var passwordConfirm= $("#passwordConfirmInput").val();
			var userName = $("#userNameInput").val();
			var phoneNumber = $("#phoneNumberInput").val();
			var email = $ ("#emailInput").val();
			
			if(loginId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			if(userName == ""){
				alert("이름을 입력하세요");
				return;
			}
			if(email == ""){
				alert("이메일을 입력하세요");
				return;
			}
			
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"loginId":loginId,"password":password,"userName":userName,"phoneNumber":phoneNumber,"email":email},
				success:function(data){
					if(data.result == "success"){
						location.href="/user/signin_view";
					}else{
						alert("회원가입에 실패하였습니다.");
					}
				},error:function(){
					alert("회원가입 에러발생")
				}
			})
		});
	});


</script>

</body>
</html>