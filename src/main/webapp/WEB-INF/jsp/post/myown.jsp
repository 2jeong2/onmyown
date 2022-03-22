<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.js"></script>




<title>메인페이지</title>

</head>
<body>

<div class="wrap">

	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<section class="my-4">
		
		<!-- 달력 -->
		
		<div class=" d-flex justify-content-center">
			<div class="monthSection d-flex justify-content-center">
				<div class="my-4">
					
						<h3><b>${userName }</b></h3>
						<h5 class="date"> do개수</h5>
					
					<input type="date" id="dayInput" class=""/>
					
					<!-- 달력박스 -->
					<div class="month p-1 mt-3" >
						<div id="calendar" >
							<div id="calendar.dateClick"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 할일리스트 -->
		<form id="todoBtn">
		
		<div class=" my-5 d-flex justify-content-center">
			<div class="todolist-box p-4 d-flex justify-content-center">
				<div class="todolist  my-4">  
					<div>
						<a class="ml-2 display-4 logoBtn" href="#"><b>Feed</b></a>
						
					</div>
					
					<div class="d-flex ">
						
						<input type="text" class="form-control my-3 ml-3 col-10" id="contentInput">
						<button class="my-3 mr-3 form-control">추가</button>
					</div>
					
					<c:forEach var="todoList" items="${todoList}">
					<div class="ml-3 my-4 ">
						
						<a class="moreBtn text-dark " data-post-id="${todoList.id }" href="#" data-toggle="modal" data-target="#exampleModalCenter">
							<div class="d-flex justify-content-between">
								<div><b>${todoList.content}</b></div>
								<div><i class="bi bi-three-dots col-1" id=""></i></div>
							</div>
						</a>
						
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		</form>
				
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      
      <div class="modal-body text-center">
       	<a href="#" id="deleteBtn">삭제하기</a> 
      </div>
      
    </div>
  </div>
</div>

</div>
<script>

	$(document).ready(function(){
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
	        	
				timeZone: 'UTC',
				aspectRatio: 1.5,
	        	initialView: 'dayGridMonth',
	        	selectable: true,
	        	droppable:true,
	        	editable:true,
	        	height:'700px',
	        	
	        	headerToolbar:{
	        		left:'prev,next today',
	        		center: 'title',
	        		right: 'dayGridMonth, timeGridWeek, timeGridDay'
	        	},
	        	contentHeight:'auto',
	        	editable: true,
	        	
	            events: 'https://fullcalendar.io/api/demo-feeds/events.json?single-day&for-resource-timeline',
	        	
	            dateClick: function(info) {
	        	      alert('clicked ' + info.dateStr);
	            	return false;
	        	    },
	        	    eventClick: function(calEvent, jsEvent, view) {
	        	        return false;
	        	    },
	        	  


	        	events:[
	        		{
	        			title:'All Day Event',
	        			start: '2022-03-01'
	        		}
	        	]
	        	
	        });
	        
	        calendar.render();
	        
	   $('#calendar').on("click",function(){
		 //  alert("");
	   });
	    
	   
	        
	       
	        
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
			if(day == ""){
				alert("날짜 오류");
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
			});
		});
			
			$(".moreBtn").on("click",function(e){
				e.preventDefault();
				//alert("");
				let id = $(this).data("post-id");
				
				//postId를 모달의 삭제하기 버튼에 값을 부여한다.
				//moreBtn을 누르는 순간 post-id부여
				$("#deleteBtn").data("post-id",id);
				
				
				
				
			});
			
			$("#deleteBtn").on("click",function(e){
				e. preventDefault();
				
				let id = $(this).data("post-id");
				alert(id);
				
				$.ajax({
					type:"get",
					url:"/post/todo/delete",
					data:{"id":id},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패!");
						}
						
					}, error:function() {
						alert("삭제 에러!!")
					}
					
				});
			});
			
			
			$(".logoBtn").on("click",function(){
				alert("");
			});
			
		
			
		
			
			
			
			
			
			   //할일 인서트
			   /*
			   달력보여주기
			 	날짜를 눌렀을 때 해당 할일이 셀렉트 되는 기능 구현
			   */
			         
			
			
		
		
	});
	



</script>

</body>
</html>