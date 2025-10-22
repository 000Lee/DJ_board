<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	/*.navbar-nav li a{margin-left: 80px;}
	.navbar-right li a{margin:0;}*/
</style>

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Egov CMS</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="/mngr/user/list.do">사용자관리</a></li>
						<li><a href="/mngr/auth/group/list.do">권한관리</a></li>
						<li><a href="/mngr/menu/list.do">메뉴관리</a></li>
						<li><a href="/mngr/board/list.do">게시판관리</a></li>
						<%--<li><a href="/mngr/category/list.do">카테고리관리</a></li>--%>
						<li><a href="/mngr/bannerpopup/bannerList.do">배너팝업관리</a></li>
						<%--<c:if test="${isAdmin || useProductMenu }">
						<li><a href="/mngr/product/category/list.do">상품관리</a></li>
						</c:if>--%>
						<%--<li><a href="/mngr/code/group/list.do">코드관리</a></li>--%>
					</ul>
				  
				  	<ul class="nav navbar-nav navbar-right">
						<li><a href="#">자동차융합기술원</a></li>
						<li><a href="/index.do">logout</a></li>
				  	</ul>
				</div>
			</div>
		</nav>