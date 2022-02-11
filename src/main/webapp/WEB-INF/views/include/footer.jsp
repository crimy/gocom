<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<html>
<head>

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
<!-- footer start -->
<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-muted">© 2022 gocom</p>

    <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <img src="<c:url value='/resources/images/logo4.png'/>" class="bi me-2" width="150">
    </a>

    <ul class="nav col-md-4 justify-content-end">
      <li class="nav-item"><a href="/gocom/" class="nav-link px-2 text-muted">메인</a></li>
      <li class="nav-item"><a href="/gocom/board/list" class="nav-link px-2 text-muted">게시판</a></li>
      <li class="nav-item"><a href="/gocom/guestbook/list" class="nav-link px-2 text-muted">방명록</a></li>
    </ul>
  </footer>
                              	
<!-- footer End -->

</div>

</body>

</html>
