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
		style="background-image: url(img/bg-img/breadcumb2.jpg);">
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
						<c:forEach items="${list}" var="list">
							<table width="180%" id="newtable">
								<tr>
									<td width="20%">
									<a href="#">
											<!-- 음원 상세페이지로 이동 -->
											<img src="<%= request.getContextPath() %>/resources/img/album-img/${list.getM_image() }" width="300" height="300" />
									</a>
									</td>
									<td width="50%" id="title">
									<a href="#">
										<!-- 음원 상세페이지로 이동 -->
										<h5>&nbsp; &nbsp; ${list.getM_name() }</h5><p>&nbsp;&nbsp;&nbsp; ${list.getM_artist() }</p>
									</a>
									</td>
									<td width="30%"><a href="#">
										<!-- 플레이 리스트에 담기 -->
										<img src="<%= request.getContextPath() %>/resources/img/core-img/playMusic.png" width="40" height="40" />
									</a> &nbsp;&nbsp;&nbsp;
									<a href="#">
										<!-- 뮤비 페이지로 이동 -->
										<img src="<%= request.getContextPath() %>/resources/img/core-img/playMV.png" width="40" height="40" />
									</a>
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

		<br>
		<br>
		<br>

		<br>
		<br>
		<br>
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
