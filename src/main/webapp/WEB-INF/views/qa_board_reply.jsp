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
        <h2> 답변글</h2>
        
	   <br>
 
	   	  <input type="hidden" name="qa_no" value="${dto.qa_no }">
	   	  <form method="post" 
          action="<%=request.getContextPath()%>/qa_notice_write_ok.do">
	      <table class="table table-striped table-bordered">
         <c:set var="dto" value="${content2 }" />
	      <tr>
	         <th>글 제목</th>
	         <td> <input name="qa_title" value="[RE] ▶ ${dto.getQa_title() }" ></td>
	      </tr>
	     
	     <c:set var="dto" value="${member }" />
	      <tr>
	         <th>작성자</th>
	         <td> <input  name="qa_writer" value="${dto.user_name }" readonly ></td>
	      </tr>

	      
	      <tr>
           <th>비밀번호</th>
           <td> <input type="password" name="qa_pwd"> </td>
         </tr>
	      
	      
				      	
	      <tr>
           <th> 답변 내 용</th>
           <td> 
           <textarea rows="7"cols="50" name="qa_cont"></textarea>  
           </td>
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
              <input type="submit" class="btn btn-primary" value="글 등록">&nbsp;&nbsp;&nbsp;
              <input type="reset" class="btn btn-primary" value="다시작성">
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