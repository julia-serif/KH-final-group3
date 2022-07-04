<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>동영상 상세 페이지</title>

    <!-- Favicon -->
    <link rel="icon" href="<%= request.getContextPath() %>/resources/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/style.css">
    
    <style type="text/css">
	    .video-container {
			position: relative;
			padding-bottom: 56.25%;
			padding-top: 30px;
			height: 0;
			overflow: hidden;
		}
		 
		.video-container iframe,
		.video-container object,
		.video-container embed {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
		}
    </style>
    
</head>
<body>
	<jsp:include page="/resources/include/header.jsp"></jsp:include>
	
	<!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>영상플레이어</p>
            <c:if test="${!empty music }">
            	<h2>${music.getM_name() }</h2>
            </c:if>
            
            <c:if test="${empty music }">
            	<h2>잘못된 접근</h2>
            </c:if>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    <!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-100">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<c:if test="${!empty music }">
						<!-- Single Post Start -->
	                    <div class="single-blog-post mb-100 wow fadeInUp" data-wow-delay="100ms">
	                        <!-- Post Thumb -->
	                        <div class="blog-post-thumb mt-30" style="height: 100%;">
	                            <c:set var="mv" value="${fn:split(music.getM_mv(), '/')[2] }" />
	                            <div class="video-container">
						            <iframe src="https://www.youtube.com/embed/${mv }" title="${music.getM_name() }"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
										allowfullscreen" style="width: 100%; height: 100%;"></iframe>
								</div>
	                        </div>
	
	                        <!-- Blog Content -->
	                        <div class="blog-content">
	                            <!-- Post Title -->
	                            <a href="#" class="post-title">${music.getM_name() }</a>
	                            <!-- Post Meta -->
	                            <div class="post-meta d-flex mb-0">
	                                <p class="post-author"><a href="#">${music.getM_artist() }</a></p>
	                                <p class="tags"><a href="#">${music.getM_album() }</a></p>
	                                <p class="tags">${music.getM_date().substring(0,10) }</p>
	                                <p class="tags">▶${music.getPlay_counts() }</p>
	                            </div>
	                        </div>
	                        
	                        <!-- Blog Content -->
	                        <div class="blog-content">
	                            <!-- Post Excerpt -->
	                            <h6 style="margin-bottom: 15px;">가사 정보</h6>
	                            <p>${music.getM_lyrics() }</p>
	                        </div>
	                    </div>
                    </c:if>
                    
                    <c:if test="${empty music }">
						<h6>동영상 정보가 존재하지 않습니다.</h6>
					</c:if>
				</div>
			</div>
		</div>
	</div>
    
    <section>
    	<div class="card my-4">
			<h5 class="card-header">댓글</h5>
			<div class="card-body">
				<form name="comment-form" action="<%=request.getContextPath() %>/video_reply_write.do" method="post" autocomplete="off">
					<div class="form-group">
						<input type="hidden" name="v_no" value="${music.getM_no() }">
						<textarea name="vr_cont" class="form-control" rows="3"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">작성</button>
				</form>
			</div>
		</div>
		
		
    </section>
    
	
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>