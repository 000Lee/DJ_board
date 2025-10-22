<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= request.getParameter("headerTitle") == null ? "" : request.getParameter("headerTitle") %></title>

<link href="/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
<link href="/datepicker/css/datepicker.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="/bootstrap/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/datepicker/locales/bootstrap-datepicker.kr.js"></script>
<link rel="stylesheet" href="/css/kendoui/kendo.default-main.min.css"/>
<link rel="stylesheet" href="/css/kendoui/kendo.common.min.css"/>
<link rel="stylesheet" href="/css/kendoui/kendo.default.min.css"/>
<script type="text/javascript" src="<c:url value='/js/kendoui/cultures/kendo.culture.ko-KR.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/kendoui/kendo.all.min.js'/>"></script>
<%--<link href="/css/mngr/login.css" type="text/css" rel="stylesheet"/>--%>
<link href="/css/mngr/layout.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="/js/mngr/common.js"></script>
<link href="/css/mngr/global.css" type="text/css" rel="stylesheet"/>