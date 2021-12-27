<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 리스트</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/nike/nikeweb/assets/img/favicon.png">
    
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
</head>

<script>
$( function() {
	   $( ".selector" ).checkboxradio({
	      icon: false
	   });
}); 
</script>

<script>
//데이터 수집 함수
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
    



//페이징 버튼

$("#add").click(function(){
   	//필터정보 함수
	var data = filterRe();
   	
   	page++;
   	
   	data += "&page_no=" + page
   	
   	var addurl = "/addList.do?" + data;
   	
   	$('#list').load(addurl);
   	
});
		

</script>

<style>


.chkbox {
  width: 28px; height: 28px;
  display: block;
  position: relative;
  padding-left: 25px;
  margin-bottom: 12px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* 브라우저의 기본 체크박스 숨기기 */
.chkbox input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* 브라우저의 기본 체크박스 숨기기 */
.chkbox input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}


/* 사용자 정의 체크박스 생성 */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #ff0000;
}


/* 체크박스 체크 시 배경 추가 */
.chkbox input:checked ~ .checkmark {
  background-color: #ff0000;
}

/* 체크 표시/인디케이터 생성(선택하지 않으면 숨겨짐) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* 체크 시 체크 표시 */
.chkbox input:checked ~ .checkmark:after {
  display: block;
}

/* 체크 표시/인디케이터 스타일 지정 */
.chkbox .checkmark:after {
  left: 9px;
  top: 5px;
  width: 7px;
  height: 14px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>

<body>

<header class="header-area header-in-container clearfix">
	<%@include file="../include/header.jsp" %>
</header>

<!-- 경로 -->
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="index.html">홈</a>
                </li>
                <li class="active">상품 </li>
            </ul>
        </div>
    </div>
</div>

<div class="shop-area pt-95 pb-100">
    <div class="container">
        <div class="row flex-row-reverse">
            <div class="col-lg-12">
            
            	<!-- 필터시작///////////////////// -->
				<%@include file="subFilter.jsp" %>
            	<!-- 필터끝////////////////////// -->
            	
                <div class="shop-bottom-area">
                    <div class="row">
	                    
	                    <!-- 리스트 시작//////////// -->
						<%@include file="subList.jsp" %>
						<!-- 리스트 끝 //////////// -->

						<!-- 페이징 버튼 -->
						<div class="pro-pagination-style text-center mt-30">
	                        <ul>
	                        	<li><a class="prev" href="#"><i class="fa fa-angle-double-left"></i></a></li>
								<c:forEach var="i" begin="1" end="${total_page }">
									<a href="">${i }</a>
								</c:forEach>
	                            
	                            <li><a class="active" href="#">1</a></li>
	                            <li><a href="#">2</a></li>
	                            <li><a class="next" href="#"><i class="fa fa-angle-double-right"></i></a></li>
	                        </ul>
						</div>
                        
					</div>
       			</div> 
       			     
            </div>
        </div>
    </div>
</div>

<footer class="footer-area bg-gray pt-100 pb-70">
    <%@include file="../include/footer.jsp" %>
</footer>


<!-- Modal -->
<%@include file="subModel.jsp" %>
<!-- Modal end -->









<!-- All JS is here
============================================ -->

<script src="/nike/nikeweb/assets/js/vendor/modernizr-3.11.7.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/jquery-v3.6.0.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/jquery-migrate-v3.3.2.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/popper.min.js"></script>
<script src="/nike/nikeweb/assets/js/vendor/bootstrap.min.js"></script>
<script src="/nike/nikeweb/assets/js/plugins.js"></script>
<!-- Ajax Mail -->
<script src="/nike/nikeweb/assets/js/ajax-mail.js"></script>
<!-- Main JS -->
<script src="/nike/nikeweb/assets/js/main.js"></script>

</body>

</html>