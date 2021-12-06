<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}/nike" />

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
    <link rel="stylesheet" href="${path}/css/goodsList.css">
    <title>Document</title>
</head>


<script>
    function fn_visible(){
        if(document.getElementById("fl").style.display=='none'){
            document.getElementById("fl").style.display='block';
            document.getElementById("btn_filter").innerText='필터접기';
        } else {
            document.getElementById("fl").style.display='none';
            document.getElementById("btn_filter").innerText='필터펴기';
        }
    }
    
    
    
    
    $(function(){     
    	
    	$("#filter").click(function(){
    		
    		//카테고리 데이터 
    		var len = $("input[name='category']").length;
    		var values = "";
    		
    		for(var i=0; i<len; i++) {
    			var category = document.getElementsByName('category')[i].checked;
    			if( category == true ) {
    				values += document.getElementsByName('category')[i].value;
    				values += ",";
    			}
    		}
    		
    		
    		if(values.length > 0) {
    			
   				$.ajax({
   					type : "post",
   					url  : "goodsList.do",
   					data : "values="+values,
   					datatype : "text",
   					success : function(data) {
   						if(data == "ok") {
   							alert("삭제 처리 완료");
   							document.location.reload();
   						} else {
   							alert("삭제 처리 실패!!");
   						}	
   					},
   					error : function() {
   						alert("시스템 오류");
   					}
   				});
    			
    		}
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
                <div class="goodsList">                  
                    <!-- 상품리스트 시작  -->     
                	<%@include file="./subList.jsp" %>           
                </div>
            
                <div class="filter_wrap"> 
                
                	<form action="">
	                	<!-- 필터 
	                	//////////////////////////////////////////////////////////////////////////-->
	                    <div style="width:700px;height:30px; background-color:white;">
	                       		 페이징
	                        <select>
	                            <option>10</option>
	                            <option>20</option>
	                        </select>
	                        / 
	                        <span onclick="fn_visible();" id="btn_filter" style="cursor:pointer;" > 필터펴기 </span>
	                        / 
	
	                        <span onclick="" id="btn_order" style="cursor:pointer;" > 정렬버튼 </span>
	                    </div>
	                    
	                    
	                    <br>
	                    
	                    
	                    <!-- 펼침 -->
	                    <div class="filter_list" name="fl" id="fl" style="display:none;">
	                    
	                    <table border="1">
							<tr>
							
								<th>카테고리</th>
								<td>
									<input type="checkbox" name="category" value="LIF">일상
									<input type="checkbox" name="category" value="SPT">스포츠
									<input type="checkbox" name="category" value="LES">레저
								</td>
								
								<th>성별</th>
								<td>
									<input type="radio" name="ctggender" value="M">남성
									<input type="radio" name="ctggender" value="F">여성
									<input type="radio" name="ctggender" value="N">무관
								</td>
								
								<th>가격</th>
								<td>
									<input type="range" name="price" min="1000" max="1000000" value="30000">
								</td>
								
							</tr>
							
							<tr>
							
								<th>사이즈</th>
								<td>
									<input type="range" name="size" min="1000" max="1000000" value="30000">
								</td>
								
								<th>색상</th>
								<td>
									<div style="width:40px;margin-right:10px;float:left;">									
										<input type="checkbox" name="color" id="color_white" value="white">
										<label for="color_white" style="cursor:pointer">
											<div class="item_color" style=" background-color:#f0f0f0;"></div>
										</label>
									</div>
									<div style="width:40px;margin-right:10px;float:left;">									
										<input type="checkbox" name="color" id="color_black" value="black">
										<label for="color_black" style="cursor:pointer">
											<div class="item_color" style=" background-color:black;"></div>
										</label>
									</div>
									<div style="width:40px;margin-right:10px;float:left;">									
										<input type="checkbox" name="color" id="color_red" value="red">
										<label for="color_red" style="cursor:pointer">
											<div class="item_color" style=" background-color:red;"></div>
										</label>
									</div>
								</td>
								
								<th>2</th>
								<td>
									<span class="input-checkbox checked" data-component-checkbox="" style="user-select: auto;">
		                 				<input type="checkbox" id="productColorbeige" name="productColor" value="beige" autocomplete="off" style="user-select: auto;">
		                    			<label for="productColorbeige" style="background-color: rgb(240, 230, 140); user-select: auto;"></label>
		                   				<span class="productcolor-label" style="user-select: auto;">베이지</span>
	               					</span>
               					 </td>
								
							</tr>
							
							<tr>
								<th>4</th>
								<td>123123123</td>
								
								<th>2</th>
								<td>123123123</td>
								
								<th>4</th>
								<td>123123123</td>
							<tr>
								
					
						</table>
						
						
	                    	<button type="button" id="filter"  style="cursor:pointer" >필터 적용</button>
	          
	          
	                    </div>
	                <!-- 필터
	                 //////////////////////////////////////////////////////////////////////-->
                    </form>
                    
                </div>
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