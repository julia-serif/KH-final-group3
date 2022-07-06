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
<style type="text/css">
    body{
        line-height:2em;        
        font-family:"맑은 고딕";
}
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
}

    #mainWrapper{
        width: 800px;
        margin: 0 auto; /*가운데 정렬*/
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
        font-weight:bold;
        text-align:center;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
}    

    #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/

    #divPaging {
          clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;

}

    .left {
        text-align : left;
}


</style>
</head>
<body>
    <jsp:include page="/resources/include/header.jsp"></jsp:include>

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">  
            <h2>회원 관리</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100-0" >
        <div class="container">
            <div align="center" id="mainWrapper">

                <div class="col-12 col-lg-9" >
                    <div class="contact-content mb-100" >
                        <!-- Title -->
                        <table class="table">
      <thead>                 
       <tr>
         <th>회원 번호</th>
         <th>회원 아이디</th>
         <th>회원 이름</th>
         <th>가입일</th>
       </tr>
      </thead>
      
       <c:set var="list" value="${List }"/>
       <c:if test="${!empty list }">
          <c:forEach items="${list }" var="dto">
          <tbody>
            <tr>
              <td>${dto.getUser_no() }</td>
              <td>
               <a href="<%=request.getContextPath()%>/user_content.do?user_no=${dto.getUser_no()}">
              ${dto.getUser_id() }</a></td>
              <td>${dto.getUser_name() }</td>
              <td>${dto.getUser_date().substring(0,10) }</td>            
            </tr>
           </tbody>
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
            <input type="button" value="회원등록" class="btn btn-info float-right"
                    onclick="location.href='member_insert.do'"> 
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