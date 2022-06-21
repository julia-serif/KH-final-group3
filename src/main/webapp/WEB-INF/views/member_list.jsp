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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">  
            <h2>회원 관리</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100-0" >
        <div class="container">
            <div class="row">

                <div class="col-12 col-lg-3" >
                    <div class="contact-content mb-100" >
                        <!-- Title -->
                        <table border="1" cellspacing="0" width="400">
       <tr>
         <th>사원 번호</th>
         <th>사원 이름</th>
         <th>담당 업무</th>
         <th>가입일</th>
       </tr>
       
       <c:set var="list" value="${List }"/>
       <c:if test="${!empty list }">
          <c:forEach items="${list }" var="dto">
            <tr>
              <td>${dto.getUser_no() }</td>
              <td>
               <a href="<%=request.getContextPath()%>/user_content.do?user_no=${dto.getUser_no()}">
              ${dto.getUser_id() }</a></td>
              <td>${dto.getUser_name() }</td>
              <td>${dto.getUser_date().substring(0,10) }</td>            
            </tr>  
          </c:forEach>
       </c:if>
     
     <c:if test="${empty list }">
        <tr>
          <td colspan="4" align="center">
           <h3>검색된 사원이 없습니다.</h3>
          </td>
        </tr>
      </c:if>
      
       <tr>
        <td colspan="4" align="right">
            <input type="button" value="회원등록"
                    onclick="location.href='user_insert.do'"> 
        </td>      
      </tr>
     </table>
     <br>
                        

                    </div>
                </div>

                <div class="col-12 col-lg-9">
                    <!-- ##### Google Maps ##### -->
                    
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>