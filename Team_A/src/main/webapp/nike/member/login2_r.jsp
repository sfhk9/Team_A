<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}/nike" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script> window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>'); </script>
	<link rel="stylesheet" href="${path}/css/main.css">
	<link rel="stylesheet" href="${path}/css/mem_login2.css">
	<title>로그인</title>
</head>
<style>
table {
	margin-left:180px;

}
font_green {
	color : green;
}
.font_red {
	color : red;
}
</style>
<script>
  
function fn_logout(){
	
	if( confirm("로그아웃하시겠습니까?") ){
		
		$.ajax({			
			type : "post",
			data : "",
			url  : "/logout.do",
			
			datatype : "text",
			success  : function(){
				alert("로그아웃 되었습니다.");
				location="/loginWrite.do";
			},
			error    : function(){
				
			}			
		});		
	}
}

	$(function(){
		
		$("#btn_save").click(function(){
			
			if( $("#userid").val() == "" ) {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;				
			}
			if( $("#pass").val() == "" ) {
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;				
			}
			
			
			var formdata = $("#frm").serialize();
			
			$.ajax({
				type : "post",
				url  : "loginCertify.do", // (1) 검증 , (2) 세션
				data : formdata,
				
				datatype : "text",
				success : function(data) {
						if(data == "ok") {
							alert( $("#userid").val() + "님 로그인 되었습니다.");							
							location = "loginWrite.do";							
						} else if(data == "er1") {
							alert("존재하지 않는 정보입니다.");
						} else {
							alert("인증 실패");
						}
				},
				error : function() {
					alert("오류!!");
				}
				
			});
		});
	});
</script>
<body>
	<header>
		<%@include file="../include/header.jsp" %>
	</header>
	<nav>
		<%@include file="../include/nav.jsp" %>       
	</nav>
		<div class="wrap">
		<section>
			<aside>
			</aside>
			<article>
				<form id="frm" >
					<table align="center" style="width:400px;"> 
					<%
  					 String session_id = (String) session.getAttribute("MemberSessionId");
  					%>
  					<%
            		if(session_id == null){
            		%> 
						<caption >
							<a href="#"><img src="/nike/member/simbol.jpg" class="simbol"></a>
							<br>로그인
   						</caption>
						<tr>
							<td style="height:50px;">
								<input type="text" 
									   name="userid" 
									   id="userid"
									   class="input1" 
									   maxlength="12"
									   style="width:90%;"
									   placeholder="아이디">								 			
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" 
									   name="pass" 
									   id="pass"
									   class="input1" 
									   style="width:90%;"
    								   placeholder="비밀번호">
							</td>	
						</tr>					
						<tr>
							<td>
								<button type="submit" class="input2" id="btn_save" onclick="return false;">로그인</button>
							</td>
						</tr>
						<tr>
							<td>
								<a href="find_info_r.jsp">
								<input type="button" value="아이디/비번찾기" class="input3"></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="joinAgree.do">
								<input type="button" value="회원가입" class="input4"></a>
							</td>
						</tr>
						<%
            		    }else{
						%>
						<caption >
							<a href="#"><img src="/nike/member/simbol.jpg" class="simbol"></a>
							<br>로그아웃
   						</caption>						 
						<tr>
							<td style="height:48px;">
								아이디님!<br>
								반갑습니다~!			 			
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" class="input2" onclick="javascript:fn_logout()">로그아웃</button>
							</td>
						</tr>
						<tr>
							<td>
								<a href="myPage.do">
								<input type="button" value="마이페이지" class="input3"></a>
							</td>
						</tr>					
						<tr>
							<td>
								<a href="memberModify.do">
								<input type="button" value="정보수정" class="input4"></a>
							</td>
						</tr>
						<%
            		    }
						%>
					</table>				
				</form>		
			</article>
			
		</section>
	</div>
	<footer>
		<%@include file="../include/footer.jsp" %>
	</footer>

</body>
</html>