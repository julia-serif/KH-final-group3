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
<script type="text/javascript">
	function make_bold(input) {
		var keyword = "${keyword}";
		var pattern = new RegExp('([' + keyword + '|\\s]+)', 'gm');
		return input.trim().replace(pattern, "<b>$1</b>");
	}
	
	function visit_text(html, visitor) {
		var output = '';
		var idx = 0;
		while (true) {
			var s = html.indexOf('<', idx);
			if (s == -1)
				break;
			var e = html.indexOf('>', s+1);
			if (e == -1)
				break;
			output += visitor(html.substring(idx, s));
			output += html.substring(s, ++e);
			idx = e;
			}
		return output;
	}
	
	function make_keyword_bold() {
		var items = document.getElementsByClassName('col-12 col-lg-9');
		for (var i = 0; i < items.length; i++) {
			items[i].innerHTML = visit_text(items[i].innerHTML, make_bold);
		}
	}
	
	function on_load() {
		make_keyword_bold();
	}
	
</script>
<body onload="on_load()">
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
					
					<div class="new-hits-area mb-50">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                            <p>총 ${resultNum }건</p>
                            <h2>곡</h2>
                        </div>
                        
                        <c:if test="${!empty list }">
							<c:forEach items="${list }" var="music">
		                        <!-- Single Top Item -->
		                        <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="100ms">
		                            <div class="first-part d-flex align-items-center">
		                                <div class="thumbnail">
		                                	<a href="<%= request.getContextPath() %>/music_cont.do?m_no=${music.getM_no() }">
		                                    	<img src="<%= request.getContextPath() %>/resources/img/album-img/${music.getM_image() }" alt="${music.getM_album() } 앨범 재킷">
	                                    	</a>
		                                </div>
		                                <div class="content-">
		                                    <a href="<%= request.getContextPath() %>/music_cont.do?m_no=${music.getM_no() }">
		                                    	<h6>${music.getM_name() }</h6>
	                                    	</a>
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
							<h6>검색된 음원이 없습니다.</h6>
						</c:if>
						
					</div>
					
					<div align="center">
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
				
				<jsp:include page="/resources/include/search_widget.jsp"></jsp:include>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>