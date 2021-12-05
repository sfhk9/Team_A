<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 상품리스트 시작//////////////////////////////////////////////  -->
<c:forEach var="result" items="${list}" varStatus="status" >
	<div class="item">  
	
		
		<!-- 썸네일 출력////////////// -->
		<c:set var="thumbnail" value="${result.thumbnail }" />
		<%
		String thumbnail = (String) pageContext.getAttribute("thumbnail");
		String[] th = thumbnail.split("/");
		%>
		<img src="../nike/goods/${result.unq}/<%=th[0]%>" class="item_img">
		
		
		<!-- 상품정보 -->
		<div class="item_container">
		       
			<!-- 상품이름 ///////////////-->
			<div class="item_name">${result.name}</div>
		           
			<!-- 상품색상/////////////// -->
			<div style="width:130px;height:30px;">
				<c:set var="color" value="${result.color}" />
				<%
				String color = (String) pageContext.getAttribute("color") ;
				String[] col = color.split("/");
						
					for( int i=0; i<col.length; i++ ) {																			
				%>
				<div class="item_color" style="background-color:<%=col[i]%>;"></div>
				<%
					}
				%>
			</div>
			
		</div>
		       
		<!-- 상품 가격 /////////////-->
		<div class="item_price">
		       
			<!-- 상품가격 -->
			<div class="price_cancel">${result.price}원</div>
			<!-- 상품세일 할인가 50% -->
			<div class="price_sale">${result.price/2}원</div>
			           
		</div>
		       
		       
	</div>
	<c:set var="rownum" value="${rownum-1}"/>
</c:forEach>
<!-- 상품리스트 끝///////////////////////////////////////////// -->