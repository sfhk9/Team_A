<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk1" class="chkbox" >										
											<input id="chk1" type="checkbox" name="color" value="black">
											<span class="checkmark" style="background-color: black;"></span>
										</label><br>
										<a>검은색</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk2" class="chkbox" >										
											<input id="chk2" type="checkbox" name="color" value="gray">
											<span class="checkmark" style="background-color: gray;"></span>
										</label><br>
										<a>회색</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk3" class="chkbox" >										
											<input id="chk3" type="checkbox" name="color" value="white">
											<span class="checkmark2" style="background-color: white;"></span>
										</label><br>
										<a>흰색</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk4" class="chkbox" >										
											<input id="chk4" type="checkbox" name="color" value="red">
											<span class="checkmark" style="background-color: red;"></span>
										</label><br>
										<a>빨간색</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk5" class="chkbox" >										
											<input id="chk5" type="checkbox" name="color" value="yellow">
											<span class="checkmark2" style="background-color: yellow;"></span>
										</label><br>
										<a>노랑색</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk6" class="chkbox" >										
											<input id="chk6" type="checkbox" name="color" value="beige">
											<span class="checkmark2" style="background-color: beige;"></span>
										</label><br>
										<a>베이지</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk7" class="chkbox" >										
											<input id="chk7" type="checkbox" name="color" value="brown">
											<span class="checkmark" style="background-color: brown;"></span>
										</label><br>
										<a>갈색</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk8" class="chkbox" >										
											<input id="chk8" type="checkbox" name="color" value="navy">
											<span class="checkmark" style="background-color: navy;"></span>
										</label><br>
										<a>나이비</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk9" class="chkbox" >										
											<input id="chk9" type="checkbox" name="color" value="pink">
											<span class="checkmark" style="background-color: pink;"></span>
										</label><br>
										<a>분홍색</a>
									</div>
								</li> 
					
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk10" class="chkbox" >										
											<input id="chk10" type="checkbox" name="color" value="blue">
											<span class="checkmark" style="background-color: blue;"></span>
										</label><br>
										<a>파랑색</a>
									</div>
								</li> 
								
								<li>
									<div style="text-align: center; width: 50px; float:left; margin: 5px;">
										<label for="chk11" class="chkbox" >										
											<input id="chk11" type="checkbox" name="color" value="skyblue">
											<span class="checkmark" style="background-color: skyblue;"></span>
										</label><br>
										<a>스카이</a>
									</div>
								</li> 
					
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
					<button type="reset">취소</button>
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











