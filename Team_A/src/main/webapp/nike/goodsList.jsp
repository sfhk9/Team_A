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
   <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
     <script> window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>'); </script>
     <link rel="stylesheet" href="${path}/css/main.css">
    <link rel="stylesheet" href="${path}/css/goodsList.css">
    <title>Document</title>
    
<script>
	$( function() {
	   $( ".selector" ).checkboxradio({
	      icon: false
	   });
	   
	   $( "#slider-range" ).slider({
		    range: true,
		    min: 10000,
		    max: 1000000,
		    values: [ 20000, 50000 ],
		    slide: function( event, ui ) {
		      $( "#amount" ).val( ui.values[ 0 ] + "원 - " + ui.values[ 1 ] + "원" );
		    }
		  });
		  $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) + "원 - " + $( "#slider-range" ).slider( "values", 1 ) + "원" );
	   
	});   
</script>

</head>

<script>

function fn_visible() {
    if(document.getElementById("fl").style.display=='none'){
        document.getElementById("fl").style.display='block';
        document.getElementById("btn_filter").innerText='필터접기';
    } else {
        document.getElementById("fl").style.display='none';
        document.getElementById("btn_filter").innerText='필터펴기';
    }
}

//필터데이터 수집 함수
function filterRe() {
		
	//타입 데이터 
	var ctgtype_len = $("input[name='ctgtype']").length;
	var ctgtype = "";
	
	for( var i=0; i<ctgtype_len; i++ ) {
	   var ctgtype_val = document.getElementsByName('ctgtype')[i].checked;
	   if( ctgtype_val == true ) {
	      ctgtype += document.getElementsByName('ctgtype')[i].value;
	      ctgtype += ",";
	   }
	}
	
	//성별 데이터 
	var ctggender_len = $("input[name='ctggender']").length;
	var ctggender = "";
	
	for( var i=0; i<ctggender_len; i++ ) {
	     var ctggender_val = document.getElementsByName('ctggender')[i].checked;
	     if( ctggender_val == true ) {
	        ctggender += document.getElementsByName('ctggender')[i].value;
	     }
	  }
	
	//색상 데이터 
	var color_len = $("input[name='color']").length;
	var color = "";
	
	for( var i=0; i<color_len; i++ ) {
	     var color_val = document.getElementsByName('color')[i].checked;
	     if( color_val == true ) {
	        color += document.getElementsByName('color')[i].value;
	        color += ",";       
	     }
	  }
	
	//가격 데이터
	var pricemin = "";
	   pricemin = document.getElementById("price_min").value;
	
	var pricemax = "";
	   pricemax = document.getElementById("price_max").value;
	
	
	//최종 보낼 데이터
	var data = "";
	
	if ( ctgtype != ""    ) {   data += "ctgtype=" + ctgtype + "&"; }    
	if ( ctggender != "") {   data += "ctggender=" + ctggender + "&"; }    
	if ( color != ""    ) {   data += "color=" + color + "&"; }    
	if ( pricemin != ""   ) {   data += "pricemin=" + pricemin + "&";}
	if ( pricemax != ""   ) { data += "pricemax=" + pricemax + "&";}
	
	alert(data+"입니다");
	
	return data;

} 
    
    
	

    
 
       	
//더보기버튼
var page = 1;
$("#add").click(function(){
   	//필터정보 함수
	var data = filterRe();
   	
   	page++;
   	
   	data += "&page_no=" + page
   	
   	var addurl = "/addList.do?" + data;
   	
   	$(".wrap").css('height', 1360*page);
   	$(".add").css('margin-top', 1360*page-130);
   	
   	$('#list').load(addurl);
   	

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
				<div style="position:relative">
					<div class="div_abs">
						<div class="goodsList" id="list">                  
		                    <!-- 상품리스트 시작  -->     
		                   <%@include file="./subList.jsp" %>   
						</div>
						
	                    <div class="add" id="add">
	           	     		더보기
	            	    </div>
	                </div>
				</div>

                
               
          			
                <div class="filter_wrap"> 
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
                       
                       
                       <%@include file="./subFilter.jsp" %>       
                    
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