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
	<link rel="stylesheet" href="${path}/css/mem_join.css">
	<title>Document</title>
</head>
<script>
	function fn_submit() {	   
		if( document.frm.userid.value == "" ) {
				alert("ID를 입력해주세요.");
				document.frm.userid.focus();
				return false;
		}
		if( document.frm.userpass.value == "" ) {
			alert("비밀번호를 입력해주세요.");
			document.frm.userpass.focus();
			return false;
		}
		if( document.frm.userpass_chk.value == "" ) {
			alert("비밀번호확인을 입력해주세요.");
			document.frm.userpass_chk.focus();
			return false;
		}
		if( document.frm.username.value == "" ) {
			alert("이름을 입력해주세요.");
			document.frm.username.focus();
			return false;
		}
		if( document.frm.phone.value == "" ) {
			alert("핸드폰번호를 입력해주세요.");
			document.frm.phone.focus();
			return false;
		}
		document.frm.submit();
	}
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
				<form name="frm" method="post" action="joinSave.jsp">
					<table class="mem_tbl">
						<caption class="mem_cap">사이트 이용정보 입력</caption>
						<tr>
							<th>아이디</th>
							<td><span class="mem_str">영문자, 숫자,_만 입력 가능. 최소 3자이상 입력하세요.<br></span>
							<input type="text" name="userid" class="inputBox"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="userpass" class="inputBox"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="userpass_chk" class="inputBox"></td>
						</tr>
					</table>
					<table class="mem_tbl">
						<colgroup>
						
						</colgroup>
						<caption class="mem_cap">개인정보입력</caption>
						<tr>
							<th>이름</th>
							<td><input type="text" name="username" class="inputBox" style="width:70px"></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><span class="mem_str">공백없이 한글, 영문 숫자만 입력 가능 (한글2자, 영문4자 이상) <br>
							닉네임을 바꾸시면 앞으로 60일 이내에는 변경할 수 없습니다.</span> <br>
							<input type="text" name="nickname" class="inputBox" style="width:100px"></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><input type="email" name="email" class="inputBox" style="width:400px"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="tel" name="tel" class="inputBox"></td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td><input type="tel" name="phone" class="inputBox"></td>
						</tr>
					</table>
					<div class="mem_div_btn">
						<button type="submit" class="mem_btn1"onclick="fn_submit();return false;">회원가입</button>
						<button type="reset" class="mem_btn2">취소</button>
					</div>
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