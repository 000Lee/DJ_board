<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE HTML>
<html lang="ko">
<jsp:include page="/WEB-INF/jsp/template/head.jsp" flush="false"/>

<link href="/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<%--<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="false"/>--%>

<style>
    #login-container {
        display: flex;
        justify-content:center;
        height:37vh;
    }

    #loginForm {
        width:210px;
        padding:50px 0 50px 0;
    }
    ol, ul {margin-top: 0; margin-bottom: 0;}
    .form-control { border-radius: 0;}
    .content-wrap {padding: 130px 0 170px 0;}
</style>

<body>
<div class="wrapper">
	<jsp:include page="/WEB-INF/jsp/template/header.jsp" flush="false"/>

	<section class="sub">
		<%--<div class="banner-wrap">
			<h2>관리</h2>
		</div>--%>
		<%--<div class="location-wrap"><div class="container"></div></div>--%>
		<div class="content-wrap">
			<div class="container">
				<%--<div class="title-box">
					<h3><span>관리자 로그인</span></h3>
				</div>--%>

				<div class="board-wrap">
					<div class="container" id="login-container">
						<div style="border: 3px solid black; padding: 15px;">
							<h2>Login</h2>
							<span style="display: block">(재)자동차융합기술원 홈페이지 관리자 페이지</span>
							<form id="loginFrm">
								<div class="justify-content-center align-items-center" id="loginForm" style="float:left;">
									<div class="form-group">
										<input type="text" class="form-control" name="userId" id="userId" onkeypress="if(window.event.keyCode==13){goCms()}" placeholder="사원명(ID)">
									</div>

									<div class="form-group">
										<input type="password" class="form-control" name="userPassword" id="userPassword" onkeypress="if(window.event.keyCode==13){goCms()}" placeholder="비밀번호">
									</div>
									<span>그룹웨어 아이디/패스워드 동일합니다.</span>
									<div class="form-group">
										<button type="button" class="btn btn-primary btn-block" id="btnLogin" onclick="goCms()" style="margin-top: 10px; padding-top: 10px; border-radius: 0;">로그인</button>
									</div>
								</div>
								<div style="float:right; margin: 60px 0 0 30px;">
									<img width="180" height="70" src="/images/loginJiat.png">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 관련배너모음 -->
		<%--<jsp:include page="/WEB-INF/jsp/template/banner.jsp" flush="false"/>--%>
		<!-- //관련배너모음 -->
	</section>
	<jsp:include page="/WEB-INF/jsp/template/foot.jsp" flush="false"/>
</div>

<script>
	$("#btnLogin").on("click", function(e){


	});

    function goCms(){
        if($("#userId").val() == 'admin' && $("#userPassword").val() == "Jiat2300@@"){
            //location.href = "/mngr/user/list.do";

            location.href = "/index.do";
            window.open("/mngr/user/list.do");

        }else{
            alert("로그인 실패");
        }
    }
</script>
</body>
</html>