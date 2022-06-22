<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp"></jsp:include>
	<c:set var="list" value="${List }" />
	<table border="3" cellspacing="0" width="600" bgcolor="white">
		<tr bgcolor="lightpink">
				<th>곡</th>
				<th>아티스트</th>
			</tr>
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="music">
				<tr>
					<td>${music.getM_name() }</td>
					<td>${music.getM_artist() }</td>
				</tr>
			</c:forEach>
		</c:if>
		</table>
	<jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>