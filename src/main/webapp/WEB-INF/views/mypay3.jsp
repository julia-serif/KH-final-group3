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

            <!-- 이용권 옵션 2 설명 -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
      <div class="col-12 col-lg-10">
       <div class="newsletter-area mb-100">
        <div class="section-heading text-left mb-50">
            <h4>가족 이용권</h4>         
             <br>
        </div>
       <div class="newsletter-form">
        <form action="#">
         <p></p>
         <button onclick="#" class="btn oneMusic-btn">결제하기</button>
         &nbsp;&nbsp;&nbsp;&nbsp;
         <button onclick="mypass.do" class="btn oneMusic-btn">취소하기</button>
          </form>
         </div>
       </div>
    </div>
    </div>
    </div>
    </div>
  


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