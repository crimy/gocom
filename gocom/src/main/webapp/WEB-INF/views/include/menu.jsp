<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<title>Home</title>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true); 
	String id = request.getParameter("id"); 
	request.getSession().setAttribute("id", id); 
%>
	<a href="/gocom">메인</a>
	<a href="/gocom/board/list">게시판</a>
	<a href="/gocom/guestbook/list">방명록</a>
<c:choose>	
	<c:when test="${sessionScope.name == null}"><a href="/gocom/member/login">로그인</a>
	<a href="/gocom/member/signin">회원가입</a>	
	</c:when>
	
	<c:otherwise>${sessionScope.name}님 환영합니다
	<a href="/gocom/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>	
</body>
</html>
