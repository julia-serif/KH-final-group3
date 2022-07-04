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
            <p>Add to Playlist</p>
            <h2>플레이리스트에 넣기</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    
    <section>

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
							<ul>
								<li><span>곡명</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.getM_name() }</li>
								<li><span>아티스트</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.getM_artist() }</li>
								<li><span>앨범명</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.getM_album() }</li>
								<li><span>발매일</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.getM_date().substring(0,10) }</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    </c:if>
    </section>
    <br><br>
    <section>
    
    </section>
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>