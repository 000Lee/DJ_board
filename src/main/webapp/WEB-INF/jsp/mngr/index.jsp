<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="ADMIN INDEX" name="headerTitle"/>
	</jsp:include>
	<!-- 
	<%--<c:if test="${fn:length(popupList) > 0}">
	<script type="text/javascript">
		<c:forEach var="item" items="${popupList}">
		window.open('/popup.do?uuid=${item.bannerPopupUUID}', 'POPUP_${item.bannerPopupUUID}', "width=${item.bannerPopupWidth}, height=${item.bannerPopupHeight + 42}, top=${item.bannerPopupTop}, left=${item.bannerPopupLeft}, location=no");
		</c:forEach>
	</script>
	</c:if>--%>
	 -->
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
		</div>
	</div>
</body>
</html>