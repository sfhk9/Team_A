<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>나이키 메인페이지</title>
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

<body>

<header class="header-area header-padding-2 sticky-bar header-res-padding clearfix">
	<%@include file="../include/header.jsp" %>
</header>


<div class="slider-area">
    <div class="slider-active owl-carousel nav-style-1 owl-dot-none">
    
        <div class="single-slider-2 slider-height-1 d-flex align-items-center slider-height-res bg-img" style="background-image:url(/nike/images/main.jpg);">
            <div class="container">
                <div class="row">
                    
                </div>
            </div>
        </div>
        
        <div class="single-slider-2 slider-height-1 d-flex align-items-center slider-height-res bg-img" style="background-color: #ff99cc;">
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

<div class="banner-area pt-60 pb-65">
    <div class="container">
        <div class="row">
        
            <div class="col-lg-4 col-md-4">
                <div class="single-banner mb-30">
                    <a href="product-details.html"><img src="assets/img/banner/banner-1.jpg" alt=""></a>
                    <div class="banner-content">
                        <h3>Watches</h3>
                        <h4>Starting at <span>$99.00</span></h4>
                        <a href="product-details.html"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-md-4">
                <div class="single-banner mb-30">
                    <a href="product-details.html"><img src="assets/img/banner/banner-2.jpg" alt=""></a>
                    <div class="banner-content">
                        <h3>Plo Bag</h3>
                        <h4>Starting at <span>$79.00</span></h4>
                        <a href="product-details.html"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-md-4">
                <div class="single-banner mb-30">
                    <a href="product-details.html"><img src="assets/img/banner/banner-3.jpg" alt=""></a>
                    <div class="banner-content">
                        <h3>Sunglass</h3>
                        <h4>Starting at <span>$79.00</span></h4>
                        <a href="product-details.html"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>

