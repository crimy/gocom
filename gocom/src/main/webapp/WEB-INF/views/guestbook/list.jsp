<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@include file ="/WEB-INF/views/include/header.jsp" %>

<script src="https://kit.fontawesome.com/e67a174498.js" crossorigin="anonymous"></script>
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
.toast{
opacity:100;
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

<!-- Table Start -->
            <div class="container-fluid pt-4 px-4 text-center">
                <div class="row g-4 text-center">                                      
                    <div class="col-sm-12 col-xl-10" style="float:none; margin:0 auto">
                    	<h6 class="mb-4">방명록</h6>
                        <c:choose>
	                        <c:when test="${paging.nowPage == paging.startPage }">
								<button disabled type="button" class="btn btn-secondary"><img width="15" src="<c:url value="/resources/images/up-arrow.png"/>"></button>
							</c:when>
							<c:otherwise>
								<button onclick="location.href='/gocom/guestbook/list?nowPage=${paging.nowPage -1 }&cntPerPage=${paging.cntPerPage}'" type="button" class="btn btn-primary"><img width="15" src="<c:url value="/resources/images/up-arrow.png"/>"></button>
							</c:otherwise>
						</c:choose>
                            
                                <c:forEach items="${list}" var="t">
	                                <c:choose>	
	                                	<c:when test="${sessionScope.name == t.name }">
	                                		<div class="toast-container p-3" align="right">
		                                		<div class="toast bg-info" style="--bs-bg-opacity: .3;" role="alert" aria-live="assertive" aria-atomic="true">
													  <div class="toast-header">
													    <strong class="me-auto">${t.name}</strong>
													    <small><span class="col-3"><fmt:formatDate value="${t.reg_date }" pattern="yyyy.MM.dd"/> </span></small>												    
													  </div>
													  <div class="toast-body">
													    ${t.ment }
													  </div>
												</div>	
											</div>
		                                </c:when>
										<c:otherwise>
											<div class="toast-container p-3" align="left">
												<div class="toast bg-warning" style="--bs-bg-opacity: .3;" role="alert" aria-live="assertive" aria-atomic="true">
													  <div class="toast-header">
													    <strong class="me-auto">${t.name}</strong>
													    <small><span class="col-3"><fmt:formatDate value="${t.reg_date }" pattern="yyyy.MM.dd"/> </span></small>												    
													  </div>
													  <div class="toast-body">
													    ${t.ment }
													  </div>
												</div>	
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>									
						
						       <c:choose>
			                        <c:when test="${paging.nowPage == paging.endPage }">
										<button disabled type="button" class="btn btn-secondary"><img width="15" src="<c:url value="/resources/images/down-arrow.png"/>"></button>
									</c:when>
									<c:otherwise>
										<button onclick="location.href='/gocom/guestbook/list?nowPage=${paging.nowPage +1 }&cntPerPage=${paging.cntPerPage}'" type="button" class="btn btn-primary"><img width="15" src="<c:url value="/resources/images/down-arrow.png"/>"></button>
									</c:otherwise>
								</c:choose>
							<br/><br/>
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
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>                              	
<!-- content End -->

</body>

</html>
