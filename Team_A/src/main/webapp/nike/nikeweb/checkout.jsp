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
	
	<!-- checkout 스크립트 -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/checkout.js"></script>
	
	<!-- cart & checkout 공통 function -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/CartAndCheckout.js"></script>
	
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    
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
                <li class="active">주문결제 </li>
            </ul>
        </div>
    </div>
</div>
<div class="checkout-area pt-95 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="billing-info-wrap">
                    <h3>주문 정보 입력</h3>
                    <form id="frm">
	                    <div class="row">
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>이름 </label>
	                                <input type="text">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <button type="button">가져오기</button>
	                            </div>
	                        </div>		
	                        <div class="col-lg-12">
	                            <div class="billing-info mb-20">
	                                <label>회사명</label>
	                                <input type="text">
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="billing-select mb-20">
	                                <label>Country</label>
	                                <select>
	                                    <option>Select a country</option>
	                                    <option>Azerbaijan</option>
	                                    <option>Bahamas</option>
	                                    <option>Bahrain</option>
	                                    <option>Bangladesh</option>
	                                    <option>Barbados</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="billing-info mb-20">
	                                <label>Street Address</label>
	                                <input class="billing-address" placeholder="House number and street name" type="text">
	                                <input placeholder="Apartment, suite, unit etc." type="text">
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="billing-info mb-20">
	                                <label>Town / City</label>
	                                <input type="text">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>State / County</label>
	                                <input type="text">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>Postcode / ZIP</label>
	                                <input type="text">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>Phone</label>
	                                <input type="text">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>Email Address</label>
	                                <input type="text">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="additional-info-wrap">
	                        <h4>Additional information</h4>
	                        <div class="additional-info">
	                            <label>Order notes</label>
	                            <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="message"></textarea>
	                        </div>
	                    </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="your-order-area">
                    <h3>Your order</h3>
                    <div class="your-order-wrap gray-bg-4">
                        <div class="your-order-product-info">
                            <div class="your-order-top">
                                <ul>
                                    <li>Product</li>
                                    <li>Total</li>
                                </ul>
                            </div>
                            <div class="your-order-middle">
                                <ul>
                                	<c:set var="grandTotal" value="0"/>
                                	<c:forEach var="result" items="${list}">
	                                    <li>
	                                    	<input type="hidden" name="total" value="${result.price*result.qty}">
	                                    	<span class="order-middle-left">${result.name}  X  ${result.qty}</span>
	                                    	<span class="order-price">
	                                    		<script>
	                                    			document.write(fn_comma(${result.price*result.qty}));
	                                    		</script>
	                                    	</span>
	                                    </li>
	                                    <c:set var="grandTotal" value="${grandTotal+(result.price*result.qty)}"/>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="your-order-bottom">
                                <ul>
                                    <li class="your-order-shipping">Shipping</li>
                                    <li>Free shipping</li>
                                </ul>
                            </div>
                            <div class="your-order-total">
                                <ul>
                                    <li class="order-total">Total</li>
                                    <li>
                                 		<script>
                                  			document.write(fn_comma(${grandTotal}));
                                  		</script>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- <div class="payment-method">
                            <div class="payment-accordion element-mrg">
                                <div class="panel-group" id="accordion">
                                    <div class="panel payment-accordion">
                                        <div class="panel-heading" id="method-one">
                                            <h4 class="panel-title">
                                                <a data-bs-toggle="collapse" href="#method1">
                                                    Direct bank transfer
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="method1" class="panel-collapse collapse show" data-bs-parent="#accordion">
                                            <div class="panel-body">
                                                <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel payment-accordion">
                                        <div class="panel-heading" id="method-two">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-bs-toggle="collapse" href="#method2">
                                                    Check payments
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="method2" class="panel-collapse collapse" data-bs-parent="#accordion">
                                            <div class="panel-body">
                                                <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel payment-accordion">
                                        <div class="panel-heading" id="method-three">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-bs-toggle="collapse" href="#method3">
                                                    Cash on delivery
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="method3" class="panel-collapse collapse" data-bs-parent="#accordion">
                                            <div class="panel-body">
                                                <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <div class="Place-order mt-25">
                        <a class="btn-hover" id="btn_save">주문 접수</a>
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