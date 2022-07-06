<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#musicList{
	color: rgb(89,89,89);
	background-color: white;
	font-weight: bold;
	width: 400px;
	height: 50px;
}

#musicList:hover, #musicList:focus, #musicList:active{
	color: rgb(89,89,89);
	background-color: white;
	font-weight: bold;
	font-size: 1.2em;
	width: 400px;
	height: 60px;
} 

#artistList{
	background-color: rgb(89,89,89);
	color: white;
	font-weight: bold;
	width: 400px;
	height: 50px;
}

#artistList:hover, #artistList:focus, #artistList:active{
	background-color: rgb(89,89,89);
	color: white;
	font-weight: bold;
	font-size: 1.2em;
	width: 400px;
	height: 60px;
	
}

#newArtistArea{
	margin-left: 65%;
}


#newArtistArea input{
	color: rgb(89,89,89);
	background-color: white;
	font-weight: bold;
	border-color:rgb(89,89,89);
	width: 120px;
	height: 30px;
}


#newArtistArea input:hover , #newArtistArea input:focus, #newArtistArea input:active {
	background-color: rgb(89,89,89);
	color: white;
	font-weight: bold;
	border-color:rgb(89,89,89);
	width: 120px;
	height: 30px;
}

#artistArea input{
	color: rgb(89,89,89);
	background-color: white;
	border: 0px;
	font-weight: bold;
	font-size: 1.2em;
}

#artistArea input:hover , #artistArea input:focus, #artistArea input:active {
	background-color: rgb(89,89,89);
	color: white;
	border: 0px;
	font-weight: bold;
	font-size: 1.2em;
}

</style>
<script type="text/javascript">

function deleteArtist() {
	
	let no = $("#m_no").val();
	
	 if(confirm("정말로 삭제하겠습니까")==true){
	         location.href="admin_delete_artist.do?no="+no;
	      }
	       
	}

</script>
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
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb2.jpg);">
        <div class="bradcumbContent">
            <p>ONE SOUND의 아티스트 관리</p>
            <h2>All ARTIST</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

<br><br><br>
            <!-- 음원/아티스트 이동 바 start -->
            <div align="center">
            	<input type="button" value="음원 목록" id="musicList" onclick="location.href='admin_Music.do'">
            	<input type="button" value="아티스트 목록" id="artistList">
            </div>
            <!-- 음원/아티스트 이동 바 end -->
            
            <br>
            
            <!-- 새음원 추가  Area start -->
            <div id="newArtistArea">
            	<input type="button" value="아티스트 추가 >>" onclick="location.href='admin_insert_artist.do'"> 
            </div>
            <!-- 새 음원 추가 Area end -->
            
            <br><br>
                
                <!-- 음원 Area start -->
  				<div align="center" id="artistArea">
  				<c:set value="${list}" var="list"/>
  				
  				<c:if test="${! empty list}">
  					<c:forEach items="${list}" var="top">
  					<input type="hidden" value="${top.m_artist_no}" id="m_no">
  						
  						<table width="45%" id="newtable">
  							<tr>
 
  								<td width="7%" >
  									<a href="#">
  									<!-- 음원 상세페이지로 이동 -->
  										<img src="<%= request.getContextPath() %>/resources/img/artist-img/${top.m_artist_img}" width="300" height="300" />
                          			</a>
                            	</td>
                            	<td width="20%" id="title">
                              		     <a href="#">
                              		     <!-- 음원 상세페이지로 이동 -->
                              		     	 <h4> &nbsp; &nbsp; ${top.m_artist}</h4>
                            	 </td>
                            	 <td width="18%" align="right">
                            	  <a href="#">
                    
                               	 &nbsp; &nbsp; &nbsp;
                               	 <!-- 수정 페이지로 이동 -->
                               	 	<input type="button" value="수정" onclick="location.href='admin_artist_update.do?no=${top.m_artist_no}'">
                               	 
                            	&nbsp; || &nbsp;
                            	 <!-- 삭제 페이지로 이동 -->
                            	 	<input type="button" value="삭제" onclick="deleteArtist()">
                            	 	
                            	 
                            	 </td>
                             </tr>  
                           </table>
                            
  						<br><br><br>
  					</c:forEach>
  					
  				</c:if> 
  				</div>
  				<!-- 음원 Area end-->
  				
 
  
    <br><br><br>
    <!-- 페이징 Area start -->
    <div align="center">
  				<c:set value="${pageDTO}" var="paging"/>
  				
  				<!-- 1페이지 이후 페이지 -->
  				<c:if test="${paging.page > paging.startBlock}">
  					<a href="admin_Music?page=1">◀◀</a>
  					<a href="admin_Music.do?page=${paging.page - 1 }">◀</a>
  				</c:if>
  				
  				<!-- 페이지 위치 출력 -->
  				<c:forEach begin="${paging.startBlock}" end="${paging.endBlock }" var="i">
  					<c:if test="${paging.page == i }">
  						<a href="admin_Music.do?page=${i}"><b>[${i}]</b></a>
  					</c:if>
  					<c:if test="${paging.page != i }">
  						<a href="admin_Music.do?page=${i}">[${i}]</a>
  					</c:if>
  				</c:forEach>
  				
  				<!-- 마지막 블럭 -->
  				<c:if test="${paging.endBlock < paging.totalBlock }">
  					<a href="admin_Music.do?page=${paging.page + 1 }">▶</a>
  					<a href="admin_Music.do?page=${paging.totalBlock }">▶▶</a>
  				
  				</c:if>
  		</div>		
  		<!-- 페이징 Area end -->
  				
  		<br><br><br>
  		 </section>
    <!-- ***** Elements Area End ***** -->
                
                
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
