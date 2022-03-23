<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<header class= "header p-3 d-flex justify-content-between">
		<a href="/post/myown_view"><h1 class="logo text-dark"><b>OWN</b></h1></a>
		<div class="d-flex align-items-center">
			<c:choose>
				<c:when test="${not empty userId }">
					<div><b>${userName }</b> <a href="/user/sign_out">로그아웃</a></div>
				</c:when>
				<c:otherwise>
					<div><a href="/user/signin_view">로그인</a></div>
				</c:otherwise>
			</c:choose>
			<div class="icon ml-4">
				<a href="/post/anotherUser_view" class="bg-black"><i class="bi bi-search text-dark"></i></a>
				<i class="bi bi-list ml-3"></i>
			</div>
		</div>
	</header>