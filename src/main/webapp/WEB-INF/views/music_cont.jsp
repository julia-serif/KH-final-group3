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
    
    
<style type="text/css">



</style>

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
	
	<c:set var="dto" value="${cont }"/>
	<c:if test="${!empty dto }">
	<div class="single">
		<div class="container">
			<div class="row">
				
				<!-- Single Info -->
				<div class="col-lg-5">
					<div class="single_info">
						<div class="single_image"><img src="resources/img/bg-img/a2.jpg" alt=""></div>
					</div>
				</div>

				<!-- Single Content -->
				<div class="col-lg-7 single_content_col">
					<div class="single_content">
						<div class="single_text">
							<p>곡 소개</p>
						</div>
						
						<div class="single_text">
							<h3>${dto.getM_name() }</h3>
							<ul>
								<li><span>아티스트</span>${dto.getM_artist() }</li>
								<li><span>앨범명</span>${dto.getM_album() }</li>
								<li><span>좋아요</span>${dto.getM_like() }</li>
								<li><span>발매일</span>${dto.getM_date().substring(0,10) }</li>
								<li><span>재생시간</span>${Math.floor(dto.getM_ptime() / 60) } : ${dto.getM_ptime() % 60 }</li>
							</ul>
						</div>
						
						
						
					</div>
				</div>

			</div>
			
			<br> <br>
						
			<div class="single_text">
				<p>${dto.getM_lyrics() }</p>
			</div> 
						
						
		</div>
	</div>
	
	<audio preload="auto" controls>
         <source src="<%= request.getContextPath() %>/resources/audio/${dto.getM_audio() }">
    </audio>
    </c:if>
    </section>
    
    
    
    <section>
    	<div class="card my-4">
		<h5 class="card-header">댓글</h5> <br>
			<c:set var="list" value="${musicReplyList }"/>
			<c:set var="paging" value="${Paging }"/>
			
			<table border="0" cellspacing="0">
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="i">
					<tr align="center">
						<td>${i.mr_no }</td>
						<td>${i.mr_writer }</td>
						<td>${i.mr_cont }</td>
						<td>${i.mr_date.substring(0, 10) }</td>
					</tr>
					<tr height="10">&nbsp;</tr>
				</c:forEach>
			</c:if>
			</table>
			
			<c:if test="${empty list }">
				<div>
					<h3>전체 게시물 목록이 없습니다.</h3>
				</div>
			</c:if>
			
	<br>
	
		<div class="card-body">
			<form name="comment-form" action="<%=request.getContextPath() %>/musicReply.do?m_no=${dto.getM_no() }" method="post" autocomplete="off">
				<div class="form-group">
					<textarea name="mr_cont" class="form-control" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
    </section>
    
   
    
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>

</body>
</html>