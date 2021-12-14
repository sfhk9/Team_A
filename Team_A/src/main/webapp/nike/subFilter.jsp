<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 펼침 -->
<div class="filter_list" name="fl" id="fl" style="display:none;">
               
<table border="1">
	<tr>
	
		<th>카테고리</th>
		<td>
			<input type="checkbox" name="ctgtype" value="LIF">일상
			<input type="checkbox" name="ctgtype" value="SPT">스포츠
			<input type="checkbox" name="ctgtype" value="LES">레저
		</td>
		
		<th>성별</th>
		<td>
			<input type="radio" name="ctggender" value="M">남성
			<input type="radio" name="ctggender" value="F">여성
			<input type="radio" name="ctggender" value="N">무관
		</td>
		
		<th>가격</th>
		<td>
			<p>
			  <label for="amount">Price range:</label>
			  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
			</p>

			<div id="slider-range"></div>
			
			<br>
			
			직접입력 <br>
			<input type="text" id="price_min" >원 ~ <input type="text" id="price_max" >원
			
		</td>
		
	</tr>
	
	<tr>
	
		<th>사이즈</th>
		<td>
			<input type="range" name="size" min="60" max="200" value="70">
		</td>
		
		<th>색상</th>
		<td colspan='3'>
			<label for="checkbox-1" id="test"  >
				<div class="item_color" style=" background-color:white;"></div>
			</label>
		    <input type="checkbox" id="checkbox-1" name="color" value="white" class="selector">
		    
		    <label for="checkbox-2" id="test">
				<div class="item_color" style=" background-color:gray;"></div>
			</label>
		    <input type="checkbox" id="checkbox-2" name="color" value="gray" class="selector">
		    
		    <label for="checkbox-3" id="test">
				<div class="item_color" style=" background-color:black;"></div>
			</label>
		    <input type="checkbox" id="checkbox-3" name="color" value="black" class="selector">
		    
		    <label for="checkbox-4" id="test">
				<div class="item_color" style=" background-color:red;"></div>
			</label>
		    <input type="checkbox" id="checkbox-4" name="color" value="red" class="selector">
		    
		    <label for="checkbox-5" id="test">
		    	<div class="item_color" style=" background-color:yellow;"></div>
		    </label>
		    <input type="checkbox" id="checkbox-5" name="color" value="yellow" class="selector">

		    <label for="checkbox-6" id="test">
				<div class="item_color" style=" background-color:#F5F5DC;"></div>
			</label>
		    <input type="checkbox" id="checkbox-6" name="color" value="beige" class="selector">
		    
		    <label for="checkbox-7" id="test">
				<div class="item_color" style=" background-color:brown;"></div>
			</label>
		    <input type="checkbox" id="checkbox-7" name="color" value="brown" class="selector">
		    
		    <label for="checkbox-8" id="test">
				<div class="item_color" style=" background-color:navy;"></div>
			</label>
		    <input type="checkbox" id="checkbox-8" name="color" value="navy" class="selector">
		    
		    <label for="checkbox-9" id="test">
				<div class="item_color" style=" background-color:pink;"></div>
			</label>
		    <input type="checkbox" id="checkbox-9" name="color" value="pink" class="selector">
		    
		    <label for="checkbox-10" id="test">
				<div class="item_color" style=" background-color:blue;"></div>
			</label>
		    <input type="checkbox" id="checkbox-10" name="color" value="" class="selector">
		    
		    <label for="checkbox-11" id="test">
				<div class="item_color" style=" background-color:skyblue;"></div>
			</label>
		    <input type="checkbox" id="checkbox-11" name="color" value="skyblue" class="selector">
		</td>
		
	
		
	</tr>
	


</table>


               	<button type="button" id="filter" style="cursor:pointer" >필터 적용</button>
     
     
               </div>
           <!-- 필터
            //////////////////////////////////////////////////////////////////////-->