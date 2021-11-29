<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/main.css"> 
    <title>회원가입</title>
</head>

<script>
 function fn_submit() {	   
	   if( document.frm.userid.value == "" ) {
	      alert("ID를 입력해주세요.");
	      document.frm.userid.focus();
	      return false;
	   }
	   if( document.frm.userpass.value == "" ) {
	      alert("비밀번호를 입력해주세요.");
	      document.frm.userpass.focus();
	      return false;
	   }
	   if( document.frm.userpass_chk.value == "" ) {
		   alert("비밀번호확인을 입력해주세요.");
		   document.frm.userpass_chk.focus();
		   return false;
		   }
	   if( document.frm.username.value == "" ) {
		      alert("이름을 입력해주세요.");
		      document.frm.username.focus();
		      return false;
		   }
	   if( document.frm.phone.value == "" ) {
		      alert("핸드폰번호를 입력해주세요.");
		      document.frm.phone.focus();
		      return false;
		   }
	   document.frm.submit();
	}

</script>
<style>
body,html{
    margin:0px;
    padding:0px;
}
section{
    width:1000px;
    height:550px;  

}
article{
    width:1000px;
}
footer{
      width:1000px;
      height:200px;
      background-color:black;
  }

#title {
    margin-bottom: 15px;
    font-size: 1.3em;
    font-weight: bold;
}
.mem_title{
    font-weight:bold;
    font-family:'맑은 고딕';
    font-size:16px;

    padding-top:15px;
}

.mem_tbl{
    width:1000px;
    border-top:2px solid black;
    border-bottom:1px solid #ddd;
    border-collapse:collapse;
}
.mem_cap{
    font-weight:bold;
    font-family:'맑은 고딕';
    font-size:13px;
    text-align:left;
    margin-top:20px;
    margin-bottom:10px;
}
.mem_tbl th{
    width:150px;
    font-size:14px;
    font-family:'맑은 고딕';
    text-align:left;
    background-color:#f6f6f6;
    border-right:1px solid #ddd;
    border-bottom:1px solid #ddd;
    padding-left:10px;
    padding-top:5px;
    padding-bottom:5px; 
}
.mem_tbl td{
    font-size:14px;
    text-align:left;
    border-bottom:1px solid #ddd;
    padding-left:10px;
    padding-bottom:5px;
    padding-top:5px;

}
.mem_str{
    font-size:13px;
}
    .mem_div_btn{
    width:1000px;
    text-align:center;
    padding-top:30px;
  
}
.mem_btn1{
    width:120px;
    height:40px;
    border-radius: 5px;
    border:1px solid black;
    background-color:black;
    color:white;
}
.mem_btn2{
    width:120px;
    height:40px;
    border-radius: 5px;
    border:1px solid black;
    background-color:white;
    color:black;    
}   
.submit {
           margin-top: 50px;
           text-align: center;
        }

.submit input {
    width: 100px;
    padding: 13px 0;
    font-size: 1.09em;
    font-weight: bold;
    border-radius: 5px;
    letter-spacing: 0;
    padding: 8px;
    border: 0;
    background: black;
    color: #fff;
    letter-spacing: -0.1em;
    cursor: pointer;
}
.inputBox{
    background-color:#f6f6f6;
    border:1px solid #ddd;
}
.wrap{
	margin-left:-9%;
}
</style>

<body>
    <div class="wrap">
<<<<<<< HEAD
    <header>
    	<%@ include file="../include/topmenu.jsp" %>
    </header>
    
    
    <section>
        <article>       
            <form name="frm" method="post" action="joinSave.jsp">
            <table class="mem_tbl">
                <caption class="mem_cap">사이트 이용정보 입력</caption>
                <tr>
                    <th>아이디</th>
                    <td><span class="mem_str">영문자, 숫자,_만 입력 가능. 최소 3자이상 입력하세요.<br></span>
                        <input type="text" name="userid" class="inputBox"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userpass" class="inputBox"></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" name="userpass_chk" class="inputBox"></td>
                </tr>
            </table>
            <table class="mem_tbl">
                <colgroup>
                
                </colgroup>
                <caption class="mem_cap">개인정보입력</caption>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="username" class="inputBox" style="width:70px"></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><span class="mem_str">공백없이 한글, 영문 숫자만 입력 가능 (한글2자, 영문4자 이상) <br>
                        닉네임을 바꾸시면 앞으로 60일 이내에는 변경할 수 없습니다.</span> <br>
                        <input type="text" name="nickname" class="inputBox" style="width:100px"></td>
                </tr>
                <tr>
                    <th>E-mail</th>
                    <td><input type="email" name="email" class="inputBox" style="width:400px"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="tel" name="tel" class="inputBox"></td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td><input type="tel" name="phone" class="inputBox"></td>
                </tr>
            </table>
            <div class="mem_div_btn">
                <button type="submit" class="mem_btn1"onclick="fn_submit();return false;">회원가입</button>
                <button type="reset" class="mem_btn2">취소</button>
            </div>
             <%@ include file="../include/footer.jsp" %>
       </form>       
        </article>
    </section>
    <footer>
     
    </footer>
=======
	    <header>
	    	<%@ include file="../include/topmenu.jsp" %>
	    </header>
	    
	    
	    <section>
	        <article>       
	            <form name="frm" method="post" action="joinSave.jsp">
	            <table class="mem_tbl">
	                <caption class="mem_cap">사이트 이용정보 입력</caption>
	                <tr>
	                    <th>아이디</th>
	                    <td><span class="mem_str">영문자, 숫자,_만 입력 가능. 최소 3자이상 입력하세요.<br></span>
	                        <input type="text" name="userid" class="inputBox"></td>
	                </tr>
	                <tr>
	                    <th>비밀번호</th>
	                    <td><input type="password" name="userpass" class="inputBox"></td>
	                </tr>
	                <tr>
	                    <th>비밀번호 확인</th>
	                    <td><input type="password" name="userpass_chk" class="inputBox"></td>
	                </tr>
	            </table>
	            <table class="mem_tbl">
	                <colgroup>
	                
	                </colgroup>
	                <caption class="mem_cap">개인정보입력</caption>
	                <tr>
	                    <th>이름</th>
	                    <td><input type="text" name="username" class="inputBox" style="width:70px"></td>
	                </tr>
	                <tr>
	                    <th>닉네임</th>
	                    <td><span class="mem_str">공백없이 한글, 영문 숫자만 입력 가능 (한글2자, 영문4자 이상) <br>
	                        닉네임을 바꾸시면 앞으로 60일 이내에는 변경할 수 없습니다.</span> <br>
	                        <input type="text" name="nickname" class="inputBox" style="width:100px"></td>
	                </tr>
	                <tr>
	                    <th>E-mail</th>
	                    <td><input type="email" name="email" class="inputBox" style="width:400px"></td>
	                </tr>
	                <tr>
	                    <th>전화번호</th>
	                    <td><input type="tel" name="tel" class="inputBox"></td>
	                </tr>
	                <tr>
	                    <th>휴대폰번호</th>
	                    <td><input type="tel" name="phone" class="inputBox"></td>
	                </tr>
	            </table>
	            <div class="mem_div_btn">
	                <button type="submit" class="mem_btn1"onclick="fn_submit();return false;">회원가입</button>
	                <button type="reset" class="mem_btn2">취소</button>
	            </div>
	       </form>
	        
	        </article>
	
	    </section>
	    <footer>
	      <%@ include file="../include/footer.jsp" %>
	    </footer>
>>>>>>> branch 'master' of https://github.com/sfhk9/Team_A.git
    </div>
</body>
</html>