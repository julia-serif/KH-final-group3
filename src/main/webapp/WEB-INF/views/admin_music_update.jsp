<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOUND ONE</title>
<style type="text/css">
#addTable{
	border: 1px;
	border-color: rgba(89,89,89,0.5);
}

</style>
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
 
  <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb2.jpg);">
        <div class="bradcumbContent">
            <p>ONE SOUND 음원 수정</p>
            <h2>UPDATE MUSIC</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

  	<br><br><br><br>
   
            <!--음원 추가 Area start -->
            
  				<div align="center" id="musicADD">
  				<c:set value="${cont}" var="music"/>
  					<form method="post"  enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin_music_update_ok.do">
  						<input type="hidden" name="m_no" value="${music.m_no}">
  						<table  id="addTable" border="1">
  							<tr>
  								<td align="center"> 곡 명 </td>
  								<td> <input name="m_name" value="${music.m_name}" autofocus="autofocus" required="required"></td>
  							</tr>
  							<tr>
  								<td align="center"> 곡 소개 </td>
  								<td> <input name="m_cont" value="${music.m_cont}"></td>
  							</tr>
  							<tr>
  								<td align="center"> 앨범 명 </td>
  								<td> <input name="m_album" value="${music.m_album}" required="required"></td>
  							</tr>
  							<tr>
  								<td align="center"> 아티스트 </td>
  								<td> <input name="m_artist" value="${music.m_artist}" required="required"></td>
  							</tr>
  							<tr>
  								<td align="center"> 뮤직비디오 링크 </td>
  								<td> <input name="m_mv" value="${music.m_mv}"></td>
  							</tr>
  							<tr>
  								<td align="center"> 곡 가사 </td>
  								<td> 
  									<textarea rows="20" cols="50" style="overflow-y:scroll; " name="m_lyrics">${music.m_lyrics}
  									</textarea>
  								</td>
  							</tr>
  							<tr>
  								<td colspan="2" align="right">
  									<input type="submit" value="음원 수정">
  								</td>
  							</tr>
                        </table>
                   </form>
  				</div>
  				<!-- 음원 Area end-->
  					
           
  
    <br><br><br>

 
                
                
                <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>
