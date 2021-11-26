<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/goodsList.css">
    <title>Document</title>
</head>
<script>
    function fn_visible(){
        if(document.getElementById("fl").style.display=='none'){
            document.getElementById("fl").style.display='block';
            document.getElementById("btn_filter").innerText='필터접기';
        } else {
            document.getElementById("fl").style.display='none';
            document.getElementById("btn_filter").innerText='필터펴기';
        }
    }
</script>
<body>
    <div class="wrap">
       <%@include file="./include/topmenu.jsp" %>
        <section>
            <aside>

            </aside>
            <article>
                <div class="goodsList">
                    <div class="item">     
                        <img src="./img/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div style="width:10px; height:100px;float:left;"></div>

                    <div class="item">     
                        <img src="./images/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div style="width:10px; height:100px;float:left;"></div>

                    <div class="item">     
                        <img src="./images/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div class="item">     
                        <img src="./img/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div style="width:10px; height:100px;float:left;"></div>

                    <div class="item">     
                        <img src="./img/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div style="width:10px; height:100px;float:left;"></div>

                    <div class="item">     
                        <img src="./img/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div class="item">     
                        <img src="./img/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div style="width:10px; height:100px;float:left;"></div>

                    <div class="item">     
                        <img src="./img/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>

                    <div style="width:10px; height:100px;float:left;"></div>

                    <div class="item">     
                        <img src="./img/img_item.jfif" class="item_img">
                        <div class="item_container">
                            <div class="item_name">
                                상품이름 상품이름 <br>
                                상품이름 상품이름
                            </div>
                            <div style="width:130px;height:30px;">
                                <div class="item_color" style="background-color:blue;"></div>
                                <div class="item_color" style="background-color:red;"></div>
                            </div>
                        </div>

                        <div class="item_price">
                            <div class="price_cancel">
                                999,999원
                            </div>
                            <div class="price_sale">
                                999,999원
                            </div>
                        </div>
                    </div>
                </div>
                <div class="filter_wrap"> 
                    <div style="width:700px;height:30px; background-color:white;">
                        페이징
                        <select>
                            <option>10</option>
                            <option>20</option>
                        </select>
                        / 
                        <span onclick="fn_visible();" id="btn_filter" style="cursor:pointer;" > 필터펴기 </span>
                        / 

                        <span onclick="" id="btn_order" style="cursor:pointer;" > 정렬버튼 </span>
                    </div>
                    <br>
                    <div class="filter_list" name="fl" id="fl" style="display:none;">
                            <button type="button" style="cursor:pointer" >dfddfdfdfdffdff</button>
                    </div>
                </div>
            </article>
            <aside>
                <div class="right_list">
                    최근 본 상품 <br>
                    <div class="right_item">

                    </div>
                    상품 이름 <br> 

                    <div class="right_item">

                    </div>
                    상품 이름 <br> 
                </div>

            </aside>
        </section>
        <footer>

        </footer>
    </div>
</body>
</html>