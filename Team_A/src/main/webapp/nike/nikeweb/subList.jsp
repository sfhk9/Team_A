<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<c:forEach var="result" items="${list}" varStatus="status" >
<!-- 상품리스트 시작///////////////////// -->
	<div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
		<div class="product-wrap mb-25 scroll-zoom">
			<!-- 이미지 -->
			<div class="product-img">
				<a href="product-details.html">
				
					<!-- 썸네일 출력////////////// -->
					<c:set var="thumbnail" value="${result.thumbnail }" />
					<%
					String thumbnail = (String) pageContext.getAttribute("thumbnail");
					String[] th = thumbnail.split("/");
					%>
					<img class="default-img" src="../nike/goods/${result.unq}/<%=th[0]%>" alt="">
					<img class="hover-img" src="../nike/goods/${result.unq}/<%=th[0]%>" alt="">
					
				</a>
				
				<!-- 할인시 추가 -->
				<span class="pink">-50%</span>
				<!-- 신제품시 추가 -->
				<!-- <span class="purple">New</span> -->
				
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
			<!-- 텍스트 -->
			<div class="product-content text-center">
			
				<h3><a href="product-details.html">${result.name}</a></h3>
				
				<div class="product-rating">
					<i class="fa fa-star-o yellow"></i>
					<i class="fa fa-star-o yellow"></i>
					<i class="fa fa-star-o yellow"></i>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
				</div>
				
				<div class="product-price">
				    <span>${result.price/2}원</span>
					<span class="old">${result.price}원</span>
				</div>
				
			</div>
		</div>
	</div>
<!-- 상품리스트 끝 -->
</c:forEach>