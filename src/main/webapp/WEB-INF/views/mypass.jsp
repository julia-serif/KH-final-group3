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

    <!-- 제목 구역 -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>이용권</p>
            <h2>My Pass</h2>
        </div>
    </section>
   <!-- 제목 구역 끝-->

    <!-- 옵션  -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-9">
                  <c:set var="dto" value="${member }" />  
                <c:if test="${member.user_purchase == 0 }">                                    



  
    
   
    
    <!-- 이용권 옵션 종류 -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">

                <!-- 옵션 1 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <p>스마트 음악 감상1</p>          
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="mypay.do">
                                <p>첫달 100원</p>
                                <p>98% <del>7,400원</del></p>
                                <h3>100원</h3>
                                <button onclick="mypay.do" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- 옵션2 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <p>스마트 음악 감상2</p>          
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="mypay2.do">
                                <p>6개월 특가 할인</p>
                                <p>34% <del>7,400원</del></p>
                                <h3>4,900원</h3>
                                <button onclick="mypay2.do" class="btn oneMusic-btn">구독하기</button>
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
                            <form action="mypay3.do">
                                <p align="center">6개월 특가 할인</p>
                                <p align="center">34% <del>7,400원</del></p>
                                <h3 align="center">4,900원</h3>
                                <button onclick="mypay3.do" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                    
                     <h3>인기 상품</h3>
                </div>
                
               
                
                <!-- 옵션4 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <h4>음악 감상3</h4>         
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="mypay4.do">
                                <p>3개월 특가 할인</p>
                                <p>50% <del>22,200원</del></p>
                                <h3>11,100원</h3>
                                <button onclick="mypay4.do" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                </div>
                
                <!-- 옵션5 -->
                <div class="col-12 col-lg-5">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <h4>음악 감상4</h4>         
                            <br>
                        </div>
                        <div class="newsletter-form">
                            <form action="mypay5.do">
                                <p>12개월 특가 할인</p>
                                <p>65% <del>888,000원</del></p>
                                <h3>57,720원</h3>
                                <button onclick="mypay5.do" class="btn oneMusic-btn">구독하기</button>
                            </form>
                        </div>
                    </div>
                </div>
                

            </div>
        </div>        
    </section>
</c:if> 
<c:if test="${member.user_purchase != 0 }">   
 
    <!-- 이용권 옵션 종류 -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
<div class="col-12 col-lg-10">
       <div class="newsletter-area mb-100">
        <div class="section-heading text-left mb-50">
            <h4>이용권 사용 안내</h4>   
            <c:if test="${member.user_purchase == 1 }">
            <b>스마트 음악 감상1</b>
            <p>모바일 잔여곡수 무제한 PC 잔여곡수 무제한</p>
            <p>음악 감상 : 무제한</p>

            </c:if>
            <c:if test="${member.user_purchase == 2 }">
            <b>스마트 음악 감상2</b>
            <p>모바일 잔여곡수 무제한 PC 잔여곡수 무제한</p>
            <p>음악 감상 : 무제한</p>
            </c:if> 
            
            <c:if test="${member.user_purchase == 3 }">
            <b>가족할인</b>
            <p>모바일 잔여곡수 무제한 PC 잔여곡수 무제한</p>
            <p>음악 감상 : 무제한   최대 공유 4인</p>
            </c:if>   
            
            <c:if test="${member.user_purchase == 4 }">
            <b> 음악 감상1</b>
            <p>모바일 잔여곡수 무제한 PC 잔여곡수 무제한</p>
            <p>음악 감상 : 무제한</p>

            </c:if>  
            
            <c:if test="${member.user_purchase == 5 }">
            <b>음악 감상2</b>
            <p>모바일 잔여곡수 무제한 PC 잔여곡수 무제한</p>
            <p>음악 감상 : 무제한</p>

            </c:if>
             <br>
        </div>
       <div class="newsletter-form">
        
         <p></p>   
         <button onclick="if(confirm('이용권을 취소하시겠습니까?')) {
				location.href='mypass_change_Ok.do?user_no=${dto.getUser_no()}'
       			}else { return; }" class="btn oneMusic-btn">취소하기</button>
          
         </div>
       </div>
    </div>
    </div>
    </div>
    </div>
  
</c:if>

                </div>
                <!-- mypage 사이드바 -->
                <div class="col-12 col-lg-3">
                    <div class="blog-sidebar-area">

                        
                        <div class="single-widget-area mb-30">
                            <div class="widget-title">
                                <h5>MyPage</h5>
                            </div>
                            <div class="widget-content">
                                <ul>
                                    <li><a href="mypage.do">회원 정보 수정</a></li>
                                    <li><a href="#">회원 탈퇴</a></li>
                                    <li><a href="mypass.do">내 이용권 </a></li>
                                    <li><a href="#">이벤트 확인</a></li>
                                </ul>
                            </div>
                        </div>

                       
                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <a href="#"><img src="resources/img/bg-img/add.gif" alt=""></a>
                        </div>

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <a href="#"><img src="resources/img/bg-img/add2.gif" alt=""></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Blog Area End ##### -->

    <jsp:include page="/resources/include/footer.jsp"></jsp:include>

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="<%= request.getContextPath() %>/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="<%= request.getContextPath() %>/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="<%= request.getContextPath() %>/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="<%= request.getContextPath() %>/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="<%= request.getContextPath() %>/resources/js/active.js"></script>
</body>

</html>