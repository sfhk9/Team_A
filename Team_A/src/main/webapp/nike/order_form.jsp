<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/order_form.css">
    <title>Document</title>
</head>
<body>
    <div class="wrap">
        <header>
            <%@include file="./include/header.jsp" %>
        </header>
        <nav>
            <%@include file="./include/nav.jsp" %>
        </nav>
        <section>
            <div class="order_wrap">
                <div class="order_title">
                    주문서
                </div>
                <div class="order_process">
                    <span>장바구니</span>   >
                    <span style="font-weight:bold;">주문서</span>   >
                    <span>주문완료</span>
                </div>

                <div class="order_main">
                    <table class="tbl_order">
                        <colgroup>
                            <col width="40%" />
                            <col width="15%" />
                            <col width="15%" />
                            <col width="15%" />
                            <col width="15%" />
                        </colgroup>
                        <tr>
                            <th class="th1">주문상품 n개</th>
                            <th class="th2">수량/상품금액</th>
                            <th class="th2">할인금액</th>
                            <th class="th2">할인적용금액</th>
                            <th class="th2">배송비</th>
                        </tr>
                        <tr>
                            <td>
                                <div class="order_img">
                                    <img src="./images/img_cup.jpg" class="img_item">
                                </div>
                                <div class="order_detail">
                                    삼성 2021 갤럭시북 NT750XDA-KH38 키스킨 <br>
                                    
                                    <span>선택 종류선택 + 1)실리스킨-투명(보급형)(A타입)</span>
                                </div>
                            </td>
                            <td>
                                <span>1개 </span><br>
                                8,500d원
                            </td>
                            <td>
                                <span class="span_discount">-430원</span> <br>
                                <button type="button">쿠폰적용</button>
                            </td>
                            <td>
                                8,070원
                            </td>
                            <td style="border-right:none;">
                                <span>파우치몰</span> <br>
                                무료배송
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <article>
                <table class="tbl_insertInfo">
                    <tr>
                        <th class="th1">배송정보</th>
                    </tr>
                    <tr>
                        <td><input type="text" class="input_address" placeholder="받는 사람"></td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button">주소찾기</button>
                            <input type="text" class="input_address" placeholder="우편번호">
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" class="input_address" placeholder="기본 주소"></td>
                    </tr>
                        <td><input type="text" class="input_address" placeholder="상세 주소 및 상세 건물명"></td>
                    <tr>
                        <td>
                            <select>
                                <option value="010">010</option>
                            </select>
                            <input type="text" class="input_address" placeholder="상세 주소 및 상세 건물명">
                            <input type="text" class="input_address" placeholder="상세 주소 및 상세 건물명">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select>
                                <option value="">배송시 요청사항을 선택해주세요.</option>
                                <option value=""></option>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
                <div>

                </div>

            </article>
            <aside class="aside_order">
                <div class="div_pass_wrap">
                    <span class="th1">결제금액</span>
                    <div class="div_pass_order">
                        <table class="tbl_pass">
                            <colgroup>
                                <col width="40%" />
                                <col width="60$" />
                            </colgroup>
                            <tr>
                                <td>상품금액</td>
                                <th>8,500원</th>
                            </tr>
                            <tr>
                                <td>할인금액</td>
                                <th class="span_discount">-430원</th>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <th>0원</th>
                            </tr>
                            <tr>
                                <th class="th3" style="text-align:left;">총 결제금액</th>
                                <th class="th4">8,070원</th>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center;"><button type="button" class="btn_pass">결제하기</button></td>
                            </tr>
                        </table>
                    </div>
                </div>

            </aside>
        </section>
        <footer>
        </footer>
    </div>
</body>
</html>