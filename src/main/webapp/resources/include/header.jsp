<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#logoutBtn{
	background-color: rgba(255, 255, 255, 0);
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
                                <c:if test="${member.user_rank == 1 }"> 
                                <ul>
                                    <li><a href="<%= request.getContextPath() %>">Home</a></li>
                                    <li><a href="<%= request.getContextPath() %>/admin_Music.do">?????? ??????</a> <!-- ?????? ?????? -->
					<ul class="dropdown">
                                         <li><a href="<%= request.getContextPath() %>/admin_Music.do">??????</a></li>
                                         <li><a href="<%= request.getContextPath() %>/admin_artist.do">????????????</a></li>
                                       </ul>
					</li>
                                    <li><a href="<%= request.getContextPath() %>/member.do">?????? ??????</a></li> <!-- ????????? ?????? -->
                                    <li><a href="<%= request.getContextPath() %>/notice_list.do">???????????? ??????</a> <!-- ???????????? ?????? -->
                                        <ul class="dropdown">
                                         <li><a href="<%= request.getContextPath() %>/notice_list.do">?????? ??????</a></li>
                                         <li><a href="<%= request.getContextPath() %>/qanda_list.do">Q/A ?????????</a></li>
                                       </ul>
                                    </li>
                                    <li><a href="<%= request.getContextPath() %>/events.do">????????? ??????</a></li> <!-- ????????? ?????? -->
                                </ul>
                             </c:if>
                             <c:if test="${member.user_rank != 1 }"> 
                                <ul>
                                    <li><a href="<%= request.getContextPath() %>">Home</a></li>
                                    <li><a href="<%= request.getContextPath() %>/top10.do">Top10</a></li> <!-- top10 -->
                                    <li><a href="<%= request.getContextPath() %>/newMusic.do">New</a></li> <!-- ????????? -->
                                    <li><a href="<%= request.getContextPath() %>/events.do">Events</a></li> <!-- ????????? -->
                                    <li><a href="<%= request.getContextPath() %>/mymusic.do">MyMusic</a></li> <!-- ??? ?????? -->
                                    <li><a href="<%= request.getContextPath() %>/notice_list.do">Service</a>
                                        <ul class="dropdown">
                                         <li><a href="<%= request.getContextPath() %>/notice_list.do">Notice</a></li>
                                         <li><a href="<%= request.getContextPath() %>/qanda_list.do">Q/A Boards</a></li>
                                       </ul>
                                    </li> <!-- ????????? -->
                                </ul>
                             </c:if>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <c:set var="dto" value="${member }" />  
                                        <c:if test="${member.user_name != null }">                                    
                                        <a href="<%= request.getContextPath() %>/mypage.do?user_no=${dto.getUser_no() }" id="loginBtn"> ${dto.getUser_name() }??? ???????????????</a>&nbsp;&nbsp;&nbsp;
	      							    <a href="<%= request.getContextPath() %>/logout.do" id="logoutBtn">????????????</a>
                                        </c:if>
                                        <c:if test="${member.user_name == null }">                                    
                                        <a href="<%= request.getContextPath() %>/login.do" id="loginBtn">Login / Register</a>
                                        </c:if>
                                        
                                    </div>

                                    <!-- Cart Button -->
                                    <%-- <c:if test="${member.user_name != null && member.user_rank != 1 }">   
	                                    <div class="cart-btn">
	                                        <a href="<%=request.getContextPath() %>/mymusic.do"><p><span class="icon-music"></span></p></a>
	                                    </div>
	                                </c:if> --%>
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
           			<!-- <legend>??????</legend> -->
           			<input type="hidden" name="field" value="All">
           			<input type="search" name="keyword" autocomplete="off" id="key">
           			&nbsp;&nbsp;
           			<input type="submit" value="??????" id="search_submit">
           		</fieldset>
           	</form>
    	</div>
    </header>
    <!-- ##### Header Area End ##### -->
</body>
</html>
