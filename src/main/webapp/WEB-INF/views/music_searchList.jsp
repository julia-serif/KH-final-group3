<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<c:set var="list" value="${searchMusicList }" />
		<c:set var="paging" value="${Paging }" />
		
		<h3>검색 결과 더미 페이지</h3>
		
		<table>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="music">
					<tr>
						<td> ${music.getM_name() } </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr> <td>검색된 음원이 없습니다.</td> </tr>
			</c:if>
		</table>
	</div>

</body>
</html>