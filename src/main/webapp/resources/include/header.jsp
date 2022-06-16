<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style type="text/css">
.select{
	width: 50%;
 	margin-left: 70%;
	
}
#key{
	width:25%;
	background-color: rgba(255,255,255,0.5);
}
#search_submit{
	background-color: rgba(255,255,255,0);
	color: white;
	border: 0px;
}

</style>
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
                                    <li><a href="<%= request.getContextPath() %>/about.do">Top100</a></li> <!-- top100 -->
                                    <li><a href="<%= request.getContextPath() %>/about.do">New</a></li> <!-- 새 음악 -->
                                    <li><a href="<%= request.getContextPath() %>/about.do">Event</a></li> <!-- 이벤트 -->
				    <li><a href="<%= request.getContextPath() %>/about.do">Notice</a></li> <!-- 공지 -->
                                    <li><a href="<%= request.getContextPath() %>/service.do">MyMusic</a></li> <!-- 내 음악 -->
                                    <li><a href="<%= request.getContextPath() %>/news.do">Other</a></li> <!-- 전체메뉴 -->
                                    <li><a href="#"></a></li> 
                                    <li><a href="#"></a></li> 
                                    <li><a href="#"></a></li> 
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
		<div class="select">
			<form method="post" action="<%= request.getContextPath() %>/search.do">
           		<fieldset>
           			<!-- <legend>검색</legend> -->
           			<input type="hidden" name="field" value="All">
           			<input type="search" name="keyword" autocomplete="off" id="key">
           			&nbsp;&nbsp;
           			<input type="submit" value="검색" id="search_submit">
           		</fieldset>
           	</form>
    	</div>
    </header>
    <!-- ##### Header Area End ##### -->
</body>
</html>
