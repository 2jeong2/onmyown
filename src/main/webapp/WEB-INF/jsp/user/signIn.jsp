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
<title>로그인</title>
</head>
<body>

<div id="wrap">

	<header>
	
	
	
	</header>
	<Form id="loginForm">
	<section>
	
		<!-- 로그인 박스 -->
			<div class="login-box d-flex justify-content-center">
				<!-- logo,login -->
				<div class="my-4 ">
					<h3 class="text-center my-4">로그인</h3>
					<input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
					<input type="password" class="form-control mt-1" placeholder="비밀번호" id="passwordInput">
					<button type="submit"  class="btn btn-info btn-block my-4">로그인</button> 
					<div class="my-2">비밀번호를 잊으셨나요?</div>
				</div> 
				
				
				<div class="text-center my-5">
				</div>
				
			</div>
	
	</section>
	</Form>
	<footer class="text-center">
		<small>Copyright 2022. myown  all rights reserved.</small>
	</footer>




</div>
<script>
	$(document).ready(function(){
		$("#loginForm").on("submit",function(e){
			e.preventDefault();
			
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			
			if(loginId ==""){
				alert("아이디를 입력하세요");
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/user/sign_in",
				data:{"loginId":loginId,"password":password},
				success:function(data){
					if(data.result == "success"){
						location.href="/post/myown_view";
					}else{
						alert("아이디/비밀번호를 확인해 주세요");
					}
				},error:function(){
					alert("에러발생");
				}
			});
			
		});
		
	});



</script>

</body>
</html>