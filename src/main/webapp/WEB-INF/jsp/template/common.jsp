<%--
  Created by IntelliJ IDEA.
  User: jsy
  Date: 2023-03-06
  Time: 오전 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
    <!-- 1990년 이후 이 페이지의 캐시를 만료시킴. -->
    <meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT" />
    <!-- 캐시를 바로 만료시킴. -->
    <meta http-equiv="Expires" content="-1" />
    <!-- 페이지 로드시마다 페이지를 캐싱하지 않음. (HTTP 1.0) -->
    <meta http-equiv="Pragma" content="no-cache" />
    <!-- 페이지 로드시마다 페이지를 캐싱하지 않음. (HTTP 1.1) -->
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="shortcut icon" href="/images/favicon.png" type="image/png">-->

    <title>JIAT</title>
    <!-- camtic/global에서 mngr/global로 변경
    <link rel="stylesheet" href="/css/camtic/global.css"/>-->
    <link rel="stylesheet" href="/css/mngr/global.css"/>
    <link rel="stylesheet" href="/css/camtic/common.css"/>
    <link rel="stylesheet" href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css">
    <link rel="stylesheet" href="/lib/Hover/hover.css">
    <link rel="stylesheet" href="/lib/fontawesome/css/font-awesome.css">
    <link rel="stylesheet" href="/lib/weather-icons/css/weather-icons.css">
    <link rel="stylesheet" href="/lib/ionicons/css/ionicons.css">
    <link rel="stylesheet" href="/lib/jquery-toggles/toggles-full.css">
    <link rel="stylesheet" href="/lib/morrisjs/morris.css">
    <link rel="stylesheet" href="/lib/timepicker/jquery.timepicker.css">

    <!--원본-->
    <%--<link rel="stylesheet" href="/css/quirk.css">
    <link rel="stylesheet" href="/css/style.css">--%>


    <script src="/lib/modernizr/modernizr.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/lib/html5shiv/html5shiv.js"></script>
    <script src="/lib/respond/respond.src.js"></script>
    <![endif]-->

   <%-- <script src="/lib/jquery/jquery.js"></script>
    <script src="/lib/jquery-ui/jquery-ui.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.js"></script>
    <script src="/lib/jquery-toggles/toggles.js"></script>

    <script src="/lib/raphael/raphael.js"></script>

    <script src="/lib/flot/jquery.flot.js"></script>
    <script src="/lib/flot/jquery.flot.resize.js"></script>
    <script src="/lib/flot-spline/jquery.flot.spline.js"></script>

    <script src="/lib/jquery-knob/jquery.knob.js"></script>--%>


   <%-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>--%>

    <!-- Theme -->
<%--    <link rel="stylesheet" type="text/css" href="<c:url value='/css/kendoui/kendo.silver.min.css' />" />--%>

 <!--kendo ui js / ckEditor 2023-10-04 김병수 추가 -->
 <!--Kendo ui js -->
<script type="text/javascript" src="<c:url value='/js/kendoui/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/kendoui/kendo.all.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/kendoui/cultures/kendo.culture.ko-KR.min.js'/>"></script>
<link rel="stylesheet" href="/css/kendoui/kendo.default-main.min.css"/>
<link rel="stylesheet" href="/css/kendoui/kendo.common.min.css"/>
<link rel="stylesheet" href="/css/kendoui/kendo.default.min.css"/>
<%--<link rel="stylesheet" href="/css/style.css"/>--%>

<!-- ckEditor -->
<script type="text/javascript" src="<c:url value='/js/ckEditor/ckeditor.js'/>"></script>

<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/global.js'/>"></script></head>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jiat/common/acUtil.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/kendoui/kendo.all.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jiat/common/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/kendoui/cultures/kendo.culture.ko-KR.min.js'/>"></script>

<script type="text/javascript"> (function(c,l,a,r,i,t,y){ c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)}; t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i; y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y); })(window, document, "clarity", "script", "i52q5tuh3c"); </script>

    <script type="text/javascript" src="<c:url value='/js/jiat/common/fCommon.js?${toDate}'/>"></script>

    <script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/jiat/common/acUtil.js'/>"></script>
    <script>
        sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
        _g_contextPath_ = "${pageContext.request.contextPath}";
        function getContextPath() {
            return sessionStorage.getItem("contextpath");
        }
    </script>


</head>
<body>
<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>