<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/nike" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script> window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>'); </script>
	<link rel="stylesheet" href="${path}/css/main.css">
	<link rel="stylesheet" href="${path}/css/goodsDetail.css">
	<title>Document</title>
</head>
<script>
$(function(){
	var t1 = $("#tab1");
	var t2 = $("#tab2");
	var t3 = $("#tab3");
	var t4 = $("#tab4");
	
	/*탭에 들어갈 내용 부분 - 제품정보 탭*/
	var content1=""+
				"첫번째 탭입니다<br>"+
				"여러줄 작성 예시<br>"+
				"한줄 씩 작성 후 <br>"+
				"+로 연결하면 됩니다<br>"+
				"<%String msg="jsp 주석을 쌍 따옴표 안에서 넣고, 마찬가지로 한줄씩 분리하면 jsp도 가능";%>"+
				"<%=msg%>"
				<%
	      		String goodsimg = (String)pageContext.getAttribute("goodsimg") ;
				String[] array1 = null;
				if(goodsimg != null && !goodsimg.equals("")) {
					array1 = goodsimg.split("/");
					for( int i=0; i<array1.length; i++ ) {
				%>
						"<span><img src="<%=array1[i] %>"/></span><br>"
				<%
					}
				}
				%>
				
				
				;

	/*탭에 들어갈 내용 부분 - 구매후기 탭*/		
	var content2=""+
				"두번째 탭입니다<br>"+
				"여러줄 작성 예시<br>"+
				"한줄 씩 작성 후 <br>"+
				"+로 연결하면 됩니다<br>"+
				"<%=msg%>";
				
	/*탭에 들어갈 내용 부분 - 상품문의 탭*/				
	var content3=""+
				"세번째 탭입니다<br>"+
				"여러줄 작성 예시<br>"+
				"한줄 씩 작성 후 <br>"+
				"+로 연결하면 됩니다<br>"+
				"<%=msg%>";

	/*탭에 들어갈 내용 부분 - 추천상품 탭*/
	var content4=""+
				"네번째 탭입니다<br>"+
				"여러줄 작성 예시<br>"+
				"한줄 씩 작성 후 <br>"+
				"+로 연결하면 됩니다<br>"+
				"<%=msg%>";

	$("#content_view").html(content1);
	t1.click(function(){
		t1.css({"background-color":"black","color":"white"});
		t2.css({"background-color":"white","color":"black"});
		t3.css({"background-color":"white","color":"black"});
		t4.css({"background-color":"white","color":"black"});
		
		$("#content_view").html(content1);
	});
	
	t2.click(function(){
		t1.css({"background-color":"white","color":"black"});
		t2.css({"background-color":"black","color":"white"});
		t3.css({"background-color":"white","color":"black"});
		t4.css({"background-color":"white","color":"black"});
		
		$("#content_view").html(content2);
	});
	
	t3.click(function(){
		t1.css({"background-color":"white","color":"black"});
		t2.css({"background-color":"white","color":"black"});
		t3.css({"background-color":"black","color":"white"});
		t4.css({"background-color":"white","color":"black"});
		
		$("#content_view").html(content3);
	});
	
	t4.click(function(){
		t1.css({"background-color":"white","color":"black"});
		t2.css({"background-color":"white","color":"black"});
		t3.css({"background-color":"white","color":"black"});
		t4.css({"background-color":"black","color":"white"});
		
		$("#content_view").html(content4);
	});
	
	/*
	// 썸네일 마우스 휠 이벤트 
	$("#info_th").on('mousewheel',function(e){
		$('html').on('scroll touchmove mousewheel', function(event) {
			  event.preventDefault();
			  event.stopPropagation();
			  return false;
		});
		
		var wheelDelta = e.originalEvent.wheelDelta;

		if(wheelDelta > 0){
			console.log("up");
			// 이벤트 추가 : .animate() + 다음 이미지 가져오기
			
			$("info_th").animate({
				background-image:;
			},1000);
			
		}else{
			console.log("down");
			// 이벤트 추가 : 
		}

	});
	$("#info_th").mouseout(function(){
		$('html').off('scroll touchmove mousewheel');
	});
	*/
	
	/* 상품 이미지 마우스 휠 이벤트 */
	$("#info_imgs").on('mousewheel',function(e){
		$('html').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			// 위의 둘 = return false;
			// return false;
			event.returnValue = '';
			
		});
		
		
		var wheelDelta = e.originalEvent.wheelDelta;

		if(wheelDelta > 0){
			console.log("up");
			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
		}else{
			console.log("down");
			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
		}

	});
	
	$("#info_imgs").mouseout(function(){
		$('html').off('scroll touchmove mousewheel');
	});

});
</script>
<body>
	<header>
		<%@include file="./include/header.jsp" %>
	</header>
	<nav>
		<%@include file="./include/nav.jsp" %>       
	</nav>
		<div class="wrap">
		<section>
			<aside>
			</aside>
			<article>
				<div class="info_wrap">
					<form name="frm">
					<table class="tbl_info">
						<colgroup>
							<col width="50%" />
							<col width="50%" />
						</colgroup>
						
						<tr>
							<!-- thumbnail 넣는 곳 -->
							<td rowspan="5" class="info_th" id="info_th">
								<div style="width:338px;height:338px;border:1px solid #ccc;">
								</div>
							</td>
							
							<!-- 카테고리 명 -->
							<td class="info_td1">${vo.category} : ${vo.ctgtype} 카테고리 : 대분류</td>
						</tr>
						
						<tr>
							<!-- 상품 이름 -->
							<td class="info_td2">${vo.name}상품이름</td>
						</tr>
						
						<tr>
							<td class="info_td3">
								<div class="discount_rate">20%</div>
								<div class="discount_price">${vo.price}999원</div>
								<div class="price">999,999원</div>																
							</td>
						</tr>
						<tr>
							<td class="info_td4">
								<c:set var="csize" value="${vo.csize}" />
								<%
								String csize = (String)pageContext.getAttribute("csize");
								
								if(csize != null && !csize.equals("")) {
									String[] array = csize.split("/");
									for(int i=0; i<array.length; i++) {
										if(i  < array.length ) {
								%>			
											<div class="opt_box"><%=array[i] %>사이즈</div>										
								<%
										}
									}
								}
								%>
							</td>
						</tr>
						<tr class="info_td5">
							<td>각종 혜택 옵션</td>
						</tr>
						<tr>
							<td>
								<div class="info_imgs" id="info_imgs">
									<!-- 
										* for문으로 등록한 이미지 수만큼 돌리면 될것 같습니다 
										* 클래스명 img_goods를 사용하시면 사이즈가 적용됩니다
										* 일정 수 이상의 이미지 등록시 스크롤 가능하도록 추가할 예정입니다
									-->
									<!-- ?????? -->
									
									<%
						      		String thumbnail = (String)pageContext.getAttribute("thumbnail") ;
									String[] array = null;
									if(thumbnail != null && !thumbnail.equals("")) {
										array = thumbnail.split("/");
										for( int i=0; i<array.length; i++ ) {
									%>
											<span class="img_goods">
												<img src="<%=array[i] %>"/>
											</span>
									<%
										}
									}
									%>
									<span class="imgs" style="font-size:40px;"> df1 </span>
									<span class="imgs" style="font-size:40px;"> df2 </span>
									<span class="imgs" style="font-size:40px;"> df3 </span>
									<span class="imgs" style="font-size:40px;"> df4 </span>
									<span class="imgs" style="font-size:40px;"> df5 </span>
									<span class="imgs" style="font-size:40px;"> df6 </span>
									<span class="imgs" style="font-size:40px;"> df7 </span>
									<span class="imgs" style="font-size:40px;"> df8 </span>
									<span class="imgs" style="font-size:40px;"> df9 </span>
									<span class="imgs" style="font-size:40px;"> df10 </span>
									<span class="imgs" style="font-size:40px;"> df11 </span>
																		
								</div>
							</td>
							<td class="info_td6">
								<button type="button" class="btn_cart">장바구니</button>
								<button type="button" class="btn_buy">구매하기</button>
							</td>
						</tr>
					</table>
					</form>
				</div>
				<table class="tbl_content">
					<tr>
						<!-- 
							* 탭 클릭시 배경색, 글자색 변경됨
							* 탭 클릭시 innerHTML 등을 활용하여 content 부분을 바꿀 예정
						 -->
						<td class="content_td" id="tab1" style="background-color:black;color:white;"><div class="content_tab">제품정보</div></td>
						<td class="content_td" id="tab2"><div class="content_tab">구매후기</div></td>
						<td class="content_td" id="tab3"><div class="content_tab">상품문의</div></td>
						<td class="content_td" id="tab4"><div class="content_tab">추천상품</div></td>
					</tr>
					<tr>
						<td colspan="4">
							<div id="content_view">
								페이지 오류 발생
							</div>
						</td>
					</tr>
				</table>
			</article>
			<aside>
			    <div class="right_list">
			                    최근 본 상품 <br>
			         	<div class="right_item">
			
			            </div>
			                    상품 이름 <br> 
						<div class="right_item">
			
			            </div>
			                    상품 이름 <br> 
                </div>
			</aside>
		</section>
	</div>
	<footer>
		<%@include file="./include/footer.jsp" %>
	</footer>

</body>
</html>