<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>MNGR BOARD LIST</title>
<style type="text/css">
		ul {	
			list-style:none;
		}
		li {
			float: left;
		}
	</style>
</head>
<body>
	
	<ul>
	<c:if test="${pagenation.curPage > 1}">
		<li><a href="#">[처음]</a></li>
	</c:if>
	<c:if test="${pagenation.curPage > 1}">
		<li>
			<a href="#">[이전 ${pagenation.prevPage}]</a>
		</li>
	</c:if>
	<c:forEach var="num" begin="${pagenation.blockBegin}" end="${pagenation.blockEnd}">
		<li>
			<c:choose>
				<c:when test="${num == pagenation.curPage}">
					<span style="color:red">[${num}]</span>
				</c:when>
				<c:otherwise>
					<a href="#">[${num}]</a>
				</c:otherwise>
			</c:choose>
		</li>
	</c:forEach>
	<c:if test="${pagenation.curPage < pagenation.totalPage}">
		<a href="#">[다음 ${pagenation.nextPage} ]</a>
	</c:if>
	<c:if test="${pagenation.curPage < pagenation.totalPage}">
		<a href="#">${pagenation.totalPage }</a>
	</c:if>
	</ul>
</body>
</html>