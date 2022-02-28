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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>메인페이지</title>
</head>
<body>

<div id="wrap">

	<header class="p-3 d-flex justify-content-between">
		<h4 class="logo"><b>OWN</b></h4>
		<i class="bi bi-list"></i>
	</header>
	<section class="my-4">
		<!-- 달력 -->
		<div class=" d-flex justify-content-center">
			<div class="monthSection d-flex justify-content-center">
				<div class="my-4">
					<div class="date"><b>2022년 2월</b></div>
					<div class="month  mt-2"> 달력</div>
				</div>
			</div>
		</div>
		<!-- 할일리스트 -->
		<form id="todoBtn">
		<div class="d-flex justify-content-center">
			<div class="todolist-box my-3 d-flex justify-content-center">
				<div class="todolist my-4 ">  
					<div class="d-flex">
						
						<input type="text" class="form-control my-3 ml-3 col-10" id="todoInput${post.id }">
						<button class="my-3 mr-3 form-control">추가</button>
					</div>
					<div class="ml-3">
						<div>todo</div>
						<div>todo</div>
						<div>todo</div>
						<div>todo</div>
						<div>todo</div>
					</div>
				</div>
			</div>
		</div>
		</form>
				
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>



</div>
<script>

	$(document).ready(function(){
		$("#todoBtn").on("submit",function(e){
			e.preventDefault();
			//alert("");
			
			var todo = $("#todoInput").val().trim();
			
			if(todo == ""){
				alert("내용을 입력해주세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/post/todo/create",
				data:{"userId":userId,"day":day,"state":state,"content":content},
				success:function(data){
					if(data.result == "success"){
						location.reload();
						
					}else{
						alert("할일 추가 실패");
					}
				},error:function(){
					alert("할일추가 에러발생");
				}
			})
			
			
			
			
			
		});
	});



</script>

</body>
</html>