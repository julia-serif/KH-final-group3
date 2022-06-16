<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
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
            <p>See what’s new</p>
            <h2>곡 정보</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    
    <section>
    	
    <div class="home">
		<div class="home_inner">
			<!-- Image artist: https://unsplash.com/@yoannboyer -->
			<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/single.jpg" data-speed="0.8"></div>
		</div>
	</div>
	<br><br><br>

	<!-- Single -->

	<div class="single">
		<div class="container">
			<div class="row">
				
				<!-- Single Info -->
				<div class="col-lg-5">
					<div class="single_info">
						<div class="single_image"><img src="resources/img/bg-img/a2.jpg" alt=""></div>
						<div class="single_info_list">
							<ul>
								<li><span>Release date: </span>25 August, 2017</li>
								<li><span>Tags: </span>chill, techno, electronic</li>
								<li><span>Producers: </span>Michael Smith, Jenna Williams</li>
								<li><span>No of songs: </span>12</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Single Content -->
				<div class="col-lg-7 single_content_col">
					<div class="single_content">
						<div class="single_text">
							<p> luctus.</p>
						</div>
						<div class="single_players">
							
							<!-- Single Player -->
							<div class="single_player_container d-flex flex-column align-items-start justify-content-center">
								<div class="single_player">
									<div id="jplayer_1" class="jp-jplayer"></div>
									<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
										<div class="jp-type-single">
											<div class="player_details d-flex flex-row align-items-center justify-content-start">
												<div class="jp-details">
													<div>playing</div>
													<div class="jp-title" aria-label="title">&nbsp;</div>
												</div>
												<div class="jp-controls-holder ml-auto">
													<button class="jp-play" tabindex="0"></button>
												</div>
											</div>
											<div class="player_controls">
												<div class="jp-gui jp-interface d-flex flex-row align-items-center justify-content-start">
													<div class="jp-controls-holder time_controls d-flex flex-row align-items-center justify-content-start">
														<div><div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div></div>
														<div class="jp-progress">
															<div class="jp-seek-bar">
																<div class="jp-play-bar"></div>
															</div>
														</div>
														<div><div class="jp-duration ml-auto" role="timer" aria-label="duration">&nbsp;</div></div>
													</div>
													<div class="jp-volume-controls d-flex flex-row align-items-center justify-content-start ml-auto">
														<button class="jp-mute" tabindex="0"></button>
														<div class="jp-volume-bar">
															<div class="jp-volume-bar-value"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="jp-no-solution">
												
											</div>
										</div>
									</div>

								</div>
							</div>

							<!-- Single Player -->
							<div class="single_player_container d-flex flex-column align-items-start justify-content-center">
								<div class="single_player">
									<div id="jplayer_2" class="jp-jplayer"></div>
									<div id="jp_container_2" class="jp-audio" role="application" aria-label="media player">
										<div class="jp-type-single">
											<div class="player_details d-flex flex-row align-items-center justify-content-start">
												<div class="jp-details">
													<div>playing</div>
													<div class="jp-title" aria-label="title">&nbsp;</div>
												</div>
												<div class="jp-controls-holder ml-auto">
													<button class="jp-play" tabindex="0"></button>
												</div>
											</div>
											<div class="player_controls">
												<div class="jp-gui jp-interface d-flex flex-row align-items-center justify-content-start">
													<div class="jp-controls-holder time_controls d-flex flex-row align-items-center justify-content-start">
														<div><div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div></div>
														<div class="jp-progress">
															<div class="jp-seek-bar">
																<div class="jp-play-bar"></div>
															</div>
														</div>
														<div><div class="jp-duration ml-auto" role="timer" aria-label="duration">&nbsp;</div></div>
													</div>
													<div class="jp-volume-controls d-flex flex-row align-items-center justify-content-start ml-auto">
														<button class="jp-mute" tabindex="0"></button>
														<div class="jp-volume-bar">
															<div class="jp-volume-bar-value"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="jp-no-solution">
												<span>Update Required</span>
												To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
    
    </section>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>

</body>
</html>