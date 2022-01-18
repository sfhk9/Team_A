<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
//데이터 수집 함수
function filterRe() {
		
	//네임 데이터 
	var goodsname2 = "${goodsname}";	

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
	
	if ( goodsname2 != "" ) {   data += "goodsname=" + goodsname2 + "&";	}
	if ( ctgtype != ""    ) {   data += "ctgtype=" + ctgtype + "&";		 	}    
	if ( ctggender != ""  ) {   data += "ctggender=" + ctggender + "&"; 	}    
	if ( color != ""      ) {   data += "color=" + color + "&"; 			}    
	if ( pricemin != ""   ) {   data += "pricemin=" + pricemin + "&";		}
	if ( pricemax != ""   ) { 	data += "pricemax=" + pricemax + "&";		}
	
	//디버그용
   	/* alert(data+"입니다 최종"); */
	
	return data;

} 

function filter(){
	
	//필터정보 함수 
	var data = filterRe();
	
	alert(data+"입니다 최종");
	
	var addurl = "/addList.do?" + data;
   	
   	//디버그용
   	/* alert(data+"입니다"); */
    	
   	$('#list').load(addurl, function() {//콜백함수
   		
   		var totaltexhi = $('#totaltex1').val();
   	   	totaltex.innerHTML = totaltexhi;
   	   	
   	}); 

} 

//페이징 로드 함수
function page(pgno){
	
   	//필터정보 함수
	var data = filterRe();

   	data += "page_no=" + pgno
   	
   	var addurl = "/addList.do?" + data;
   	
   	//디버그용
   	/* alert(data+"입니다"); */
   	
   	$('#list').load(addurl, function() {//콜백함수
   		
   		var totaltexhi = $('#totaltex1').val();
   	   	totaltex.innerHTML = totaltexhi;
   	   	
   	});

};

function fn_comma(money){
	var str = String(money).split("").reverse();
	
	var tmp="";
	var cnt=0;
	for(var i=0;i<str.length;i++){
		cnt++;
		tmp=str[i]+tmp;
		if(cnt%3==0&&cnt!=str.length){
			tmp=","+tmp;
		}
	}
	
	return tmp;
}


/* 페이지 로드시 첫실행 */
window.onload = function(){ page(1); }
$(function(){ 
	
	$("#allchk").click(function(){
		if( $("#allchk").prop("checked") == true ) {
			$("input[name='chk']").prop("checked",true);
		} else {
			$("input[name='chk']").prop("checked",false);
		}
	});	
	
	$("#btn_all_delete").click(function(){
		
		var len = $("input[name='chk']").length;
		var values = "";
		
		for(var i=0; i<len; i++) {
			var chk = document.getElementsByName('chk')[i].checked;
			if( chk == true ) {
				values += document.getElementsByName('chk')[i].value;
				values += ",";
			}
		}
		
		if(values.length > 0) {
			
			if(  confirm("일괄 삭제를 진행하시겠습니까?")  ) {
				$.ajax({
					type : "post",
					url  : "adminListAllDelete.do",
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
		}
	});
	
});

function fn_delete(unq) {
	
	if( confirm("정말 삭제하시겠습니까?") ) {
		$.ajax({
			type : "post",
			url  : "adminListDelete.do",
			data : "unq="+unq,
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
}

function fn_unqSubmit(unq){
	$("#unqHidden").val(unq);
	$("#unqFrm").submit();
}
</script>
<style>
.scroll{
	overflow:scroll;
}

</style>

<body>

<header class="header-area header-in-container clearfix">
	<%@include file="../../include/header.jsp" %>
</header>

<!-- 경로 -->
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="index.do">홈</a>
                </li>
                <li class="active">관리자 페이지 </li>
            </ul>
        </div>
    </div>
</div>

<!-- 필터시작///////////////////// -->
<%@include file="../subFilter.jsp" %>
<!-- 필터끝////////////////////// -->
<!-- 여기 메인 리스트 -->
<div class="scroll">
		<div style="position:relative; left:20px; top:30px; margin-bottom:5px;">
			<span style="font-size:20px;font-weight:blod;">상품 목록</span>
		</div>		
		<div style="position:relative; width:1000px; left:20px; top:30px; margin-bottom:10px;">
		</div>
		<div style="position:relative; left:20px; top:30px;" overflow: scroll;>
	
	<table style="width:1000px;"  >
		<colgroup>
			<col width="1%"/>
			<col width="5%"/>
			<col width="30%"/>
			<col width="7%"/>
			<col width="5%"/>
			<col width="7%"/>
			<col width="15%"/>			
			<col width="7%"/>
		</colgroup>
		<tr>
			<th> <input type="checkbox" id="allchk">  </th>
			<th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp번호</th>
			<th>상품이름</th>
			<th>카테고리</th>
			<th>성별</th>
			<th>가격</th>
			<th>색상</th>			
			<th>삭제</th>
		</tr>
	
		<c:set var="rownum" value="${vo.rownum }"/>
		
		<c:forEach var="result" items="${list}">

		<tr align="center"  >
			<td > <input type="checkbox" name="chk" value="${result.unq }" ></td>
			<td >${rownum } </td>
			<td align="left">
			<a href="javascript:fn_unqSubmit('${result.unq }')">${result.name}</a>
			</td>
			<td align="left">${result.ctgtype }</td>
			<td align="left">${result.ctggender }</td>
			<td align="left">${result.price }원</td>
			<td align="left">${result.color }</td>		
			<td align="left"><a href="javascript:fn_delete('${result.unq }')">Del</a></td>		
		</tr>
		
		<c:set var="rownum" value="${rownum-1}"/>
		</c:forEach>

	</table>
	
	<div style="width:800px; text-align:left; margin-top:10px;">
		<button type="button" id="btn_all_delete">일괄삭제</button>
	</div>
	
	<div style="width:1000px; text-align:center; margin-top:10px;">		
			<c:forEach var="i" begin="1" end="${total_page }">
				<a href="adminList.do?page_no=${i }&s_field=${s_field}&s_text=${s_text}">${i }</a>
			</c:forEach>
	</div>
	
		</div>
	</div>
	<form id="unqFrm" action="adminGoodsDetail.do" method="post">
		<input type="hidden" name="unq" id="unqHidden" value="0">
	</form>
<!-- 여기 메인 리스트 -->


<footer class="footer-area bg-gray pt-100 pb-70">
    <%@include file="../../include/footer.jsp" %>
</footer>



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