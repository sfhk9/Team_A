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
    <title>Flone - Minimal eCommerce HTML Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- jquery -->	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<!-- cart -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/cart.js"></script>
	
	<!-- cart & checkout 공통 function -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/CartAndCheckout.js"></script>
    
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
                <li class="active">장바구니 </li>
            </ul>
        </div>
    </div>
</div>
<div class="cart-main-area pt-90 pb-100">
    <div class="container">
        <h3 class="cart-page-title">장바구니 목록</h3>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="table-content table-responsive cart-table-content">
                    <table id="cartTable">
                    	<caption>>> 수량이 0개인 상품은 저장시 목록에서 지워집니다</caption>
                        <thead>
                            <tr>
                                <th>이미지</th>
                                <th>상품 정보</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                                <th>메모/삭제</th>
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
                                 <td class="product-price-cart">
                                 	<span class="amount">
                                 		<script>
                                 			document.write(fn_comma(${result.price}));
                                 		</script>
                                 	</span>
                                 </td>
                                 <td class="product-quantity">
                                 	<input type="hidden" id="price" value="${result.price}">
                         			<input type="hidden" name="unq" id="unq" value="${result.unq}">
                         			<input type="hidden" name="goods" id="goodsunq" value="${result.goodsunq}">
                                     <div class="cart-plus-minus">
                                     	 <!-- cart 테이블에 수량 관련된 Column 추가 필요함 -->
                                         <input class="cart-plus-minus-box" 
                                         	   type="text" 
                                         	   id="qty"
                                         	   name="qtybutton"
                                         	   value="${result.qty}"
                                         	   onchange="fn_qtychk($(this));">
                                     </div>
                                 </td>
                                 <td id="total" class="product-subtotal">
                                 	<script>
                                 		 document.write(fn_comma(${result.price}));
                                 	</script>
                                 </td>
                                 <td class="product-remove">
                                     <a href="#"><i class="fa fa-pencil"></i></a>
                                     <a><i class="fa fa-times" onclick="fn_delete($(this))"></i></a>
                                </td>
                             </tr>
                           	</c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cart-shiping-update-wrapper">
                            <div class="cart-shiping-update">
                            	<!-- 변경 후 저장 안했을 경우 체크하기 -->
                                <a href="#" id="btn_continue">쇼핑 계속하기</a>
                            </div>
                            <div class="cart-clear">
                            	<button id="btn_save">변경사항 저장하기</button>
                                <a href="#" id="btn_clear">장바구니 비우기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="cart-tax">
                            <div class="title-wrap">
                                <h4 class="cart-bottom-title section-bg-gray">Estimate Shipping And Tax</h4>
                            </div>
                            <div class="tax-wrapper">
                                <p>Enter your destination to get a shipping estimate.</p>
                                <div class="tax-select-wrapper">
                                    <div class="tax-select">
                                        <label>
                                            * Country
                                        </label>
                                        <select class="email s-email s-wid">
                                            <option>Bangladesh</option>
                                            <option>Albania</option>
                                            <option>Åland Islands</option>
                                            <option>Afghanistan</option>
                                            <option>Belgium</option>
                                        </select>
                                    </div>
                                    <div class="tax-select">
                                        <label>
                                            * Region / State
                                        </label>
                                        <select class="email s-email s-wid">
                                            <option>Bangladesh</option>
                                            <option>Albania</option>
                                            <option>Åland Islands</option>
                                            <option>Afghanistan</option>
                                            <option>Belgium</option>
                                        </select>
                                    </div>
                                    <div class="tax-select">
                                        <label>
                                            * Zip/Postal Code
                                        </label>
                                        <input type="text">
                                    </div>
                                    <button class="cart-btn-2" type="submit">Get A Quote</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="discount-code-wrapper">
                            <div class="title-wrap">
                               <h4 class="cart-bottom-title section-bg-gray">Use Coupon Code</h4> 
                            </div>
                            <div class="discount-code">
                                <p>Enter your coupon code if you have one.</p>
                                <form>
                                    <input type="text" required="" name="name">
                                    <button class="cart-btn-2" type="submit">Apply Coupon</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <!-- checkout할 때, update 버튼 눌리게 끔 만들어야 함 (db에 저장 후 checkout으로 이동)-->
                    <div class="col-lg-4 col-md-12">
                        <div class="grand-totall">
                            <div class="title-wrap">
                                <h4 class="cart-bottom-title section-bg-gary-cart">장바구니 총계</h4>
                            </div>
                            <h5>상품 가격 합 <span id="cartTotal">0</span></h5>
                            <div class="total-shipping">
                                <h5>배송 요금</h5>
                                <ul>
                                	<!-- 배송 요금 관련된 column이 필요하지 않을까 싶음 -->
                                    <li><input type="checkbox"> Standard <span>$20.00</span></li>
                                    <li><input type="checkbox"> Express <span>$30.00</span></li>
                                </ul>
                            </div>
                            <h4 class="grand-totall-title">총계  <span id="grandTotal">0</span></h4>
                            <a href="/checkout.do" id="checkout">결제 진행하기</a>
                        </div>
                    </div>
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