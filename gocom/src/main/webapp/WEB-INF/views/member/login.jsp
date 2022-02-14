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

      	<!-- login Start -->
        <form name="form1" method="POST" action="login_check">
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-9 col-md-8 col-lg-7 col-xl-6">
                    <div class="bg-light rounded p-3 p-sm-5 my-4 mx-1">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>gocom</h3>
                            </a>
                            <h3>로그인</h3>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="floatingInput" name="userid" placeholder="아이디를 입력해주세요">
                            <label for="floatingInput">아이디</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="비밀번호를 입력해주세요">
                            <label for="floatingPassword">비밀번호</label>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">로그인</button>
                        <p class="text-center mb-0">회원이 아니신가요 ? <a href="regi">회원가입</a></p>
                        <c:if test="${message == 'error'}">
						<div class="text-center text-danger">ID 또는 비밀번호가 틀렸습니다.
						</div>
						</c:if>
                    </div>
                </div>
            </div>
        </div>
        </form>
        
        <!-- login End -->
                              	
<!-- content End -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>

</body>

</html>
