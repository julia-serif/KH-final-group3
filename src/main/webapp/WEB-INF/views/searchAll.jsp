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
    <title>검색 결과 페이지</title>

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
            <p>${keyword }로 검색한</p>
            <h2>검색 결과</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
	
	<!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-9">
						
					<c:forEach items="${searchLists }" var="list" varStatus="status">
						<c:set var="paging" value="${Pagings }" />
						<c:set var="resultNum" value="${resultNums }" />
							
						<c:choose>
							<c:when test="${status.index == 0 }">
								<div class="new-hits-area mb-100">
									<div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
			                            <p>총 ${resultNum[status.index] }건</p>
			                            <h2>곡</h2>
	                        		</div>
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="music">
					                        <!-- Single Top Item -->
					                        <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="100ms">
					                            <div class="first-part d-flex align-items-center">
					                                <div class="thumbnail">
					                                    <img src="<%= request.getContextPath() %>/resources/img/album-img/${music.getM_image() }" alt="${music.getM_album() } 앨범 재킷">
					                                </div>
					                                <div class="content-">
					                                    <h6>${music.getM_name() }</h6>
					                                    <p style="display: inline-block; padding-right: 5px;">${music.getM_album() }</p>
					                                    |
					                                    <p style="display: inline-block; padding-left: 5px;">${music.getM_artist() }</p>
					                                </div>
					                            </div>
					                            <audio preload="auto" controls>
					                                <source src="<%= request.getContextPath() %>/resources/audio/${music.getM_audio() }">
					                            </audio>
					                        </div>
			                        	</c:forEach>
									</c:if>
									
									<c:if test="${empty list }">
										<div class="section-heading text-left mb-0 wow fadeInUp" data-wow-delay="50ms">
				                            <p>총 ${resultNum[status.index] }건</p>
				                            <h6>곡의 검색 결과가 없습니다.</h6>
			                        	</div>
									</c:if>
								</div>
							</c:when>
							
							<c:when test="${status.index == 1 }">
								<div class="weeks-top-area mb-100" style="background-color: #f5f9fa; border-color: #d8d8d8;">
									<div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
			                            <p>총 ${resultNum[status.index] }건</p>
			                            <h2>앨범</h2>
			                        </div>
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="music">
					                        <!-- Single Top Item -->
					                        <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
					                            <div class="thumbnail">
					                                <img src="<%= request.getContextPath() %>/resources/img/album-img/${music.getM_image() }" alt="${music.getM_album() } 앨범 재킷">
					                            </div>
					                            <div class="content-">
					                                <h6>${music.getM_album() }</h6>
					                                <p>${music.getM_artist() }</p>
					                            </div>
					                        </div>
			                        	</c:forEach>
									</c:if>
									
									<c:if test="${empty list }">
										<div class="section-heading text-left mb-0 wow fadeInUp" data-wow-delay="50ms">
				                            <p>총 ${resultNum[status.index] }건</p>
				                            <h6>앨범의 검색 결과가 없습니다.</h6>
			                        	</div>
									</c:if>
								</div>
							</c:when>
							
							<c:when test="${status.index == 2 }">
								<div class="popular-artists-area mb-100">
									<c:if test="${!empty list }">
										<div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
				                            <p>총 ${resultNum[status.index] }건</p>
				                            <h2>아티스트</h2>
				                        </div>
										<c:forEach items="${list }" var="music">
					                        <!-- Single Artist -->
					                        <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
					                            <div class="thumbnail">
					                                <img src="<%= request.getContextPath() %>/resources/img/bg-img/pa1.jpg" alt="">
					                            </div>
					                            <div class="content-">
					                                <p>${music.getM_artist() }</p>
					                            </div>
					                        </div>
			                        	</c:forEach>
									</c:if>
									
									<c:if test="${empty list }">
										<div class="section-heading text-left mb-0 wow fadeInUp" data-wow-delay="50ms">
				                            <p>총 ${resultNum[status.index] }건</p>
				                            <h6>아티스트의 검색 결과가 없습니다.</h6>
			                        	</div>
									</c:if>
								</div>
							</c:when>
							
							<c:when test="${status.index == 3 }">
								<div class="new-hits-area mb-100">
									<div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
			                            <p>총 ${resultNum[status.index] }건</p>
			                            <h2>동영상</h2>
	                        		</div>
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="music">
					                        <!-- Single Top Item -->
					                        <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="100ms">
					                            <div class="first-part d-flex align-items-center">
					                            	<div style="margin-right: 20px;">
						                            	<c:set var="mv" value="${fn:split(music.getM_mv(), '/')[2] }" />
						                            	<a href="<%= request.getContextPath() %>/video.do?no=${music.getM_no() }">
						                            		<img alt="${music.getM_name() } 동영상 썸네일" src="https://i1.ytimg.com/vi/${mv }/default.jpg">
					                            		</a>
					                            	</div>
					                            	<div class="content-">
					                                    <h6><a href="<%= request.getContextPath() %>/video.do?no=${music.getM_no() }">${music.getM_name() }</a></h6>
					                                    <p>${music.getM_artist() }</p>
					                                </div>
					                            </div>
					                            
					                        </div>
			                        	</c:forEach>
									</c:if>
									
									<c:if test="${empty list }">
										<div class="section-heading text-left mb-0 wow fadeInUp" data-wow-delay="50ms">
				                            <p>총 ${resultNum[status.index] }건</p>
				                            <h6>동영상의 검색 결과가 없습니다.</h6>
			                        	</div>
									</c:if>
								</div>
							</c:when>
							
							<c:when test="${status.index == 4 }">
							
							<div class="weeks-top-area mb-0" style="pointer-events: none;">
								<div class="section-heading text-left mb-0 wow fadeInUp" data-wow-delay="50ms">
		                            <p>총 ${resultNum[status.index] }건</p>
		                            <h2>가사</h2>
                        		</div>
							</div>
							
								<div class="single-blog-post mb-100 wow fadeInUp" data-wow-delay="100ms">
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="music">
					                        <!-- Blog Content -->
					                        <div class="blog-content">
					                            <!-- Post Title -->
					                            <a href="#" class="post-title">${music.getM_name() }</a>
					                            <!-- Post Meta -->
					                            <div class="post-meta d-flex mb-30">
					                                <p class="post-author"><a href="#"> ${music.getM_artist() }</a></p>
					                                <p class="tags"><a href="#"> ${music.getM_album() }</a></p>
					                            </div>
					                            <!-- Post Excerpt -->
					                            <p>${music.getM_lyrics().substring(0,200) }...</p>
					                        </div>
				                        </c:forEach>
			                        </c:if>
			                        
			                        <c:if test="${empty list }">
			                        	<div class="blog-content">
											<div class="section-heading text-left mb-0 wow fadeInUp" data-wow-delay="50ms">
					                            <p>총 ${resultNum[status.index] }건</p>
					                            <h6>가사의 검색 결과가 없습니다.</h6>
				                        	</div>
			                        	</div>
									</c:if>
			                    </div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
				
				<jsp:include page="/resources/include/search_widget.jsp"></jsp:include>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>