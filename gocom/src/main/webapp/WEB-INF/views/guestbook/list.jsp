<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<html>
<head>
    <meta charset="utf-8">
    <title>gocom 방명록</title>
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
	                            <a href="/gocom/member/signin" class="dropdown-item">회원가입</a>
	                        </div>
	                    </div>                
                    </c:otherwise>
                </c:choose>
            </nav>
            
<!-- Navbar End --> 

<!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">                                      
                    <div class="col-sm-12 col-xl-10">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">방명록</h6>
                            <table class="table table-hover">
                                <tbody>
                                    <c:forEach items="${list}" var="t">
									<tr>
										<td class="col-3">${t.name}</td>
										<td class="col-6">${t.ment}</td>
										<td class="col-3"><fmt:formatDate value="${t.reg_date }" pattern="yyyy.MM.dd"/> </td>										 
									</tr>
									</c:forEach>									
																
                                </tbody>
                            </table>
        <div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/gocom/guestbook/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<button disabled type="button" class="btn btn-secondary">${p }</button>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<button onclick="location.href='/gocom/guestbook/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}'" type="button" class="btn btn-primary">${p }</button>					
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/gocom/guestbook/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
                            <c:choose>
								<c:when test="${sessionScope.name != null}">
								<form action="writegb" method="POST">
								    <div class="input-group">
                                		<span class="input-group-text">방명록 작성</span>
                                		<textarea name="ment" class="form-control" aria-label="With textarea"></textarea>
                            		</div>
									<div class="float-end">
										<button type="submit" class="btn btn-outline-primary m-2">글쓰기</button>
									</div>
								</form>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
                        </div>
                    </div>
	            
                </div>
            </div>
<!-- Table End -->  
            
                       
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
</body>

</html>
