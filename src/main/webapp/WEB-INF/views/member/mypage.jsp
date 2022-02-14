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
	<div class="container-fluid pt-4 px-4">
		<div class="row g-4 text-center">                                      
			<div class="col-sm-12 col-xl-10" style="float:none; margin:0 auto">
				<div class="bg-light rounded h-100 p-4">
					<table class="table"> 
							<thead class="thead-dark">
							    <tr>
							      <th scope="col">이모티콘</th>
							      <th scope="col">사용횟수</th>
							    </tr>
							</thead>		
							<tbody>										
								<c:forEach items="${list}" var="t">	
									<tr>
										<td>${t.getEmo_name()}</td>
										<td>${t.getUse_cnt()}</td>
									</tr>
								</c:forEach>	
							</tbody>	
					</table>
				</div>
			</div>
		</div>
	</div>
            
<!-- Table End -->
                              	
<!-- content End -->

</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>
