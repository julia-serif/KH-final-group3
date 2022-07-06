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
                        <table class="table">
       <thead>
       <tr>
         <th>게시물 번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>게시일</th>
       </tr>
       </thead>
       
       <c:set var="QA_list" value="${qa_searchPageList}"/>
       <c:if test="${!empty QA_list}">
          <c:forEach items="${QA_list }" var="dto">
          <tbody>
            <tr>
              <td>${dto.qa_no }</td>
              <td>
               <a href="<%=request.getContextPath()%>/qanda_content.do?qa_no=${dto.qa_no}">
              ${dto.qa_title }</a></td>
              <td>${dto.qa_writer }</td>
              <td>${dto.qa_date.substring(0,10) }</td>            
            </tr>  
           </tbody>
          </c:forEach>
       </c:if>
     
     <c:if test="${empty QA_list }">
        <tr>
          <td colspan="4" align="center">
           <h3>검색된 게시물이 없습니다.</h3>
          </td>
        </tr>
      </c:if>
     </table>
     <br>
     
     <%-- 페이징 처리 부분 --%>
       <c:set var="QA_Paging" value="${qa_Paging}" />
	   <c:if test="${QA_Paging.getQa_page() > QA_Paging.getQa_block() }">
	      <a href="QA_board_search.do?qa_page=1&qa_field=${QA_Paging.qa_field}&keyword=${QA_Paging.keyword}">◀◀</a>
	      <a href="QA_board_search.do?qa_page=${QA_Paging.getQa_startBlock() - 1 }&field=${QA_Paging.qa_field}$keyword=${QA_Paging.qa_keyword}">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${QA_Paging.getQa_startBlock() }"
	          				end="${QA_Paging.getQa_endBlock() }" var="i">
	      <c:if test="${i == QA_Paging.getQa_page() }">
	         <b> <a href="qanda_list.do?qa_page=${i }">[${i }]</a></b>
	      </c:if>
	   
	   	  <c:if test="${i != QA_Paging.getQa_page() }">
	         <a href="qanda_list.do?qa_page=${i}">[${i}]</a>
	      </c:if>
	   </c:forEach>

	   <c:if test="${QA_Paging.getQa_endBlock() < QA_Paging.getQa_allPage() }">
	      <a href="qanda_list.do?page=${QA_Paging.getQa_endBlock() + 1 }">▶</a>
	      <a href="qanda_list.do?page=${QA_Paging.getQa_allPage() }">▶▶</a>
	   </c:if>
	   
	   <br> <br>
	    
	    <input type="button" value="전체목록" class="btn btn-default pull-right"
	      onclick="location.href='qanda_list.do?'">
                        

                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>