<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>관리자로그인</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../../Flone/flone/assets/img/favicon.png">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../../Flone/flone/assets/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="../../Flone/flone/assets/css/icons.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="../../Flone/flone/assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="../../Flone/flone/assets/css/style.css">
</head>

<script>
function admin_logout(){
	
	if( confirm("로그아웃하시겠습니까?") ){
		
		$.ajax({			
			type : "post",
			data : "",
			url  : "/adminout.do",
			
			datatype : "text",
			success  : function(){
				alert("로그아웃 되었습니다.");
				location="adminLogin.do";
			},
			error    : function(){
				
			}			
		});		
	}
}
// 로그인 - 유효성 체크
	$(function(){	
		$("#btn_save").click(function(){
			
			if( $("#adminid").val() == "" ) {
				alert("아이디를 입력해주세요.");
				$("#adminid").focus();
				return false;				
			}
			if( $("#adminpass").val() == "" ) {
				alert("암호를 입력해주세요.");
				$("#adminpass").focus();
				return false;				
			}		
			var formdata = $("#frm").serialize();			
			$.ajax({
				type : "post",
				url  : "adminCertify.do", // (1) 검증 , (2) 세션
				data : formdata,
				
				datatype : "text",
				success : function(data) {
						if(data == "ok") {
							alert( "관리자님 로그인 되었습니다.");							
							location = "adminLogin.do";							
						} else if(data == "er1") {
							alert("존재하지 않는 정보입니다.");
						} else {
							alert("인증 실패");
						}
				},
				error : function() {
					alert("오류!!");
				}
				
				
			});
		});
	});
</script>
<body>
<header class="header-area header-in-container clearfix">
   <%@include file="../../include/header.jsp" %>
</header>
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="index.do">홈</a>
                </li>
                <li class="active">관리자 로그인 </li>
            </ul>
        </div>
    </div>
</div>
<div class="login-register-area pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-12 ms-auto me-auto">
                <div class="login-register-wrapper">
                    <div class="login-register-tab-list nav">                       
                        <a class="active" data-bs-toggle="tab" href="#lg1">
                            <h4> 관리자 로그인 </h4>
                        </a>                       
                    </div>
                    <div class="tab-content">
                        <div id="lg1" class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form id="frm" >                               
                                         	<%
						   					 String session_admin = (String) session.getAttribute("AdminSessionId");
					    					%> 
					    					<%
				            				if(session_admin == null){
				           					 %>      
                                        <input type="text" 
                                         	   name="adminid" 
                                         	   id="adminid" 
                                         	   maxlength="12" 
                                         	   placeholder="아이디">
                                        <input type="password" 
                                        	   name="adminpass" 
                                        	   id="adminpass" 
                                        	   placeholder="비밀번호">
                                        <div class="button-box" >                                            
                                                                                
                                            <button type="submit" id="btn_save" onclick="return false;"><span>로그인</span></button>                                                       
                                        	<%
				            				} else {
				            				%> 
				            				<span>관리자</span>
				            				<button type="button"  onclick="javascript:admin_logout()"><span>로그아웃</span></button>
				            				<%
				            				}
				            				%>      
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>               
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="footer-area bg-gray pt-100 pb-70">
    <%@include file="../../include/footer.jsp" %>
