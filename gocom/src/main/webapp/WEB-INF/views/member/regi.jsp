<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@include file ="/WEB-INF/views/include/header.jsp" %>
<html>
<head>
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

<!-- 
		<a href="/gocom/board/list">게시판</a>
		<a href="/gocom/guestbook/list">방명록</a>
-->

<div class="container">
<!-- content start -->

<!-- regi Start -->
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
                        	<label for="floatingText">아이디</label>
	                            <input name="userid" maxlength="12" type="text" class="col-8 userid form-control" id="floatingText" placeholder="userid">
	                            <button id="buttonChk" class="btn btn-outline-warning m-2 col-2" type="button">중복확인</button>
	                            <button id="buttonAdj" class="btn btn-outline-info m-2 col-2" type="button">변경</button>
                            <div class="text-primary id_format">영문,숫자만 사용할 수 있습니다.</div>
							<div class="text-primary id_using">사용중인 ID입니다.</div>
							<div class="text-primary id_ok">사용 가능합니다!</div>
                            
                            <div colspan="2">아이디는 영문,숫자 12자 이하로 사용이 가능합니다.</div>
                        </div>
                        
                        <div class="form-floating mb-4">
                        	<label for="floatingPassword">비밀번호</label>
                            <input name="password" id="password" type="password" class="form-control pwd pwdOrg" id="floatingPassword" placeholder="Password">
                        </div>
                        
                        <div class="form-floating mb-4">
                        	<label for="floatingPassword">비밀번호 확인</label>
                            <input name="passwordChk" type="password" class="form-control pwd pwdChk" id="floatingPassword2" placeholder="Password">                            
                            <div class="pwd_ok">확인되었습니다.</div>
							<div class="pwd_wrong">일치하지 않습니다.</div>
                        </div>
                        
                        <div class="form-floating mb-3">
                        	<label for="floatingInput">별명</label>
                            <input name="name" maxlength="12" type="text" class="name form-control" id="floatingInput" placeholder="nickname">                            
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
<!-- regi End -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>                              	
<!-- content End -->

</div>

</body>

</html>
