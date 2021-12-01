<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<script> window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>'); </script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 찾기</title>
	
	 <script>
        function CheckEmail()
        {
            var mail_val = document.querySelector('#email').value;
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

            if (!reg_email.test(mail_val)) {
                alert('메일을 다시쓰세요')
                return false;

            } else {

                return true;

            }

        }
    </script>
    <style>
        body {
            margin-left:10% ;         
        }

        .info {
            font-size: 0.75em;
        }
		 .info p {
            margin: 0 0 10px;
            line-height: 1.8em;
        }

        #info {
            margin: 0 20px 20px;
            padding: 0;
            background: #fff;
            border: none;
        }
		
        .title {
            margin: 0 0 20px;
            padding: 20px;
            border-top: 3px solid #4e5d60;
            border-bottom: 1px solid #e9e9e9;
            background: #fff;
            font-size: 1.2em;
         
        }

       
        /*input design*/
        .email_input {
            border: 1px solid #e4eaec;
            background: #f7f7f7;
            color: #000;
            vertical-align: middle;
            line-height: 2em;
            width: 350px;
            height: 20px;
            margin-top:5px;
        }

        .required {
            background: url('./wrest.gif') #f7f7f7 top right no-repeat
        }

        .capcha {
            width: 100px;
            height: 41px;
            border: 1px solid #e9e9e9;
        }

        .cah {
            display: inline-block;
            position: relative;
        }

        #captcha_sound {
            position: absolute;
            top: 0;
            left: 101px;
            margin: 0;
            padding: 0;
            width: 23px;
            height: 22px;
            border: 0;
            background: transparent;
            vertical-align: middle;
            overflow: hidden;
            cursor: pointer;
        }

        #captcha_sound span {
            position: absolute;
            top: 0;
            left: 0;
            width: 23px;
            height: 22px;
            background: url(./sound.gif);
        }

        #captcha_reload {
            position: absolute;
            top: 21px;
            left: 101px;
            margin: 0;
            padding: 0;
            width: 23px;
            height: 22px;
            border: 0;
            background: transparent;
            vertical-align: middle;
            overflow: hidden;
            cursor: pointer;
        }

        #captcha_reload span {
            position: absolute;
            top: 0;
            left: 0;
            width: 23px;
            height: 22px;
            background: url(./reload.gif);
        }

        #captcha_key {
            margin: 0 0 0 25px;
            padding: 0 5px;
            width: 70px;
            height: 41px;
            border: 1px solid #b8c9c2;
            background: #f7f7f7;
            font-size: 1.333em;
            font-weight: bold;
            text-align: center;
            line-height: 2.8em;
        }

        .captcha-box {
            display: flex;
            justify-content: left;
        }

        #captcha_info {
            display: block;
            margin: 5px 0 0;
            font-size: 0.95em;
            letter-spacing: -0.1em;
        }

        .win_btn {
       		margin-left:20%;         
        }

        .btn_submit {
     
            padding: 13px 0;
            font-size: 1.09em;
            font-weight: bold;
            border-radius: 5px;
            padding: 8px;
            letter-spacing: -0.1em;
            cursor: pointer;
            width:100px;
		    height:30px;;
		    border:1px solid black;
		    background-color:black;
		    color:white;
        }

        .win_btn button {
            padding: 13px 0;
            font-size: 1.09em;
            font-weight: bold;
            border-radius: 5px;
            padding: 8px;
            letter-spacing: -0.1em;
            cursor: pointer;
            width:100px;
		    height:30px;;
		    border:1px solid black;
		    background-color:white;
		    color:black;
        }
        .wrap{
        	width:600px;
        }
       
    </style>
</head>

<body>
<div class="wrap">
    <div class="info">
        <h1 class="title">회원정보 찾기</h1>
        <fieldset id="info">
            <p>
                회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
                해당 이메일로 아이디와 비밀번호 정보를 보내드립니다.
            </p>
            <div>
                <caption>E-mail 주소</caption><br>
                <input type="email" 
                       maxlength="30" 
                       autofocus id="email" 
                       class="email_input required">
            </div>
        </fieldset>

        <fieldset id="info" class="cah">
            <div class="captcha-box">
                <img class="capcha">
                <button type="button" id="captcha_sound">
                    <span></span>
                </button>
                <button type="button" id="captcha_reload">
                    <span></span>
                </button>
                <input type="text"
                	   name="captcha_key" 
                	   id="captcha_key" 
                	   required="" 
                	   class="captcha_box required" 
                	   size="6"
                       maxlength="6">
            </div>

            <span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
        </fieldset>

        <div class="win_btn">
            <input type="submit" 
             	   value="확인" 
             	   class="btn_submit" 
             	   onclick="CheckEmail()">
            <button type="button" onclick="window.close();">창닫기</button>
        </div>
    </div>
   </div>
</body>

</html>