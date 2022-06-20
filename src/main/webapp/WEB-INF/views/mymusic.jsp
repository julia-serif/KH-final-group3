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
            <p>내 음 악</p>
            <h2>My Music</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    <!-- ##### MyMusic Area Start ##### -->
    <section class="events-area section-padding-100">
        <div class="container">
            <div class="row">

                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="resources/img/bg-img/MM01.png" alt="">
                        </div>
                        <div class="event-text">
                            <a href="#" class="btn see-more-btn">좋아요 표시한 음악</a>
                        </div>
                    </div>
                </div>

                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="resources/img/bg-img/MM02.png" alt="">
                        </div>
                        <div class="event-text">
                            <a href="#" class="btn see-more-btn">최근 들은 음악</a>
                        </div>
                    </div>
                </div>

                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="resources/img/bg-img/MM03.png" alt="">
                        </div>
                        <div class="event-text">
                            <a href="#" class="btn see-more-btn">많이 들은 음악</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### MyMusic Area End ##### -->
    
    <!-- ##### Playlist Area Start ##### -->
    <div class="one-music-songs-area mb-70">
        <div class="container">
            <div class="row">

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="resources/img/bg-img/s1.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>플레이리스트 1번</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="resources/audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="resources/img/bg-img/s2.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>플레이리스트 2번</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="resources/audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="resources/img/bg-img/s3.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>플레이리스트 3번</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="resources/audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="resources/img/bg-img/s4.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>플레이리스트 4번</p>
                                <div class="blog-content">
	                                <div class="post-meta d-flex mb-30">
		                                <p class="post-author">17곡</p>
                                		<p class="tags"><a href="#">2 Comments</a></p>
	                          	    </div>
                          	    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Playlist Area End ##### -->
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>