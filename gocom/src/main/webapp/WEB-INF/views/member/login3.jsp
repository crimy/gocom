<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>Insert title here</title>

</head>
<body>
<%@include file="../include/menu.jsp" %>
	<form name="form1" method="POST" action="login_check">
		<table>
			<tr>
				<td>ID</td>
				<td><input id="userid" name="userid"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" id="btnLogin">로그인</button>
				<c:if test="${message == 'error'}">
				<div>ID 또는 비밀번호가 틀렸습니다.
				</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
