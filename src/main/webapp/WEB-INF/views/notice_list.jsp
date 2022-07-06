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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">  
            <h2>공지사항 관리</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100-0" >
        <div class="container">
            <div align="center">

                <div class="col-12 col-lg-9" >
                    <div class="contact-content mb-100" >
                        <!-- Title -->
                        <table class="table table-hover" >
       <thead>
       <tr>
         <th>게시판 No.</th>
         <th>글 제목</th>
         <th>작성자</th>
         <th>조회수</th>
         <th>작성일자</th>
       </tr>
      </thead>
       
       <c:set var="list" value="${List }"/>    
       <c:if test="${!empty list }">
          <c:forEach items="${list }" var="dto">
          <tbody>
            <tr>
              <td>${dto.getMusic_no() }</td>
              <td>
               <a href="<%=request.getContextPath()%>/notice_content.do?music_no=${dto.getMusic_no()}">
              ${dto.getMusic_title() }</a></td>
              <td>${dto.getMusic_writer() }</td>
              <td>${dto.getMusic_hit() }</td>
              <td>${dto.getMusic_date().substring(0,10) }</td>            
            </tr>  
           </tbody>
          </c:forEach>
       </c:if>
     
     <c:if test="${empty list }">
        <tr>
          <td colspan="5" align="center">
           <h3>검색된 공지사항이 없습니다.</h3>
          </td>
        </tr>
      </c:if>
      
       <tr>
        <td colspan="5" align="right">
            <input type="button" value="글쓰기" class="btn btn-info float-right"
                    onclick="location.href='notice_write.do'" > 
        </td>      
      </tr>
     </table>
     <br>
     
	   
                    </div>
                </div>

                

            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>