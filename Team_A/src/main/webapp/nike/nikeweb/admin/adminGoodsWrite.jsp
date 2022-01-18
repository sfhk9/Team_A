<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nike" value="${pageContext.request.contextPath}/nike" />
<c:set var="nikeweb" value="${pageContext.request.contextPath}/nike/nikeweb" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록화면</title>
	<link rel="stylesheet" href="/css/admin_main.css">
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
	<!-- adminGoodsWrite.js -->
	<script type ="text/javascript" src="${nikeweb}/assets/js/adminGoodsComm.js"></script>
	<script type ="text/javascript" src="${nikeweb}/assets/js/adminGoodsWrite.js"></script>

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
			<h2>상품 등록</h2>
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
				<span style="font-size:20px;font-weight:bold;">상품 정보 등록화면</span> 
			</div>
	
			<div style="position:relative; left:20px; top:30px;">
	
			<form id="frm" enctype="multipart/form-date">
				<table style="width:600px; border:1px solid black;">
					<tr>
						<th>상품명</th>
						<td><input type="text" name="name" id="name" style="width:98%"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category" id="category" style="width:50%;" onchange="fn_size()">
								<option value="">선택해주세요</option>
								<option value="CLS">옷</option>
								<option value="SHO">신발</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>타입</th>
						<td>
							<select name="ctgtype" id="ctgtype" style="width:50%;">
								<option value="">선택해주세요</option>
								<option value="LIF">일상</option>
								<option value="LES">레저</option>
								<option value="SPT">스포츠</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<select name="ctggender" id="ctggender" style="width:50%;">
								<option value="">선택해주세요</option>
								<option value="M">남성용</option>
								<option value="F">여성용</option>
								<option value="N">남녀공용</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="number" name="price" id="price" style="width:50%;"></td>
					</tr>
					<tr>
						<th>세일 코드</th>
						<td><input type="number" name="sale" id="sale" style="width:50%;"></td>
					</tr>
					<tr>
						<!-- 체크박스로 전달하기 -->
						<!-- category 값에 따라 변경되도록 -->
						<th>사이즈</th>
						<td>
							<div name="sizeDiv" id="sizeDiv"> 카테고리를 선택해주세요 </div>
						</td>	
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
								<c:set var="checkmark2List">
									white,
									yellow,
									beige
								</c:set>
								
								<c:forEach var="item" items="${colorMap}" varStatus="status">
									<c:set var="color" value="${fn:substringBefore(fn:trim(item),':')}"/>
									<c:set var="color_kr" value="${fn:substringAfter(fn:trim(item),':')}"/>
									<c:choose>
										<c:when test="${fn:contains(fn:trim(checkmark2List),color)}">
											<c:set var="checkmark" value="checkmark2"/>
										</c:when>
										<c:otherwise>
											<c:set var="checkmark" value="checkmark"/>
										</c:otherwise>
									</c:choose>
									<li>
										<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk${status.count}" class="chkbox" >										
												<input id="chk${status.count}" type="checkbox" name="color" value="${color}">
												<span class="${checkmark}" style="background-color: ${color};"></span>
											</label><br>
											<a>${color_kr}</a>
										</div>
									</li>
								</c:forEach> 
							</ul>
						</td>
					</tr>
					<tr>	
						<th>상품 설명</th>
						<td>
							<textarea name="info" 
									  id="info"
									  style="width:98%; 
									  		 height:150px;"></textarea>
						</td>
					</tr>
					<tr>
						<th>썸네일</th>
						<td>
							<label for="thumbnails" class="imgLabel">
							파일 추가
							</label>
							<h4>썸네일 리스트</h4>
							<div id="thumbnailsList">
							비어있습니다
							</div>
						</td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td>
							<label for="goodsImgs" class="imgLabel">
							파일 추가
							</label>
							<h4>상품 이미지 리스트</h4>
							<div id="goodsImgsList">
							비어있습니다
							</div>
						</td>
					</tr>
				</table>
				<div style="width:600px; text-align:center; margin-top:10px;">
					<button type="button" id="btn_save">저장</button>
					<button type="button" onclick="javascript:location.href='adminList.do'">취소</button>
				</div>
			</form>
			
			<!-- input -->
			<div id="thumbnailsInput">
				<input type="file" 
					   accept="image/*" 
					   multiple="multiple"
					   id="thumbnails" 
					   style="display:none">
			</div>
			<div id="goodsImgsInput">
				<input type="file" 
				   accept="image/*" 
				   multiple="multiple"
				   id="goodsImgs" 
				   style="display:none">
			</div>
			</div>
		</div>
	</div>
</body>
</html>











