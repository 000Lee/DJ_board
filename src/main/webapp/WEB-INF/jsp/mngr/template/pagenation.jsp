<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String linkUrl = request.getParameter("linkUrl");
	String codeGroupIdx = request.getParameter("codeGroupIdx");
	String boardUUID = request.getParameter("boardUUID");
	String gubun = request.getParameter("gubun");
	String productUUID = request.getParameter("productUUID");
	int searchType = request.getParameter("searchType") == null ? 0 : Integer.parseInt(request.getParameter("searchType"));
	int curPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
	int rowCount = request.getParameter("rowCount") == null ? 10 : Integer.parseInt(request.getParameter("rowCount"));
	String searchContent = request.getParameter("searchContent") == null ? "" : request.getParameter("searchContent");
%>     
<script type="text/javascript">
	function fn_pageMv(searchType, searchContent, page, rowCount){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<%= linkUrl %>");
		<% if(boardUUID != null && !"".equals(boardUUID)){ %>
		comSubmit.addParam("boardUUID","<%=boardUUID%>");
		<% }		%>
		<% if(gubun != null && !"".equals(gubun)){ %>
		comSubmit.addParam("gubun",<%=Integer.parseInt(gubun) %>);
		<% }		%>
		<% if(productUUID != null && !"".equals(productUUID)){ %>
		comSubmit.addParam("productUUID","<%=productUUID%>");
		<% }		%>
		<%if(codeGroupIdx != null && !"".equals(codeGroupIdx)){%>
		comSubmit.addParam("codeGroupIdx","<%=codeGroupIdx%>");
		<%}%>
		comSubmit.addParam("searchType",<%=searchType%>);
		comSubmit.addParam("searchContent","<%=searchContent%>");
		comSubmit.addParam("page",page);
		comSubmit.addParam("rowCount",rowCount);
		comSubmit.submit();
	}
</script>
<div class="row text-center">	  
<nav>
  <ul class="pagination">
	<c:if test="${pagenation.curPage > 1}">
	<li>
		<a href="#" onclick="fn_pageMv(<%=searchType%>, '<%=searchContent%>', ${pagenation.prevPage}, <%=rowCount%>); return false;" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
		</a>
	</li>
	</c:if>
	<c:if test="${pagenation.curPage > 1}">
	<li>
		<a href="#" onclick="fn_pageMv(<%=searchType%>, '<%=searchContent%>', 1, <%=rowCount%>); return false;" aria-label="First">
	    	<span aria-hidden="true">&lt;</span>
		</a>
	</li>
	</c:if>
	<c:forEach var="num" begin="${pagenation.blockBegin}" end="${pagenation.blockEnd}">
	<li <c:if test="${num == pagenation.curPage}">class="active"</c:if>>
		<a href="#" <c:if test="${num != pagenation.curPage}">onclick="fn_pageMv(<%=searchType%>, '<%=searchContent%>', ${num}, <%=rowCount%>); return false;" </c:if>>${num}</a>	
	</li>
	</c:forEach>
	<c:if test="${pagenation.curPage < pagenation.totalPage}">
	<li>
		<a href="#" onclick="fn_pageMv(<%=searchType%>, '<%=searchContent%>', ${pagenation.nextPage}, <%=rowCount%>); return false;" aria-label="Next">
			<span aria-hidden="true">&gt;</span>
		</a>
	</li>
	</c:if>
	<c:if test="${pagenation.curPage < pagenation.totalPage}">
	<li>
		<a href="#" onclick="fn_pageMv(<%=searchType%>, '<%=searchContent%>', ${pagenation.totalPage}, ${rowCount}); return false;" aria-label="Last">
			<span aria-hidden="true">&raquo;</span>
		</a>
	</li>
	</c:if>
  </ul>
</nav>		
</div>