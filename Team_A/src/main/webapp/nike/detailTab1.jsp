<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/nike" />    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script> window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>'); </script>
	<link rel="stylesheet" href="${path}/css/main.css">
	<link rel="stylesheet" href="${path}/css/goodsDetail.css">

<title>tab1</title>
</head>

<body>
		<p id="tabtab1">
		 	1111111111111111
		</p>
		<p id="tabtab2">
		 	2222222222222222
		</p>
		<p id="tabtab3">
		 	3333333333333333
		</p>
		<p id="tabtab4">
		 	4444444444444444
		</p>
		<p id="test123">
		 	<c:set var="goodsimg" value="${vo.goodsimg }" />
			<%
				
	      		String goodsimg = (String)pageContext.getAttribute("goodsimg") ;
				if(goodsimg != null && !goodsimg.equals("")) {
					String[] array = goodsimg.split("/");
					for( int i=0; i<array.length; i++ ) {
						if(i < array.length ) {
			%>
							<span><img src="./nike/goods/${vo.unq}/<%=array[i] %>"/></span><br>
			<%
						}
					}
				}
			%>
		</p>
</body>
</html>

