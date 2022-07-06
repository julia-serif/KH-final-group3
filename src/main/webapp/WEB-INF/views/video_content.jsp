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
		.oneMusic-btn:after {
			clear: both;
		}
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">
		window.onload = function () {
			$(".reply_field").hide();
		};
	</script>
	<script type="text/javascript">
	
		function nested_reply(a) {
			
			var uid = '${member}';
			if(!uid){
				window.location.href = "${pageContext.request.contextPath}/login.do";
				
			} else {
				if($("#"+a).is(":hidden")){
					$("#"+a).show();
				} else {
					$("#"+a).hide();
				}
			}	
		}
	</script>
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
	                                <p class="tags">▶${music.getM_pcount() }</p>
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
    <!-- ##### Newsletter & Testimonials Area Start ##### -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">

                <!-- Newsletter Area -->
                <div class="col-12">
                	<div class="section-heading text-left mb-50">
                        <p>총 ${totalRecord }개</p>
                        <h2>댓글</h2>
                    </div>
                    <div class="newsletter-area mb-50" style="padding-bottom: 60px;">
                        <div class="newsletter-form">
                            <form action="<%=request.getContextPath() %>/video_reply_write.do" method="post" autocomplete="off">
                            	<input type="hidden" name="v_no" value="${music.getM_no() }">
                                <textarea name="vr_cont" class="form-control" rows="3" style="position: relative; display: inline-block;"
                                placeholder="명예훼손, 개인정보 유출, 인격권 침해, 허위사실 유포 등은 이용약관 및 관련법률에 의해 제재를 받을 수 있습니다. 건전한 댓글문화 정착을 위해 이용에 주의를 부탁드립니다."></textarea>
                                <button type="submit" class="btn oneMusic-btn" style="float: right;">댓글 등록</button>
                            </form>
                        </div>
                    </div>
                    
                    <!-- 댓글 표시 Area -->
                    <div class="new-hits-area mb-50">
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="reply">
		                        <!-- Single Top Item -->
		                        <div class="single-new-item d-flex align-items-center justify-content-between">
		                            <div class="first-part d-flex align-items-center">
										 <c:if test="${reply.getVr_layer() != 0 }">
											<c:forEach begin="1" end="${reply.getVr_layer() }">
												<img alt="" src="<%= request.getContextPath() %>/resources/img/bg-img/right-arrow.png"
													width="50" height="50">&nbsp;&nbsp;&nbsp;
											</c:forEach>
										</c:if>					     
		                                <div class="thumbnail">
		                                    <img src="<%= request.getContextPath() %>/resources/img/bg-img/wt7.jpg" alt="">
		                                </div>
		                                <div class="content-">
		                                    <h6 style="text-transform: none;">${reply.getVr_writer() }</h6>
		                                    <p>${reply.getVr_date().substring(0,10) }</p>
		                                    <p>${reply.getVr_cont() }</p>
		                                </div>
		                            </div>
		                            <div>
		                            	<c:if test="${reply.getVr_writer() == member.getUser_id() }">
			                            	<button type="button" class="oneMusic-btn-small"
			                            	onclick="if(confirm('정말로 삭제하시겠습니까?')) { 
			                            		location.href='video_reply_delete.do?v_no=${reply.getV_no() }&vr_no=${reply.getVr_no() }' }
			                            		else { return; }">삭제</button>
			                            </c:if>
					 				<c:if test="${reply.getVr_layer() == 0 }">				 
		                            	<button type="button" class="oneMusic-btn-small" onclick="nested_reply(${reply.getVr_no()})">댓글</button>
									</c:if>
		                            </div>
		                        </div>
		                        <div class="reply_field" id="${reply.getVr_no() }">
			                       <form action="<%=request.getContextPath() %>/video_rereply_write.do" method="post" autocomplete="off">
		                            	<input type="hidden" name="vr_no" value="${reply.getVr_no() }">
		                            	<input type="hidden" name="v_no" value="${music.getM_no() }">
		                                <textarea name="vr_cont" class="form-control" rows="3" style="position: relative; display: inline-block;"></textarea>
		                                <button type="submit" class="oneMusic-btn-small" style="float: right;">등록</button>
		                            </form>
		                            <hr style="margin-top: 50px;">
	                            </div>
	                        </c:forEach>
                        </c:if>
                        
                        <c:if test="${empty list }">
							<p>아직 등록된 덧글이 없습니다.</p>
						</c:if>
                	</div>
                
                	<div align="center" style="margin-bottom: 100px;">
						<%-- 페이징 처리 부분 --%>
					   	<c:if test="${paging.getPage() > paging.getBlock() }">
					      	<a href="board_list.do?page=1">◀◀</a>
					      	<a href="board_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
					   	</c:if>
					   
					   	<c:forEach begin="${paging.getStartBlock() }"
					          				end="${paging.getEndBlock() }" var="i">
					      	<c:if test="${i == paging.getPage() }">
					         	<b> <a href="board_list.do?page=${i }">[${i }]</a></b>
					      	</c:if>
					   
					   	  	<c:if test="${i != paging.getPage() }">
					         	<a href="board_list.do?page=${i }" style="font-weight: 300;">[${i }]</a>
					      	</c:if>
					   	</c:forEach>
				
					   	<c:if test="${paging.getEndBlock() < paging.getTotalBlock() }">
					      	<a href="board_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
					      	<a href="board_list.do?page=${paging.getAllPage() }">▶▶</a>
					   	</c:if>
					</div>
				</div>
            </div>
    	</div>
    </section>
    
    
	
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>
