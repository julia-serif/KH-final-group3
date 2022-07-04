<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-12 col-lg-3">
	<div class="blog-sidebar-area">
	
	    <!-- Widget Area -->
	    <div class="single-widget-area mb-30">
	        <div class="widget-title">
	            <h5>Categories</h5>
	        </div>
	        <div class="widget-content">
	            <ul>
	            	<li>
		            	<c:if test="${field == 'All' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=All&keyword=${keyword}" style="font-weight: 900">통합 검색</a>
		            	</c:if>
		            	<c:if test="${field != 'All' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=All&keyword=${keyword}">통합 검색</a>
		            	</c:if>
	            	</li>
	            	
	                <li>
	                	<c:if test="${field == 'Artist' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Artist&keyword=${keyword}" style="font-weight: 900">아티스트</a>
		            	</c:if>
		            	<c:if test="${field != 'Artist' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Artist&keyword=${keyword}">아티스트</a>
		            	</c:if>
	                </li>
	                
	                <li>
	                	<c:if test="${field == 'Song' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Song&keyword=${keyword}" style="font-weight: 900">곡</a>
		            	</c:if>
		            	<c:if test="${field != 'Song' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Song&keyword=${keyword}">곡</a>
		            	</c:if>
	                </li>
	                
	                <li>
	                	<c:if test="${field == 'Album' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Album&keyword=${keyword}" style="font-weight: 900">앨범</a>
		            	</c:if>
		            	<c:if test="${field != 'Album' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Album&keyword=${keyword}">앨범</a>
		            	</c:if>
	                </li>
	                
	                <li>
	                	<c:if test="${field == 'Video' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Video&keyword=${keyword}" style="font-weight: 900">동영상</a>
		            	</c:if>
		            	<c:if test="${field != 'Video' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Video&keyword=${keyword}">동영상</a>
		            	</c:if>
	                </li>
	                
	                <li>
	                	<c:if test="${field == 'Lyrics' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Lyrics&keyword=${keyword}" style="font-weight: 900">가사</a>
		            	</c:if>
		            	<c:if test="${field != 'Lyrics' }">
		            		<a href="<%= request.getContextPath() %>/search.do?field=Lyrics&keyword=${keyword}">가사</a>
		            	</c:if>
	                </li>
	            </ul>
	        </div>
	    </div>
	
	    <!-- Widget Area -->
	    <div class="single-widget-area mb-30">
	        <div class="widget-title">
	            <h5>TOP 10</h5>
	        </div>
	        <div class="widget-content">
	        	<c:set var="toplist" value="${topList}"/>
	        	<c:if test="${! empty toplist }">
		            <ul>
		            	<c:forEach items="${toplist}" var="top">
		            		<li><a href="#">${top.m_name}</a></li>
		            	</c:forEach>
		            </ul>
	            </c:if>
	        </div>
	    </div>
	
	    <!-- Widget Area -->
	    <div class="single-widget-area mb-30">
	        <div class="widget-title">
	            <h5>급상승 검색어</h5>
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