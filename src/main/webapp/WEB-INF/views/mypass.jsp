<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Music - Modern Music HTML5 Template</title>

    <!-- Favicon -->
    <link rel="icon" href="<%= request.getContextPath() %>/resources/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/style.css">

</head>
<body>
    <jsp:include page="/resources/include/header.jsp"></jsp:include>

<c:set var="dto" value="${member }" />  
<c:if test="${member.user_purchase == 0 }">                                    



    <!-- 이용권 구매 제목 -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">  
            <h2>이용권 구매</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    <!-- ##### Events Area Start ##### -->
    <section class="events-area section-padding-100">
        
    </section>
   
    
    <!-- 이용권 옵션 종류 -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">

                <!-- 옵션 1 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <p>스마트 음악 감상</p>          
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="#">
                                <p>첫달 100원</p>
                                <p>98% 7,400원</p>
                                <h3>100원</h3>
                                <button onclick="#" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- 옵션2 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <p>스마트 음악 감상</p>          
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="#">
                                <p>6개월 특가 할인</p>
                                <p>34% 7,400원</p>
                                <h3>4,900원</h3>
                                <button onclick="#" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                </div>
                
                <!-- 옵션3 -->
                <div class="col-12 col-lg-10">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <h4 align="center">가족 할인</h4>         
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="#">
                                <p align="center">6개월 특가 할인</p>
                                <p align="center">34% 7,400원</p>
                                <h3 align="center">4,900원</h3>
                                <button onclick="#" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                    
                     <h3>인기 상품</h3>
                </div>
                
               
                
                <!-- 옵션4 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <h4>음악 감상</h4>         
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="#">
                                <p>3개월 특가 할인</p>
                                <p>50% 22,200원</p>
                                <h3>11,100원</h3>
                                <button onclick="#" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                </div>
                
                <!-- 옵션5 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <h4>친구 할인</h4>         
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="#">
                                <p>12개월 특가 할인</p>
                                <p>65% 888,000원</p>
                                <h3>57,720원</h3>
                                <button onclick="#" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                </div>
                

            </div>
        </div>
        
    </section>
</c:if> 
<c:if test="${member.user_purchase != 0 }">   



    <!-- 이용권 구매 제목 -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">  
            <h2>이용권 구매</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    <!-- ##### Events Area Start ##### -->
    <section class="events-area section-padding-100">
        
    </section>
   
    
    <!-- 이용권 옵션 종류 -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">
<div class="col-12 col-lg-5">
       <div class="newsletter-area mb-100">
        <div class="section-heading text-left mb-50">
            <h4>이용권 사용 안내</h4>         
             <br>
        </div>
       <div class="newsletter-form">
        <form action="#">
         <p>이용권 안내</p>
         
         <button onclick="#" class="btn oneMusic-btn">취소하기</button>
          </form>
         </div>
       </div>
    </div>
    </div>
    </div>
    </section>
  
</c:if>

   
    <!-- -->
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>