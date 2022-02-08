<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@include file="../include/menu.jsp" %>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="t">
		<tr>
			<td>${t.con_no}</td>
			<td><a href="view?no=${t.con_no}">${t.title}</a></td>
			<td>${t.userid}</td>
			<td>${t.view_cnt}</td> 
		</tr>
		</c:forEach>
	</table>
<c:choose>
	<c:when test="${sessionScope.name != null}">
		<button type="button" onclick="location.href='write' ">글쓰기</button>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
</body>
</html>
