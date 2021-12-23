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
	<title>마이페이지</title>
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
					<div class="mypage">MY PAGE</div>
                    <div class="userinfo">         	
	                    <img src="${path}/images/img_user.png" class="userimg">
	                    <span class="userid">USER_ID</span>
                    </div>

                    <ul class="left_list">
                        <li class="list_title"><a href="#">나의 정보</a></li>
                        <li><a href="#">회원정보 관리</a></li>
                        <li><a href="#">비밀번호변경</a></li>
                        <li><a href="#">회원탈퇴</a></li>
                    </ul>

                    <ul class="left_list">
                        <li class="list_title"><a href="#">쇼핑정보</a></li>
                        <li><a href="#">최근 쇼핑 내용</a></li>
                    </ul>
                </div>
			</aside>
			<article>
				<form name="frm" method="post" >
					<div class="div_content">
						<table class="tbl_list">
							<caption>최근 쇼핑 내용</caption>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
						</table>
						<table class="tbl_list">
							<caption>최근 쇼핑 내용</caption>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
						</table>
						<table class="tbl_list">
							<caption>최근 쇼핑 내용</caption>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
							<tr>
								<td>내용내용내용내용</td>
							</tr>
						</table>
					</div>	
				</form>
			</article>
		</section>
	</div>
	<footer>
		<%@include file="./include/footer.jsp" %>
	</footer>

</body>
</html>