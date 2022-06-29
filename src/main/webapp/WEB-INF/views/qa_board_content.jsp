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
       <c:set var="dto" value="${content2 }" />                                    
        <h2> 공지사항</h2>
        
	   <br>
 
	   	  <input type="hidden" name="qa_no" value="${dto.qa_no }">
	   	  <input type="hidden" name="db_pwd" value="${dto.qa_pwd }">
	      <table border="1" cellspacing="0" width="400">

	      <tr>
	         <th>글 제목</th>
	         <td> ${dto.getQa_title() } </td>
	      </tr>
	      
	      <tr>
	         <th>작성자</th>
	         <td> ${dto.getQa_writer() } </td>
	      </tr>
	      
	      <tr>
	         <th>비밀번호</th>
	         <td>
	            <c:if test="${!empty dto.getMusic_pwd() }">
	               <c:forEach begin="1" end="${dto.getMusic_pwd().length() }">
	                    *
	               </c:forEach>
	            </c:if>
	         </td>
	      </tr>
	      
	      
				      	
	      <tr>
	         <th>글 내용</th>
	         <td>
	            <textarea rows="10" cols="40" readonly>${dto.getQa_cont() }</textarea>
	         </td>
	      </tr>
	      
	      <tr>
			<c:if test="${empty dto.getQa_update() }">
				   <th>작성일자</th>
				   <td> ${dto.getQa_date().substring(0,10) } </td>
			</c:if>
				         
			<c:if test="${!empty dto.getQa_update() }">
				    <th>수정일자</th>
				    <td> ${dto.getQa_update() } </td>
			</c:if>
		</tr>
	      
	      
	      <tr>
	         <th>조회 수</th>
	         <td> ${dto.getQa_hit() } </td>
	      </tr>
	      
	     
	      
	      <c:if test="${empty dto }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3>조회된 상세 내역이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	         <td colspan="2" align="center">
	            <input type="button" value="글수정"
	               onclick="location.href='qa_modify.do?qa_no=${dto.getQa_no()}'">
	               &nbsp;
	            <input type="button" value="글삭제"
	               onclick="if(confirm('게시글을 삭제하시겠습니까?')) {
	               				location.href='qa_delete.do?qa_no=${dto.getQa_no()}'
	               				}else { return; }">
	               &nbsp;         
	            <input type="button" value="전체목록"
	               onclick="location.href='qa_list.do?'">
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