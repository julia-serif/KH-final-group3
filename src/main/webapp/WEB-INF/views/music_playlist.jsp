<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
#newtable {
	margin-left: 30%;
}
</style>
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>One Music - Modern Music HTML5 Template</title>

<!-- Favicon -->
<link rel="icon"
	href="<%= request.getContextPath() %>/resources/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/style.css">

</head>
<body>
	<jsp:include page="/resources/include/header.jsp"></jsp:include>

	<!-- ##### Breadcumb Area Start ##### -->
	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(resources/img/bg-img/breadcumb2.jpg);">
		<div class="bradcumbContent">
			<p>PLAYLIST</p>
			<h2 class="original">${Name }</h2>
			<h5 class="input">
				<form method="post" action="<%=request.getContextPath() %>/playlist_modify.do?playlist_no=${Playlist }">
						<c:set value="${Member }" var="dto" />
						<input type="hidden" name="user_no" value="${dto.getUser_no() }">
						<div class="input-group mb-2">
  							<input type="text" class="form-control" text-align="center" value="${Name }" name="playlist_name" aria-describedby="basic-addon2">
						  	<div class="input-group-append">
						    	<input type="submit" value="submit" class="btn btn-outline-secondary" type="button">
						  	</div>
						</div>
				</form>
			</h5>
			<p style="float:right"><img class="modify" src="<%= request.getContextPath() %>/resources/img/core-img/editIcon.png"
				width="20px" alt="edit.png" data-toggle="tooltip" data-placement="bottom" title="Rename"></p>
		</div>
	</div>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Elements Area Start ##### -->
	<section class="elements-area mt-30 section-padding-100-0">
		<div class="container">
			<div class="row">
				<!-- Music Area -->
				<div align="center">
					<c:set value="${List}" var="list" />
					<c:if test="${! empty list}">
						<c:forEach items="${list}" var="list" varStatus="status">
							<table width="180%" id="newtable">
								<tr>
									<td width="20%">
									<!-- 플레이리스트 이미지로 등록하기 -->
							    	<div class="mask" style="background-color: rgba(255, 255, 255, 0.5)">
										<a href="<%=request.getContextPath()%>/music_cont.do?m_no=${list.getM_no() }">
											<img src="<%= request.getContextPath() %>/resources/img/album-img/${list.getM_image() }" width="300" height="300" />
										</a>
									</div>
									<a href="<%=request.getContextPath() %>/image_register.do?playlist_no=${Playlist }&m_no=${list.getM_no() }">
									    <div class="d-flex justify-content-center align-items-center h-100">
									    	<p class="mb-0">이미지 섬네일로 등록</p>
									    </div>
									</a>
									</td>
									<td width="50%" id="title">
									<a href="<%=request.getContextPath()%>/music_cont.do?m_no=${list.getM_no() }">
										<!-- 음원 상세페이지로 이동 -->
										<h5>&nbsp; &nbsp; ${list.getM_name() }</h5><p>&nbsp;&nbsp;&nbsp; ${list.getM_artist() } </p>
									</a>
									</td>
									<td width="30%">
									<a href="<%=request.getContextPath()%>/video.do?no=${list.getM_no() }">
										<!-- 뮤비 페이지로 이동 -->
										<img src="<%= request.getContextPath() %>/resources/img/core-img/playMV.png" width="40" height="40" />
									</a>&nbsp;&nbsp;&nbsp;
										<!-- 플레이 리스트에서 삭제하기 -->
										<img src="<%= request.getContextPath() %>/resources/img/core-img/delete.png" width="40" height="40" 
										onclick="if(confirm('플레이리스트에서 제거하시겠습니까?')) {
	               							location.href='delete_musiclist.do?playlist_no=${Playlist }&m_order=${status.count }'
	               							} else { return; }"/>
	               							<br>
	               							
										<!-- 위로 이동 -->
										<c:if test="${status.first eq false}">
											<a href="<%=request.getContextPath() %>/order_musiclist.do?playlist_no=${Playlist }&prev=${status.count - 1 }&next=${status.count }">
												<img src="<%= request.getContextPath() %>/resources/img/core-img/ArrowUp.png" width="40" height="40" />
											</a>&nbsp;&nbsp;&nbsp;
										</c:if>
										
										<!-- 아래로 이동 -->
										<c:if test="${status.last eq false}">
											<a href="<%=request.getContextPath() %>/order_musiclist.do?playlist_no=${Playlist }&prev=${status.count }&next=${status.count + 1 }">
												<img src="<%= request.getContextPath() %>/resources/img/core-img/ArrowDown.png" width="40" height="40" />
											</a>&nbsp;&nbsp;&nbsp;
										</c:if>
									</td>
								</tr>
							</table>
							<br>
							<br>
							<br>
						</c:forEach>
					</c:if>
				</div>
				<!-- 새 음원 Area end-->
			</div>
		</div>
	</section>
	<!-- ***** Elements Area End ***** -->
	
	<section>
		<div class="one-music-songs-area mt-70 mb-70">
			<div class="load-more-btn text-center">
		        <a href="<%=request.getContextPath() %>/mymusic.do" class="btn oneMusic-btn">뒤로 가기<i class="icon-return"></i></a>
		    </div>
	    </div>
	</section>

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
<script type="text/javascript">
$(function(){
	$('.input').hide();
	$(".modify").on("click", function(){
		$(".original").toggle(100, function(){
			
		})
		$(".input").toggle(100, function(){
			
		})
	});
});
</script>
</html>
