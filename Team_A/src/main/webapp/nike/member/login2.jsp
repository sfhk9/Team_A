<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<style>
.input1{
	padding-left:20px;
	margin-left:8px;
	margin-bottom:4px; 
	height:30px;	
}
.input2{
	padding:0px; 
	margin-top:4px;
	margin-left:8px;  
	margin-bottom:4px; 
	width:400px;
	height:37px;
	background:black;
	color:white;
	font-size:17px;	
}
.input3{
	padding:0px; 
	margin-left:8px;  
	margin-bottom:4px;  
	width:400px;
	height:37px;
	background:yellow;
	color:black;
	font-size:17px;	
}
.input4{
	padding:0px; 
	margin-left:8px;   
	width:400px;
	height:37px;
	background:blue;
	color:white;
	font-size:17px;	
}

.simbol{
	width:60px;
	height:60px;
}
caption{
	font-size:17px;
}
</style>
<body>
<table align="center" style="width:400px;"> 
	<caption ><a href="#">
			  <img src="./simbol.jpg" class="simbol">
		      </a>
		      <br>로그인 화면
	</caption>
	<tr>
		<td style="height:50px;">
			<input type="text" name="userid" 
							   value=""
							   class="input1" 
							   style="width:90%;"
							   placeholder="아이디">								 			
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" name="userpw" 
								   class="input1" 
								   style="width:90%;"
								   placeholder="비밀번호"></td>	
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="chk" 
								   value="Y" >아이디 기억하기		 								   
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="로그인" class="input2">
		</td>
	</tr>
	<tr>
		<td>
			<a href="find_info.jsp">
			<input type="submit" value="아이디/비번찾기" class="input3"></a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="join_agree.jsp">
			<input type="submit" value="회원가입" class="input4"></a>
		</td>
	</tr>
</table>

</body>
</html>