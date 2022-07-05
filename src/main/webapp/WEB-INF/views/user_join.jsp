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
                        

       <!-- 회원 상세 페이지 -->
       <div align="center">
      
         <h3>회원 가입 페이지</h3>
      
      <br>
      
      <form method="post" 
          action="<%=request.getContextPath()%>/user_insert_ok.do">
           
           <table border="1" cellspacing="0" width="350">
         <tr>
           <th>회원아이디</th>
           <td><input name="user_id"></td>
         </tr>

         <tr>
           <th>회원 이름</th>
           <td> <input name="user_name"> </td>
         </tr>
         
         <tr>
           <th>회원 비밀번호</th>
           <td> <input type="password" name="user_pwd"> </td>
         </tr>
         
         <tr>
           <th>회원 성별</th>
           
           <td> 
           <input  type="radio" name="user_gender" value="남성">남성 &nbsp;&nbsp;&nbsp;
           <input  type="radio" name="user_gender" value="여성">여성 &nbsp;&nbsp;&nbsp;
            </td>
         </tr>
         
         <tr>
           <th>회원 이메일</th>
           <td> <input name="user_email"> </td>
         </tr>
         
         <tr>
           <th>회원 연락처</th>
           <td> <input name="user_phone"> </td>
         </tr>
  
         <tr>
            <td colspan="3" align="center">
              <input type="submit" value="회원등록">&nbsp;&nbsp;&nbsp;
              <input type="reset" value="다시작성">
             </td>
         </tr>
       </table>
     </form>
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