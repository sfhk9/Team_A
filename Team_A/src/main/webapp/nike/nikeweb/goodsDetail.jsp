<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="nikeweb" value="${pageContext.request.contextPath}/nike/nikeweb" />

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${goods.name}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
	<!-- cart & checkout 공통 function -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/comm_price.js"></script>
    
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

<style>
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:orange;}
</style>   

<style>
	/*
		사이즈 버튼 
	*/
	
	.size_btn input[type="radio"] {
        display: none;
    }
 
    .size_btn input[type="radio"] + span {
        background-color: #f1f2f6;
		color: #000;
		display: inline-block;
		font-size: 12px;
		line-height: 1;
		padding: 6px 9px 7px;
		text-transform: uppercase;
    }
    
    .product-details-content .pro-details-size-color .pro-details-size .pro-details-size-content ul li span:hover {
	  	background-color: #a749ff;
	  	color: #fff;
	}
 
    .size_btn input[type="radio"]:checked + span {
        background-color: #a749ff;
	  	color: #fff;
    }

</style> 


<script>
	function fn_click(){
    <%
        String session_id2 = (String) session.getAttribute("MemberSessionId");
    	boolean nowlogin=false;
    %> 
    <%
        if(session_id2 == null){
    %>
            if(confirm("로그인 하시겠습니까?")) {
                location.href="joinWrite.do";
            } else {
                alert("로그인 후 이용 바랍니다.");
            }
    <%
        } else {
        	nowlogin=true;
        }
    %>
        return <%=nowlogin%>;
    }
</script>

<script>
	function fn_star(num){
		$("#mark").val(num);
	}
</script>

<script>
  	$(function() {
		
  		$("#submit").click(function(){  
  			
  			if(!fn_click()) return false;
  			
  			if( $.trim($("#content").val()) == "" ) {
  				alert("내용을 입력해주세요.");
  				$("#content").focus();
  				return false;
  			}
  
  			var formdata = $("#frm").serialize();
  			
  			$.ajax({
  				type : "POST",
  				url  : "detailReviewSave.do",
  				data : formdata,
  				
  				datatype : "text",
  				success : function(data) {  // ok
  					if(data == "ok") {
  						alert("저장완료");
  						location.reload();
  					} else {
  						alert("저장실패");
  					}
  				},
  			    error : function() {
  			    	alert("오류발생");
  			    }
  			});
  		});
  	});
</script>

<!-- 
<script> // 사이즈,색상 값 alert으로 표시
	function test_sample() {
		var sample =document.getElementsByName('csize');
		for(var i=0; i<sample.length; i++) {
			if(sample[i].checked == true) {
				alert(sample[i].value);
			}
		}
		var sample =document.getElementsByName('color');
		for(var i=0; i<sample.length; i++) {
			if(sample[i].checked == true) {
				alert(sample[i].value);
			}
		}
	}
</script>
 onClick="test_sample();"
 -->

<script>
  	$(function() {
  		$("#sendCart").click(function(){  
  			if(!fn_click()) return false;
  			
  			
  			
  			if( $.trim($("input[name='color']:checked").val()) == "" ) {
  				alert("색상을 선택해주세요.");
  				return false;
  			}
  			if( $.trim($("input[name='csize']:checked").val()) == "") {
  				alert("크기를 선택해주세요.");
  				return false;
  			}
  
  			var formdata = $("#cartData").serialize();
  			var result = confirm("장바구니로 이동 하시겠습니까?");
  			
  			$.ajax({
  				type : "POST",
  				url  : "sendCart.do",
  				data : formdata,
  				
  				datatype : "text",
  				success : function(data) {  // ok
  					if(data == "ok") {
  						if(result == true) {
  							location = "cart.do";
  						} else {
  							location.reload();
  						}
  					} else {
  						alert("전송 실패");
  						
  					}
  				},
  			    error : function() {
  			    	alert("오류발생");
  			    }
  			});
  		});
  	});
</script>

<script>
	$( document ).ready(function() {
  	
	  	$( ".star_rating a" ).click(function() {
	  	     $(this).parent().children("a").removeClass("on");
	  	     $(this).addClass("on").prevAll("a").addClass("on");
	  	     return false;
	  	});
  	
  	});
	

