<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/boardList.css">
    <title>Document</title>
</head>
<body>
    <div class="wrap">
        <header>
        	<%@include file="./include/header.jsp" %>
        </header>
        <nav>
        	<%@include file="./include/nav.jsp"%>
        </nav>
        <section>
            <aside>
                <div class="board_menu" style="padding-top:50px;">
                    <ul class="list_left">
                        <li class="list_left_title"><a href="#">공지사항</a></li>
                    </ul>

                    <ul class="list_left">
                        <li class="list_left_title"><a href="#">자주 찾는 내용</a></li>
                        <li><a href="#">회원혜택/서비스</a></li>
                        <li><a href="#">A/S</a></li>
                        <li><a href="#">주문결제</a></li>
                        <li><a href="#">회원정보</a></li>
                        <li><a href="#">취소/반품</a></li>
                        <li><a href="#">기타</a></li>
                        <li><a href="#">배송</a></li>
                        <li><a href="#">상품</a></li>
                    </ul>

                    <ul class="list_left">
                        <li class="list_left_title"><a href="#">고객문의</a></li>
                    </ul>
                </div>
            </aside>
            <article>

                <div class="board_main">
                    <div class="board_path">
                        고객센터 > 공지사항
                    </div>
                    <div class="board_title">
                        공지사항
                    </div>
                    <div>
                        <ul class="list_main">
                            <li><a href=#>2021년 10월 무이자 할부 혜택 안내</a></li>
                            <li><a href=#>이용약관 및 개인정보 처리방침 변경 안내</a></li>
                            <li><a href=#>나이키 X T1 월즈 저지 커스텀 버시스 안내</a></li>
                            <li><a href=#>추석 연휴 배송 및 고객센터 운영 안내</a></li>
                            <li><a href=#>오늘도착 서비스 이벤트 안내</a></li>
                            <li><a href=#>2021년 9월 무이자 할부 혜택 안내</a></li>
                            <li style="border-bottom:none;"><a href=#>문서 29개 모두 보기</a></li>
                        </ul>
                    </div>
                </div>
            </article>
            <aside>
                <div style="width:100px;height:100px;margin:0px auto;margin-top:50px;">
                    <img src="./images/img_call.png" style="width:100px;height:100px;">
                </div>

            </aside>
        </section>
        <footer>

        </footer>
    </div>
</body>
</html>