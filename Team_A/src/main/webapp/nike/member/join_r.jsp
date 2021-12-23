<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}/nike" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	
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
function fn_idchk(userid) {
	var msg = "";
	var len = userid.length;
	if( len  < 4 || len > 12 ) {
		msg = "<span class='font_red'>아이디는 4자리 ~ 12자 사이로 입력바랍니다.</span>";
	} else {
		$.ajax({
			type :"post",
			url  :"id_check.do",
			data :"userid="+userid, 
			
			datatype : "text",
			success  : function(data){
				if( data == "ok" ) msg = "<span class='font_green'>사용 가능한 아이디 입니다.</span>";
				else if( data == "er1" ) msg = "<span class='font_red'>첫 글자는영문, 아이디는 영문+숫자+특수문자(_,-)의 혼합으로만 구성해주세요.</span>";
				else msg = "<span class='font_red'>이미 사용중인 아이디 입니다.</span>";
				
				$("#id_chk_msg").html(msg);
			},
			error : function() {   }
			
		});
	}
	$("#id_chk_msg").html(msg);
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
		if( $("#pass").val() != $("#pass_chk").val()  ) {
			alert("암호가 서로 일치하지 않습니다.");
			$("#pass").focus();
			return false;				
		}
		if( $("#name").val() == "" ) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;				
		}
		if( $("#birth").val() == "" ) {
			alert("생년월일을 선택해주세요.");
			$("#birth").focus();
			return false;				
		}
		if( $("#email").val() == "" ) {
			alert("E-mail을 입력해주세요.");
			$("#email").focus();
			return false;				
		}
		if( $("#address1").val() == "" ) {
			alert("주소를 입력해주세요.");
			$("#address1").focus();
			return false;				
		}
		if( $("#address2").val() == "" ) {
			alert("상세주소를 입력해주세요.");
			$("#address2").focus();
			return false;				
		}
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type : "post",
			url  : "joinWriteSave.do",
			data : formdata,
			
			datatype : "text",
			success : function(data) {
					if(data == "ok") {
						alert("저장 완료");
					} else if(data == "er1") {
						alert("이미 사용중인 아이디 입니다.");
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
						<caption class="mem_cap">사이트 이용정보 입력</caption>
						<tr>
							<th>아이디</th>
							<td><span class="mem_str">영문,숫자만 입력 가능. 최소 3자이상 입력하세요.<br></span>
							<input type="text" 
								   name="userid" 
								   id="userid" 
								   class="inputBox" 						  				  
								   onkeyup="fn_idchk(this.value)"
                        		   maxlength="12"
                        		   placeholder=" 아이디를 입력해주세요." 	
                        		   autofocus>
							 <span id="id_chk_msg"></span>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pass" id="pass" class="inputBox" placeholder=" 비밀번호를 입력해주세요."></td>
						</tr>
						<tr>
                    		<th>비밀번호 확인</th>
                    		<td><input type="password" name="pass_chk" id="pass_chk" class="inputBox"></td>
                		</tr>
					</table>
					<table class="mem_tbl">
						
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
						<button type="submit" class="mem_btn1" id="btn_save" onclick="return false;">회원가입</button>
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