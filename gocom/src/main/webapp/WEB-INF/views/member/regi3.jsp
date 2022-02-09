<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function () {
	  $('#buttonChk').on("click", function () {
		  var id = $('#userid').val();
		     $.ajax({
		         url:'idvalidcheck',
		         type:'post',
		         data:{userid:id },
		         success:function(data){ // 컨트롤러에서 넘어온 result값을 받는다 
		        	if(data == '0'){ //result가 0이면 : 생성가능 	            	 
		                 $('.id_ok').css("display","inline-block"); 
					     $('.id_using').css("display", "none");
					     $('.id_format').css("display", "none");
					     $('#userid').attr('readonly',true);
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
		  if($('#password').val() == $('#passwordChk').val() ) {
			  $('.pwd_ok').css("display","inline-block");
			  $('.pwd_wrong').css("display","none");
		  } else {
			  $('.pwd_ok').css("display","none");
			  $('.pwd_wrong').css("display","inline-block");
		  }
	  });
	  $('#buttonChk2').on("click", function () {
		  var name = $('#name').val();
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
					    $('#name').attr('readonly',true);
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
		  $('#userid').attr('readonly',false);
	  });
	  
	  $('#buttonAdj2').on("click", function() {
		  $('#buttonSbm').attr('disabled',true);
		  $('#buttonAdj2').css("display","none");
		  $('#buttonChk2').css("display","inline-block");
		  $('#name').attr('readonly',false);
	  });
	  $('#buttonSbm').on("click", function() {
		  if( $('#buttonAdj').css("display") == "none" ) {
			  alert('ID를 확인하세요');
			  $('#userid').focus();
			  return;
		  }
		  if( $('.pwd_ok').css("display") == "none" ) {
			  alert('비밀번호를 확인하세요');
			  $('#password').focus();
			  return;
		  }
		  if( $('#buttonAdj2').css("display") == "none" ) {
			  alert('별명를 확인하세요');
			  $('#name').focus();
			  return;
		  }
		  $('.form1').submit();
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
<%@include file="../include/menu.jsp" %>
	<br/>

	<form class="form1" action="regi_form" method="POST">
		<table>
			<tr>
				<td>ID</td>
				<td><input name="userid" maxlength="12" id="userid"/></td>
				<td><button id="buttonChk" type="button">중복확인</button></td>
				<td><button id="buttonAdj" type="button">변경</button></td>
				<td class="id_format">영문,숫자만 사용할 수 있습니다.</td>
				<td class="id_using">사용중인 ID입니다.</td>
				<td class="id_ok">사용 가능합니다!</td>
			</tr>
			<tr>
				<td colspan="2">아이디는 영문,숫자 12자 이하로 사용이 가능합니다.</td>
			</tr>


			
			<tr>
				<td>비밀번호</td>
				<td><input name="password" class="pwd" id="password" type="password"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input class="pwd" id="passwordChk" type="password"></td>
				<td class="pwd_ok">확인되었습니다.</td>
				<td class="pwd_wrong">일치하지 않습니다.</td>
			</tr>
			
			
			<tr>
				<td>별명</td>
				<td><input name="name" maxlength="12" id="name"/></td>
				<td><button id="buttonChk2" type="button">중복확인</button></td>
				<td><button id="buttonAdj2" type="button">변경</button></td>
				<td class="name_ok">사용 가능합니다!</td>
				<td class="name_reject">사용할 수 없습니다</td>
			</tr>
			<tr>
				<td colspan="2">별명은 한글,영문,숫자 사용 가능합니다.</td>
			</tr>
			
			
			<tr>
				<td><input type="button" id="buttonSbm" value='회원가입'/></td>
			</tr>
			
			
		</table>
	</form>
</body>
</html>

<!-- 

 -->