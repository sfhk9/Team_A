<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:forEach var="result" items="${list}" varStatus="status" >
   <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
       <div class="product-wrap-2 mb-25">
           <div class="product-img">
               <a href="product-details.html">
                   <img class="default-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
                   <img class="hover-img" src="/nike/nikeweb/assets/img/product/hm2-pro-5.jpg" alt="">
               </a>
               <span class="pink">-10%</span>
               <!-- <span class="purple">New</span> -->
               <div class="product-action-2">
                   <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                   <a title="Quick View" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>
                   <a title="Compare" href="#"><i class="fa fa-retweet"></i></a>
               </div>
           </div>
           
           <div class="product-content-2">
               <div class="title-price-wrap-2">
                   <h3><a href="product-details.html">Awesome Tote Bag</a></h3>
                   <div class="price-2">
                       <span>$ 60.00</span>
                       <span class="old">$ 60.00</span>
                   </div>
               </div>
               <div class="pro-wishlist-2">
                   <a title="Wishlist" href="wishlist.html"><i class="fa fa-heart-o"></i></a>
               </div>
           </div>
       </div>
   </div>	
</c:forEach>