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
				<form name="frm" method="post" action="joinSave.jsp">
					<table align="center" style="width:400px;"> 
						<caption >
							<a href="#"><img src="./simbol.jpg" class="simbol"></a>
							<br>로그인
   						</caption>
						<tr>
							<td style="height:50px;">
								<input type="text" name="userid" 
												   value=""
												   class="input1" 
												   style="width:90%;"
												   placeholder="아이디">								 			
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" name="userpw" 
													   class="input1" 
													   style="width:90%;"
														placeholder="비밀번호">
							</td>	
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="chk" 
													   value="Y" >아이디 기억하기		 								   
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="로그인" class="input2">
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
								<a href="join_agree_r.jsp">
								<input type="button" value="회원가입" class="input4"></a>
							</td>
						</tr>
					</table>
				</form>
				
			</article>
			<aside>
			
			</aside>
		</section>
	</div>
	<footer>
		<%@include file="../include/footer.jsp" %>
	</footer>

</body>
</html>