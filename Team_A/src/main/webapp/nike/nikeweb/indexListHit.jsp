<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:forEach var="result" items="${listHit}" varStatus="status" >
   <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
       <div class="product-wrap-2 mb-25">
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
               
               <div class="product-action-2">
              		<a title="위시리스트" href="#"><i class="fa fa-star"></i></a>
					<a title="장바구니" href="#"><i class="fa fa-shopping-cart"></i></a>
					<a title="바로보기" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
               </div>
           </div>
           
           <div class="product-content-2">
               <div class="title-price-wrap-2">
                   <h3><a href="goodsDetail.do?unq=${result.unq}">${result.name}</a></h3>
                   <div class="price-2">
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
               <div class="pro-wishlist-2">
                   <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
               </div>
           </div>
       </div>
   </div>	
</c:forEach>