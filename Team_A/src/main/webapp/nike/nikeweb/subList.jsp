<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/nike" />
<!DOCTYPE html>
<html>

<body>
<input type="hidden" id="nameval" value="${goodsname}">

<c:set var="goodsname" value="${goodsname}" />

<input type="hidden" id="totaltex1" value="
<% 
String goodsname = (String) pageContext.getAttribute("goodsname");
if ( goodsname != null ) { 
%>
<strong>'${goodsname}'</strong>&nbsp;
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
			
				<c:set var="off" value="${result.off }" />
	 			<%
				String off = "" + pageContext.getAttribute("off");
				if( off.equals("null") ){
				%>
				
				<!-- 신제품시 추가 -->
				<span class="purple">New</span>
				
				<% } else { %>
					
				<!-- 할인시 추가 -->
				<span class="pink">-${result.off }%</span>
				
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
			<!-- 텍스트 -->
			<div class="product-content text-center">
			
				<h3><a href="goodsDetail.do?unq=${result.unq}">${result.name}</a></h3>
				
				<div class="product-rating">
					<img src="/nike/images/star/${result.mark}.png" class="width: 135px, height: 22px;">
				</div>
				
				<div class="product-price">
				<%
				if( off.equals("null") ){
				%>
				
				<!-- 신제품시 추가 -->
				<span>${result.price}원</span>
				
				<% } else { %>
					
				<!-- 할인시 추가 -->
				<span>${result.saleprice} 원</span>
				<span class="old">${result.price}원</span>
				
				<%
				}
				%>  
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
					<c:set var="pageno" value="${pageno}" />
					<a  onclick="javascript:page(${i });" 
					<% 
					String pageno = "" + pageContext.getAttribute("pageno"); 
					String val	  = "" + pageContext.getAttribute("i");

					if ( pageno.equals(val) ) { %> class="active" <% } 
					%> > ${i } 
					</a>
				</li>
			</c:forEach>
		<li><a class="next" onclick="javascript:page(${total_page });"><i class="fa fa-angle-double-right"></i></a></li>
	</ul>
</div>

</body>
</html>