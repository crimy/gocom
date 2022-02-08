<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<title>Home</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
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

<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" placeholder="Search">
                </form>
                <c:choose>
                	<c:when test="${sessionScope.name != null}">
	                    <div class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
	                            <img class="rounded-circle me-lg-2" src="/resources/img/user.jpg" alt="" style="width: 40px; height: 40px;">
	                            <span class="d-none d-lg-inline-flex"> ${sessionScope.name} </span>
	                            
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
	                            <a href="/gocom/member/logout" class="dropdown-item">로그아웃</a>
	                        </div>
	                    </div>
                    </c:when>
                    <c:otherwise>                  
                			<div class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
	                            <img class="rounded-circle me-lg-2" src="/resources/img/user.jpg" alt="" style="width: 40px; height: 40px;">
	                            <span class="d-none d-lg-inline-flex"> 로그인 해주세요 </span>
	                            
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
	                            <a href="/gocom/member/login" class="dropdown-item">로그인</a>
	                            <a href="/gocom/member/signin" class="dropdown-item">회원가입</a>
	                        </div>
	                    </div>                
                    </c:otherwise>
                </c:choose>
            </nav>
</body>
</html>
