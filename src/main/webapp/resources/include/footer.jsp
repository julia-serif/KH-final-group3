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
