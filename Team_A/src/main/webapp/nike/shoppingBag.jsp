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
	<link rel="stylesheet" href="${path}/css/shoppingBag.css">
	<link rel="stylesheet" href="${path}/css/order_form.css">
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
			<article>
				<div class="">
					<table class="tbl_bag">
						<tr>
							<td colspan="4" class="td1">
								<input type="checkbox" id="allchk"> 전체 선택 | 
								<span id="unchk" class="unchk">선택삭제</span>
							</td>
						</tr>
						<tr>
							<td class="td2">
								<input type="checkbox" id="chk" value="">
								<img src="#" style="img_bag">
							</td>
							<td class="td3">
								[유니우] 후드 / 신상 / 봄 가을 특앙면 / M~XXL 사이즈 <br>
								옵션 ㅣ 프리즈 / 후드기모 / 블랙 L <br>
								<input type="text">
								<button type="button">옵션변경</button>
							</td>
							<td class="td4">
								23,900원
								<button type="button" class=" ">옵션변경</button>
							</td>
							<td class="td5">무료배송</td>
						</tr>
						<tr>
							<td colspan="4"class="td6">
								스토어 주문 합
								<span>상품금액</span>
								23,900원
								
								-<span>할인금액</span>
								0원
								= 23,900원
							</td>
						</tr>
					</table>
					<div class="div_pass_wrap">
	                    <span class="th1">결제금액</span>
	                    <div class="div_pass_order">
	                        <table class="tbl_pass">
	                            <colgroup>
	                                <col width="40%" />
	                                <col width="60$" />
	                            </colgroup>
	                            <tr>
	                                <td>상품금액</td>
	                                <th>8,500원</th>
	                            </tr>
	                            <tr>
	                                <td>할인금액</td>
	                                <th class="span_discount">-430원</th>
	                            </tr>
	                            <tr>
	                                <td>배송비</td>
	                                <th>0원</th>
	                            </tr>
	                            <tr>
	                                <th class="th3" style="text-align:left;">총 결제금액</th>
	                                <th class="th4">8,070원</th>
	                            </tr>
	                            <tr>
	                                <td colspan="2" style="text-align:center;"><button type="button" class="btn_pass">결제하기</button></td>
	                            </tr>
	                        </table>
	                    </div>
                	</div>
				</div>
			</article>     
		</section>
	</div>
	<footer>
		<%@include file="./include/footer.jsp" %>
	</footer>

</body>
</html>