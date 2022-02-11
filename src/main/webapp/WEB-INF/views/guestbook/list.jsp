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

<!-- Table Start -->
            <div class="container-fluid pt-4 px-4 text-center">
                <div class="row g-4 text-center">                                      
                    <div class="col-sm-12 col-xl-10" style="float:none; margin:0 auto">
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
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>                              	
<!-- content End -->

</div>

</body>

</html>
