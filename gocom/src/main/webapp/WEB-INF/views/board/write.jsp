<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#buttonAdd').on('click',function(){
		$('.file_list').append("<tr><td><input type='file' name='file'/><a href='#this' onclick='deleteFile()'>삭제</a></td></tr>");
		
	});
	
});
</script>
</head>
<body>
<%@include file="../include/menu.jsp" %>

<form method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" class="title" id="title"/>
		</tr>
				
		<tr>
			<td><button id="buttonAdd" type="button">파일추가</button></td>			
		</tr>
		<tr>
			<td>
				<div class="file_list">
					<input type="file" name="file"/><a href="#this" onclick="deleteFile()">삭제</a>
				</div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<!-- 
$('#file_list').append("<tr class='file_list'><td><input type='file' name='file'/><a href='#this' onclick='deleteFile()'>삭제</a></td></tr>");
 -->