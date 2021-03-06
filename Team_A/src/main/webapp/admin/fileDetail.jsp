<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 등록화면</title> 
	
	<link rel="stylesheet" href="/css/admin_main.css">
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  	
  	<script>
  	$(function() {
		
  		$("#btn_save").click(function(){  
  			
  			if( $.trim($("#title").val()) == "" ) {
  				alert("제목을 입력해주세요.");
  				$("#title").focus();
  				return false;
  			}
  			if( $.trim($("#content").val()) == "" ) {
  				alert("내용을 입력해주세요.");
  				$("#content").focus();
  				return false;
  			}

  			var formdata = new FormData(document.getElementById('frm'));
  			$.ajax({
  				type : "POST",
  				url  : "fileboardWriteSave.do",
  				data : formdata,
  				
  				processData: false,
  				contentType: false, 
  				
  				datatype : "text",
  				success : function(data) { 
  					
  					//var datas = JSON.parse(data);
  					
  					if(data == "ok") {
  						alert("저장완료");
  					} else {
  						alert("저장실패");
  					}
  				},
  			    error : function() {
  			    	alert("오류발생");
  			    }
  			});
  		});
  	});
  	</script>
	
</head>

<style>

</style>

<body>
<div class="div1">

	<div class="div_top">
		<h2>관리자모드</h2>
	</div>
	
	
	<div class="div2">
	<!-- left menu S -->

	<%@ include file="../include/left_menu.jsp" %>

	<!-- left menu E -->
	</div>
	<div class="div3">
	
		<div style="position:relative; left:20px; top:30px; margin-bottom:10px;">

		</div>

		<div style="position:relative; left:20px; top:30px; margin-bottom:5px;">
			<span style="font-size:20px;font-weight:blod;">자료 게시판 상세</span>
		</div>

		<div style="position:relative; left:20px; top:30px;">
		
	<form id="frm" enctype="multipart/form-data">
	
	<table style="width:600px;">
		<tr>
			<th>제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>내용</th>
			
			<!--    aaaaa \n bbbbb \n ccccccc   -->
			
			<td>${vo.content }</td>
		</tr>
		
		<tr>
			<th>파일</th>
			<td>
			
			<c:set var="filename" value="${vo.filename }" />
			<%
      		String filename = (String)pageContext.getAttribute("filename") ;
			
			if(filename != null && !filename.equals("")) {
				String[] array = filename.split("／");
				for( int i=0; i<array.length; i++ ) {
			%>
					<!-- <a href="javascript:window.open(encodeURI('downloadFile.do?requestedFile=<%=array[i] %>'))"><%=array[i] %></a> -->
					
					<a href="http://localhost:9998/upload/<%=array[i] %>"><%=array[i] %></a>
					<br>
			<%
				}
			}
 			%>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${vo.rdate }</td>
		</tr>
		<tr>
			<th>변경일</th>
			<td>${vo.udate }</td>
		</tr>
		
	</table>
	
	<div style="width:600px; text-align:center; margin-top:10px;">
		<button type="button" id="btn_save">수정</button>
		<button type="button" id="btn_delete">삭제</button>
	</div>
	</form>
	
		</div>
	</div>
</div>
</body>
</html>











