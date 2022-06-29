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
            <h2>Q/A 관리</h2>
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
                        <table border="1" cellspacing="0" width="500">
       <tr>
         <th>게시물 번호</th>
         <th>제목</th>
         <th>아이디</th>
         <th>게시일</th>
       </tr>
       
       <c:set var="qa_list" value="${QA_List}"/>
       <c:set var="QA_Paging" value="${QA_Paging}" />
       
       <c:if test="${!empty qa_list}">
          <c:forEach items="${qa_list }" var="dto">
            <tr>
              <td>${dto.qa_no }</td>
              <td>
               <a href="<%=request.getContextPath()%>/qanda_content.do?qa_no=${dto.qa_no}&page=${QA_Paging.qa_page }">
              ${dto.qa_title }</a></td>
              <td>${dto.qa_id }</td>
              <td>${dto.qa_date.substring(0,10) }</td>            
            </tr>  
          </c:forEach>
       </c:if>
     
     <c:if test="${empty qa_list }">
        <tr>
          <td colspan="4" align="center">
           <h3>검색된 게시물이 없습니다.</h3>
          </td>
        </tr>
      </c:if>
      
       <tr>
        <td colspan="4" align="right">
            <input type="button" value="게시물 등록"
                    onclick="location.href='qa_insert.do'"> 
        </td>      
      </tr>
     </table>
     <br>
     
     <%-- 페이징 처리 부분 --%>
	   <c:if test="${QA_Paging.getQa_page() > QA_Paging.getQa_block() }">
	      <a href="QA_board_list.do?page=1">[처음으로]</a>
	      <a href="QA_board_list.do?page=${QA_Paging.getQa_startBlock() - 1 }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${QA_Paging.getQa_startBlock() }"
	          				end="${QA_Paging.getQa_endBlock() }" var="i">
	      <c:if test="${dto == QA_Paging.getPage() }">
	         <b> <a href="QA_board_list?page=${dto }">[${dto }]</a></b>
	      </c:if>
	   
	   	  <c:if test="${dto != QA_Paging.getPage() }">
	         <a href="QA_board_list?page=${dto }">[${dto }]</a>
	      </c:if>
	   </c:forEach>

	   <c:if test="${QA_Paging.getQa_endBlock() < QA_Paging.getQa_allPage() }">
	      <a href="QA_board_list.do?page=${QA_Paging.getQa_endBlock() + 1 }">▶</a>
	      <a href="QA_board_list.do?page=${QA_Paging.getQa_allPage() }">[마지막으로]</a>
	   </c:if>
	   
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/QA_board_search.do">
	   
	   	  <input type="hidden" name="page" value="${QA_Paging.getQa_page() }">
	   	  
	      <select name="field">
	         <option value="title">제목</option>
	         <option value="cont">내용</option>
	         <option value="title_cont">제목+내용</option>
	         <option value="writer">작성자</option>
	      </select>
	      
	      <input name="keyword">&nbsp;&nbsp;
	      <input type="submit" value="검색">
	   </form>
                        

                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>