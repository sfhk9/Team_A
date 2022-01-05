<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/nike" />
<!DOCTYPE html>
<html>

<body>
<input type="hidden" id="nameval" value="${name}">
<input type="hidden" id="totaltex1" value="
		<% 
		String name = (String) pageContext.getAttribute("name");
		if ( name != null ) { 
		%>
		<strong>'${name}'</strong> &nbsp;
		<% 
		}  
		%> 
		총 ${total}개 결과중  ${s_no} ~ ${e_no}개 표시중">
<c:forEach var="result" items="${list}" varStatus="status" >

	<div class="col-xl-4 col-md-6 col-lg-4 col-sm-6">
		<div class="product-wrap mb-25 scroll-zoom">
			<!-- 이미지 -->
			<div class="product-img">
				<a href="goodsDetail.do?unq=${result.unq}">
				
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
			
				<h3><a href="goodsDetail.do?unq=${result.unq}">${result.name}</a></h3>
				
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
	
</c:forEach>

<!-- 페이징 버튼 -->
<div class="pro-pagination-style text-center mt-30">
	<ul>
		<li><a class="prev" onclick="javascript:page(1);"><i class="fa fa-angle-double-left"></i></a></li>
			<c:forEach var="i" begin="1" end="${total_page }">
			
				<li>
					<a  onclick="javascript:page(${i });" 
					<% 
					String pageno = "" + pageContext.getAttribute("pageno"); 
					String val	  = "" + pageContext.getAttribute("i");
					 System.out.println(pageno);
					 System.out.println(val);
					if ( pageno.equals(val) ) { %> class="active"<% } 
					%> > ${i } 
					</a>
				</li>
			</c:forEach>
		<li><a class="next" onclick="javascript:page(${total_page });"><i class="fa fa-angle-double-right"></i></a></li>
	</ul>
</div>

</body>
</html>