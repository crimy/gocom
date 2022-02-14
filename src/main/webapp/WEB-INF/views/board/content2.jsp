<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@include file ="/WEB-INF/views/include/header.jsp" %>
<html>
<head>

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

<!-- content Start -->
            <div class="text-center container-fluid pt-4 px-4">
                <div class="row g-4 text-center">
                    <div class="col-sm-12 col-xl-10" style="float:none; margin:0 auto">
                        <div class="bg-light rounded h-100 p-4">
                        	<div class="col-sm-12 col-xl-6">
	                            <h6 class="mb-4">${board.getTitle()}</h6>
	                            <br/>
	                        </div>
	                        
	                        <div class="row g-4">
                            <c:forEach items="${image}" var="t">
								<div>
									<img alt="" src="<c:url value="/resources/upload/${t.getFsn()}"/>">
									<br/>
								</div>
							</c:forEach>
							</div>						
                        </div>
                    </div>
                </div>
            </div>
            
                <div class="container-fluid pt-4 px-4">
                	<div class="row g-4 text-center">
                		<div class="col-sm-6 col-xl-5" style="float:none; margin:0 auto">
	                        <div onclick="location.href='recommend?no=${board.getCon_no()}'" class="bg-light rounded d-flex align-items-center justify-content-between p-4">
	                            <svg width="50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M128 447.1V223.1c0-17.67-14.33-31.1-32-31.1H32c-17.67 0-32 14.33-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64C113.7 479.1 128 465.6 128 447.1zM512 224.1c0-26.5-21.48-47.98-48-47.98h-146.5c22.77-37.91 34.52-80.88 34.52-96.02C352 56.52 333.5 32 302.5 32c-63.13 0-26.36 76.15-108.2 141.6L178 186.6C166.2 196.1 160.2 210 160.1 224c-.0234 .0234 0 0 0 0L160 384c0 15.1 7.113 29.33 19.2 38.39l34.14 25.59C241 468.8 274.7 480 309.3 480H368c26.52 0 48-21.47 48-47.98c0-3.635-.4805-7.143-1.246-10.55C434 415.2 448 397.4 448 376c0-9.148-2.697-17.61-7.139-24.88C463.1 347 480 327.5 480 304.1c0-12.5-4.893-23.78-12.72-32.32C492.2 270.1 512 249.5 512 224.1z"/></svg>
	                            <div class="ms-3">
	                                <p class="mb-2">추천!</p>
	                                <h6 class="mb-0">${board.getRec_cnt() }</h6>	                                
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-sm-6 col-xl-5" style="float:none; margin:0 auto">
	                        <div onclick="location.href='warn?no=${board.getCon_no()}'" class="bg-light rounded d-flex align-items-center justify-content-between p-4">
	                            <svg width="50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 32.04H32c-17.67 0-32 14.32-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64c17.67 0 32-14.33 32-31.1V64.03C128 46.36 113.7 32.04 96 32.04zM467.3 240.2C475.1 231.7 480 220.4 480 207.9c0-23.47-16.87-42.92-39.14-47.09C445.3 153.6 448 145.1 448 135.1c0-21.32-14-39.18-33.25-45.43C415.5 87.12 416 83.61 416 79.98C416 53.47 394.5 32 368 32h-58.69c-34.61 0-68.28 11.22-95.97 31.98L179.2 89.57C167.1 98.63 160 112.9 160 127.1l.1074 160c0 0-.0234-.0234 0 0c.0703 13.99 6.123 27.94 17.91 37.36l16.3 13.03C276.2 403.9 239.4 480 302.5 480c30.96 0 49.47-24.52 49.47-48.11c0-15.15-11.76-58.12-34.52-96.02H464c26.52 0 48-21.47 48-47.98C512 262.5 492.2 241.9 467.3 240.2z"/></svg>
	                            <div class="ms-3">
	                                <p class="mb-2">반대!</p>
	                                <h6 class="mb-0">${board.getWarn_cnt() }</h6>
	                            </div>
	                        </div>
	                    </div>
	                 </div>
	            </div>
	            
	            <div class="container-fluid pt-4 px-4">
	                 <div class="row g-4 text center">
                    		<div class="col-sm-12 col-xl-10" style="height:400px; position:relative; float:none; margin:0 auto"">
                        		<div class="container bg-light rounded h-100 p-4 ">
                        		
			                        	<div class="nav-item dropdown">
				                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
				                            	<span class="d-none d-lg-inline-flex">반응하기</span>
				                            </a>				                            				                        
						                         <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
						                            <div class="dropdown-item">
						                            <c:forEach items="${allemoji}" var="t">
						                            	<a href="reactEmoji?emoname=${t}&no=${board.getCon_no()}"><img height="50" width="50" src="<c:url value="/resources/emoji/${t}.svg"/>"></img></a>
						                            </c:forEach>
						                            </div>
						                       	 </div>			                           		
					                  	</div>	
						              <c:forEach items="${emoji}" var="t">
						              	<div class="emojidiv">
					                  		<img class="emoji" height="30" width="30" src="<c:url value="/resources/emoji/${t.getEmo_name()}.svg"/>" style="position:absolute; left:${t.getX_pos()}%; top:${t.getY_pos()}%"></img>
					                  		<p class="name_tag" style="position:absolute; left:${t.getX_pos()}%; top:${t.getY_pos()}%"> ${t.getName() } </p>
					                  	</div>
					                  </c:forEach>  	                        
		                        </div>			                  
		                  </div>    	
		                  </div>
		        </div>				

<!-- content End -->
                              	
<!-- content End -->

</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
    <script src="<c:url value="/resources/js/main.js"/>"></script>
    <script>
    $(".emojidiv").find(".emoji").hover( function() {
    	var ediv = $(this).parent();
    	ediv.find(".name_tag").css("display","inline-block");
    }, function() {
    	var ediv = $(this).parent();
		ediv.find(".name_tag").css("display","none");
    });
    </script>
</html>
