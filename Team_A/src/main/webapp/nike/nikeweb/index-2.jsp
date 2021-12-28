<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 리스트</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/nike/nikeweb/assets/img/favicon.png">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/nike/nikeweb/assets/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="/nike/nikeweb/assets/css/icons.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="/nike/nikeweb/assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="/nike/nikeweb/assets/css/style.css">
</head>

<script>
$( function() {
	   $( ".selector" ).checkboxradio({
	      icon: false
	   });
}); 
</script>

<script>
//데이터 수집 함수
function filterRe() {
		
	//타입 데이터 
	var ctgtype_len = $("input[name='ctgtype']").length;
	var ctgtype = "";
	
	for( var i=0; i<ctgtype_len; i++ ) {
	   var ctgtype_val = document.getElementsByName('ctgtype')[i].checked;
	   if( ctgtype_val == true ) {
	      ctgtype += document.getElementsByName('ctgtype')[i].value;
	      ctgtype += ",";
	   }
	}
	
	//성별 데이터 
	var ctggender_len = $("input[name='ctggender']").length;
	var ctggender = "";
	
	for( var i=0; i<ctggender_len; i++ ) {
	     var ctggender_val = document.getElementsByName('ctggender')[i].checked;
	     if( ctggender_val == true ) {
	        ctggender += document.getElementsByName('ctggender')[i].value;
	     }
	  }
	
	//색상 데이터 
	var color_len = $("input[name='color']").length;
	var color = "";
	
	for( var i=0; i<color_len; i++ ) {
	     var color_val = document.getElementsByName('color')[i].checked;
	     if( color_val == true ) {
	        color += document.getElementsByName('color')[i].value;
	        color += ",";       
	     }
	  }
	
	//가격 데이터
	var pricemin = "";
	   pricemin = document.getElementById("price_min").value;
	
	var pricemax = "";
	   pricemax = document.getElementById("price_max").value;	
	//최종 보낼 데이터
	var data = "";
	
	if ( ctgtype != ""    ) {   data += "ctgtype=" + ctgtype + "&"; }    
	if ( ctggender != "") {   data += "ctggender=" + ctggender + "&"; }    
	if ( color != ""    ) {   data += "color=" + color + "&"; }    
	if ( pricemin != ""   ) {   data += "pricemin=" + pricemin + "&";}
	if ( pricemax != ""   ) { data += "pricemax=" + pricemax + "&";}
	
	alert(data+"입니다");
	
	return data;

} 
    
//페이징 버튼

$("#add").click(function(){
   	//필터정보 함수
	var data = filterRe();
   	
   	page++;
   	
   	data += "&page_no=" + page
   	
   	var addurl = "/addList.do?" + data;
   	
   	$('#list').load(addurl);
   	
});
		
</script>
<body>

<header class="header-area header-in-container clearfix">
	<%@include file="../include/header.jsp" %>
</header>
<div class="slider-area ml-70 mr-70">
    <div class="slider-active owl-carousel nav-style-1 owl-dot-none">
        <div class="single-slider-2 slider-height-1 d-flex align-items-center slider-height-res bg-img" style="background-image:url(assets/img/slider/slider-1.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-7 ms-auto">
                        <div class="slider-content-2 slider-animated-1">
                            <h3 class="animated">Sale Off 40%</h3>
                            <h1 class="animated">Summer Offer <br>2020 Collection</h1>
                            <div class="slider-btn btn-hover">
                                <a class="animated" href="../../Flone/flone/shop.html">SHOP NOW</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single-slider-2 slider-height-1 d-flex align-items-center slider-height-res bg-img" style="background-image:url(../../Flone/flone/assets/img/slider/slider-2-2.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-7 ms-auto">
                        <div class="slider-content-2 slider-animated-1">
                            <h3 class="animated">Sale Off 40%</h3>
                            <h1 class="animated">Summer Offer <br>2020 Collection</h1>
                            <div class="slider-btn btn-hover">
                                <a class="animated" href="shop.html">SHOP NOW</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="shop-area pt-95 pb-100">
    <div class="container">
        <div class="row flex-row-reverse">
            <div class="col-lg-12">
            
            	<!-- 필터시작///////////////////// -->
				<%@include file="subFilter.jsp" %>
            	<!-- 필터끝////////////////////// -->
            	
                <div class="shop-bottom-area">
                    <div class="row">
	                    
	                    <!-- 리스트 시작//////////// -->
						<%@include file="subList.jsp" %>
						<!-- 리스트 끝 //////////// -->

						<!-- 페이징 버튼 -->
						<div class="pro-pagination-style text-center mt-30">
	                        <ul>
	                        	<li><a class="prev" href="#"><i class="fa fa-angle-double-left"></i></a></li>
								<c:forEach var="i" begin="1" end="${total_page }">
									<a href="">${i }</a>
								</c:forEach>	                            
	                            <li><a class="active" href="#">1</a></li>
	                            <li><a href="#">2</a></li>
	                            <li><a class="next" href="#"><i class="fa fa-angle-double-right"></i></a></li>
	                        </ul>
						</div>                       
					</div>
       			</div>       			     
            </div>
        </div>
    </div>
</div>
<div class="blog-area pb-55">
    <div class="container">
        <div class="section-title text-center mb-55">
            <h2>OUR BLOG</h2>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-wrap mb-30 scroll-zoom">
                    <div class="blog-img">
                        <a href="blog-details.html"><img src="../../Flone/flone/assets/img/blog/blog-1.jpg" alt=""></a>
                        <span class="purple">Lifestyle</span>
                    </div>
                    <div class="blog-content-wrap">
                        <div class="blog-content text-center">
                            <h3><a href="blog-details.html">Lorem ipsum dolor sit <br> amet consec.</a></h3>
                            <span>By Shop <a href="#">Admin</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-wrap mb-30 scroll-zoom">
                    <div class="blog-img">
                        <a href="blog-details.html"><img src="../../Flone/flone/assets/img/blog/blog-2.jpg" alt=""></a>
                        <span class="pink">Lifestyle</span>
                    </div>
                    <div class="blog-content-wrap">
                        <div class="blog-content text-center">
                            <h3><a href="blog-details.html">Lorem ipsum dolor sit <br> amet consec.</a></h3>
                            <span>By Shop <a href="#">Admin</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-wrap mb-30 scroll-zoom">
                    <div class="blog-img">
                        <a href="blog-details.html"><img src="../../Flone/flone/assets/img/blog/blog-3.jpg" alt=""></a>
                        <span class="purple">Lifestyle</span>
                    </div>
                    <div class="blog-content-wrap">
                        <div class="blog-content text-center">
                            <h3><a href="blog-details.html">Lorem ipsum dolor sit <br> amet consec.</a></h3>
                            <span>By Shop <a href="#">Admin</a></span>
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
<!-- Modal -->
<%@include file="subModel.jsp" %>
<!-- Modal end -->
<!-- All JS is here
============================================ -->

<script src="/nike/nikeweb/assets/js/vendor/modernizr-3.11.7.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/jquery-v3.6.0.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/jquery-migrate-v3.3.2.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/popper.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/bootstrap.min.js"></script>
<script src="/nike/nikeweb/assets/js/plugins.js"></script>
<!-- Ajax Mail -->
<script src="/nike/nikeweb/assets/js/ajax-mail.js"></script>
<!-- Main JS -->
<script src="/nike/nikeweb/assets/js/main.js"></script>

</body>

</html>