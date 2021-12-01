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
	<link rel="stylesheet" href="${path}/css/mem_find_info.css">
	<title>Document</title>
</head>
<script>
        function CheckEmail()
        {
            var mail_val = document.querySelector('#email').value;
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

            if (!reg_email.test(mail_val)) {
                alert('메일을 다시쓰세요')
                return false;

            } else {

                return true;

            }

        }
</script>
<body>
	<div class="wrap">
	    <div class="info">
	        <h1 class="title">회원정보 찾기</h1>
	        <fieldset id="info">
	            <p>
	                회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
	                해당 이메일로 아이디와 비밀번호 정보를 보내드립니다.
	            </p>
	            <div>
	                <caption>E-mail 주소</caption><br>
	                <input type="email" 
	                       maxlength="30" 
	                       autofocus id="email" 
	                       class="email_input required">
	            </div>
	        </fieldset>
	
	        <fieldset id="info" class="cah">
	            <div class="captcha-box">
	                <img class="capcha">
	                <button type="button" id="captcha_sound">
	                    <span></span>
	                </button>
	                <button type="button" id="captcha_reload">
	                    <span></span>
	                </button>
	                <input type="text"
	                	   name="captcha_key" 
	                	   id="captcha_key" 
	                	   required="" 
	                	   class="captcha_box required" 
	                	   size="6"
	                       maxlength="6">
	            </div>
	
	            <span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
	        </fieldset>
	
	        <div class="win_btn">
	            <input type="submit" 
	             	   value="확인" 
	             	   class="btn_submit" 
	             	   onclick="CheckEmail()">
	            <button type="button" onclick="window.close();">창닫기</button>
	        </div>
	    </div>
	</div>
</body>
</html>