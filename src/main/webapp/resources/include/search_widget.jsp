<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="col-12 col-lg-3">
	<div class="blog-sidebar-area">
	
	    <!-- Widget Area -->
	    <div class="single-widget-area mb-30">
	        <div class="widget-title">
	            <h5>Categories</h5>
	        </div>
	        <div class="widget-content">
	            <ul>
	            	<li><a href="<%= request.getContextPath() %>/search.do?field=All&keyword=${keyword}">통합 검색</a></li>
	                <li><a href="<%= request.getContextPath() %>/search.do?field=Artist&keyword=${keyword}">아티스트</a></li>
	                <li><a href="<%= request.getContextPath() %>/search.do?field=Song&keyword=${keyword}">곡</a></li>
	                <li><a href="<%= request.getContextPath() %>/search.do?field=Album&keyword=${keyword}">앨범</a></li>
	                <li><a href="<%= request.getContextPath() %>/search.do?field=Video&keyword=${keyword}">동영상</a></li>
	                <li><a href="<%= request.getContextPath() %>/search.do?field=Lyrics&keyword=${keyword}">가사</a></li>
	            </ul>
	        </div>
	    </div>
	
	    <!-- Widget Area -->
	    <div class="single-widget-area mb-30">
	        <div class="widget-title">
	            <h5>HOT Album</h5>
	        </div>
	        <div class="widget-content">
	            <ul>
	                <li><a href="#">February 2018</a></li>
	                <li><a href="#">March 2018</a></li>
	                <li><a href="#">April 2018</a></li>
	                <li><a href="#">May 2018</a></li>
	                <li><a href="#">June 2018</a></li>
	            </ul>
	        </div>
	    </div>
	
	    <!-- Widget Area -->
	    <div class="single-widget-area mb-30">
	        <div class="widget-title">
	            <h5>실시간 차트</h5>
	        </div>
	        <div class="widget-content">
	            <ul class="tags">
	                <li><a href="#">music</a></li>
	                <li><a href="#">events</a></li>
	                <li><a href="#">artists</a></li>
	                <li><a href="#">press</a></li>
	                <li><a href="#">mp3</a></li>
	                <li><a href="#">videos</a></li>
	                <li><a href="#">concerts</a></li>
	                <li><a href="#">performers</a></li>
	            </ul>
	        </div>
	    </div>
	
	    <!-- Widget Area -->
	    <div class="single-widget-area mb-30">
	        <a href="#"><img src="resources/img/bg-img/add.gif" alt=""></a>
	    </div>
	
	    <!-- Widget Area -->
	      <div class="single-widget-area mb-30">
	          <a href="#"><img src="resources/img/bg-img/add2.gif" alt=""></a>
	      </div>
	
	  </div>
</div>