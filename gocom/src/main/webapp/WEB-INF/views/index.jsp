<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@include file ="include/header.jsp" %>
<html>
<head>
<style>
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

<!-- HIT board Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                       <i class="fa-brands fa-hotjar"></i><h6 class="text-danger mb-0">HIT!</h6>
                        <a href="/gocom/board/list">게시판으로</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                    <tr>
                                        <th class="col-5" scope="col">제목</th>
                                        <th class="col-5" scope="col">작성자</th>
                                        <th class="col-2" scope="col">추천수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${hotlist}" var="t">
									<tr>
										<td><a href="/gocom/board/view?no=${t.con_no}">${t.title}</a></td>
										<td>${t.name}</td>
										<td><mark>${t.rec_cnt}</mark></td> 
									</tr>
									</c:forEach>									
																
                                </tbody>
                        </table>
                    </div>
                </div>
            </div>
<!-- HIT board End -->

<!-- recent gb Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">방명록</h6>
                        <a href="/gocom/guestbook/list">방명록으로</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">                          
                             <tbody>
                                   <c:forEach items="${recentgb}" var="t">
										<div class="toast-container p-3" align="center">
		                                	<div class="toast bg-success" style="--bs-bg-opacity: .3;" role="alert" aria-live="assertive" aria-atomic="true">
												<div class="toast-header">
												    <strong class="me-auto">${t.name}</strong>
												    <small><span class="col-3"><fmt:formatDate value="${t.reg_date }" pattern="yyyy.MM.dd"/> </span></small>												    
												</div>
												  <div class="toast-body">
												  	${t.ment }
												  </div>
												</div>	
										</div>
									</c:forEach>																													
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<!-- recent gb End -->
                              	
<!-- content End -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>

</body>

</html>
