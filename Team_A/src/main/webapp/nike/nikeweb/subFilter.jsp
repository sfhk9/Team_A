<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

            	
            	<!-- 상단 필터 버튼 시작-->
                <div class="shop-top-bar mb-35">
                    <div class="select-shoing-wrap">
                        <div class="shop-select">
                            <select>
                                <option value="">신상품순</option>
                                <option value="">가  ~ 하</option>
                                <option value="">하  ~ 가</option>
                                <option value="">남은 재고순</option>
                            </select>
                        </div>
                        
                        <p>총 ${total}개 결과중 1-12개 표시중</p>
                    </div>
                    
                    <div class="filter-active">
                        <a href="#"><i class="fa fa-plus"></i> 필터</a>
                    </div>
                </div>
    			
                
                <!-- 하단 필터 버튼 시작-->
                <div class="product-filter-wrapper">
                    <div class="row">
                    
                        <!-- 정렬순 -->
                        <div class="col-md-2 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>정렬</h5>
                                <ul class="sort-by">
                                    <li><a href="#">기본</a></li>
                                    <li><a href="#">인기순</a></li>
                                    <li><a href="#">판매순</a></li>
                                    <li><a href="#">신상품순</a></li>
                                    <li><a href="#">높은가격순</a></li>
                                    <li><a href="#">낮은가격순</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <!-- 카테고리 필터 -->
                        <div class="col-md-2 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>카테고리</h5>
                                <ul class="color-filter">
	                                <li><input type="checkbox" name="ctgtype" value="LIF"> <a>일상</a></li>
	                                <li><input type="checkbox" name="ctgtype" value="SPT"> <a>스포츠</a></li>
	                                <li><input type="checkbox" name="ctgtype" value="LES"> <a>레저</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <!-- 카테고리 필터 -->
                        <div class="col-md-2 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>성별</h5>
                                <ul class="color-filter">
                                    <li><input type="radio" name="ctggender" value="M"> <a>남성</a></li>
	                                <li><input type="radio" name="ctggender" value="F"> <a>여성</a></li>
	                                <li><input type="radio" name="ctggender" value="N"> <a>무관</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <!-- Product Filter -->
                        <div class="col-md-2 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>가격</h5>
                                <div class="price-filter mt-25">
									<input type="text" id="price_min" >원 ~ <input type="text" id="price_max" >원
                                </div>
                            </div>
                        </div>
                        
                        <!-- 색상 필터 -->
                        <div class="col-md-3 col-sm-6 col-xs-12 mb-30">
                            <div class="product-filter">
                                <h5>색상</h5>
                                <ul class="color-filter">
                                
	          						<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-1" style="background-color:white; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-1" name="color" value="white" class="selector"><br>
					    					<a>하얀색</a>
										</div>     
				         			</li> 
				         			  
	          						<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-2" style="background-color:gray; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-2" name="color" value="gray" class="selector"><br>
					    					<a>회색</a>
										</div>     
				         			</li> 
				         			
	          						<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-3" style="background-color:black; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-3" name="color" value="black" class="selector"><br>
					    					<a>검은색</a>
										</div>     
				         			</li> 
				         			
				         			<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;" >
			          						<label for="checkbox-4" style="background-color:red; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-4" name="color" value="red" class="selector"><br>
					    					<a>빨간색</a>
										</div>     
				         			</li> 
				         			
				         			<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-5" style="background-color:yellow; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-5" name="color" value="yellow" class="selector"><br>
					    					<a>노란색</a>
										</div>     
				         			</li> 
				         			
				         			<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-6" style="background-color:#F5F5DC; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-6" name="beige" value="brown" class="selector"><br>
					    					<a>베이지</a>
										</div>     
				         			</li> 
				         			
	          						<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-7" style="background-color:brown; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-7" name="color" value="brown" class="selector"><br>
					    					<a>갈색</a>
										</div>     
				         			</li> 
				         			
				         			<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-8" style="background-color:navy; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-8" name="color" value="navy" class="selector"><br>
					    					<a>나이비</a>
										</div>     
				         			</li> 

				         			<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-9" style="background-color:pink; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-9" name="color" value="pink" class="selector"><br>
					    					<a>분홍색</a>
										</div>     
				         			</li> 
				         			
				         			<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-10" style="background-color:blue; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-10" name="color" value="blue" class="selector"><br>
					    					<a>파란색</a>
										</div>     
				         			</li> 

				         			<li>
		          						<div style="text-align: center; width: 50px; float:left; margin: 5px;">
			          						<label for="checkbox-11" style="background-color:skyblue; width: 28px; height: 28px;" ></label>
					    					<input type="checkbox" id="checkbox-11" name="color" value="skyblue" class="selector"><br>
					    					<a>스카이</a>
										</div>     
				         			</li> 
             
                                </ul>
                            </div>
                        </div>
                        
                        <input type="button" class="button" value="필터적용">
                        
                    </div>
                </div>
            	