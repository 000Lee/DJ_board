<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}"/>  
		<div class="col-sm-3 col-md-2 sidebar">
		<c:choose>
			<c:when test="${fn:indexOf(path, '/user/') ne -1}">
			<ul class="nav nav-sidebar">
	            <li class="active">
	            	<a href="/mngr/user/list.do">사용자관리 <c:if test="${path eq '/mngr/user/list.do'}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
          	</ul>	
			</c:when>
			
			<c:when test="${fn:indexOf(path, '/auth/') ne -1}">
			<ul class="nav nav-sidebar">
				<li class="active">
	            	<a href="/mngr/auth/group/list.do">그룹관리 <c:if test="${path eq '/mngr/auth/group/list.do'}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
			</ul>
			</c:when>
			
			<c:when test="${fn:indexOf(path, '/menu/') ne -1 || fn:indexOf(path, '/content/') ne -1}">
			<ul class="nav nav-sidebar">
	        	<li <c:if test="${path eq '/mngr/menu/list.do'}">class="active"</c:if> >
	            	<a href="/mngr/menu/list.do">메뉴관리 <c:if test="${path eq '/mngr/menu/list.do'}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
	            
	            <li <c:if test="${path eq '/mngr/content/list.do'}">class="active"</c:if> >
	            	<a href="/mngr/content/list.do">컨텐츠 관리<c:if test="${path eq '/mngr/content/list.do'}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
          	</ul>
			</c:when>
			
			<c:when test="${fn:indexOf(path, '/board/') ne -1}">
			<ul class="nav nav-sidebar">
	            <li class="active">
	            	<a href="/mngr/board/list.do">게시판관리 <c:if test="${path eq '/mngr/board/list.do'}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
          	</ul>
			</c:when>
			
			<c:when test="${fn:indexOf(path, '/mngr/category/') ne -1}">
			<ul class="nav nav-sidebar">
	            <li class="active">
	            	<a href="/mngr/category/list.do">카테고리관리 <c:if test="${path eq '/mngr/category/list.do'}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
          	</ul>
			</c:when>
			
			<c:when test="${fn:indexOf(path, '/bannerpopup/') ne -1}">
			<ul class="nav nav-sidebar">
	            <li <c:if test="${fn:indexOf(path, '/bannerList') ne -1}">class="active"</c:if> >
	            	<a href="/mngr/bannerpopup/bannerList.do">배너관리 <c:if test="${fn:indexOf(path, '/bannerList') ne -1}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
				<li <c:if test="${gubun eq 'banner'}">class="active"</c:if> style="padding-left: 10px;">
					<a href="/mngr/bannerpopup/register.do?gubun=banner&mode=write">└ 배너등록 <c:if test="${gubun eq 'banner'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
	            <li <c:if test="${fn:indexOf(path, '/popupList') ne -1}">class="active"</c:if> >
	            	<a href="/mngr/bannerpopup/popupList.do">팝업관리 <c:if test="${fn:indexOf(path, '/popupList') ne -1}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
				<li <c:if test="${gubun eq 'popup'}">class="active"</c:if> style="padding-left: 10px;">
					<a href="/mngr/bannerpopup/register.do?gubun=popup&mode=write">└ 팝업등록 <c:if test="${gubun eq 'popup'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
          	</ul>
			</c:when>
			
			<c:when test="${(fn:indexOf(path, '/mngr/product/') ne -1) && (isAdmin || useProductMenu)}">
			<ul class="nav nav-sidebar">
	            <li <c:if test="${fn:indexOf(path, '/category/') ne -1 }">class="active"</c:if> >
	            	<a href="/mngr/product/category/list.do">상품카테고리관리 <c:if test="${fn:indexOf(path, '/category/') ne -1 }"><span class="sr-only">(current)</span></c:if></a>
	            </li>
	            <li <c:if test="${fn:indexOf(path, '/category/') eq -1}">class="active"</c:if> >
	            	<a href="/mngr/product/list.do">상품관리 ${gubun}<c:if test="${fn:indexOf(path, '/category/') eq -1}"><span class="sr-only">(current)</span></c:if></a>
	            </li>
          	</ul>
			</c:when>
			
			<c:when test="${fn:indexOf(path, '/code/') ne -1}">
			<ul class="nav nav-sidebar">
	            <li class="active">
	            	<a href="/mngr/code/group/list.do">코드관리<span class="sr-only">(current)</span></a>
	            </li>
          	</ul>
			</c:when>
			
		</c:choose>
        </div>