<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@include file="include/menu.jsp" %>
	<br/>
	<form method="GET">
		내용<textarea name="gb_content"></textarea>
	</form>
</body>
</html>
