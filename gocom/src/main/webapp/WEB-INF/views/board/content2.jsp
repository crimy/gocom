<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="utf-8">
    <title>gocom</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value="/resources/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"/>" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">

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
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true); 
	String id = request.getParameter("id"); 
	request.getSession().setAttribute("id", id); 
%>
<!-- 
		<a href="/gocom/board/list">게시판</a>
		<a href="/gocom/guestbook/list">방명록</a>
-->

<div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->        
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="/gocom/" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>gocom</h3>
                </a>
                  	<c:choose>
                    	<c:when test="${sessionScope.name != null}">
                			<div class="d-flex align-items-center ms-4 mb-4">
                    			<div class="position-relative">
                        			<img class="rounded-circle" src="<c:url value="/resources/img/user.jpg"/>" alt="" style="width: 40px; height: 40px;">
                        				<div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    			</div>
		                    	<div class="ms-3">
		                        	<h6 class="mb-0"> ${sessionScope.name} </h6>
		                    	</div>
		                    </div>
		                </c:when>
		                <c:otherwise>
		                	<div class="d-flex align-items-center ms-4 mb-4">
                    			<div class="position-relative">
                        			<img class="rounded-circle" src="<c:url value="/resources/img/guest.png"/>" alt="" style="width: 40px; height: 40px;">
                        				<div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    			</div>
		                	<div class="ms-3">
		                        <h6 class="mb-0">안녕하세요</h6>
		                    </div>
		                    </div>
		                </c:otherwise>
		            </c:choose>
                
                <div class="navbar-nav w-100">                                      
                    <a href="/gocom/guestbook/list" class="nav-item nav-link"><i class="fas fa-feather-alt me-2"></i>방명록</a>
                    <a href="/gocom/board/list" class="nav-item nav-link"><i class="fas fa-photo-video me-2"></i>게시판</a>
                   <c:choose>
                    	<c:when test="${sessionScope.name == null }">
                    <div class="nav-item dropdown sticky-right">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-id-card me-2"></i>회원</a>
                    
	                        <div class="dropdown-menu bg-transparent border-0">
	                            <a href="/gocom/member/login" class="dropdown-item">로그인</a>
	                            <a href="/gocom/member/regi" class="dropdown-item">회원가입</a>
	                        </div>
	                    </c:when>
                        <c:otherwise>
                        	
                        </c:otherwise>
                    </c:choose>
                        
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
        
        <!-- Content Start -->
        <div class="content">        
    	
<!-- Navbar Start -->
<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="/gocom/" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="/gocom/" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
				<div class="col-8">
				</div>
                <c:choose>
                	<c:when test="${sessionScope.name != null}">
	                    <div class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
	                            <img class="rounded-circle me-lg-2" src=<c:url value="/resources/img/user.jpg"/> alt="" style="width: 40px; height: 40px;">
	                            <span class="d-none d-lg-inline-flex"> ${sessionScope.name} </span>
	                            
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
	                            <a href="/gocom/member/logout" class="dropdown-item">로그아웃</a>
	                        </div>
	                    </div>
                    </c:when>
                    <c:otherwise>                  
                			<div class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
	                            <img class="rounded-circle me-lg-2" src="<c:url value="/resources/img/guest.png"/>" alt="" style="width: 40px; height: 40px;">
	                            <span class="d-none d-lg-inline-flex"> 로그인 해주세요 </span>
	                            
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
	                            <a href="/gocom/member/login" class="dropdown-item">로그인</a>
	                            <a href="/gocom/member/regi" class="dropdown-item">회원가입</a>
	                        </div>
	                    </div>                
                    </c:otherwise>
                </c:choose>
            </nav>
            
<!-- Navbar End --> 

<!-- content Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-10">
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
            <div>
            
                <div class="container-fluid pt-4 px-4">
                	<div class="row g-4">
                		<div class="col-sm-6 col-xl-5">
	                        <div onclick="location.href='recommend?no=${board.getCon_no()}'" class="bg-light rounded d-flex align-items-center justify-content-between p-4">
	                            <svg width="50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M128 447.1V223.1c0-17.67-14.33-31.1-32-31.1H32c-17.67 0-32 14.33-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64C113.7 479.1 128 465.6 128 447.1zM512 224.1c0-26.5-21.48-47.98-48-47.98h-146.5c22.77-37.91 34.52-80.88 34.52-96.02C352 56.52 333.5 32 302.5 32c-63.13 0-26.36 76.15-108.2 141.6L178 186.6C166.2 196.1 160.2 210 160.1 224c-.0234 .0234 0 0 0 0L160 384c0 15.1 7.113 29.33 19.2 38.39l34.14 25.59C241 468.8 274.7 480 309.3 480H368c26.52 0 48-21.47 48-47.98c0-3.635-.4805-7.143-1.246-10.55C434 415.2 448 397.4 448 376c0-9.148-2.697-17.61-7.139-24.88C463.1 347 480 327.5 480 304.1c0-12.5-4.893-23.78-12.72-32.32C492.2 270.1 512 249.5 512 224.1z"/></svg>
	                            <div class="ms-3">
	                                <p class="mb-2">추천!</p>
	                                <h6 class="mb-0">${board.getRec_cnt() }</h6>	                                
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-sm-6 col-xl-5">
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
	                 <div class="row g-4" style="height:400px;">
                    		<div class="col-sm-12 col-xl-10">
                        		<div class="container bg-light rounded h-100 p-4" style="position:relative;">
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
                    
                </div>
	        </div>
	        </div>
 <br/>                 
<!-- content End -->                       
            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">gocom</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        <br/>
                        Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value="/resources/lib/chart/chart.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/easing/easing.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/waypoints/waypoints.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/owlcarousel/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/tempusdominus/js/moment.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/tempusdominus/js/moment-timezone.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"/>"></script>

    <!-- Template Javascript -->
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
</body>

</html>

<!-- 
		                        <div class="row g-4">
	                            <c:forEach items="${emoji}" var="t">
									<div>
										<img alt="" src="<c:url value="/resources/emoji/${t.getEmo_name()}"/>">
										<br/>
									</div>
								</c:forEach>
							</div>	
 -->
