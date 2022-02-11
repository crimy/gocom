<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@include file ="/WEB-INF/views/include/header.jsp" %>
<html>
<head>
<script>

$(document).ready(function(){	
	$('#buttonSbm').on("click", function() {
		  if( $('#InputTitle').val() == "" ) {
			  alert('제목을 입력하세요');
			  $('#InputTitle').focus();
			  return;
		  }
		  $('.boardForm').submit();
	});
});

</script>
<style>
.name_tag{
background-color:white;
-webkit-border-radius: 8px;
-moz-border-radius: 8px;
border: 1px solid black;
opacity:100%;
display:none;
}
</style>

</head>
<body>

<!-- 
		<a href="/gocom/board/list">게시판</a>
		<a href="/gocom/guestbook/list">방명록</a>
-->

<div class="container">
<!-- content start -->

            <!-- Form Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4 text-center">
                    <div class="col-sm-12 col-xl-8" style="float:none; margin:0 auto">
                        <div class="text-left bg-light rounded h-100 p-4">
                            <h6 class="mb-4">글쓰기</h6>
                            <form class="boardForm" action="upload" method="POST" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="InputTitle" class="form-label">제목</label>
                                    <input type="text" class="form-control" name="title" id="InputTitle"/>
                                </div>
                                
	                            <div class="mb-3">
	                                <label for="formFileMultiple" class="form-label">이미지 업로드</label>
	                                <input class="form-control" type="file" name="file" id="formFileMultiple" onchange="imgPreview(event);" multiple>
	                            </div>
	                            <div id="img_preview"></div>                                
                                <button type="button" id="buttonSbm" class="btn btn-primary">작성하기</button>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- Form End --> 
                              	
<!-- content End -->

</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
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
</html>
