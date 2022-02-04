<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<a href="/gocom">메인</a>
	<a href="/gocom/board/list">게시판</a>
	<a href="/gocom/guestbook/list">방명록</a>
	<c:if test="${name == null}"><a href="/gocom/member/login">로그인</a>
	<a href="/gocom/member/signin">회원가입</a>
	</c:if>
	<c:if test="${name != null}">${name}님 환영합니다
	<a href="/gocom/member/logout">로그아웃</a>
	</c:if>
	
</body>
</html>
