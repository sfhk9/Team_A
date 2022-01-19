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
	
	<!-- 공통 function -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/comm_price.js"></script>
	
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
<style>
.cart-table-content table tbody > tr td.product-price-cart2 {
  width: 180px;
}
 .cart-table-content table tbody > tr td.product-quantity2 {
  width: 30px;
}
.cart-table-content table tbody > tr td.product-remove2 {
  height: 220px;
  width: 200px;
}
.button {
  height: 38px;
  width: 50%;
  margin: 3px;
}
.buttoncon {
  background-color: #111111;
  color: white;
}
.cart-table-content table tbody > tr td.product-price-cart2 span {
  font-weight: 500;
  color: #333;
}
</style>

<script>

function fn_complete(unq){
	
	if( confirm("거래를 완료 하시겠습니까?") ){
		
		$.ajax({			
			type : "post",
			url  : "complete.do",
			data : "unq="+unq,
			datatype : "text",
			success  : function( tex ){
				if(tex == "ok") {
					alert("거래완료 되었습니다.");
					document.location.reload();
				} else {
					alert("처리 실패");
				}
			},
			error    : function(){
				alert("시스템 오류");
			}			
		});	
		
	}
}


</script>

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
                                 		 document.write( fn_comma(${result.price*result.qty}) );
                                 	</script>
                                 </td>
                                 <td class="product-remove2">
									<!-- 변수 세팅 -->
									<c:set var = "stmt" value = "${result.stmt}"/>
																			
									<c:choose>
										
										<c:when test = "${stmt == 1}">
											결제대기<br>
										</c:when>
										
										<c:when test = "${stmt == 2}">
											결제취소<br>
										</c:when>
										
										<c:when test = "${stmt == 3}">
											결제완료<br>
										</c:when>
										
										<c:when test = "${stmt == 4}">
											배송준비<br>
											<input type="button" class="button" onclick="" value="배송조회"><br>
										</c:when>
										
										<c:when test = "${stmt == 5}">
											배송중<br>
											11/11(토)<br>
											도착예정<br>
											<input type="button" class="button" onclick="" value="배송조회"><br>
										</c:when>
										
										<c:when test = "${stmt == 6}">
											배송완료<br>
											11/11(토)<br>
											<input type="button" class="button" onclick="" value="배송조회"><br>
										</c:when>
										
										<c:when test = "${stmt == 7}">
											거래완료<br>
											11/11(토)<br>
											<input type="button" class="button" onclick="" value="배송조회"><br>
											<input type="button" class="button" onclick="location.href='/goodsDetail.do?unq=${result.goodsunq}';" value="리뷰작성">
										</c:when>
										
										<c:when test = "${stmt == 8}">
											교환신청<br>
										</c:when>
										
										<c:when test = "${stmt == 9}">
											교환완료<br>
										</c:when>
										
										<c:when test = "${stmt == 10}">
											반품신청<br>
										</c:when>
										
										<c:when test = "${stmt == 11}">
											반품완료<br>
										</c:when>
										
										<c:otherwise>
											오류<br>
										</c:otherwise>
											
									</c:choose>
                                     
                                </td>
                                
                                <td class="product-remove2">
                                
									<c:choose>
									
										<c:when test = "${stmt == 1}">
											결제대기<br>
											<input type="button" class="button" onclick="" value="거래취소">
										</c:when>
										
										<c:when test = "${stmt == 2}">
											결제취소<br>
										</c:when>
										
										<c:when test = "${stmt == 3}">
											결제완료<br>
											<input type="button" class="button" onclick="" value="거래취소"><br>
											<input type="button" class="button" onclick="" value="교환신청">
										</c:when>
										
										<c:when test = "${stmt == 4}">
											배송준비<br>
											<input type="button" class="button" onclick="" value="거래취소"><br>
											<input type="button" class="button" onclick="" value="교환신청">
										</c:when>
										
										<c:when test = "${stmt == 5}">
											<input type="button" class="button" onclick="" value="거래취소"><br>
											<input type="button" class="button" onclick="" value="교환신청">										
										</c:when>
										
										<c:when test = "${stmt == 6}">
											<input type="button" class="button buttoncon" onclick="fn_complete( ${result.unq} );" value="구매확정"><br>
											<input type="button" class="button" onclick="" value="반품신청"><br>
											<input type="button" class="button" onclick="" value="교환신청">											
										</c:when>
										
										<c:when test = "${stmt == 7}">
											
										</c:when>
										
										<c:when test = "${stmt == 8}">
											<input type="button" class="button" onclick="" value="교환신청취소"><br>
										</c:when>
										
										<c:when test = "${stmt == 9}">
											
										</c:when>
										
										<c:when test = "${stmt == 10}">
											<input type="button" class="button" onclick="" value="반품신청취소"><br>
										</c:when>
										
										<c:when test = "${stmt == 11}">
										
										</c:when>
										
										<c:otherwise>
											오류<br>
										</c:otherwise>
										
									</c:choose>
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