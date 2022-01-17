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
	
    <!-- 다음 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type ="text/javascript" src="${nikeweb}/assets/js/postcode.v2.js"></script>
	
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
<script>
/* 다음 주소 검색 api */

function fn_import(){
	$("#name").val("${vo.name}");
	$("#zipcode").val("${vo.zipcode}");
	$("#address1").val("${vo.address1}");
	$("#detailAddr").val("${vo.address2}");
	$("#phone").val("${vo.phone}");
	$("#email").val("${vo.email}");
}

function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddr").value = extraAddr;
            
            } else {
                document.getElementById("extraAddr").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddr").value = "";
            document.getElementById("detailAddr").focus();
        }
    }).open();
}
</script>
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
	                                <label>이름 *</label>
	                                <input type="text" name="name" id="name" maxlength="10">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">	                        
		                        <div class="btnstyle">
		                                <a class="btn-hover" id="btn_import">내 정보 가져오기</a>
		                        </div>	
	                        </div>	
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>우편번호 *</label>
	                                <input type="text" name="zipcode" id="zipcode" placeholder="검색 버튼으로 검색" maxlength="6" readonly>
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">	                        
		                        <div class="btnstyle">
		                                <a class="btn-hover" onclick="DaumPostcode()">주소검색</a>
		                        </div>	
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="billing-info mb-20">
	                                <label>주소 *</label>
	                                <input type="text" name="address1" id="address1"  maxlength="100" readonly>
	                            </div>
	                        </div>
							<div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>상세주소</label>
	                                <input type="text" name="detailAddr" id="detailAddr" maxlength="50">
	                            </div>
	                        </div>
	                        
	                     	<div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>참고항목</label>
	                                <input type="text" name="extraAddr" id="extraAddr">
	                                <input type="hidden" name="address2" id="address2" maxlength="50" value="">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>휴대폰 번호 *</label>
	                                <input type="text"name="phone" id="phone" maxlength="20">
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-6">
	                            <div class="billing-info mb-20">
	                                <label>이메일 *</label>
	                                <input type="email" name="email" id="email">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="additional-info-wrap">
	                        <h4>추가 요청 사항</h4>
	                        <label id="message_label">(0 / 3000)</label>
	                        <div class="additional-info">
	                            <textarea placeholder="배송시 요청사항을 입력" name="message" id="message"></textarea>
	                        </div>
	                    </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="your-order-area">
                    <h3>주문서</h3>
                    <div class="your-order-wrap gray-bg-4">
                        <div class="your-order-product-info">
                            <div class="your-order-top">
                                <ul>
                                    <li>상품명</li>
                                    <li>합계</li>
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
                                    <li class="your-order-shipping">배송료</li>
                                    <li>무료 배송</li>
                                </ul>
                            </div>
                            <div class="your-order-total">
                                <ul>
                                    <li class="order-total">총계</li>
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