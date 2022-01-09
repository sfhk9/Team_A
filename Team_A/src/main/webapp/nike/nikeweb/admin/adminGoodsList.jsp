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
</script>


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


<!-- 여기 메인 리스트 -->
<div >
		<div style="position:relative; left:20px; top:30px; margin-bottom:5px;">
			<span style="font-size:20px;font-weight:blod;">상품 목록</span>
		</div>
		
		<div style="position:relative; width:800px; left:20px; top:30px; margin-bottom:10px;">
	
			<div style="position:relative; float:left; width:400px;" >
			총 출력 개수 : ${vo.total }
			</div>
			
			<form name="frm" method="post" action="adminList.do">
			<div style="position:relative; text-align:right;" >
				<select name="s_field"  >
					<option value="name"   <c:if test="${s_field == 'name' }">selected</c:if>>이름</option>
					<option value="content" <c:if test="${s_field == 'content' }">selected</c:if>>가격</option>
					<option value="rdate"   <c:if test="${s_field == 'rdate' }">selected</c:if>>색상</option>
				</select>
				<input type="text" name="s_text" style="width:120px;" value="${s_text }">
				<button type="submit" id="btn_search">검색</button>
			</div>
			</form>
		
		</div>
		<div style="position:relative; left:20px; top:30px;" overflow: scroll;>
	
	<table style="width:1000px;"  >
		<colgroup>
			<col width="2%"/>
			<col width="5%"/>
			<col width="*"/>
			<col width="10%"/>
			<col width="7%"/>
			<col width="15%"/>
			
		</colgroup>
		<tr>
			<th> <input type="checkbox" id="allchk">  </th>
			<th>&nbsp&nbsp&nbsp번호</th>
			<th>상품이름</th>
			<th>가격</th>
			<th>색상</th>
			<th>등록일</th>
			<th>사진</th>
		</tr>
	
		<c:set var="rownum" value="${vo.rownum }"/>
		
		<c:forEach var="result" items="${list}">

		<tr align="center"  >
			<td > <input type="checkbox" name="chk" value="${result.unq }" ></td>
			<td >${rownum } </td>
			<td align="left">
			<a href="*.do?unq=${result.unq }&s_field=${s_field}&s_text=${s_text}">${result.name}</a>
			</td>
			<td align="left">${result.price }원</td>
			<td align="left">${result.color }</td>
			<td align="left">${result.rdate  }</td>
			<td align="left">${result.thumbnail}</td>			
		</tr>
		
		<c:set var="rownum" value="${rownum-1}"/>
		</c:forEach>

	</table>
	
	<div style="width:800px; text-align:left; margin-top:10px;">
		<button type="button" id="btn_all_delete">일괄삭제</button>
	</div>
	
	<div style="width:800px; text-align:center; margin-top:10px;">
			
			<span>페이징</span>
			<%-- <c:forEach var="i" begin="1" end="${vo.total_page }">
				<a href="goodsList.do?page_no=${i }&s_field=${s_field}&s_text=${s_text}">${i }</a>
			</c:forEach> --%>
	</div>
	
		</div>
	</div>
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