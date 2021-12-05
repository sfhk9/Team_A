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
	<link rel="stylesheet" href="${path}/css/mainpage.css">
	<link rel="stylesheet" href="${path}/css/goodsList.css">
	<title>Document</title>
</head>
<script>
$(function(){
	
	/* 추천 상품 마우스 휠 */
	$("#recommends").on('mousewheel',function(e){
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
	
	$("#recommends").mouseout(function(){
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
				<form name="frm" method="post" action="joinSave.jsp">
					
					<div class="mainimg">
						
					</div>
					<div class="rec_title">추천 상품</div>
					<div class="recommends">
						<div class="item">     
	                        <img src="./img/img_item.jfif" class="item_img">
	                        <div class="item_container">
	                            <div class="item_name">
					                                상품이름 상품이름 <br>
					                                상품이름 상품이름
	                            </div>
	                            <div class="div_color">
	                                <div class="item_color" style="background-color:blue;"></div>
	                                <div class="item_color" style="background-color:red;"></div>
	                            </div>
	                        </div>
	
	                        <div class="item_price">
	                            <div class="price_cancel">
	                                999,999원
	                            </div>
	                            <div class="price_sale">
	                                999,999원
	                            </div>
	                        </div>
	                    </div>
	                    <div class="item">     
	                        <img src="./img/img_item.jfif" class="item_img">
	                        <div class="item_container">
	                            <div class="item_name">
					                                상품이름 상품이름 <br>
					                                상품이름 상품이름
	                            </div>
	                            <div class="div_color">
	                                <div class="item_color" style="background-color:blue;"></div>
	                                <div class="item_color" style="background-color:red;"></div>
	                            </div>
	                        </div>
	
	                        <div class="item_price">
	                            <div class="price_cancel">
	                                999,999원
	                            </div>
	                            <div class="price_sale">
	                                999,999원
	                            </div>
	                        </div>
	                    </div>
	                    <div class="item">     
	                        <img src="./img/img_item.jfif" class="item_img">
	                        <div class="item_container">
	                            <div class="item_name">
					                                상품이름 상품이름 <br>
					                                상품이름 상품이름
	                            </div>
	                            <div class="div_color">
	                                <div class="item_color" style="background-color:blue;"></div>
	                                <div class="item_color" style="background-color:red;"></div>
	                            </div>
	                        </div>
	
	                        <div class="item_price">
	                            <div class="price_cancel">
	                                999,999원
	                            </div>
	                            <div class="price_sale">
	                                999,999원
	                            </div>
	                        </div>
	                    </div>
	                    <div class="item">     
	                        <img src="./img/img_item.jfif" class="item_img">
	                        <div class="item_container">
	                            <div class="item_name">
					                                상품이름 상품이름 <br>
					                                상품이름 상품이름
	                            </div>
	                            <div class="div_color">
	                                <div class="item_color" style="background-color:blue;"></div>
	                                <div class="item_color" style="background-color:red;"></div>
	                            </div>
	                        </div>
	
	                        <div class="item_price">
	                            <div class="price_cancel">
	                                999,999원
	                            </div>
	                            <div class="price_sale">
	                                999,999원
	                            </div>
	                        </div>
	                    </div>
	                    <div class="item">     
	                        <img src="./img/img_item.jfif" class="item_img">
	                        <div class="item_container">
	                            <div class="item_name">
					                                상품이름 상품이름 <br>
					                                상품이름 상품이름
	                            </div>
	                            <div class="div_color">
	                                <div class="item_color" style="background-color:blue;"></div>
	                                <div class="item_color" style="background-color:red;"></div>
	                            </div>
	                        </div>
	
	                        <div class="item_price">
	                            <div class="price_cancel">
	                                999,999원
	                            </div>
	                            <div class="price_sale">
	                                999,999원
	                            </div>
	                        </div>
	                    </div>
					</div>
					
					<div class="div_tbl">
						<table class="tbl_list" style="margin-right:20px;">
							<caption>공지사항</caption>
							<colgroup>
								<col width="*" />
								<col width="20%" />
							</colgroup>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
						</table>
						<table class="tbl_list">
							<caption>최근후기</caption>
							<colgroup>
								<col width="*" />
								<col width="20%" />
							</colgroup>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
							<tr>
								<td class="td1">가나다라마바사</td>
								<td class="td2">12-20</td>
							</tr>
						</table>
					</div>
					
					
				</form>
				
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