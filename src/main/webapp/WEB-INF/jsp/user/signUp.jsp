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

	<header>
	
	</header>

	<section>
	
		<div class="join-bigBox d-flex justify-content-center">
			
				<div class="join-box my-5">
					
					<label>전화번호</label><input type="text" class="form-control" placeholder="전화번호" id="phoneNumberInput">
					<label>아이디</label><input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
					<label>이름</label><input type="text" class="form-control" placeholder="이름 " id="nameInput">
					<label>비밀번호</label><input type="password" class="form-control" placeholder="비밀번호" id="passwordInput">
					<label>비밀번호 확인</label><input type="password" class="form-control" placeholder="비밀번호 확인" id="passwordConfirmInput">
					<label>이메일</label><input type="text" class="form-control" placeholder="이메일 주소" id="emailInput">
					<button type="submit"  class="btn btn-secdondary btn-block mt-3">가입하기</button> 
					
				</div>
		</div>
	
	</section>
	<footer>
	
	</footer>
</div>

</body>
</html>