<div class="product-area pb-60">
    <div class="container">
        <div class="tab-filter-wrap mb-60">
            <div class="product-tab-list-2 nav">
                <a href="#product-1" data-bs-toggle="tab" >
                    <h4>New Arrivals  </h4>
                </a>
                <a class="active" href="#product-2" data-bs-toggle="tab">
                    <h4>Best Sellers </h4>
                </a>
                <a href="#product-3" data-bs-toggle="tab">
                    <h4>Sale Items</h4>
                </a>
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
        <div class="tab-content jump">
            <div class="tab-pane" id="product-1">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Awesome Tote Bag</a></h3>
                                    <div class="price-2">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-4.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-4.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Timex Watch</a></h3>
                                    <div class="price-2">
                                        <span>$ 70.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-3.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-3.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Leather Crossbody Purse</a></h3>
                                    <div class="price-2">
                                        <span>$ 40.00</span>
                                        <span class="old">$ 50.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-2.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-2.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Sunflower Shoes</a></h3>
                                    <div class="price-2">
                                        <span>$ 80.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-1.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-1.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Winter Zipper </a></h3>
                                    <div class="price-2">
                                        <span>$ 30.00</span>
                                        <span class="old">$ 40.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-8.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-8.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Winter Zipper </a></h3>
                                    <div class="price-2">
                                        <span>$ 90.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-7.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-7.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Makeup Brushes</a></h3>
                                    <div class="price-2">
                                        <span>$ 20.00</span>
                                        <span class="old">$ 30.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-6.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-6.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Ladies Gown</a></h3>
                                    <div class="price-2">
                                        <span>$ 50.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane active" id="product-2">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-1.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-1.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Winter Zipper</a></h3>
                                    <div class="price-2">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-2.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-2.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Sunflower Shoes</a></h3>
                                    <div class="price-2">
                                        <span>$ 70.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-3.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-3.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Leather Crossbody Purse</a></h3>
                                    <div class="price-2">
                                        <span>$ 40.00</span>
                                        <span class="old">$ 50.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-4.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-4.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Timex Watch</a></h3>
                                    <div class="price-2">
                                        <span>$ 80.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Awesome Tote Bag</a></h3>
                                    <div class="price-2">
                                        <span>$ 30.00</span>
                                        <span class="old">$ 40.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-6.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-6.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Ladies Gown</a></h3>
                                    <div class="price-2">
                                        <span>$ 90.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-7.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-7.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Makeup Brushes</a></h3>
                                    <div class="price-2">
                                        <span>$ 20.00</span>
                                        <span class="old">$ 30.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-8.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-8.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Winter Zipper</a></h3>
                                    <div class="price-2">
                                        <span>$ 50.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="product-3">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-8.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-8.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Winter Zipper</a></h3>
                                    <div class="price-2">
                                        <span>$ 60.00</span>
                                        <span class="old">$ 60.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-7.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-7.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Makeup Brushes</a></h3>
                                    <div class="price-2">
                                        <span>$ 70.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-6.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-6.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Ladies Gown</a></h3>
                                    <div class="price-2">
                                        <span>$ 40.00</span>
                                        <span class="old">$ 50.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Awesome Tote Bag</a></h3>
                                    <div class="price-2">
                                        <span>$ 80.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-4.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-4.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Timex Watch</a></h3>
                                    <div class="price-2">
                                        <span>$ 30.00</span>
                                        <span class="old">$ 40.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-3.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-3.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Leather Crossbody Purse</a></h3>
                                    <div class="price-2">
                                        <span>$ 90.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-2.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-2.jpg" alt="">
                                </a>
                                <span class="pink">-10%</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Sunflower Shoes</a></h3>
                                    <div class="price-2">
                                        <span>$ 20.00</span>
                                        <span class="old">$ 30.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-1.jpg" alt="">
                                    <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-1.jpg" alt="">
                                </a>
                                <span class="purple">New</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                    <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Winter Zipper </a></h3>
                                    <div class="price-2">
                                        <span>$ 50.00</span>
                                    </div>
                                </div>
                                <div class="pro-wishlist-2">
                                    <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
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
                        <a href="blog-details.html"><img src="/nike/nikeweb/assets/img/blog/blog-1.jpg" alt=""></a>
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
                        <a href="blog-details.html"><img src="/nike/nikeweb/assets/img/blog/blog-2.jpg" alt=""></a>
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
                        <a href="blog-details.html"><img src="/nike/nikeweb/assets/img/blog/blog-3.jpg" alt=""></a>
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
    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-4">
                <div class="copyright mb-30">
                    <div class="footer-logo">
                        <a href="index.html">
                            <img alt="" src="assets/img/logo/logo.png">
                        </a>
                    </div>
                    <p>© 2021 <a href="#">Flone</a>.<br> All Rights Reserved</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4">
                <div class="footer-widget mb-30 ml-30">
                    <div class="footer-title">
                        <h3>ABOUT US</h3>
                    </div>
                    <div class="footer-list">
                        <ul>
                            <li><a href="about.html">About us</a></li>
                            <li><a href="#">Store location</a></li>
                            <li><a href="contact.html">Contact</a></li>
                            <li><a href="#">Orders tracking</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4">
                <div class="footer-widget mb-30 ml-50">
                    <div class="footer-title">
                        <h3>USEFUL LINKS</h3>
                    </div>
                    <div class="footer-list">
                        <ul>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Support Policy</a></li>
                            <li><a href="#">Size guide</a></li>
                            <li><a href="#">FAQs</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6">
                <div class="footer-widget mb-30 ml-75">
                    <div class="footer-title">
                        <h3>FOLLOW US</h3>
                    </div>
                    <div class="footer-list">
                        <ul>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">Youtube</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer-widget mb-30 ml-70">
                    <div class="footer-title">
                        <h3>SUBSCRIBE</h3>
                    </div>
                    <div class="subscribe-style">
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <div id="mc_embed_signup" class="subscribe-form">
                            <form id="mc-embedded-subscribe-form" class="validate" novalidate="" target="_blank" name="mc-embedded-subscribe-form" method="post" action="https://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef">
                                <div id="mc_embed_signup_scroll" class="mc-form">
                                    <input class="email" type="email" required="" placeholder="Enter your email here.." name="EMAIL" value="">
                                    <div class="mc-news" aria-hidden="true">
                                        <input type="text" value="" tabindex="-1" name="b_6bbb9b6f5827bd842d9640c82_05d85f18ef">
                                    </div>
                                    <div class="clear">
                                        <input id="mc-embedded-subscribe" class="button" type="submit" name="subscribe" value="Subscribe">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                                <img src="/nike/nikeweb/assets/img/product/quickview-l1.jpg" alt="">
                            </div>
                            <div id="pro-2" class="tab-pane fade">
                                <img src="/nike/nikeweb/assets/img/product/quickview-l2.jpg" alt="">
                            </div>
                            <div id="pro-3" class="tab-pane fade">
                                <img src="/nike/nikeweb/assets/img/product/quickview-l3.jpg" alt="">
                            </div>
                            <div id="pro-4" class="tab-pane fade">
                                <img src="/nike/nikeweb/assets/img/product/quickview-l2.jpg" alt="">
                            </div>
                        </div>
                        <!-- Thumbnail Large Image End -->
                        <!-- Thumbnail Image End -->
                        <div class="quickview-wrap mt-15">
                            <div class="quickview-slide-active owl-carousel nav nav-style-1" role="tablist">
                                <a class="active" data-bs-toggle="tab" href="#pro-1"><img src="assets/img/product/quickview-s1.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-2"><img src="/nike/nikeweb/assets/img/product/quickview-s2.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-3"><img src="/nike/nikeweb/assets/img/product/quickview-s3.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-4"><img src="/nike/nikeweb/assets/img/product/quickview-s2.jpg" alt=""></a>
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