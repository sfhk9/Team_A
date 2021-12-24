<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 리스트</title>
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

//필터데이터 수집 함수
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
    

    $(function(){ 

       	//필터 버튼
		$("#filter").click(function(){
	    	//필터정보 함수 
			var data = filterRe();
	          
			window.location.href = "/goodsList.do?" + data;
		});
       	
       	
		//더보기버튼
		var page = 1;
		$("#add").click(function(){
	    	//필터정보 함수
			var data = filterRe();
	    	
	    	page++;
	    	
	    	data += "&page_no=" + page
	    	
	    	var addurl = "/addList.do?" + data;
	    	
	    	$(".wrap").css('height', 1360*page);
	    	$(".add").css('margin-top', 1360*page-130);
	    	
	    	$('#list').load(addurl);
	    	
		});
		
    });  
</script>


<body>

<header class="header-area header-in-container clearfix">
	<%@include file="../include/header.jsp" %>
</header>

<!-- 경로 -->
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li class="active">Shop </li>
            </ul>
        </div>
    </div>
</div>

<div class="shop-area pt-95 pb-100">
    <div class="container">
        <div class="row flex-row-reverse">
            <div class="col-lg-12">
                <div class="shop-top-bar mb-35">
                    <div class="select-shoing-wrap">
                        <div class="shop-select">
                            <select>
                                <option value="">Sort by newness</option>
                                <option value="">A to Z</option>
                                <option value=""> Z to A</option>
                                <option value="">In stock</option>
                            </select>
                        </div>
                        <p>Showing 1–12 of 20 result</p>
                    </div>
                    <div class="filter-active">
                        <a href="#"><i class="fa fa-plus"></i> filter</a>
                    </div>
                </div>
                <div class="product-filter-wrapper">
                    <div class="row">
                        <!-- Product Filter -->
                        <div class="col-md-3 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>Sort by</h5>
                                <ul class="sort-by">
                                    <li><a href="#">Default</a></li>
                                    <li><a href="#">Popularity</a></li>
                                    <li><a href="#">Average rating</a></li>
                                    <li><a href="#">Newness</a></li>
                                    <li><a href="#">Price: Low to High</a></li>
                                    <li><a href="#">Price: High to Low</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Product Filter -->
                        <div class="col-md-3 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>color filters</h5>
                                <ul class="color-filter">
                                    <li><input type="checkbox" value=""> <a href="#">Black</a></li>
                                    <li><input type="checkbox" value=""> <a href="#">Brown</a></li>
                                    <li><input type="checkbox" value=""> <a href="#">Orange</a></li>
                                    <li><input type="checkbox" value=""> <a href="#">red</a></li>
                                    <li><input type="checkbox" value=""> <a href="#">Yellow</a></li>
                                    <li><input type="checkbox" value=""> <a href="#">purple</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Product Filter -->
                        <div class="col-md-3 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>product tags</h5>
                                <div class="product-tags">
                                    <ul>
                                        <li><a href="#">New</a></li>
                                        <li><a href="#">brand</a></li>
                                        <li><a href="#">black</a></li>
                                        <li><a href="#">white</a></li>
                                        <li><a href="#">chire</a></li>
                                        <li><a href="#">table</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Product Filter -->
                        <div class="col-md-3 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>Filter by price</h5>
                                <div class="price-filter mt-25">
                                    <div class="price-slider-amount">
                                        <input type="text" id="amount" name="price"  placeholder="Add Your Price" />
                                    </div>
                                    <div id="slider-range"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="shop-bottom-area">
                    <div class="row">
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-1.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-1-1.jpg" alt="">
                                    </a>
                                    <span class="pink">-10%</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-2.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-2-1.jpg" alt="">
                                    </a>
                                    <span class="purple">New</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-3.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-3-1.jpg" alt="">
                                    </a>
                                    <span class="pink">-10%</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-4.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-4-1.jpg" alt="">
                                    </a>
                                    <span class="purple">New</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-5.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-5-1.jpg" alt="">
                                    </a>
                                    <span class="pink">-10%</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-6.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-6-1.jpg" alt="">
                                    </a>
                                    <span class="purple">New</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-7.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-4-1.jpg" alt="">
                                    </a>
                                    <span class="pink">-10%</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-8.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-6.jpg" alt="">
                                    </a>
                                    <span class="purple">New</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
                            <div class="product-wrap mb-25 scroll-zoom">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="assets/img/product/pro-1.jpg" alt="">
                                        <img class="hover-img" src="assets/img/product/pro-1-1.jpg" alt="">
                                    </a>
                                    <span class="pink">-10%</span>
                                    <div class="product-action">
                                        <div class="pro-same-action pro-wishlist">
                                            <a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
                                        </div>
                                        <div class="pro-same-action pro-cart">
                                            <a title="Add To Cart" href="#"><i class="pe-7s-cart"></i> Add to cart</a>
                                        </div>
                                        <div class="pro-same-action pro-quickview">
                                            <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="pe-7s-look"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h3><a href="product-details.html">T- Shirt And Jeans</a></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o yellow"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pro-pagination-style text-center mt-30">
                        <ul>
                            <li><a class="prev" href="#"><i class="fa fa-angle-double-left"></i></a></li>
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

<footer class="footer-area bg-gray pt-100 pb-70">
    <%@include file="../include/footer.jsp" %>
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
                                <img src="assets/img/product/quickview-l1.jpg" alt="">
                            </div>
                            <div id="pro-2" class="tab-pane fade">
                                <img src="assets/img/product/quickview-l2.jpg" alt="">
                            </div>
                            <div id="pro-3" class="tab-pane fade">
                                <img src="assets/img/product/quickview-l3.jpg" alt="">
                            </div>
                            <div id="pro-4" class="tab-pane fade">
                                <img src="assets/img/product/quickview-l2.jpg" alt="">
                            </div>
                        </div>
                        <!-- Thumbnail Large Image End -->
                        <!-- Thumbnail Image End -->
                        <div class="quickview-wrap mt-15">
                            <div class="quickview-slide-active owl-carousel nav nav-style-1" role="tablist">
                                <a class="active" data-bs-toggle="tab" href="#pro-1"><img src="assets/img/product/quickview-s1.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-2"><img src="assets/img/product/quickview-s2.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-3"><img src="assets/img/product/quickview-s3.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-4"><img src="assets/img/product/quickview-s2.jpg" alt=""></a>
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