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
	href="<%=request.getContextPath()%>/resources/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/style.css">
<style type="text/css">


#newMusic{
	width: 100%;
}

.album-thumb img{
	
	width: 80%;

}

#leadMoreBtn{
	margin-left: 13%;
}
	
</style>

</head>

<body>
	<jsp:include page="/resources/include/header.jsp"></jsp:include>

	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
		<div class="hero-slides owl-carousel">

			<!-- top1 음원 Slide -->
			<div
				class="single-hero-slide d-flex align-items-center justify-content-center">
				<c:set var="toplist" value="${topList }" />
				<c:if test="${!empty toplist }">
					<c:forEach items="${toplist }" var="top1" begin="0" end="0">
						<!-- Slide Img -->
						<div class="slide-img bg-img"
							style="background-image: url(resources/img/album-img/${top1.m_image});"></div>
						<!-- Slide Content -->
						<div class="container">
							<div class="row">
								<div class="col-12">
									<div class="hero-slides-content text-center">
										<h6 data-animation="fadeInUp" data-delay="100ms">Today
											TOP music</h6>
										<h2 data-animation="fadeInUp" data-delay="300ms">${top1.m_name}
											<span>${top1.m_name}</span>
										</h2>
										<a data-animation="fadeInUp" data-delay="500ms" href="<%=request.getContextPath()%>/music_cont.do?m_no=${top1.m_no}"
											class="btn oneMusic-btn mt-50">go music <i
											class="fa fa-angle-double-right"></i></a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<!-- 새 음원 Slide -->
			<div
				class="single-hero-slide d-flex align-items-center justify-content-center">
				<c:set var="newlist" value="${newList }" />
				<c:if test="${!empty newlist }">
					<c:forEach var="n1" items="${newlist}" begin="0" end="0">
						<!-- Slide Img -->
						<div class="slide-img bg-img"
							style="background-image: url(resources/img/album-img/${n1.m_image});"></div>
						<!-- Slide Content -->
						<div class="container">
							<div class="row">
								<div class="col-12">
									<div class="hero-slides-content text-center">
										<h6 data-animation="fadeInUp" data-delay="100ms">new
											album</h6>
										<h2 data-animation="fadeInUp" data-delay="300ms">${n1.m_name}
											<span>${n1.m_name}</span>
										</h2>
										<a data-animation="fadeInUp" data-delay="500ms" href="<%=request.getContextPath()%>/music_cont.do?m_no=${n1.m_no}"
											class="btn oneMusic-btn mt-50">go music <i
											class="fa fa-angle-double-right"></i></a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</section>
	<!-- ##### Hero Area End ##### -->

	<!-- ##### TOP100 Area Start ##### -->
	<section class="latest-albums-area section-padding-100">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading style-2">
						<p>믿고 듣는 TOP10, 많은 사람들이 선택한 음악은?</p>
						<h2>TOP 10</h2>
					</div>
				</div>
			</div>
			<!--  <div class="row justify-content-center">
                <div class="col-12 col-lg-9">
                    <div class="ablums-text text-center mb-70">
                        <p>Nam tristique ex vel magna tincidunt, ut porta nisl finibus. Vivamus eu dolor eu quam varius rutrum. Fusce nec justo id sem aliquam fringilla nec non lacus. Suspendisse eget lobortis nisi, ac cursus odio. Vivamus nibh velit, rutrum at ipsum ac, dignissim iaculis ante. Donec in velit non elit pulvinar pellentesque et non eros.</p>
                    </div>
                </div>
            </div> -->

            <div class="row">
                <div class="col-12">
                    <div class="albums-slideshow owl-carousel">
                    <c:set var="toplist" value="${topList}"/>
                    <c:if test="${! empty toplist }">
                    <c:forEach items="${toplist}" var="top">
                    <!-- Single Album -->
			 <a href="music_cont.do?m_no=${top.m_no }">
                        <div class="single-album">
                            <img src="<%= request.getContextPath() %>/resources/img/album-img/${top.m_image}">
                            <div class="album-info">
                                
                                    <h5>${top.m_name}</h5>
                                <p>${top.m_artist}</p>
                            </div>
                        </div>
			</a>
                    </c:forEach>
                    </c:if>
						<c:if test="${empty toplist}">
							top10 음악이 없습니다.
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### TOP10 Area End ##### -->

	<!-- ##### New Music Area Start ##### -->
	<section
		class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="section-heading style-2">
						<p>오늘의 신곡, 새로운 음악을 만나보세요</p>
						<h2>new Music</h2>
					</div>
				</div>
			</div>

			<div class="row">
			<div id="newMusic" width="80%"> 
				<!-- Single Album Area -->
				<!--<div class="col-12 col-sm-6 col-md-4 col-lg-2" >-->
					<c:set var="newlist" value="${newList }" />
					<c:if test="${!empty newlist }">
						<c:set var="i" value="1" />
					 <table>
						<tr align="left"> 
							<c:forEach var="n" items="${newlist}" begin="0" end="11">
								<td width="300px" align="center" >
								<a href="music_cont.do?m_no=${n.m_no}">
									<div class="single-album-area wow fadeInUp">

										<div class="album-thumb">
											<img
												src="<%= request.getContextPath()%>/resources/img/album-img/${n.m_image}" />
											<!-- Play Icon -->
											<div class="play-icon">
												<a href="#" class="video--play--btn"><span
													class="icon-play-button"></span></a>
											</div>
										</div>
										<div class="album-info" align="center">

											
												<h5>${n.m_name}</h5>

											<p>${n.m_artist}</p>

										</div>
									</div>
								</a>
								</td>
								<c:if test="${i%6 == 0 }">
									</tr>
									<tr align="left">
								</c:if>
								<c:set var="i" value="${i + 1 }" />
							</c:forEach>
							</tr>
						</table>
					</c:if>
					<c:if test="${empty newlist }">
                    	오늘은 새로운 음원이 없습니다.
                    </c:if>
				
				</div>

				<br>

				<div class="row">
					<div class="col-12">
						<div class="load-more-btn text-center wow fadeInUp"
							data-wow-delay="300ms">
							<div id="leadMoreBtn">
							<a href="<%=request.getContextPath()%>/newMusic.do"
								class="btn oneMusic-btn">Load More <i
								class="fa fa-angle-double-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			</div>
	</section>
	<!-- ##### New Music Area End ##### -->

	<!-- ##### Featured Artist Area Start ##### -->
	<section
		class="featured-artist-area section-padding-100 bg-img bg-overlay bg-fixed"
		style="background-image: url(resources/img/bg-img/bg-4.jpg);">
		<div class="container">
			<div class="row align-items-end">
				<div class="col-12 col-md-5 col-lg-4">
					<div class="featured-artist-thumb">
						<img
							src="<%=request.getContextPath()%>/resources/img/bg-img/fa.jpg"
							alt="">
					</div>
				</div>
				<div class="col-12 col-md-7 col-lg-8">
					<div class="featured-artist-content">
						<!-- Section Heading -->
						<div class="section-heading white text-left mb-30">
							<p>오늘의 추천음악</p>
							<h2>Music Recommendation</h2>
						</div>
						<p>one sound는 다양한 아티스트의 노래도 들을 수 있습니다. 우리는 모든 아티스트를 존중하고
							존경합니다.</p>
						<div class="song-play-area">
							<div class="song-name">
								<p>01. Main Hit Song</p>
							</div>
							<audio preload="auto" controls>
								<source
									src="<%=request.getContextPath()%>/resources/audio/dummy-audio.mp3">
							</audio>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Featured Artist Area End ##### -->

	<!-- ##### Miscellaneous Area Start ##### -->
	<section class="miscellaneous-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<!-- ***** Weeks Top ***** -->
				<div class="col-12 col-lg-4">
					<div class="weeks-top-area mb-100">
						<div class="section-heading text-left mb-50 wow fadeInUp"
							data-wow-delay="50ms">
							<p>이번주 top음원</p>
							<h2>This week’s top</h2>
						</div>

						<!-- Single Top Item -->
						<div class="single-top-item d-flex wow fadeInUp"
							data-wow-delay="100ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/wt1.jpg"
									alt="">
							</div>
							<div class="content-">
								<h6>Sam Smith</h6>
								<p>Underground</p>
							</div>
						</div>

						<!-- Single Top Item -->
						<div class="single-top-item d-flex wow fadeInUp"
							data-wow-delay="150ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/wt2.jpg"
									alt="">
							</div>
							<div class="content-">
								<h6>Power Play</h6>
								<p>In my mind</p>
							</div>
						</div>

						<!-- Single Top Item -->
						<div class="single-top-item d-flex wow fadeInUp"
							data-wow-delay="200ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/wt3.jpg"
									alt="">
							</div>
							<div class="content-">
								<h6>Cristinne Smith</h6>
								<p>My Music</p>
							</div>
						</div>

						<!-- Single Top Item -->
						<div class="single-top-item d-flex wow fadeInUp"
							data-wow-delay="250ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/wt4.jpg"
									alt="">
							</div>
							<div class="content-">
								<h6>The Music Band</h6>
								<p>Underground</p>
							</div>
						</div>

						<!-- Single Top Item -->
						<div class="single-top-item d-flex wow fadeInUp"
							data-wow-delay="300ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/wt5.jpg"
									alt="">
							</div>
							<div class="content-">
								<h6>Creative Lyrics</h6>
								<p>Songs and stuff</p>
							</div>
						</div>

						<!-- Single Top Item -->
						<div class="single-top-item d-flex wow fadeInUp"
							data-wow-delay="350ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/wt6.jpg"
									alt="">
							</div>
							<div class="content-">
								<h6>The Culture</h6>
								<p>Pop Songs</p>
							</div>
						</div>

					</div>
				</div>

				<!-- ***** New Hits Songs ***** -->
				<div class="col-12 col-lg-4">
					<div class="new-hits-area mb-100">
						<div class="section-heading text-left mb-50 wow fadeInUp"
							data-wow-delay="50ms">
							<p>새로 떠오르는 음악</p>
							<h2>New Hits</h2>
						</div>

						<!-- Single Top Item -->
						<div
							class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
							data-wow-delay="100ms">
							<div class="first-part d-flex align-items-center">
								<div class="thumbnail">
									<img
										src="<%=request.getContextPath()%>/resources/img/bg-img/wt7.jpg"
										alt="">
								</div>
								<div class="content-">
									<h6>Sam Smith</h6>
									<p>Underground</p>
								</div>
							</div>
							<audio preload="auto" controls>
								<source
									src="<%=request.getContextPath()%>/resources/audio/dummy-audio.mp3">
							</audio>
						</div>

						<!-- Single Top Item -->
						<div
							class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
							data-wow-delay="150ms">
							<div class="first-part d-flex align-items-center">
								<div class="thumbnail">
									<img
										src="<%=request.getContextPath()%>/resources/img/bg-img/wt8.jpg"
										alt="">
								</div>
								<div class="content-">
									<h6>Power Play</h6>
									<p>In my mind</p>
								</div>
							</div>
							<audio preload="auto" controls>
								<source
									src="<%=request.getContextPath()%>/resources/audio/dummy-audio.mp3">
							</audio>
						</div>

						<!-- Single Top Item -->
						<div
							class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
							data-wow-delay="200ms">
							<div class="first-part d-flex align-items-center">
								<div class="thumbnail">
									<img
										src="<%=request.getContextPath()%>/resources/img/bg-img/wt9.jpg"
										alt="">
								</div>
								<div class="content-">
									<h6>Cristinne Smith</h6>
									<p>My Music</p>
								</div>
							</div>
							<audio preload="auto" controls>
								<source
									src="<%=request.getContextPath()%>/resources/audio/dummy-audio.mp3">
							</audio>
						</div>

						<!-- Single Top Item -->
						<div
							class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
							data-wow-delay="250ms">
							<div class="first-part d-flex align-items-center">
								<div class="thumbnail">
									<img
										src="<%=request.getContextPath()%>/resources/img/bg-img/wt10.jpg"
										alt="">
								</div>
								<div class="content-">
									<h6>The Music Band</h6>
									<p>Underground</p>
								</div>
							</div>
							<audio preload="auto" controls>
								<source
									src="<%=request.getContextPath()%>/resources/audio/dummy-audio.mp3">
							</audio>
						</div>

						<!-- Single Top Item -->
						<div
							class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
							data-wow-delay="300ms">
							<div class="first-part d-flex align-items-center">
								<div class="thumbnail">
									<img
										src="<%=request.getContextPath()%>/resources/img/bg-img/wt11.jpg"
										alt="">
								</div>
								<div class="content-">
									<h6>Creative Lyrics</h6>
									<p>Songs and stuff</p>
								</div>
							</div>
							<audio preload="auto" controls>
								<source
									src="<%=request.getContextPath()%>/resources/audio/dummy-audio.mp3">
							</audio>
						</div>

						<!-- Single Top Item -->
						<div
							class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
							data-wow-delay="350ms">
							<div class="first-part d-flex align-items-center">
								<div class="thumbnail">
									<img src="resources/img/bg-img/wt12.jpg" alt="">
								</div>
								<div class="content-">
									<h6>The Culture</h6>
									<p>Pop Songs</p>
								</div>
							</div>
							<audio preload="auto" controls>
								<source
									src="<%=request.getContextPath()%>/resources/audio/dummy-audio.mp3">
							</audio>
						</div>
					</div>
				</div>

				<!-- ***** Popular Artists ***** -->
				<div class="col-12 col-lg-4">
					<div class="popular-artists-area mb-100">
						<div class="section-heading text-left mb-50 wow fadeInUp"
							data-wow-delay="50ms">
							<p>아티스트 추천</p>
							<h2>Popular Artist</h2>
						</div>

						<!-- Single Artist -->
						<div class="single-artists d-flex align-items-center wow fadeInUp"
							data-wow-delay="100ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/pa1.jpg"
									alt="">
							</div>
							<div class="content-">
								<p>Sam Smith</p>
							</div>
						</div>

						<!-- Single Artist -->
						<div class="single-artists d-flex align-items-center wow fadeInUp"
							data-wow-delay="150ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/pa2.jpg"
									alt="">
							</div>
							<div class="content-">
								<p>William Parker</p>
							</div>
						</div>

						<!-- Single Artist -->
						<div class="single-artists d-flex align-items-center wow fadeInUp"
							data-wow-delay="200ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/pa3.jpg"
									alt="">
							</div>
							<div class="content-">
								<p>Jessica Walsh</p>
							</div>
						</div>

						<!-- Single Artist -->
						<div class="single-artists d-flex align-items-center wow fadeInUp"
							data-wow-delay="250ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/pa4.jpg"
									alt="">
							</div>
							<div class="content-">
								<p>Tha Stoves</p>
							</div>
						</div>

						<!-- Single Artist -->
						<div class="single-artists d-flex align-items-center wow fadeInUp"
							data-wow-delay="300ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/pa5.jpg"
									alt="">
							</div>
							<div class="content-">
								<p>DJ Ajay</p>
							</div>
						</div>

						<!-- Single Artist -->
						<div class="single-artists d-flex align-items-center wow fadeInUp"
							data-wow-delay="350ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/pa6.jpg"
									alt="">
							</div>
							<div class="content-">
								<p>Radio Vibez</p>
							</div>
						</div>

						<!-- Single Artist -->
						<div class="single-artists d-flex align-items-center wow fadeInUp"
							data-wow-delay="400ms">
							<div class="thumbnail">
								<img
									src="<%=request.getContextPath()%>/resources/img/bg-img/pa7.jpg"
									alt="">
							</div>
							<div class="content-">
								<p>Music 4u</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Miscellaneous Area End ##### -->

	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>

</html>
