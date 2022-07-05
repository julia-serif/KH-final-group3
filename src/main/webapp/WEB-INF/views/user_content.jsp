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
            <h2>회원 정보</h2>
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
                        

       <!-- 회원 상세 페이지 -->
       <div align="center">
       <c:set var="dto" value="${Cont }" />                                    
        <h2> ${dto.getUser_name() }님 상세 내역</h2>
        
	   <br>
 
	   	  <input type="hidden" name="user_no" value="${dto.user_no }">
	   	  <input type="hidden" name="db_pwd" value="${dto.user_pwd }">
	      <table class="table table-striped table-bordered">
	         <tr>
	            <th>회원 아이디</th>
	            <td> ${dto.getUser_id() } </td>
	         </tr>

	         <tr>
	            <th>회원 이름</th>
	            <td> ${dto.getUser_name() }</td>
	         </tr>
	         
	         <tr>
	            <th>회원 비밀번호</th>
	            <td> 
	                <c:if test="${!empty dto.getUser_pwd() }">
	               <c:forEach begin="1" end="${dto.getUser_pwd().length() }">
	                    *
	               </c:forEach>
	            </c:if>
	                </td>
	         </tr>
	         
	         <tr>
	            <th>회원 성별</th>
	            <td> ${dto.getUser_gender() } </td>
	         </tr>
	         
	         <tr>
	            <th>회원 이메일</th>
	            <td> ${dto.getUser_email() }</td>
	         </tr>
	         
	         <tr>
	            <th>회원 연락처</th>
	            <td> ${dto.getUser_phone() }</td>
	         </tr>
	         
	         <c:if test="${dto.user_purchase == false }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> 이용권 없음</td>
	         </tr>
             </c:if>
             
             <c:if test="${dto.user_purchase == true }">
	         <tr>
	            <th>이용권 소유</th>
	            <td> 이용권 소유</td>
	         </tr>
             </c:if>
             
             
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="button" value="정보 수정" class="btn btn-success"
	               onclick="location.href='user_modify.do?user_no=${dto.getUser_no()}'">
	               &nbsp;&nbsp;&nbsp;
	               <input type="button" value="회원 탈퇴" class="btn btn-danger"
	               onclick="if(confirm('회원을 탈퇴 처리하시겠습니까?')) {
	               				location.href='user_delete.do?user_no=${dto.getUser_no()}'
	               			}else { return; }">
	            </td>
	         </tr>
	      </table>
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