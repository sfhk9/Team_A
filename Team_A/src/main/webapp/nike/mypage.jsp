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
	<link rel="stylesheet" href="${path}/css/mypage.css">
	<title>Document</title>
</head>

<body>
	<header>
		<%@include file="./include/header.jsp" %>
	</header>
	<nav>
		<%@include file="./include/nav.jsp" %>       
	</nav>
		<div class="wrap">
		<section>
			<aside>
				<div class="board_menu" style="padding-top:50px;">
                    <ul class="list_left">
                        <li class="list_left_title"><a href="#">공지사항</a></li>
                    </ul>

                    <ul class="list_left">
                        <li class="list_left_title"><a href="#">자주 찾는 내용</a></li>
                        <li><a href="#">회원혜택/서비스</a></li>
                        <li><a href="#">A/S</a></li>
                        <li><a href="#">주문결제</a></li>
                        <li><a href="#">회원정보</a></li>
                        <li><a href="#">취소/반품</a></li>
                        <li><a href="#">기타</a></li>
                        <li><a href="#">배송</a></li>
                        <li><a href="#">상품</a></li>
                    </ul>

                    <ul class="list_left">
                        <li class="list_left_title"><a href="#">고객문의</a></li>
                    </ul>
                </div>
			</aside>
			<article>
				<form name="frm" method="post" action="joinSave.jsp">
					
					
					
					
					
					
					
				</form>
				
			</article>
			<aside>
			
			</aside>
		</section>
	</div>
	<footer>
		<%@include file="./include/footer.jsp" %>
	</footer>

</body>
</html>