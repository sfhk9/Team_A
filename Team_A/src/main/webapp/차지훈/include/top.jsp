<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단메뉴</title>
</head>
<style>
   
   .top_menu {
       width:1000px;
       height:20px;
       border-bottom:2px solid #ccc;
       text-align:left;
   }

   .top_ul{
       float:right;
       margin-right:80px;
       line-height:1.8;
   }   

   .top_ul li{
       list-style:none;
       float:left;      
       border-right:1px solid black;
       padding-left:5px;
       padding-right:5px;
       font-size:12px;

   }
       
   body {
   width:1000px;
   height:120px;
	}
   * {
       margin:0px;
       padding:0px;
   	  }
	a{
       text-decoration:none;
       color:inherit;
   }
   html{
   width:1000px;
   }
    .top_logo {
        width:1000px;
        height:100px;
        text-align:center;
    }
    .img_logo{
        width:100px;
        height:40px;    
        margin-top:30px;
        margin-left:20px;
    }

    .searchbar{
        width:400px;
        height:40px;
        font-size:30px;
        margin-top:30px;
        border:2px solid #ccc;
        border-radius:30px;
    }

    .img_mypage{
        width:80px;
        height:80px; 
        margin-top:10px;
        margin-right:20px;
    }
    
    nav{
        position:sticky;
        top:0px;
        width:1000px;
        height:40px;
        z-index:3;
        border-top:1px solid #ccc;
        border-bottom:2px solid black;
        background-color:white;
        text-align:center;
    }
     .nav_ul {
        width:700px;
        margin:0px auto;
        line-height:1.8
    }

    .nav_ul li{ 
        list-style:none;
        float:left;
        margin-left:63px;
        font-weight:bold;
        font-size:20px;
    }
 
</style>

<body> 
    <div class="top_menu">
        <ul class="top_ul">
            <li><a href="../member/login2.jsp">로그인</a></li>
            <li><a href="../member/join_agree.jsp">회원가입</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">주문배송</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>   
    </div>         
     <div class="top_logo">
            <div style="float:left;width:300px;height:100px;">
                <a href="#">
                <img src="../img/logo_NIKE.jpg" class="img_logo"></a>
            </div>
            <div style="float:left;width:400px;height:100px;">
                <input type="text" class="searchbar">
            </div>
            <div style="float:left;width:300px;height:100px;">            
                <a href="#">
                <img  src="../img/mypage.png" class="img_mypage"></a>
            </div>
     </div>
     <nav> 
     <ul class="nav_ul">
                <li><span style="cursor:pointer;" onmouseover="javascript:" onmouseout="">New releases</span></li>
                <li><a href="#">men</a></li>
                <li><a href="#">women</a></li>
                <li><a href="#">kids</a></li>
                <li><a href="#">sale</a></li>
    </ul>
	</nav>
</body>
</html>