</footer>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5 col-sm-12 col-xs-12">
                        <div class="tab-content quickview-big-img">
                            <div id="pro-1" class="tab-pane fade show active">
                                <img src="../../Flone/flone/assets/img/product/quickview-l1.jpg" alt="">
                            </div>
                            <div id="pro-2" class="tab-pane fade">
                                <img src="../../Flone/flone/assets/img/product/quickview-l2.jpg" alt="">
                            </div>
                            <div id="pro-3" class="tab-pane fade">
                                <img src="../../Flone/flone/assets/img/product/quickview-l3.jpg" alt="">
                            </div>
                            <div id="pro-4" class="tab-pane fade">
                                <img src="../../Flone/flone/assets/img/product/quickview-l2.jpg" alt="">
                            </div>
                        </div>
                        <!-- Thumbnail Large Image End -->
                        <!-- Thumbnail Image End -->
                        <div class="quickview-wrap mt-15">
                            <div class="quickview-slide-active owl-carousel nav nav-style-1" role="tablist">
                                <a class="active" data-bs-toggle="tab" href="#pro-1"><img src="assets/img/product/quickview-s1.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-2"><img src="../../Flone/flone/assets/img/product/quickview-s2.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-3"><img src="../../Flone/flone/assets/img/product/quickview-s3.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-4"><img src="../../Flone/flone/assets/img/product/quickview-s2.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12">
                        <div class="product-details-content quickview-content">
                            <h2>Products Name Here</h2>
                            <div class="product-details-price">
                                <span>$18.00 </span>
                                <span class="old">$20.00 </span>
                            </div>
                            <div class="pro-details-rating-wrap">
                                <div class="pro-details-rating">
                                    <i class="fa fa-star-o yellow"></i>
                                    <i class="fa fa-star-o yellow"></i>
                                    <i class="fa fa-star-o yellow"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <span>3 Reviews</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisic elit eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim ad minim venialo quis nostrud exercitation ullamco</p>
                            <div class="pro-details-list">
                                <ul>
                                    <li>- 0.5 mm Dail</li>
                                    <li>- Inspired vector icons</li>
                                    <li>- Very modern style  </li>
                                </ul>
                            </div>
                            <div class="pro-details-size-color">
                                <div class="pro-details-color-wrap">
                                    <span>Color</span>
                                    <div class="pro-details-color-content">
                                        <ul>
                                            <li class="blue"></li>
                                            <li class="maroon active"></li>
                                            <li class="gray"></li>
                                            <li class="green"></li>
                                            <li class="yellow"></li>
                                            <li class="white"></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="pro-details-size">
                                    <span>Size</span>
                                    <div class="pro-details-size-content">
                                        <ul>
                                            <li><a href="#">s</a></li>
                                            <li><a href="#">m</a></li>
                                            <li><a href="#">l</a></li>
                                            <li><a href="#">xl</a></li>
                                            <li><a href="#">xxl</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="pro-details-quality">
                                <div class="cart-plus-minus">
                                    <input class="cart-plus-minus-box" type="text" name="qtybutton" value="2">
                                </div>
                                <div class="pro-details-cart btn-hover">
                                    <a href="#">Add To Cart</a>
                                </div>
                                <div class="pro-details-wishlist">
                                    <a href="#"><i class="fa fa-heart-o"></i></a>
                                </div>
                                <div class="pro-details-compare">
                                    <a href="#"><i class="pe-7s-shuffle"></i></a>
                                </div>
                            </div>
                            <div class="pro-details-meta">
                                <span>Categories :</span>
                                <ul>
                                    <li><a href="#">Minimal,</a></li>
                                    <li><a href="#">Furniture,</a></li>
                                    <li><a href="#">Electronic</a></li>
                                </ul>
                            </div>
                            <div class="pro-details-meta">
                                <span>Tag :</span>
                                <ul>
                                    <li><a href="#">Fashion, </a></li>
                                    <li><a href="#">Furniture,</a></li>
                                    <li><a href="#">Electronic</a></li>
                                </ul>
                            </div>
                            <div class="pro-details-social">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->









<!-- All JS is here
============================================ -->

<script src="../../Flone/flone/assets/js/vendor/modernizr-3.11.7.min.js"></script>
<script src="../../Flone/flone/assets/js/vendor/jquery-v3.6.0.min.js"></script>
<script src="../../Flone/flone/assets/js/vendor/jquery-migrate-v3.3.2.min.js"></script>
<script src="../../Flone/flone/assets/js/vendor/popper.min.js"></script>
<script src="../../Flone/flone/assets/js/vendor/bootstrap.min.js"></script>
<script src="../../Flone/flone/assets/js/plugins.js"></script>
<!-- Ajax Mail -->
<script src="../../Flone/flone/assets/js/ajax-mail.js"></script>
<!-- Main JS -->
<script src="../../Flone/flone/assets/js/main.js"></script>

</body>

</html>