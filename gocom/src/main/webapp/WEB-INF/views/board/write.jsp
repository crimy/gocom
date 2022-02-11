<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){	
	$('#buttonSbm').on("click", function() {
		  if( $('#title').val() == "" ) {
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
			<td><input type="text" name="title" id="title"/>
		</tr>
		<tr>
			<td>
				<div class="file_list">
					<input id="file_input" type="file" name="file" class="file0" onchange="imgPreview(event);" multiple />
					<div id="img_preview"></div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" id="buttonSbm" value='작성하기'/>
			</td>
		</tr>
	</table>
</form>

<script> 
function imgPreview(event) {
	$('#img_preview img').attr("src",null);
	for (var image of event.target.files) {
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#img_preview").appendChild(img); 
		}; 
		console.log(image); 
		reader.readAsDataURL(image); 
		} 
} 
</script>
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