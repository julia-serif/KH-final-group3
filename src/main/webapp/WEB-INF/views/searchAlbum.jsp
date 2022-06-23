<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				
					<c:set var="list" value="${searchMusicList }" />
					<c:set var="paging" value="${Paging }" />
					
					<div class="weeks-top-area mb-100">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                            <p>총 ${resultNum }건</p>
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
							<h6>앨범의 검색 결과가 없습니다.</h6>
						</c:if>
						
					</div>
				</div>
				
				<jsp:include page="/resources/include/search_widget.jsp"></jsp:include>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>