<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var cnt = 1;
$(document).ready(function(){
	
	$('#buttonAdd').on('click',function(){
		$('.add_file').append("<tr><td><input id='file_input' type='file' name="file" class='file" + cnt + "'/><a href='#this' onclick='deleteFile()'>삭제</a></td></tr>");
		
	});
	$('#file_input').change(function(){
		
	});
	$('#buttonSbm').on("click", function() {
		  if( $('#title') == "" ) {
			  alert('제목을 입력하세요');
			  $('#title').focus();
			  return;
		  }
		  $('.form1').submit();
	});
});
</script>
</head>
<body>
<%@include file="../include/menu.jsp" %>

<form class="form1" action="upload" method="POST" enctype="multipart/form-data">
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
					<input id="file_input" type="file" name="file" class="file0"/><a href="#this" onclick="deleteFile()">삭제</a>
					<div class="img_preview" class="prv0"><img src=""></div>
				</div>
			</td>
			<td>
				<div class="add_file"></div>
			</td>
		</tr>
		<tr>
			<td>
				<td><input type="button" id="buttonSbm" value='작성하기'/></td>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<!-- 

$("#file_input").change(function(){
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
		 		$(".img_preview img").attr("src", data.target.result).width(500);        
		    }
		    reader.readAsDataURL(this.files[0]);
		  }
		  
이미지 미리보기

 -->