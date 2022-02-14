<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="utf-8">
    <title>gocom 회원가입</title>
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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function () {
	  $('#buttonChk').on("click", function () {
		  var id = $('.userid').val();
		     $.ajax({
		         url:'idvalidcheck',
		         type:'post',
		         data:{userid:id },
		         success:function(data){ // 컨트롤러에서 넘어온 result값을 받는다 
		        	if(data == '0'){ //result가 0이면 : 생성가능 	            	 
		                 $('.id_ok').css("display","inline-block"); 
					     $('.id_using').css("display", "none");
					     $('.id_format').css("display", "none");
					     $('.userid').attr('readonly',true);
					     $('#buttonChk').css("display","none");
					     $('#buttonAdj').css("display","inline-block");
		        	} else {
		            if( data == '2' ) { // result가 2면 : format
			           	$('.id_ok').css("display","none"); 
			            $('.id_using').css("display", "none");
			            $('.id_format').css("display", "inline-block"); 
		            }
			        if( data == '1' ) {
			        	$('.id_ok').css("display","none"); 
		                $('.id_using').css("display", "inline-block");
		                $('.id_format').css("display", "none");
			        }
		        	}
		       },
		         error:function(){
		        	    alert('다시 시도해주세요!');
		         }
		     });
	  });
	  $('.pwd').keyup(function(){
		  if($('.pwdOrg').val() == $('.pwdChk').val() ) {
			  $('.pwd_ok').css("display","inline-block");
			  $('.pwd_wrong').css("display","none");
		  } else {
			  $('.pwd_ok').css("display","none");
			  $('.pwd_wrong').css("display","inline-block");
		  }
	  });
	  $('#buttonChk2').on("click", function () {
		  var name = $('.name').val();
		     $.ajax({
		         url:'namevalidcheck',
		         type:'post',
		         data:{username:name },
		         success:function(data){ // 컨트롤러에서 넘어온 result값을 받는다 
		        	if(data == '1'){ //result가 1이면 : 중복 	            	 
		                 $('.name_ok').css("display","none"); 
					     $('.name_reject').css("display", "inline-block");
					     
		        	} else {		           
		        		$('.name_ok').css("display","inline-block"); 
					    $('.name_reject').css("display", "none");
					    $('.name').attr('readonly',true);
					    $('#buttonChk2').css("display","none");
					    $('#buttonAdj2').css("display","inline-block");
					    $('#buttonSbm').attr('disabled',false);
		            }
		        	
		       	},
		         error:function(){
		        	    alert('다시 시도해주세요!');
		         }
		     });
	  });
	  $('#buttonAdj').on("click", function() {
		  $('#buttonSbm').attr('disabled',true);
		  $('#buttonAdj').css("display","none");
		  $('#buttonChk').css("display","inline-block");
		  $('.userid').attr('readonly',false);
	  });
	  
	  $('#buttonAdj2').on("click", function() {
		  $('#buttonSbm').attr('disabled',true);
		  $('#buttonAdj2').css("display","none");
		  $('#buttonChk2').css("display","inline-block");
		  $('.name').attr('readonly',false);
	  });
	  $('#buttonSbm').on("click", function() {
		  if( $('#buttonAdj').css("display") == "none" ) {
			  alert('ID를 확인하세요');
			  $('.userid').focus();
			  return;
		  }
		  if( $('.pwd_ok').css("display") == "none" ) {
			  alert('비밀번호를 확인하세요');
			  $('.pwd').focus();
			  return;
		  }
		  if( $('#buttonAdj2').css("display") == "none" ) {
			  alert('별명를 확인하세요');
			  $('.name').focus();
			  return;
		  }
		  $('.form_regi').submit();
	  });
});

</script>    
<style>
.id_ok{color:#6A82FB; display: none;}
.id_using{color:#6A82FB; display: none;}
.id_format{color:#6A82FB; display: none;}
.pwd_ok{color:#6A82FB; display: none;}
.pwd_wrong{color:#6A82FB; display: none;}
.name_ok{color:#6A82FB; display: none;}
.name_reject{color:#6A82FB; display: none;}
#buttonAdj{display:none;}
#buttonAdj2{display:none;}
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
        	       
<!-- Sign Up Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-10 col-md-10 col-lg-10 col-xl-8">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>gocom</h3>
                            </a>
                            <h3>회원가입</h3>
                        </div>
                     <form class="form_regi" action="regi_form" method="POST">
                        <div class="form-floating mb-3">
                            <input name="userid" maxlength="12" type="text" class="userid form-control" id="floatingText" placeholder="userid">
                            <button id="buttonChk" class="btn btn-outline-warning m-2" type="button">중복확인</button>
                            <button id="buttonAdj" class="btn btn-outline-info m-2" type="button">변경</button>
                            <div class="text-primary id_format">영문,숫자만 사용할 수 있습니다.</div>
							<div class="text-primary id_using">사용중인 ID입니다.</div>
							<div class="text-primary id_ok">사용 가능합니다!</div>
                            <label for="floatingText">아이디</label>
                            <div colspan="2">아이디는 영문,숫자 12자 이하로 사용이 가능합니다.</div>
                        </div>
                        
                        <div class="form-floating mb-4">
                            <input name="password" id="password" type="password" class="form-control pwd pwdOrg" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">비밀번호</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input name="passwordChk" type="password" class="form-control pwd pwdChk" id="floatingPassword2" placeholder="Password">
                            <label for="floatingPassword">비밀번호 확인</label>
                            <div class="pwd_ok">확인되었습니다.</div>
							<div class="pwd_wrong">일치하지 않습니다.</div>
                        </div>
                        
                        <div class="form-floating mb-3">
                            <input name="name" maxlength="12" type="text" class="name form-control" id="floatingInput" placeholder="nickname">
                            <label for="floatingInput">별명</label>
                            <button id="buttonChk2" class="btn btn-outline-warning m-2" type="button">중복확인</button>
                            <button id="buttonAdj2" class="btn btn-outline-info m-2" type="button">변경</button>
                            <div class="name_ok">사용 가능합니다!</div>
							<div class="name_reject">사용할 수 없습니다</div>
							<div colspan="2">별명은 한글,영문,숫자 사용 가능합니다.</div>
                        </div>   
                        
			                <button id="buttonSbm" type="button" class="btn btn-primary py-3 w-100 mb-4">회원가입</button>
                       </form>
                    </div>
                </div>
            </div>
        </div>
<!-- Sign Up End -->   
    
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
