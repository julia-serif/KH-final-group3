<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#newtable{
	margin-left: 30%;
}


</style>
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
 
  <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb2.jpg);">
        <div class="bradcumbContent">
            <p>새로운 노래의 시작</p>
            <h2>NEW MUSIC</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Elements Area Start ##### -->
    <section class="elements-area mt-30 section-padding-100-0">
        <div class="container">
            <div class="row">

               
               

                <!-- ========== Loaders ========== -->
                 <div class="col-12">
                    <div class="elements-title mb-70">
                        <h2>Loaders</h2>
                    </div>
                </div>

                <div class="col-12">
                    <!-- Loaders Area Start -->
                    <div class="our-skills-area">
                        <div class="row">

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle" class="circle" data-value="0.75">
                                        <div class="skills-text">
                                            <span>75%</span>
                                            <p>Good Music</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle2" class="circle" data-value="0.83">
                                        <div class="skills-text">
                                            <span>83%</span>
                                            <p>Amazing Artists</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle3" class="circle" data-value="0.25">
                                        <div class="skills-text">
                                            <span>25%</span>
                                            <p>Concerts</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle4" class="circle" data-value="0.95">
                                        <div class="skills-text">
                                            <span>95%</span>
                                            <p>Superstars</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                
                <!-- 새음원 Area -->
  				<div align="center">
  				<c:set value="${list}" var="list"/>
  				
  				<c:if test="${! empty list}">
  					<c:forEach items="${list}" var="top">
  						
  						<table width="180%" id="newtable">
  							<tr>
 
  								<td width="20%" >
  									<a href="#">
  									<!-- 음원 상세페이지로 이동 -->
  										<img src="<%= request.getContextPath() %>/resources/img/album-img/${top.m_image}" width="300" height="300" />
                          			</a>
                            	</td>
                            	<td width="50%" id="title">
                              		     <a href="#">
                              		     <!-- 음원 상세페이지로 이동 -->
                              		     	 <h5> &nbsp; &nbsp; ${top.m_name}</h5>
                             		   		<p> &nbsp;&nbsp;&nbsp; ${top.m_artist}</p>
                             		   	</a>
                            	 </td>
                            	 <td width="30%">
                            	  <a href="#">
                            	  <!-- 플레이 리스트에 담기 -->
                             	 	  <img src="<%= request.getContextPath() %>/resources/img/core-img/playMusic.png" width="40" height="40" />
                             	   </a>
                             	   &nbsp; &nbsp; &nbsp;
                               	  <a href="#">
                                 <!-- 뮤비 페이지로 이동 -->
                               		 <img src="<%= request.getContextPath() %>/resources/img/core-img/playMV.png" width="40" height="40" />
                               	 </a>
                            	 
                            	 </td>
                             </tr>  
                           </table>
                            
  						<br><br><br>
  					</c:forEach>
  					
  				</c:if> 
  				</div>
  				<!-- 새 음원 Area end-->
            </div>
        </div>
    </section>
    <br><br><br>
    <!-- ***** Elements Area End ***** -->
                
                
                <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>