</script>
    
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
                <li class="active">상품상세 </li>
            </ul>
        </div>
    </div>
</div>
<div class="shop-area pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-xl-7 col-lg-7 col-md-12">
                <div class="product-details-img mr-20 product-details-tab">
                    <div id="gallery" class="product-dec-slider-2">
                        <c:set var="thumbnail" value="${goods.thumbnail }" />
                        <%
			      		String thumbnail = (String) pageContext.getAttribute("thumbnail") ;
						
						if(thumbnail != null && !thumbnail.equals("")) {
							String[] array = thumbnail.split("/");
							for( int i=0; i<array.length; i++ ) {
								if(i < array.length ) {
						%>
                        <a data-image="/nike/goods/${goods.unq}/<%=array[i] %>" data-zoom-image="/nike/goods/${goods.unq}/<%=array[i] %>">
                            <img src="/nike/goods/${goods.unq}/<%=array[i] %>" alt="">
                        </a>
                        <%
								}
							}
						}
						%>
                    </div>
                    <div class="zoompro-wrap zoompro-2 pl-20">
                    	
                        <div class="zoompro-border zoompro-span">
                        	<%
				      		thumbnail = (String) pageContext.getAttribute("thumbnail") ;
							
							if(thumbnail != null && !thumbnail.equals("")) {
								String[] array = thumbnail.split("/");
							%>
                            	<img class="zoompro" src="/nike/goods/${goods.unq}/<%=array[0] %>" data-zoom-image="/nike/goods/${goods.unq}/<%=array[0] %>" alt=""/>          
                            <%
							}
							%>
								
							<c:set var="off" value="${off}" />
				 			<%
				 			int off = (int) pageContext.getAttribute("off");
							
							if( off == 0 ){
							%>
								<!-- 신제품시 추가 -->
								<span class="purple">New</span>
							<% } else { %>
								<!-- 할인시 추가 -->
								<span class="pink">-${goods.off}%</span>
							<%
							}
							%> 
                           	<!-- <div class="product-video">
                                 <a class="video-popup" href="https://www.youtube.com/watch?v=tce_Ap96b0c">
                                    <i class="fa fa-video-camera"></i>
                                    View Video
                                </a> 
                            </div> -->
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-lg-5 col-md-12">
                <div class="product-details-content">
                    <h2>${goods.name}</h2>
                    <div class="product-details-price">
                        
                        <%
						if( off == 0 ){
						%>
							<!-- 신제품시 추가 -->
							<span>
								<fmt:formatNumber value="${goods.price}" pattern="#,###"/>원
							</span>
						<% } else { %>
							<!-- 할인시 추가 -->
							<span>
    							<fmt:formatNumber value="${goods.pricesale}" pattern="#,###"/>원
							</span>
							<span class="old">
								<fmt:formatNumber value="${goods.price}" pattern="#,###"/>원
							</span>
						<%
						}
						%>
				
                    </div>
                    <div class="pro-details-rating-wrap">
                        <div class="pro-details-rating">
                            <img src="/nike/images/star/${goods.mark}.png" class="width: 135px, height: 22px;">
                        </div>
                        <span><a href="#">리뷰  ${review_cnt }</a></span>
                    </div>
                    <p>제품 설명</p>
                    <div class="pro-details-list">
                        <ul>
                            <li>- 설명1</li>
                            <li>- 설명2</li>
                            <li>- 설명3</li>
                        </ul>
                    </div>
                    
                    <form id="cartData">
                    <input type="hidden" name="unq" id="unq" value="${goods.unq}">
                    <div class="pro-details-size-color">
                        <div class="pro-details-color-wrap">
                            <span>Color</span>
                            <div class="pro-details-color-content" style="width: 215px; height:50px;">
                                <ul>
                                <c:set var="color" value="${goods.color }" />
                                <%
					      		String color = (String) pageContext.getAttribute("color") ;
                                
								if(color != null && !color.equals("")) {
									String[] array = color.split("/");
									for( int i=0; i<array.length; i++ ) {
										if(i < array.length && array[i].equals("white") || array[i].equals("yellow") || array[i].equals("beige") ) {
								%>
											<li style="margin-left:8px;">
		            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
													<label for="chk<%=i %>" class="chkbox">										
														<input type="radio" name="color" id="chk<%=i %>" value="<%=array[i] %>">
														<span class="checkmark2" style="background-color: <%=array[i] %>;"></span>
													</label><br>
												</div>
											</li> 
								<%
										} else {
								%>
											<li style="margin-left:8px;">
		            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
													<label for="chk<%=i %>" class="chkbox">										
														<input type="radio" name="color" id="chk<%=i %>" value="<%=array[i] %>">
														<span class="checkmark" style="background-color: <%=array[i] %>;"></span>
													</label><br>
												</div>
											</li> 							
								<%		
										}
									}
								}
								%>
                                
                               
                                </ul>
                            </div>
                        </div>
                        <div class="pro-details-size">
                            <span>Size</span>
                            <div class="pro-details-size-content">
                                <ul>
	                                <c:set var="csize" value="${goods.csize}" />
	                                <%
									String csize = (String)pageContext.getAttribute("csize");
									
									if(csize != null && !csize.equals("")) {
										String[] array = csize.split("/");
										for(int i=0; i<array.length; i++) {
											if(i < array.length ) {	
									%>	
												<li>
													<label class="size_btn" style="cursor:pointer;">
													    <input type="radio" name="csize" id="csize" value="<%=array[i] %>">
													    <span><%=array[i] %></span>
													</label>
												</li>
									<%
											}
										}
									}
									%>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="pro-details-quality">
                        <div class="cart-plus-minus">
                            <input class="cart-plus-minus-box" type="text" name="qty" id="qty" value="1">
                        </div>
                        <div class="pro-details-cart btn-hover" id="sendCart">
                            <a href="#">장바구니</a>
                        </div>
                        <div class="pro-details-wishlist">
                            <a href="#"><i class="fa fa-heart-o"></i></a>
                        </div>
                        <div class="pro-details-compare">
                            <a href="#"><i class="pe-7s-shuffle"></i></a>
                        </div>
                    </div>
                    </form>
                    <div class="pro-details-meta">
                        <span>카테고리 :</span>
                        <ul>
                            <li><a href="#">${goods.category eq 'CLS'?'의류':'신발'},</a></li>
                            <li><a href="#">${goods.ctgtype eq 'SPT'?'스포츠':'LES'?'레저':'일상'},</a></li>
                            <li><a href="#">${goods.ctggender eq 'M'?'남성':'F'?'여성':'성별 무관'}</a></li>
                        </ul>
                    </div>
                <!-- 
                    <div class="pro-details-meta">
                        <span>태그 :</span>
                        <ul>
                            <li><a href="#">Fashion, </a></li>
                            <li><a href="#">Furniture,</a></li>
                            <li><a href="#">Electronic</a></li>
                        </ul>
                    </div>
                -->
                 <!-- 
                    <div class="pro-details-social">
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                 -->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="description-review-area pb-90">
    <div class="container">
        <div class="description-review-wrapper">
            <div class="description-review-topbar nav">
                <!-- <a data-bs-toggle="tab" href="#des-details1">추가 정보</a>  -->
                <a class="active" data-bs-toggle="tab" href="#des-details2">상세정보</a>
                <a data-bs-toggle="tab" href="#des-details3">리뷰</a>
            </div>
            <div class="tab-content description-review-bottom">
                <div id="des-details2" class="tab-pane active">
                    <div id="des-details1" class="tab-pane ">
	                    <div class="product-anotherinfo-wrapper" style="width:80%;margin:0px auto">
	                        <c:set var="goodsimg" value="${goods.goodsimg }" />
							<%
					      		String goodsimg = (String)pageContext.getAttribute("goodsimg") ;
								if(goodsimg != null && !goodsimg.equals("")) {
									String[] array = goodsimg.split("/");
									for( int i=0; i<array.length; i++ ) {
										if(i < array.length ) {
							%>
											<span><img style="width:100%;" src="/nike/goods/${goods.unq}/<%=array[i] %>"/></span><br>

							<%
										}
									}
								}
							%>
	                    </div>
	                </div>
                </div>
                
            <!-- 
                
                <div class="product-description-wrapper">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
                        <p>ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commo consequat. Duis aute irure dolor in reprehend in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt </p>
                    </div>
            -->
                 
                <!-- 리뷰 시작 -->
                
                <div id="des-details3" class="tab-pane">
                    <div class="row">
                        <div class="col-lg-7">
                            <!-- <div class="review-wrapper">  -->
                                <div class="single-review" style="flex-direction: column;">
                                    <c:forEach var="result" items="${comm_list }" varStatus="status">
                                    	<c:set var="userid" value="${result.userid }"/>
                                    	<c:set var="content" value="${result.content }"/>
                                    	<c:set var="mark" value="${result.mark }"/>
                                        <%
                                        String userid = pageContext.getAttribute("userid")+"";
                                        String content = pageContext.getAttribute("content")+"";
                                        String mark = pageContext.getAttribute("mark")+"";
                                        %>
                                    <div class="review-img" style="display: flex; margin-top: 5px; margin-bottom: 8px;">
                                        <!-- <img src="/nike/nikeweb/assets/img/testimonial/1.jpg" alt="">  -->
                                        <div class="review-content">
                                        <div class="review-top-wrap">
                                            <div class="review-left">
                                                <div class="review-name" style="margin-left: 10px;">
                                                    <h4>${userid }</h4>
                                                </div>
                                                <div class="review-rating">
                                                	<c:forEach var="k" begin="1" end="${mark}">
                                                		<c:if test="${mark >= k}"><i class="fa fa-star"></i></c:if>
                                                	</c:forEach>
                                                </div>
                                            </div>
                                        <!--     
                                            <div class="review-left">
                                                <a href="#">답글</a>
                                            </div>
                                         -->
                                        </div>
                                        <div class="review-bottom" style="flex-direction: column; margin-left: 20px;">
                                            <p>${content }</p>
                                        </div>
                                    </div>
                                    </div>
                                    
                                
                                	</c:forEach>
                                
                                </div>
                            <!-- 답글
                                <div class="single-review child-review">
                                    <div class="review-img">
                                        <img src="/nike/nikeweb/assets/img/testimonial/2.jpg" alt="">
                                    </div>
                                    <div class="review-content">
                                        <div class="review-top-wrap">
                                            <div class="review-left">
                                                <div class="review-name">
                                                    <h4>White Lewis</h4>
                                                </div>
                                                <div class="review-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="review-left">
                                                <a href="#">Reply</a>
                                            </div>
                                        </div>
                                        <div class="review-bottom">
                                            <p>Vestibulum ante ipsum primis aucibus orci luctustrices posuere cubilia Curae Sus pen disse viverra ed viverra. Mauris ullarper euismod vehicula. </p>
                                        </div>
                                    </div>
                                </div>
                             -->
                            <!-- </div>  -->
                        </div>
                        <!-- 리뷰작성 -->
                        <div class="col-lg-5">
                            <div class="ratting-form-wrapper pl-50">
                                <h3>리뷰 작성</h3>
                                <div class="ratting-form">
                                    <form id="frm">
                                    	<input type="hidden" name="unq" value="${goods.unq}">
                                        <div class="star-box" id="star">
                                            <span>만족도 선택:</span>
                                            <div class="ratting-star">
                                                <input type="hidden" id="mark" name="mark" value="3">
                                                <p class="star_rating">
												    <a onclick="fn_star(1)" class="on"><i class="fa fa-star"></i></a>
												    <a onclick="fn_star(2)" class="on"><i class="fa fa-star"></i></a>
												    <a onclick="fn_star(3)" class="on"><i class="fa fa-star"></i></a>
												    <a href="#" onclick="fn_star(4)"><i class="fa fa-star"></i></a>
												    <a href="#" onclick="fn_star(5)"><i class="fa fa-star"></i></a>
												</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                        <!--     
                                            <div class="col-md-6">
                                                <div class="rating-form-style mb-10">
                                                    <input placeholder="이름 입력" type="text">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="rating-form-style mb-10">
                                                    <input placeholder="이메일 입력" type="email">
                                                </div>
                                            </div>
                                        -->    
                                            <div class="col-md-12">
                                                <div class="rating-form-style form-submit">
                                                    <textarea name="content" id="content" placeholder="최소 10자 이상 입력해주세요"></textarea>
                                                    <input type="submit" id="submit" value="Submit">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    	<!-- 리뷰작성 -->
                    </div>
                </div>
				
				<!-- 리뷰 끝 -->
				            
            </div>
        </div>
    </div>
