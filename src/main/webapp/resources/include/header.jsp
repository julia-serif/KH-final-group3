<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="<%= request.getContextPath() %>" class="nav-brand"><img src="resources/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="<%= request.getContextPath() %>">Home</a></li>
                                    <li><a href="<%= request.getContextPath() %>/about.do">About</a></li> <!-- 도움말 -->
                                    <li><a href="<%= request.getContextPath() %>/events.do">Events</a></li> <!-- 이벤트 -->
                                    <li><a href="<%= request.getContextPath() %>/news.do">News</a></li> <!-- 공지사항 & 뉴스 -->
                                    <li><a href="<%= request.getContextPath() %>/service.do">Service</a></li> <!-- 고객센터 -->
                                    <li><a href="<%= request.getContextPath() %>/mypage.do">MyPage</a></li> <!-- 내 페이지 -->
                                    <li><a href="<%= request.getContextPath() %>/sitemap.do">Sitemap</a></li> <!-- 사이트맵 -->
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <a href="<%= request.getContextPath() %>/login.do" id="loginBtn">Login / Register</a>
                                    </div>

                                    <!-- Cart Button -->
                                    <div class="cart-btn">
                                        <p><span class="icon-shopping-cart"></span> <span class="quantity">1</span></p>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->
</body>
</html>