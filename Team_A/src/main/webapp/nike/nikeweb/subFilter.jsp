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
											<label for="chk1" class="chkbox" >										
												<input id="chk1" type="checkbox" >
												<span class="checkmark" style="background-color: black;"></span>
											</label><br>
											<a>검은색</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk2" class="chkbox" >										
												<input id="chk2" type="checkbox" >
												<span class="checkmark" style="background-color: gray;"></span>
											</label><br>
											<a>회색</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk3" class="chkbox" >										
												<input id="chk3" type="checkbox" >
												<span class="checkmark2" style="background-color: white;"></span>
											</label><br>
											<a>흰색</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk4" class="chkbox" >										
												<input id="chk4" type="checkbox" >
												<span class="checkmark" style="background-color: red;"></span>
											</label><br>
											<a>빨간색</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk5" class="chkbox" >										
												<input id="chk5" type="checkbox" >
												<span class="checkmark2" style="background-color: yellow;"></span>
											</label><br>
											<a>노랑색</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk6" class="chkbox" >										
												<input id="chk6" type="checkbox" >
												<span class="checkmark2" style="background-color: beige;"></span>
											</label><br>
											<a>베이지</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk7" class="chkbox" >										
												<input id="chk7" type="checkbox" >
												<span class="checkmark" style="background-color: brown;"></span>
											</label><br>
											<a>갈색</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk8" class="chkbox" >										
												<input id="chk8" type="checkbox" >
												<span class="checkmark" style="background-color: navy;"></span>
											</label><br>
											<a>나이비</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk9" class="chkbox" >										
												<input id="chk9" type="checkbox" >
												<span class="checkmark" style="background-color: pink;"></span>
											</label><br>
											<a>분홍색</a>
										</div>
									</li> 
									
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk10" class="chkbox" >										
												<input id="chk10" type="checkbox" >
												<span class="checkmark" style="background-color: blue;"></span>
											</label><br>
											<a>파랑색</a>
										</div>
									</li> 
									<li>
            							<div style="text-align: center; width: 50px; float:left; margin: 5px;">
											<label for="chk11" class="chkbox" >										
												<input id="chk11" type="checkbox" >
												<span class="checkmark" style="background-color: skyblue;"></span>
											</label><br>
											<a>스카이</a>
										</div>
									</li> 
									
	

                                </ul>
                            </div>
                        </div>
                        
                        <input type="button" class="button" value="필터적용">
                        
                    </div>
                </div>
            	