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

</head>
<body>
	<jsp:include page="/resources/include/header.jsp"></jsp:include>
	
	<!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>영상플레이어</p>
            <h2>${music.getM_name() }</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    <!-- ##### Events Area Start ##### -->
    <section class="events-area section-padding-100">
        <div class="container">
            <div class="row">
	            <div class="col-12" align="center">
					<div class="single-event-area mb-30">
						<div class="event-thumbnail">
							<c:set var="mv" value="${fn:split(music.getM_mv(), '/')[2] }" />
				            <iframe width="940" height="528.750" src="https://www.youtube.com/embed/${mv }" title="${music.getM_name() }"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen"></iframe>
						</div>
						<div class="event-text">
							<h4>${music.getM_name() }</h4>
							<div class="event-meta-data">
								<a href="#" class="event-place">${music.getM_artist() }</a>
								<a href="#" class="event-date">${music.getM_album() }</a>
							</div>
							<p>${music.getM_date().substring(0,10) }</p>
							<p>▶${music.getPlay_counts() }</p>
	                   </div>
	                   <p>가사</p>
	                   <p>댓글</p>
	               	</div>
	            </div>
            
            </div>
        </div>
    </section>
    
	
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>