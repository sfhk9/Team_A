<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}/nike" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보수정</title>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">	
	<link rel="stylesheet" href="/resources/demos/style.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script> window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>'); </script>
	<link rel="stylesheet" href="${path}/css/main.css">
	<link rel="stylesheet" href="${path}/css/mem_join.css">
	
</head>
<style>
.font_green {
	color : green;
}
.font_red {
	color : red;
}

</style>
<script>
$(function(){
	
	$("#btn_save").click(function(){

		if( $("#pass").val() == "" ) {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;				
		}
		if( $("#name").val() == "" ) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;				
		}
	
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type : "post",
			url  : "memberModifySave.do",
			data : formdata,
			
			datatype : "text",
			success : function(data) {
					if(data == "ok") {
						alert("수정 완료");
						location = "memberModify.do";
					} else if(data == "er1") {
						alert("암호가 일치하지 않습니다.");
					} else {
						alert("저장 실패");
					}
			},
			error : function() {
				alert("저장오류!!");
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
			<article>
				<form id="frm">
					<table class="mem_tbl">
						<caption class="mem_cap">정보수정</caption>
						<tr>
							<th>아이디</th>
							<td>
							${vo.userid }
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pass" id="pass" class="inputBox" placeholder=" 비밀번호를 입력해주세요."></td>
						</tr>
					</table>
					<table class="mem_tbl">
						
						<caption class="mem_cap">개인 정보 입력</caption>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name" value="${vo.name }"class="inputBox" style="width:70px"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><span class="mem_str">※ 오른쪽 달력 아이콘을 이용해 주세요.<br></span>
							<input type="date" name="birth" id="birth" value="${vo.birth }"class="inputBox" >현재 선택일 ${vo.birth }</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="tel" name="phone" id="phone" value="${vo.phone }" class="inputBox"></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><input type="email" name="email" id="email" value="${vo.email }"class="inputBox" style="width:400px" placeholder=" Email 형식을 확인 해주세요. ex) aaa@aaaa.com"></td>
						</tr>
						<tr>
							<th>우편 번호</th>
							<td><input type="text" name="zipcode" id="zipcode" value="${vo.zipcode }"class="inputBox"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="address1" id="address1" value="${vo.address1 }"class="inputBox"></td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td><input type="text" name="address2" id="address2" value="${vo.address2 }"class="inputBox"></td>
						</tr>
					</table>
					<div class="mem_div_btn">
						<button type="submit" class="mem_btn1" id="btn_save" onclick="return false;">수정하기</button>
						<button type="reset" class="mem_btn2">취소</button>
					</div>
				</form>
				
			</article>
			
		</section>
	</div>
	<footer>
		<%@include file="../include/footer.jsp" %>
	</footer>

</body>
</html>