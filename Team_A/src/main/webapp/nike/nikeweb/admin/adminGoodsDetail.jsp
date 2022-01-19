<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="nike" value="${pageContext.request.contextPath}/nike" />
<c:set var="nikeweb" value="${pageContext.request.contextPath}/nike/nikeweb" />
<c:set var="goods" value="${pageContext.request.contextPath}/nike/goods" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세화면</title>
	<link rel="stylesheet" href="/css/admin_main.css">
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
	<script type ="text/javascript" src="${nikeweb}/assets/js/comm_price.js"></script>
	<script type ="text/javascript" src="${nikeweb}/assets/js/adminGoodsComm.js"></script>
	<script type ="text/javascript" src="${nikeweb}/assets/js/adminGoodsDetail.js"></script>

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
    <!-- Jquery CSS -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	

</head>
<body>
	<div class="div1">
		<div class="div_top">
			<h2>상품 상세</h2>
		</div>
		<div class="div2">
		<!-- left menu S -->
	
		<%@ include file="../../include/left_menu.jsp" %>
	
		<!-- left menu E -->
		</div>
		<div class="div3">
		
			<div style="position:relative; left:20px; top:30px; margin-bottom:10px;">
					
			</div>
	
			<div style="position:relative; left:20px; top:30px; margin-bottom:5px;">
				<span style="font-size:20px;font-weight:bold;">상품 정보 상세화면</span> 
			</div>
	
			<div style="position:relative; left:20px; top:30px;">

			<table style="width:600px; border:1px solid black;">
				<tr>
					<th>상품명</th>
					<td>${goodsinfo.name}</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>${goodsinfo.category}</td>
				</tr>
				<tr>
					<th>타입</th>
					<td>${goodsinfo.ctgtype}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${goodsinfo.ctggender}</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
					    <script>
                           	document.write(fn_comma(${goodsinfo.price}));
                           </script>
					</td>
				</tr>
				<tr>
					<th>세일 코드</th>
					<td>${goodsinfo.sale}</td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td>${goodsinfo.csize}</td>	
				</tr>
				<tr>
					<th>색상</th>
					<td>
						<ul class="color-filter">
							<c:set var="colorMap">
								black:검은색,
								gray:회색,
								white:흰색,
								red:빨강색,
								yellow:노랑색,
								beige:베이지,
								brown:갈색,
								navy:네이비,
								pink:분홍색,
								blue:파랑색,
								skyblue:스카이
							</c:set>
							<c:set var="goodsColor">${goodsinfo.color}</c:set>

							<c:forEach var="item" items="${colorMap}" varStatus="status">
								<c:set var="color" value="${fn:substringBefore(fn:trim(item),':')}"/>
								<c:set var="color_kr" value="${fn:substringAfter(fn:trim(item),':')}"/>
								
								<c:forEach var="checked" items="${goodsColor}">
									<c:if test="${color eq checked}">
										<li>
											<div style="text-align: center; width: 50px; float:left; margin: 5px;">
												<label class="chkbox" style="cursor:default;">										
													<span class="checkmark" style="background-color: ${color};"></span>
												</label><br>
												<a style="cursor:default;">${color_kr}</a>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</c:forEach> 
						</ul>
					</td>
				</tr>
				<tr>	
					<th>상품 설명</th>
					<td>${goodsinfo.info}</td>
				</tr>
				<tr>
					<th>썸네일</th>
					<td>
						<h4>썸네일 리스트</h4>
						<div id="thumbnailsList">
						<c:choose>
							<c:when test="${empty thumbnails}">비어있습니다.</c:when>
							<c:otherwise>
								<c:forEach var="img" items="${thumbnails}">
									<c:set var="imgPath" value="${goods}/${goodsinfo.unq}/${img}"/>
									<p>
										<img src="${imgPath}" 
											 class="listIMG" 
											 onclick="fn_preview('${imgPath}')"> ${img}
									</p>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</div>
					</td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td>
						<h4>상품 이미지 리스트</h4>
						<div id="goodsImgsList">
						<c:choose>
							<c:when test="${empty goodsImgs}">비어있습니다.</c:when>
							<c:otherwise>
								<c:forEach var="img" items="${goodsImgs}">
									<c:set var="imgPath" value="${goods}/${goodsinfo.unq}/${img}"/>
									<p>
										<img src="${imgPath}" 
											 class="listIMG" 
											 onclick="fn_preview('${imgPath}')"> ${img}
									</p>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</div>
					</td>
				</tr>
			</table>
			<form name="frm" id="frm" action="adminGoodsModify.do" method="post">
				<input type="hidden" name="unq" value="${goodsinfo.unq}">
				<div style="width:600px; text-align:center; margin-top:10px;">
					<button type="submit" id="btn_save">수정</button>
					<button type="button" id="btn_delete">삭제</button>
					<button type="button" onclick="javascript:location.href='adminList.do'">목록으로</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>











