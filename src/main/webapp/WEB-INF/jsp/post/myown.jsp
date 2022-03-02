<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
	
	String monthString = "2021-03";
	
	Date date = formatter.parse(monthString);
	
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(date);
	
	int dayNum = calendar.get(Calendar.DAY_OF_WEEK);
	
	int day = (dayNum - 1) * -1 + 1;
	int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
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

<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>


<title>메인페이지</title>
</head>
<body>

<div id="wrap">

	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<section class="my-4">
		<!-- 달력 -->
		
		<div class=" d-flex justify-content-center">
			<div class="monthSection d-flex justify-content-center">
				<div class="my-4">
					<h3><b>${userName }</b></h3>
					<h5 class="date"><%=monthString%> do개수</h5>
					<input type="date" id="dayInput" class=""/>
					
					<!-- 달력박스 -->
					<div class="month  p-1 mt-3" >
						
						<div id="calendar"></div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- 할일리스트 -->
		<form id="todoBtn">
		<div class="d-flex justify-content-center my-5">
			<div class="todolist-box  d-flex justify-content-center">
				<div class="todolist my-4 ">  
					<div class="d-flex">
						
						<input type="text" class="form-control my-3 ml-3 col-10" id="contentInput">
						<button class="my-3 mr-3 form-control">추가</button>
					</div>
					<c:forEach var="todolist" items="${todoList }"></c:forEach>
					<div class="ml-3">
						<div>${todolist.content}</div>
						
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
			
			var content = $("#contentInput").val().trim();
			var day = $("#dayInput").val();
			var state = $("input[name='state']").val();
			
			if(content == ""){
				alert("내용을 입력해주세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/post/todo/create",
				data:{"day":day,"content":content},
				success:function(data){
					if(data.result == "success"){
						location.reload();
						
					}else{
						alert("할일 추가 실패");
					}
				},error:function(){
					alert("할일추가 에러발생");
					//"할일추가 에러발생"
				}
			})
			
			
			
			   //할일 인서트
			   /*
			   달력보여주기
			 	날짜를 눌렀을 때 해당 할일이 셀렉트 되는 기능 구현
			   */
			         
			
			
		});
		var calendarEl = document.getElementById('calendar');
	    
	      var calendar = new FullCalendar.Calendar(calendarEl, {
	        plugins: [ 'dayGrid' ]
	      });
	    
	      calendar.render();
	});



</script>

</body>
</html>