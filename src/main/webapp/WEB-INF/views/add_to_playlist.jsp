<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="UTF-8">
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
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<c:set var="dto" value="${cont }" />
			<p>${dto.getM_artist() }의 ${dto.getM_name() } 곡을</p>
			<h2>플레이리스트에 넣기</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->

	<section>
		<!-- Single -->
		<div class="one-music-songs-area mt-70 mb-70">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					<!-- Content -->
					<c:forEach items="${List }" var="playlist">
						<form method="post" action="<%=request.getContextPath() %>/add_to_playlist_ok.do">
							<input type="hidden" name="m_no" value="${dto.getM_no() }">
							<input type="hidden" name="user_no" value="${playlist.getUser_no() }">
							<input type="hidden" name="playlist_no" value="${playlist.getPlaylist_no() }">
							<input type="hidden" name="playlist_thumbnail" value="${playlist.getPlaylist_thumbnail() }">
							<input type="hidden" name="playlist_name" value="${playlist.getPlaylist_name() }">
							<div class="post-meta d-flex d-flex-row-reverse mb-30 wow fadeInUp" data-wow-delay="100ms">
	                          	<c:if test="${playlist.getPlaylist_thumbnail() != null }">
	                        		<img src="<%= request.getContextPath() %>/resources/img/album-img/${playlist.getPlaylist_thumbnail() }" alt="${playlist.getPlaylist_thumbnail() } 앨범 재킷" height="100px" width="100px">
	                        	</c:if>
	                        	<c:if test="${playlist.getPlaylist_thumbnail() == null }">
	                        		<img src="<%= request.getContextPath() %>/resources/img/album-img/PlaylistDefault.jpg" alt="PlaylistDefault.jpg" height="100px" width="100px">
	                       		</c:if>
								<c:if test="${playlist.getM_order() == 1}">
									<input type="submit" value="${playlist.getPlaylist_name() } 에 추가하기" class="btn btn-light btn-lg btn-block">
								</c:if>
								<c:if test="${playlist.getM_order() == 0}">
									<input type="submit" value="${playlist.getPlaylist_name() } 에 추가하기" class="btn btn-light btn-lg btn-block" disabled>
								</c:if>
							</div>
						</form>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section>
		<div class="one-music-songs-area mt-70 mb-70">
			<div class="load-more-btn text-center wow fadeInUp" data-wow-delay="100ms">
		        <a href="javascript:history.go(-1)" class="btn oneMusic-btn">뒤로 가기<i class="icon-return"></i></a>
		    </div>
	    </div>
	</section>
	
	<section>
	</section>

	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>