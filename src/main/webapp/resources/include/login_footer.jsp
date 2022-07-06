<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(resources/img/bg-img/bg-2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading white wow fadeInUp" data-wow-delay="100ms">
                        <p>See what’s new</p>
                        <h2>Get In Touch</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Contact Form Area -->
                    <div class="contact-form-area">
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group wow fadeInUp" data-wow-delay="100ms">
                                        <input type="text" class="form-control" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group wow fadeInUp" data-wow-delay="200ms">
                                        <input type="email" class="form-control" id="email" placeholder="E-mail">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group wow fadeInUp" data-wow-delay="300ms">
                                        <input type="text" class="form-control" id="subject" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group wow fadeInUp" data-wow-delay="400ms">
                                        <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="col-12 text-center wow fadeInUp" data-wow-delay="500ms">
                                    <button class="btn oneMusic-btn mt-30" type="submit">Send <i class="fa fa-angle-double-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="<%= request.getContextPath() %>/resources/img/core-img/logo.png" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>

                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <c:if test="${member.user_rank == 1 }"> 
                                <ul>
                                    <li><a href="<%= request.getContextPath() %>">Home</a></li>
                                    <li><a href="<%= request.getContextPath() %>/admin_Music.do">음원 관리</a></li> <!-- 음원 관리 -->
                                    <li><a href="<%= request.getContextPath() %>/about.do">회원 관리</a></li> <!-- 사용자 관리 -->
                                    <li><a href="<%= request.getContextPath() %>/about.do">고객센터 관리</a> <!-- 고객센터 관리 -->
                                        <ul class="dropdown">
                                         <li><a href="<%= request.getContextPath() %>/notice.do">공지 사항</a></li>
                                         <li><a href="<%= request.getContextPath() %>/about.do">Q/A 게시판</a></li>
                                         <li><a href="<%= request.getContextPath() %>/about.do">도움말</a></li>
                                       </ul>
                                    </li>
                                    <li><a href="<%= request.getContextPath() %>/service.do">이벤트 관리</a></li> <!-- 이벤트 관리 -->
                                </ul>
                             </c:if>
                             <c:if test="${member.user_rank != 1 }"> 
                                <ul>
                                    <li><a href="<%= request.getContextPath() %>">Home</a></li>
                                    <li><a href="<%= request.getContextPath() %>/top10.do">Top10</a></li> <!-- top10 -->
                                    <li><a href="<%= request.getContextPath() %>/newMusic.do">New</a></li> <!-- 새음악 -->
                                    <li><a href="<%= request.getContextPath() %>/events.do">Events</a></li> <!-- 이벤트 -->
                                    <li><a href="<%= request.getContextPath() %>/mymusic.do">MyMusic</a></li> <!-- 내 음악 -->
                                    <li><a href="<%= request.getContextPath() %>/notice_list.do">Service</a>
                                        <ul class="dropdown">
                                         <li><a href="<%= request.getContextPath() %>/notice_list.do">Notice</a></li>
                                         <li><a href="<%= request.getContextPath() %>/qanda_list.do">Q/A Boards</a></li>
                                       </ul>
                                    </li> <!-- 서비스 -->
                                    <li><a href="<%= request.getContextPath() %>/news.do">Other</a></li> <!-- 전체메뉴 -->
                                </ul>
                             </c:if>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->

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
