<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<title>회원가입</title>
</head>
<script>
$(function() {
	
		$("#btn_save").click(function(){  
			
			if( $.trim($("#userid").val()) == "" ) {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			if( $.trim($("#pass").val()) == "" ) {
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			if( $.trim($("#name").val()) == "" ) {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if( $.trim($("#birth").val()) == "" ) {
				alert("생년월일을 입력해주세요.");
				$("#birth").focus();
				return false;
			}
			if( $.trim($("#phone").val()) == "" ) {
				alert("핸드폰 번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			}
			if( $.trim($("#email").val()) == "" ) {
				alert("email을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if( $.trim($("#address1").val()) == "" ) {
				alert("주소를 입력해주세요.");
				$("#address1").focus();
				return false;
			}
			if( $.trim($("#address2").val()) == "" ) {
				alert("상세주소를 입력해주세요.");
				$("#address2").focus();
				return false;
			}
			var formdata = $("#frm").serialize();
			
			$.ajax({
				type : "POST",
				url  : "joinWriteSave.do",
				data : formdata,
				
				datatype : "text",
				success : function(data) {  
					if(data == "ok") {
						alert("저장완료");
						
					} else {
						alert("저장실패");
					}
				},
			    error : function() {
			    	alert("오류발생");
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
				<form id="frm">
					<table class="mem_tbl">
						<caption class="mem_cap">사이트 이용정보 입력</caption>
						<tr>
							<th>아이디</th>
							<td><span class="mem_str">영문자, 숫자,_만 입력 가능. 최소 3자이상 입력하세요.<br></span>
							<input type="text" name="userid" id="userid" class="inputBox" placeholder=" 아이디를 입력해주세요." autofocus>
							
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pass" id="pass" class="inputBox" placeholder=" 비밀번호를 입력해주세요."></td>
						</tr>
				
					</table>
					<table class="mem_tbl">
						<colgroup>
						
						</colgroup>
						<caption class="mem_cap">개인 정보 입력</caption>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name" class="inputBox" style="width:70px"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><span class="mem_str">※ 오른쪽 달력 아이콘을 이용해 주세요.<br></span>
							<input type="date" name="birth" id="birth" class="inputBox" ></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="tel" name="phone" id="phone" class="inputBox"></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><input type="email" name="email" id="email" class="inputBox" style="width:400px" placeholder=" Email 형식을 확인 해주세요. ex) aaa@aaaa.com"></td>
						</tr>
						<tr>
							<th>우편 번호</th>
							<td><input type="text" name="zipcode" id="zipcode" class="inputBox"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="address1" id="address1" class="inputBox"></td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td><input type="text" name="address2" id="address2" class="inputBox"></td>
						</tr>
					</table>
					<div class="mem_div_btn">
						<button type="button" class="mem_btn1" id="btn_save">회원가입</button>
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