<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="utf-8">
    <title>고독한 커뮤니티 gocom</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
* {
  user-select: none;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true); 
	String id = request.getParameter("id"); 
	request.getSession().setAttribute("id", id); 
%>
<!-- 
		<a href="/gocom/board/list">게시판</a>
		<a href="/gocom/guestbook/list">방명록</a>
-->

<div class="container">
<!-- navbar start -->
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/gocom/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <img src="<c:url value="/resources/images/logo4.png"/>" class="bi me-2" width="75" aria-label="Bootstrap"></img>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/gocom/" class="nav-link px-2 link-secondary">메인</a></li>
        <li><a href="/gocom/board/list" class="nav-link px-2 link-dark">게시판</a></li>
        <li><a href="/gocom/guestbook/list" class="nav-link px-2 link-dark">방명록</a></li>
      </ul>

      <div class="col-md-3 text-end">
      
        <c:choose>
        	<c:when test="${sessionScope.name == null}">
        		<div class="dropdown">
        			<img class="rounded-circle me-lg-2" src="<c:url value='/resources/images/guest.png'/>" style="width: 40px; height: 40px;">
        			<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    					로그인해주세요.
  					</button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><a class="dropdown-item" href="/gocom/member/login">로그인</a></li>
					    <li><a class="dropdown-item" href="/gocom/member/regi">회원가입</a></li>
					  </ul>
				</div>
				
        	</c:when>
        	<c:otherwise>
        		<div class="dropdown">
	        		<img class="rounded-circle me-lg-2" src="<c:url value="/resources/images/guest.png"/>" alt="" style="width: 40px; height: 40px;">
	        		<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
	    			${sessionScope.name}님
	  				</a>   
	  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    				<li><a class="dropdown-item" href="/gocom/member/logout">로그아웃</a></li>
	    				<li><a class="dropdown-item" href="/gocom/member/mypage?id=${sessionScope.userid}">마이페이지</a></li>
	  				</ul>
				</div> 	
        	</c:otherwise>
        </c:choose>
      </div>
    </header>
                              	
<!-- navbar End -->

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>
