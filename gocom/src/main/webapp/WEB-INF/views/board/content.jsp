<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@include file="../include/menu.jsp" %>

<h2>제목</h2><div>${board.getTitle()}</div>

<c:forEach items="${image}" var="t">
<div>
	<img alt="" src="<c:url value="/images/${t.getFsn()}"/>">
</div>
</c:forEach>
	
</body>
</html>