</div>

<!--  상품 추천  -->

<div class="related-product-area pb-95">
    <div class="container">
        <div class="section-title text-center mb-50">
            <h2>추천 상품</h2>
        </div>
        <div class="related-product-active owl-carousel owl-dot-none">
            
            
            <c:forEach var="result" items="${list}"  varStatus="status"  >
            <div class="product-wrap">
                
                <c:set var="thumbnail" value="${result.thumbnail }" />
                <%
				String thumbnail1 = (String) pageContext.getAttribute("thumbnail") ;
				
				if(thumbnail1 != null && !thumbnail1.equals("")) {
					String[] array = thumbnail1.split("/");
				%>
				<div class="product-img">
					<a href="goodsDetail.do?unq=${result.unq }">
                    	<img class="default-img" src="/nike/goods/${result.unq}/<%=array[0] %>" alt="">
                        <img class="hover-img" src="/nike/goods/${result.unq}/<%=array[0] %>" alt="">
                    </a>
	                   
	            <c:set var="off" value="${result.off }" />
	 			<%
				String offA = "" + pageContext.getAttribute("off");
				if( offA.equals("null") ){
				%>  
						<!-- 신제품시 추가 -->
						<span class="purple">New</span>
				<%  } else { %>
						<!-- 할인시 추가 -->
						<span class="pink">-${result.off}%</span>
				<%  
					}
				%>  
				
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
                <%
				}
				%>
                
                <div class="product-content text-center">
                    <h3><a href="goodsDetail.do?unq=${result.unq }">${result.name }</a></h3>
                    <div class="product-rating" style="position:absolute; left:30%;">
                        <img src="/nike/images/star/${result.mark}.png" style="width:120px; heigth:120px;">
                    </div>
                    <br>
                    <div class="product-price">
						
						<c:set var="off" value="${result.off }" />
		 			<%
						String offB = "" + pageContext.getAttribute("off");
						if( offB.equals("null") ){
					%>
							<!-- 신제품시 추가 -->
							<span>
								<a href="goodsDetail.do?unq=${result.unq }">
									<fmt:formatNumber value="${result.price}" pattern="#,###"/>원
								</a>
							</span>
					<%  } else { %>
							<!-- 할인시 추가 -->
							<span>
								<fmt:formatNumber value="${result.saleprice}" pattern="#,###"/>원
							</span>
							<span class="old">
								<fmt:formatNumber value="${result.price}" pattern="#,###"/>원
							</span>
					<%
						}
					%>
						
                    </div>
                </div>
            </div>
            </c:forEach>
            <!-- 
            <div class="product-wrap">
                <div class="product-img">
                    <a href="product-details-2.html">
                        <img class="default-img" src="/nike/nikeweb/assets/img/product/pro-2.jpg" alt="">
                        <img class="hover-img" src="/nike/nikeweb/assets/img/product/pro-2-1.jpg" alt="">
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
                    <h3><a href="product-details-2.html">T- Shirt And Jeans</a></h3>
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
            
            
            
            <div class="product-wrap">
                <div class="product-img">
                    <a href="product-details-2.html">
                        <img class="default-img" src="/nike/nikeweb/assets/img/product/pro-3.jpg" alt="">
                        <img class="hover-img" src="/nike/nikeweb/assets/img/product/pro-3-1.jpg" alt="">
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
                    <h3><a href="product-details-2.html">T- Shirt And Jeans</a></h3>
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
            
            
            
            <div class="product-wrap">
                <div class="product-img">
                    <a href="product-details-2.html">
                        <img class="default-img" src="/nike/nikeweb/assets/img/product/pro-4.jpg" alt="">
                        <img class="hover-img" src="/nike/nikeweb/assets/img/product/pro-4-1.jpg" alt="">
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
                    <h3><a href="product-details-2.html">T- Shirt And Jeans</a></h3>
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
            
            
            
            <div class="product-wrap">
                <div class="product-img">
                    <a href="product-details-2.html">
                        <img class="default-img" src="/nike/nikeweb/assets/img/product/pro-5.jpg" alt="">
                        <img class="hover-img" src="/nike/nikeweb/assets/img/product/pro-5-1.jpg" alt="">
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
                    <h3><a href="product-details-2.html">T- Shirt And Jeans</a></h3>
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
        
         -->
        
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