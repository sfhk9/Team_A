<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="nike" value="${pageContext.request.contextPath}/nike" />
<c:set var="nikeweb" value="${pageContext.request.contextPath}/nike/nikeweb" />
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>주문 목록</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- jquery -->	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<!-- cart -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/cart.js"></script>
	
	<!-- cart & checkout 공통 function -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/comm_price.js"></script>
    
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${nikeweb}/assets/img/favicon.png">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${nikeweb}/assets/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="${nikeweb}/assets/css/icons.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${nikeweb}/assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${nikeweb}/assets/css/style.css">
</head>
<style>
.cart-table-content table tbody > tr td.product-price-cart2 {
  width: 150px;
}
 .cart-table-content table tbody > tr td.product-quantity2 {
  width: 30px;
}
.cart-table-content table tbody > tr td.product-remove2 {
  width: 230px;
}
.button {
  height: 35px;
  width: 50%;
  margin: 2px;
}
.buttoncon {
  background-color: #111111;
  color: white;
}
</style>
<body>
<header class="header-area header-in-container clearfix">
  <%@include file="../include/header.jsp" %>
</header>
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="index.html">홈</a>
                </li>
                <li class="active">주문내역 </li>
            </ul>
        </div>
    </div>
</div>
<div class="cart-main-area pt-90 pb-100">
    <div class="container">
        <h3 class="cart-page-title">주문내역 목록</h3>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="table-content table-responsive cart-table-content">
                    <table id="cartTable">
                        <thead>
                            <tr>
                                <th>이미지</th>
                                <th>상품 정보</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                                <th>주문상태</th>
                                <th>확인/취소/교환</th>
                            </tr>
                        </thead>
                        <tbody>
                       		<c:forEach var="result" items="${list}">
                             <tr>
                                 <td class="product-thumbnail">
                                     <a href="/goodsDetail.do?unq=${result.goodsunq}">
                                     	<img src="${nike}/goods/${result.goodsunq}/${result.thumbnail}" 
                                     		 alt="" 
                                     		 class="product-img"
                                     		 style="width:84px;height:84px;">
                                     </a>
                                 </td>
                                 <td class="product-name">
                                 	<a href="/goodsDetail.do?unq=${result.goodsunq}">${result.name}</a><br>
                                 	<span style="font-size:13px;color:gray">[color : ${result.color} / size : ${result.csize}]</span>	
                                 </td>
                                 <td class="product-price-carts2">
                                 	<span class="amount">
                                 		<script>
                                 			document.write(fn_comma(${result.price}));
                                 		</script>
                                 	</span>
                                 </td>
                                 <td class="product-quantity2">
                                 	${result.qty}
                                 </td>
                                 <td id="total" class="product-subtotal">
                                 	<script>
                                 		 document.write(fn_comma(${result.price*result.qty}));
                                 	</script>
                                 </td>
                                 <td class="product-remove2">
                                     <a>배송시작</a><br>
                                     <a>11/11(토)</a><br>
                                     <a>도착예정</a><br>
                                     <input type="button" class="button" onclick="" value="배송조회"><br>
                                     <input type="button" class="button" onclick="location.href='/goodsDetail.do?unq=${result.goodsunq}';" value="리뷰작성">
                                </td>
                                <td class="product-remove2">
                                     <input type="button" class="button buttoncon" onclick="" value="구매확정"><br>
                                     <input type="button" class="button" onclick="" value="반품신청"><br>
                                     <input type="button" class="button" onclick="" value="교환신청">
                                </td>
                             </tr>
                           	</c:forEach>
                        </tbody>
                    </table>
                </div>
                

            </div>
        </div>
    </div>
</div>

<footer class="footer-area bg-gray pt-100 pb-70">
    <%@include file="../include/footer.jsp" %>
</footer>











<!-- All JS is here
============================================ -->

<script src="${nikeweb}/assets/js/vendor/modernizr-3.11.7.min.js"></script>
<script src="${nikeweb}/assets/js/vendor/jquery-v3.6.0.min.js"></script>
<script src="${nikeweb}/assets/js/vendor/jquery-migrate-v3.3.2.min.js"></script>
<script src="${nikeweb}/assets/js/vendor/popper.min.js"></script>
<script src="${nikeweb}/assets/js/vendor/bootstrap.min.js"></script>
<script src="${nikeweb}/assets/js/plugins.js"></script>
<!-- Ajax Mail -->
<script src="${nikeweb}/assets/js/ajax-mail.js"></script>
<!-- Main JS -->
<script src="${nikeweb}/assets/js/main.js"></script>

</body>

</html>