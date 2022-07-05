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
    
    <!-- Stylesheet2 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   
</head>

<body>
    <jsp:include page="/resources/include/header.jsp"></jsp:include>

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <h2>MyPage</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-9">

    <!-- Single Post Start -->
      <div >
      <!-- Post Thumb -->
                        

       <!-- 정보 수정 페이지 -->
       <div >
       <c:set var="dto2" value="${Cont }" />                                    
        <h2 align="center"> ${dto2.getUser_name() }님 정보 수정</h2>
        
	   <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/user_modify_ok.do">
	   
	   	  <input type="hidden" name="user_no" value="${dto2.user_no }">
	   	  <input type="hidden" name="db_pwd" value="${dto2.user_pwd }">
	      <table class="table table-striped table-bordered" >
	         <tr>
	            <th>회원 아이디</th>
	            <td> <input name="user_id"
	            				value="${dto2.user_id }" readonly> </td>
	         </tr>
	        <tr>
	            <th>회원 비밀번호</th>
	            <td> <input type="password" name="user_pwd"> </td>
	         </tr>
	         
	         <tr>
	            <th>회원 이름</th>
	            <td> <input name="user_name"
	            				value="${dto2.user_name }" readonly> </td>
	         </tr>
	         
	         <tr>
	            <th>회원 성별</th>
	            <td> <input name="user_gender"
	            				value="${dto2.user_gender }" readonly> </td>
	         </tr>
	         
	         <tr>
	            <th>회원 이메일</th>
	            <td> 
	               <input name="user_email"
	            				value="${dto2.user_email }">
	            </td>
	         </tr>
	         
	         <tr>
	            <th>회원 연락처</th>
	            <td> <input name="user_phone"
	            				value="${dto2.user_phone }"> </td>
	         </tr>
	         
	         <c:if test="${dto2.user_purchase_no == 0 }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> <input name="user_purchase_no"
	            				value="이용권 없음" readonly> </td>
	         </tr>
	         </c:if>

	         <c:if test="${dto2.user_purchase_no == 1 }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> <input name="user_purchase"
	            				value="스마트 음악 감상1"> </td>
	         </tr>
	         </c:if>
	         
	         <c:if test="${dto2.user_purchase_no == 2 }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> <input name="user_purchase"
	            				value="스마트 음악 감상2"> </td>
	         </tr>
	         </c:if>
	         
	         <c:if test="${dto2.user_purchase_no == 3 }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> <input name="user_purchase"
	            				value="가족 할인"> </td>
	         </tr>
	         </c:if>
	         
	         <c:if test="${dto2.user_purchase_no == 4 }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> <input name="user_purchase"
	            				value="음악 감상1"> </td>
	         </tr>
	         </c:if>
	         
	         <c:if test="${dto2.user_purchase_no == 5 }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> <input name="user_purchase"
	            				value="음악 감상2"> </td>
	         </tr>
	         </c:if>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input class="btn btn-primary" type="submit" value="정보 수정">&nbsp;&nbsp;&nbsp;
	               <input class="btn btn-primary" type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	   </form>
	</div>
                        </div>
                    </div>
                <!-- 마이페이지 사이드바 -->
                <div class="col-12 col-lg-3">
                    <div class="blog-sidebar-area">

                       
                        <div class="single-widget-area mb-30">
                            <div class="widget-title">
                                <h5>MyPage</h5>
                            </div>
                            <div class="widget-content">
                                <ul>
                                    <li><a href="mypage.do?user_no=${dto2.getUser_no()}">회원 정보 수정</a></li>
                                    <li><a href="user_delete.do?user_no=${dto2.getUser_no()}" 
                                           onclick="return confirm('정말로 삭제하시겠습니까?');"
                                                    >회원 탈퇴</a></li>
                                    <li><a href="mypass.do?user_no=${dto2.getUser_no()}">내 이용권 </a></li>
                                    <li><a href="events.do">이벤트 확인</a></li>
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