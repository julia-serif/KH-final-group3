<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    
    
<style type="text/css">

		.video-container {
			float: left;
		    margin-right: 22px;
		    padding-bottom: 50px;
		}
		
		.audio-content {
		  padding: 10px;
		} 
		
		.blog-content::after {
		  content: "";
		  clear: both;
		  display: table;
		} 
		
		img {
		  display: inline-block;
		  margin-left: auto;
		  margin-right: auto;
		}
		
		.button-content {
			padding-top: 10px;
		}
		
		.m_name {
			font-size: 32px;
		}
		
		table {
			font-family: "Archivo Narrow", sans-serif;
  			font-size: 24px; 
		}
		

</style>
<script type="text/javascript">

		window.onload = function () {
			$(".reply_field").hide();
		};

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
            <p>See what???s new</p>
            <h2>??? ??????</h2>
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
	<c:set var="dto" value="${cont }"/>
	<c:set var="paging" value="${Paging }"/>
	 <div class="blog-area section-padding-100">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<c:if test="${!empty dto }">
						<!-- Single Post Start -->
	                    <div class="single-blog-post mb-100 wow fadeInUp" data-wow-delay="100ms">
	                        <!-- Single Info -->
							<div class="video-container">
					            <img src="<%= request.getContextPath() %>/resources/img/album-img/${dto.getM_image() }" alt="${dto.getM_album() } ?????? ??????" width="435px" height="435px">
							</div>

	                        <!-- Blog Content -->
	                        <div class="blog-content">
	                            <!-- Post Title -->
	                            <a href="#" style="font-size: 35px;">${dto.getM_name() }</a>
	                            <br> <br>
 	                            <!-- Post Meta -->
	                           	<table border="0" cellspacing="0" class="table-content">
		                           	<tr>
		                           		<th>????????????</th>
		                           		<td width="100"></td>
		                           		<td>${dto.getM_artist() }</td>
		                           	</tr>
		                           	
		                           	<tr>
		                           		<th>?????????</th>
		                           		<td width="150"></td>
		                           		<td>${dto.getM_album() }</td>
		                           	</tr>
		                           	
		                           	<tr>
		                           		<th>?????????</th>
		                           		<td width="150"></td>
		                           		<td>${dto.getM_date().substring(0,10) }</td>
		                           	</tr>
		                           	
		                           	<tr>
		                           		<th>????????????</th>
		                           		<td width="150"></td>
		                           		<td>${Math.floor(dto.getM_ptime() / 60).intValue() } : ${dto.getM_ptime() % 60 }</td>
		                           	</tr>
		                           	
		                           	<tr>
		                           		<th>?????????</th>
		                           		<td width="150"></td>
		                           		<td>${dto.getM_like() }</td>
		                           	</tr>
		                           	
		                           	
	                            </table>
	                            
	                            <br> <br>
	                            
	                            <div class="button-content">
								<c:set var="myInfo" value="${myInfo }"/>
	                            	<c:if test="${member == null }">
	                    				<a href="<%=request.getContextPath() %>/m_like_up.do?m_no=${dto.getM_no() }&page=${paging.page }">
		                       			  <!-- ????????? ?????? -->
		                    				<img src="<%= request.getContextPath() %>/resources/img/bg-img/like.png" width="40" height="40" />
		                   			    </a>
	                            	</c:if>
	                            	<c:if test="${myInfo.getPlay_thumbs() == 'false' }">
		                            	<a href="<%=request.getContextPath() %>/m_like_up.do?m_no=${dto.getM_no() }&page=${paging.page }">
		                       			  <!-- ????????? ?????? -->
		                    				<img src="<%= request.getContextPath() %>/resources/img/bg-img/like.png" width="40" height="40" />
		                   			    </a>
	                   			    </c:if>
	                            	<c:if test="${myInfo.getPlay_thumbs() == 'true' }">
		                            	<a href="<%=request.getContextPath() %>/m_like_down.do?m_no=${dto.getM_no() }&page=${paging.page }">
		                       			  <!-- ????????? ?????? -->
		                    				<img src="<%= request.getContextPath() %>/resources/img/bg-img/like2.png" width="40" height="40" />
		                   			    </a>
	                   			    </c:if>
	                   			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            <a href="<%=request.getContextPath()%>/video.do?no=${dto.getM_no()}">
	                       			<!-- ?????? ???????????? ?????? -->
	                      				<img src="<%= request.getContextPath() %>/resources/img/bg-img/television.png" width="40" height="40" />
	                          		</a>
	                          		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                          		<a href="<%=request.getContextPath() %>/add_to_playlist.do?m_no=${dto.getM_no() }">
	                       			  <!-- ?????????????????? ?????? ?????? -->
	                    				<img src="<%= request.getContextPath() %>/resources/img/bg-img/add.png" width="40" height="40" />
	                   			    </a>
	                            </div>
	                            
					            <div class="audio-content">
					            	<audio preload="auto" controls>
								         <source src="<%= request.getContextPath() %>/resources/audio/${dto.getM_audio() }">
								    </audio>
                         		</div>
	                          		
	                        </div>
	                        
	                        <!-- Blog Content -->
						    <div class="blog-content" align="left">
						        <!-- Post Excerpt -->
						        <h6 style="margin-bottom: 15px;">?????? ??????</h6>
						        <p>${dto.getM_lyrics() }</p>
						    </div>
	                    </div>
	                    
                    </c:if>
                    
                    <c:if test="${empty dto }">
						<h6>????????? ????????? ???????????? ????????????.</h6>
					</c:if>
				</div>
			</div>
		</div>
	</div>
    </section>
    
    
    <!-- ##### Newsletter & Testimonials Area Start ##### -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">
            	<c:set var="list" value="${musicReplyList }"/>
				

                <!-- Newsletter Area -->
                <div class="col-12">
                	<div class="section-heading text-left mb-50">
                        <p>??? ${totalRecord }???</p>
                        <h2>??????</h2>
                    </div>
                    <div class="newsletter-area mb-50" style="padding-bottom: 60px;">
                        <div class="newsletter-form">
                            <form name="comment-form" action="<%=request.getContextPath() %>/musicReply.do?m_no=${dto.getM_no() }" method="post" autocomplete="off">
                                <textarea name="mr_cont" class="form-control" rows="3" style="position: relative; display: inline-block;"
                                placeholder="????????????, ???????????? ??????, ????????? ??????, ???????????? ?????? ?????? ???????????? ??? ??????????????? ?????? ????????? ?????? ??? ????????????. ????????? ???????????? ????????? ?????? ????????? ????????? ??????????????????."></textarea>
                                <button type="submit" class="btn oneMusic-btn" style="float: right;">?????? ??????</button>
                            </form>
                        </div>
                    </div>
                    
                    <!-- ?????? ?????? Area -->
                    <div class="new-hits-area mb-50">
						<c:if test="${!empty list }">
							<c:set var="member" value="${member }"/>
							<c:forEach items="${list }" var="reply">
		                        <!-- Single Top Item -->
		                        <div class="single-new-item d-flex align-items-center justify-content-between">
		                            <div class="first-part d-flex align-items-center">
		                            	<c:if test="${reply.getMr_layer() != 0 }">
											<c:forEach begin="1" end="${reply.getMr_layer() }">
												<img alt="" src="<%= request.getContextPath() %>/resources/img/bg-img/right-arrow.png"
													width="50" height="50">&nbsp;&nbsp;&nbsp;
											</c:forEach>
										</c:if>
		                                <div class="thumbnail">
		                                    <img src="<%= request.getContextPath() %>/resources/img/bg-img/wt7.jpg" alt="">
		                                </div>
		                                <div class="content-">
		                                    <h6 style="text-transform: none;">${reply.getMr_writer() }</h6>
		                                    <p>${reply.getMr_date().substring(0,10) }</p>
		                                    <p>${reply.getMr_cont() }</p>
		                                </div>
		                            </div>
		                            <div>
		                            	<c:if test="${reply.getMr_writer() == member.getUser_id() }">
			                            	<button type="button" class="oneMusic-btn-small" 
			                            		onclick="if(confirm('????????? ?????????????????????????')) {
													location.href='music_reply_delete.do?mr_no=${reply.getMr_no() }&page=${paging.page }&m_no=${dto.getM_no() }'
												}else {return;}">??????</button>
			                            </c:if>
		                            
		                            <c:if test="${reply.getMr_layer() == 0 }">
		                            <button type="button" class="oneMusic-btn-small" onclick="nested_reply(${reply.getMr_no()})">??????</button>
		                            </c:if>
		                            </div>
		                        </div>
		                        
		                          <div class="reply_field" id="${reply.getMr_no() }">
			                        <form action="<%=request.getContextPath() %>/music_reply_write.do" method="post" autocomplete="off">
		                            	<input type="hidden" name="mr_no" value="${reply.getMr_no() }">
		                            	<input type="hidden" name="m_no" value="${dto.getM_no() }">
		                                <textarea name="mr_cont" class="form-control" rows="3" style="position: relative; display: inline-block;"></textarea>
		                                <button type="submit" class="oneMusic-btn-small" style="float: right;">??????</button>
		                            </form>
		                            <hr style="margin-top: 50px;">
	                            </div>
	                        </c:forEach>
                        </c:if>
                        
                        <c:if test="${empty list }">
							<p>?????? ????????? ????????? ????????????.</p>
						</c:if>
                	</div>
                
                <div align="center" style="margin-bottom: 50px;">
  			
  				<!-- 1????????? ?????? ????????? -->
  				<c:if test="${paging.page > paging.startBlock}">
  					<a href="music_cont.do?m_no=${dto.getM_no() }&page=1">??????</a>
  					<a href="music_cont.do?m_no=${dto.getM_no() }&page=${paging.page - 1 }">???</a>
  				</c:if>
  				
  				<!-- ????????? ?????? ?????? -->
  				<c:forEach begin="${paging.startBlock}" end="${paging.endBlock }" var="i">
  					<c:if test="${paging.page == i }">
  						<a href="music_cont.do?m_no=${dto.getM_no() }&page=${i}"><b>[${i}]</b></a>
  					</c:if>
  					<c:if test="${paging.page != i }">
  						<a href="music_cont.do?m_no=${dto.getM_no() }&page=${i}">[${i}]</a>
  					</c:if>
  				</c:forEach>
  				
  				<!-- ????????? ?????? -->
  				<c:if test="${paging.endBlock < paging.totalBlock }">
  					<a href="music_cont.do?m_no=${dto.getM_no() }&page=${paging.page + 1 }">???</a>
  					<a href="music_cont.do?m_no=${dto.getM_no() }&page=${paging.totalBlock }">??????</a>
  				</c:if>
  				</div>	
				</div>
            </div>
    	</div>
    </section>
    
    
   
    
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>

</body>
</html>
