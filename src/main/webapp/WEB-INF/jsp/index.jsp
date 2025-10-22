<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML>
<html lang="ko">
<jsp:include page="/WEB-INF/jsp/template/head.jsp" flush="false"/>
<style>
	.width49per{width:49%;}

    .btn_today_close {
        width: 100%;
        height: 30px;
        background-color: #333;
        text-align: center;
        color: #fff;
        font-size: 14px;
        display: block;
    }
    #tcSpan {
        display: block;
        line-height: 30px;
        vertical-align: bottom;
        opacity: 0.8;
        margin-right: 20px;
    }
    .tcA{
        color: #fff;
        font-size: 14px;
    }

    .rayer {
        position: fixed;
        z-index : 9999;

    }
    .rayer .pop {
	    margin: 0;
        background: #fff;
    }

    .rayer .pop input[type=checkbox] { -webkit-appearance: checkbox; }
    .rayer .pop input[type=checkbox]:before { display: none; }
</style>

<body>
<div class="wrapper">
	<jsp:include page="/WEB-INF/jsp/template/header.jsp" flush="false"/>

	<section>
		<div class="main-wrap">
			<div class="main-wrap-00">
				<div class="swiper-container swiper00">
					<ul class="swiper-wrapper">
						<li class="swiper-slide" style="background-image:url('/asset/images/img_main_slide_01.png');">
							<div class="txt">
								<h2>미래차</h2>
								<p>
									생태계 조성으로<br>
									<small><b>친환경 · 스마트</b><br>모빌리티산업 진흥</small>
								</p>
							</div>
						</li>
						<li class="swiper-slide" style="background-image:url('/asset/images/img_main_slide_04.png');">
							<div class="txt">
								<h2>미래차</h2>
								<p>
									생태계 조성으로<br>
									<small><b>친환경 · 스마트</b><br>모빌리티산업 진흥</small>
								</p>
							</div>
						</li>
						<li class="swiper-slide" style="background-image:url('/asset/images/img_main_slide_02.png');">
							<div class="txt">
								<h2>미래차</h2>
								<p>
									생태계 조성으로<br>
									<small><b>친환경 · 스마트</b><br>모빌리티산업 진흥</small>
								</p>
							</div>
						</li>
						<li class="swiper-slide" style="background-image:url('/asset/images/img_main_slide_03.png');">
							<div class="txt">
								<h2>미래차</h2>
								<p>
									생태계 조성으로<br>
									<small><b>친환경 · 스마트</b><br>모빌리티산업 진흥</small>
								</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="swiper-control" style="padding-left: 20%;">
					<ul>
						<li class="active"><a href="javascript:;" onclick="swiperChange(0);"><p>사업관리 시스템</p></a></li>
						<li><a href="javascript:" onclick="swiperChange(1);"><p>시설 임대 시스템</p></a></li>
						<li><a href="javascript:" onclick="swiperChange(2);"><p>시험 장비 시스템</p></a></li>
					</ul>
				</div>
			</div>

			<!-- 게시판 -->
			<div class="main-wrap-01">
				<div class="left-box">
					<h2>정보마당</h2>
					<div class="tab">
						<ul>
							<li class="li_notice active"><a href="javascript:void(0);" onclick="getList('notice');">공지사항</a></li>
							<li class="li_business"><a href="javascript:void(0);" onclick="getList('business');">사업공고</a></li>
							<li class="li_employment"><a href="javascript:void(0);" onclick="getList('employment');">채용공고</a></li>
						</ul>
					</div>
					<div class="list">
						<ul class="listUl">
							<li>
								<a href="#">
									<span>공지사항</span>
									<p>제안서 평가결과 공개_전북<br>뿌리산업 종합발전계획 연구용역 제안서 평가결과 공개_전북<br>뿌리산업 종합발전계획 연구용역</p>
									<time>2023-05-22</time>
								</a>
							</li>
							<li>
								<a href="#">
									<span>공지사항</span>
									<p>제안서 평가결과 공개_전북<br>뿌리산업 종합발전계획 연구용역 제안서 평가결과 공개_전북<br>뿌리산업 종합발전계획 연구용역</p>
									<time>2023-05-22</time>
								</a>
							</li>
							<li>
								<a href="#">
									<span>공지사항</span>
									<p>제안서 평가결과 공개_전북<br>뿌리산업 종합발전계획 연구용역 제안서 평가결과 공개_전북<br>뿌리산업 종합발전계획 연구용역</p>
									<time>2023-05-22</time>
								</a>
							</li>
						</ul>
					</div>
					<div class="more">
						<a href="javascript:void(0);" onclick="goBoard();">전체보기</a>
					</div>
				</div>
				<div class="right-box">
					<div class="flex">
					<div class="width49per">
						<h2 class="mt60">JIAT POPUP</h2>
						<div class="swiper-container swiper01">
							<ul id="popupSwiper" class="swiper-wrapper">
								<%--<li class="swiper-slide">
									&lt;%&ndash;<h2 style="margin: 0 0 70px;">JIAT POPUP</h2>
                                    <a style="color: #f5f8ff; font-size:20px; margin: 0 0 40px;"></a>&ndash;%&gt;
									<a href="javascript:void(0)" onclick="goPopup(1);">
										<div class="list-image" style="background-image:url('/asset/images/jiat_popup.jpg'); background-position: top; background-size: cover; padding-bottom: 70%"></div>
									</a>
								</li>
								<li class="swiper-slide">
									<a href="javascript:void(0)" onclick="goPopup(2);">
										<div class="list-image" style="background-image:url('/asset/images/jiat_popup2.png'); background-position: top; background-size: cover; padding-bottom: 70%"></div>
									</a>
								</li>
								<li class="swiper-slide">
                                    <a href="javascript:void(0)" onclick="goPopup(3);">
                                        <div class="list-image" style="background-image:url('/asset/images/jiat_popup3.png'); background-position: bottom; background-size: cover; padding-bottom: 70%"></div>
                                    </a>
                                </li>
								<li class="swiper-slide">
									<a href="javascript:void(0)" onclick="goPopup(4);">
										<div class="list-image" style="background-image:url('/asset/images/jiat_popup4.png'); background-position: bottom; background-size: cover; padding-bottom: 70%"></div>
									</a>
								</li>--%>
							</ul>
						</div>
						<div class="swiper-control">
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<div class="width49per">
						<div class="main-wrap-07">
							<div class="container">
								<div class="sub-title">
									<h2>산업기술정보서비스<br>상용차 글로벌 산업동향</h2>
								</div>
								<div class="inner">
									<div class="inner-banner">
										<a href="/board/noamal/commonBoard.do?categoryKey=global">
											<div class="left-box" style="background:#2d3849;">
												<small>산업기술정보서비스</small>
												<strong>상용차<br>글로벌<br>산업동향</strong>
												<p>Vol.66</p>
											</div>
											<div class="right-box1">
												<img src="/asset/images/img_main_07_01.png">
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
			<!-- //게시판 -->

			<!-- 자주찾은메뉴 & 시설안내 -->
			<div class="main-wrap-02">
				<div class="list-top">
					<div class="container">
						<div class="inner active">
							<h3>
								<%--<strong>자주 찾은 메뉴1</strong>--%>
								<small>자주 방문하시는 메뉴를 모아 안내합니다.</small>
							</h3>
							<ul>
								<li><a href="/department01.do"><p>연구개발</p></a></li>
								<li><a href="/department02.do"><p>지원사업</p></a></li>
								<%--<li><a href="/facility01_2.do"><p>장비이용신청</p></a></li>--%>
								<li><a href="/facility02.do"><p>입주신청</p></a></li>
								<li><a href="/facility03.do"><p>임대신청</p></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="list-bottom">
					<div class="left-box">
						<div class="inner active">
							<h2>JIAT 시설안내</h2>
							<div class="txt">
								<h3>(재)자동차융합기술원 본원</h3>
								<p>본원의 시설로는 본관동, 연구실험동, 시험평가 1ㆍ2ㆍ3동, 기술지원동, 특장차자가인증검사지원동, 상용차부품R&D센터, 동력성능평가동이 있습니다.</p>
							</div>
							<ul>
								<li>전북 군산시 동장산2길 6 (소룡동 1641-4번지) (군산국가산업단지 내)</li>
								<li>063)472-2300 </li>
							</ul>
							<div class="btn">
								<a href="/facility01.do">자세히보기</a>
								<a style="color: white; border: 0;"></a>
							</div>
						</div>
						<div class="inner">
							<h2>JIAT 시설안내</h2>
							<div class="txt">
								<h3>금형비즈니스프라자(분원)</h3>
								<p>전북금형비즈니스프라자는 본관동, 가공지원동, 협업동(기업입주), Try-Out동 및 자동차 품질인증부품 지원센터로 구성되어 있습니다.</p>
							</div>
							<ul>
								<li>전북 군산시 산단로 42(오식도동 814-4번지)</li>
								<li>063)472-2373</li>
							</ul>
							<div class="btn">
								<a href="/facility01_2.do">자세히보기</a>
								<a href="http://jmold.jiat.re.kr ">예약하기</a>
							</div>
						</div>
						<div class="inner">
							<h2>JIAT 시설안내</h2>
							<div class="txt">
								<h3>새만금주행시험장(SMPG)</h3>
								<p>새만금주행시험장(SMPG) 시험로는 상용고속주회로, 종합시험로와 원선회로, 저마찰로, ISO소음시험로, 등판로, 내구시험로로 구성되어 있습니다.</p>
							</div>
							<ul>
								<li>전라북도 군산시 옥구읍 어은리 5-10</li>
								<li>063)730-7012</li>
							</ul>
							<div class="btn">
								<a href="/facility01_3.do">자세히보기</a>
								<a href="http://smpg.jiat.re.kr ">예약하기</a>
							</div>
						</div>
						<div class="inner">
							<h2>JIAT 시설안내</h2>
							<div class="txt">
								<h3>완주 분원</h3>
								<p>완주 분원은 뿌리특화단지 수출지원동과 금형 시험생산 지원센터로 구성되어 있습니다.</p>
							</div>
							<ul>
								<li>전북 완주군 봉동읍 우동로 28(완주테크노밸리)</li>
								<li>063)714-3900</li>
							</ul>
							<div class="btn">
								<a href="/facility01_4.do">자세히보기</a>
								<a href="http://jmold.jiat.re.kr ">예약하기</a>
							</div>
						</div>
					</div>
					<div class="right-box">
						<div class="swiper-container swiper02">
							<ul class="swiper-wrapper">
								<li class="swiper-slide" style="background-image:url('/asset/images/img_main_03_01.jpg');"></li>
								<li class="swiper-slide" style="background-image:url('/asset/images/img_main_03_02.jpg');"></li>
								<li class="swiper-slide" style="background-image:url('/asset/images/img_main_03_03.jpg');"></li>
								<li class="swiper-slide" style="background-image:url('/asset/images/img_main_03_04.jpg');"></li>
							</ul>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
			<!-- //자주찾은메뉴 & 시설안내 -->

			<!-- 기업지원사업 -->
			<div class="main-wrap-05">
				<div class="container">
					<div class="sub-title mb50 mb-lg-20">
						<h2>기업지원사업</h2>
						<p>자동차산업 육성을 위한 전략적 지원과 중소기업의 경쟁력 강화를 지원합니다.</p>
					</div>
					<%--<div class="list-top">
						<ul class="list">
							<li><a href="/department02.do">부품신뢰성향상<br>지원사업</a></li>
							<li><a href="">뿌리기업 그린환경<br>시스템 구축</a></li>
							<li><a href="">글로벌 빅바이어<br>연계 수출기업화 촉진</a></li>
							<li><a href="">수출전략형 미래그린<br>상용차 연구개발</a></li>
							<li><a href="">연구장비<br>공동이용사업</a></li>
						</ul>
					</div>--%>
					<div class="list-bottom">
						<strong>지원사업공고</strong>
						<div class="list-bottom-inner">
							<ul class="list" id="businessList">
								<li>
									<a href="/https://pms.jiat.re.kr/">
										<p>2023년도 상용차산업 혁신성장 기업지원사업 공고(3차)</p>
										<time>2023-06-23</time>
									</a>
								</li>
								<li>
									<a href="/https://pms.jiat.re.kr/">
										<p>전북 군산형 일자리 전기차 생산 기술고도화 지원사업 전북 군산형 일자리 전기차 생산 기술고도화 지원사업</p>
										<time>2023-06-23</time>
									</a>
								</li>
							</ul>
							<a href="/board/noamal/commonBoard.do?categoryKey=business" class="more">더보기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- //기업지원사업 -->

			<!-- 예약시스템검색 -->
			<%--<div class="main-wrap-06">
				<div class="container">
					<div>
						<small>회의실 예약을 빠르게!</small>
						<b>시설 · 장비 임대 <strong>예약시스템</strong></b>
					</div>
					<form>
						<input type="text" placeholder="시설명을 검색해주세요" onkeydown="goPage(event);">
						<a href="/facility03.do" class="submit">검색</a>
					</form>
				</div>
			</div>--%>
			<!-- //예약시스템검색 -->

			<!-- JIAT 서비스 -->
			<div class="main-wrap-07">
				<div class="container">
					<div class="sub-title">
						<h2>JIAT 서비스</h2>
					</div>
					<div class="inner">
						<%--<div class="inner-banner">
							<a href="/board/noamal/commonBoard.do?categoryKey=global">
								<div class="left-box">
									<small>산업기술정보서비스</small>
									<strong>상용차<br>글로벌<br>산업동향</strong>
									<p>Vol.66</p>
								</div>
								<div class="right-box">
									<img src="/asset/images/img_main_07_01.png">
								</div>
							</a>
						</div>--%>
						<div class="inner-board">
							<ul>
								<li class="top bg1">
									<a href="/facility02.do" class="list-box">
										<div class="list-head">
											<h3 class="fontsizeMobile">입주 안내</h3>
										</div>
										<div class="list-body">
											<p>성장 잠재력이 우수한 기업을 대상으로<br>입주공간 등을 지원하고 있습니다.</p>
										</div>
									</a>
								</li>
								<li class="top bg2">
									<a href="/facility04.do" class="list-box">
										<div class="list-head">
											<h3 class="fontsizeMobile">견학 안내</h3>
										</div>
										<div class="list-body">
											<p>방문객에게 최상의 서비스를 지원하기 위해<br>노력하고 있으며, 단체/개인 견학을 환영합니다.</p>
										</div>
									</a>
								</li>
								<li class="top bg3">
									<a href="mailto:jiat@jiat.re.kr" class="list-box">
										<div class="list-head">
											<h3 class="fontsizeMobile1">고객의 소리</h3>
										</div>
										<div class="list-body">
											<p>항상 고객님의 목소리에 귀를<br>기울이고 있습니다.</p>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- //JIAT 서비스 -->

			<!-- 관련배너모음 -->
			<jsp:include page="/WEB-INF/jsp/template/banner.jsp" flush="false"/>
			<!-- //관련배너모음 -->
	</section>
	<jsp:include page="/WEB-INF/jsp/template/foot.jsp" flush="false"/>
</div>
<div id="rayer-background" >
	<%--<div id="rayer">
		<div class="pop">
			<div class="content" style="height: 100%;display: flex;flex-direction: column;">
				<a id="imgA" style="background-image: url('/asset/images/logo.png'); background-size: 100% 100%; display: block; width: 100%;height: 100%"></a>
			</div>
			<p class="btn_today_close" style="text-align: right; margin: 0;">
			    <span id="tcSpan" style="letter-spacing: 5px;">
				    <input type="checkbox" style="vertical-align: middle;" id="popupCloseCheck" onclick="closePopup()" />
				    <span style="vertical-align: middle;">오늘 하루 열지 않음</span>
			        <a href="" class="tcA" style="vertical-align: middle;" onClick="rayerClose()">닫기</a>
			    </span>
			</p>
		</div>
	</div>--%>
</div>

<script>
	var categoryKey = "notice";
	var categoryName = "공지사항";

    var data = {
        category : "notice"
    }
    var resultData;
    var resultBannerPopup;
    var resultBusinessData;

	$(function () {
        fnDefaultScript();
        fnDefaultBusinessScript();

        drawTable();
        drawBusinessTable();

        popupSwiper();
        /** 메인페이지 JIAT POPUP CUSTOM */
        var swiper01 = new Swiper(".swiper01", {
            slidesPerView: 1,
            spaceBetween: 300,
            loop: true,
            autoplay: {
                delay: 3500,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".main-wrap-01 .swiper-pagination",
            },
            breakpoints: {
                1000: {
                    slidesPerView: 1,
                    spaceBetween: 10,
                },
                800: {
                    slidesPerView: 1,
                    spaceBetween: 20,
                },
            },
        });

		/*$("#rayer-background div").hide();*/
	});

    function fnDefaultScript() {
        $.ajax({
            url : '/main/getMainList.do',
            type : 'POST',
            data: data,
            dataType : "json",
            async: false,
            success: function(rs) {
                resultData = rs.list;
                resultBannerPopup = rs.list2;
            }
        });
    }

    function fnDefaultBusinessScript() {
        $.ajax({
            url : '/main/getMainList.do',
            type : 'POST',
            data: {
                category : "business"
            },
            dataType : "json",
            async: false,
            success: function(rs) {
                resultBusinessData = rs.list;
            }
        });
    }

    //게시글 리스트 그리기
    function drawTable() {
        //const tableBody = document.getElementById("tableBody");
        $(".listUl").html('');

        let html = "";

        resultData.forEach((item, index) => {

            html += "<li><a>";

            html += '<span>'+ categoryName +'</span>';
            html += '<p style="cursor: pointer;" onclick="fn_detailBoard('+item.BOARD_ARTICLE_ID+',\''+item.BOARD_CATEGORY_ID+'\')">'+ item.BOARD_ARTICLE_TITLE +'</p>';
            html += '<time>'+ item.WRITE_DATE +'</time>';

            html += '</a></li>';
        });

        /*tableBody.innerHTML = html;*/
        $(".listUl").append(html);
    }
    //팝업 슬라이드 그리기
    function popupSwiper() {
        //const tableBody = document.getElementById("tableBody");
        $("#popupSwiper").html('');

        let html = "";

        resultBannerPopup.forEach((item, index) => {
            html += "<li class='swiper-slide'>";

            html += '<a href="javascript:void(0)" onclick="goPopup('+ item.uuid +')">';
            html += '<div class="list-image" style="background-image: url(' + item.filePath + item.fileMask + '); background-position: top; background-size: cover; padding-bottom: 70%;"></div>';
            //html += '<div class="list-image" style="background-image: url(/asset/images/jiat_popup4.png); background-position: top; background-size: cover; padding-bottom: 70%;"></div>';


            html += "</a></li>";
        });

        /*tableBody.innerHTML = html;*/
        $("#popupSwiper").append(html);
    }

    function drawBusinessTable() {
        //const tableBody = document.getElementById("tableBody");
        $("#businessList").html('');

        let businessHtml = "";

        resultBusinessData.forEach((item, index) => {

            businessHtml += "<li><a>";

            businessHtml += '<p style="cursor: pointer;" onclick="fn_detailBoard('+item.BOARD_ARTICLE_ID+',\''+item.BOARD_CATEGORY_ID+'\')">'+ item.BOARD_ARTICLE_TITLE +'</p>';
            businessHtml += '<time>'+ item.WRITE_DATE +'</time>';

            businessHtml += '</a></li>';
        });

        /*tableBody.innerHTML = html;*/
        $("#businessList").append(businessHtml);
    }

    //상세보기 이동
    function fn_detailBoard(key,categoyKey){

        location.href="/board/noamal/view.do?boardArticleId=" + key + "&category=" + categoyKey;
    }

    function getList(key){
        data.category = key;
        if(key == 'notice'){
            categoryName = '공지사항';
        }else if(key == 'business'){
            categoryName = '사업공고';
        }else if(key == 'employment'){
            categoryName = '채용공고';
        }
        $(".li_notice").removeClass("active");
        $(".li_business").removeClass("active");
        $(".li_employment").removeClass("active");

        $(".li_"+key).addClass("active");
        fnDefaultScript();
        drawTable();
    }

    function goBoard() {

        location.href = '/board/noamal/commonBoard.do?categoryKey=' + data.category;
    }

    function goPage(event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Enter 키의 기본 동작 방지
            location.href = '/facility03.do';
        }
    }

    // 쿠키 가져오기
    var getCookie = function (cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
        }
        return "";
    }

    window.onload = function (){
		for(var x=0; x < resultBannerPopup.length; x++){

            if(resultBannerPopup[x].bannerPopupGubun == 1) {
                openPopup(
                    resultBannerPopup[x].uuid, resultBannerPopup[x].bannerPopupTitle,
                    "scrollbar=no" + ",width=" + resultBannerPopup[x].bannerPopupWidth + ",height=" + resultBannerPopup[x].bannerPopupHeight +
                    ",top=" + resultBannerPopup[x].bannerPopupTop + ",left=" + resultBannerPopup[x].bannerPopupLeft
                );
            }else{
                rayerPopup(resultBannerPopup[x]);
            }

            console.log( resultBannerPopup[x].uuid, resultBannerPopup[x].bannerPopupTitle,
                "scrollbar=no" + ",width=" + resultBannerPopup[x].bannerPopupWidth+",height=" + resultBannerPopup[x].bannerPopupHeight +
                ",top=" + resultBannerPopup[x].bannerPopupTop + ",left="+resultBannerPopup[x].bannerPopupLeft);
		}
    };

    var openPopup = function(popId, popupName,style) {
        var cookieValue = getCookie("popupClosed_" + popId);
        if (cookieValue !== "true") {
            window.open(
                '/mainPop.do?popId=' + popId,
                popupName,
                style
            );
        }
    };

    //팝업 슬라이드 바로가기
    function goPopup(id) {
        for(var x=0; x < resultBannerPopup.length; x++){
            if(resultBannerPopup[x].uuid == id) {
                if (resultBannerPopup[x].bannerPopupGubun == 1) {
                    window.open(
                        '/mainPop.do?popId=' + resultBannerPopup[x].uuid
                        , resultBannerPopup[x].bannerPopupTitle
                        , "scrollbar=no" + ",width=" + resultBannerPopup[x].bannerPopupWidth + ",height=" + resultBannerPopup[x].bannerPopupHeight +
                        ",top=" + resultBannerPopup[x].bannerPopupTop + ",left=" + resultBannerPopup[x].bannerPopupLeft
                    );
                }else{
                    rayerPopup(resultBannerPopup[x]);
                }
            }
        }

    }

    function rayerPopup(data){

        if(getRayerCookie("rayer"+data.uuid) == 'Y'){
            return false;
        }
        var link = "";

        if(data.bannerPopupLink != ""){
            link = data.bannerPopupLink;
        }
        let html = '';

        html += '<div id="rayer'+data.uuid+'" class="rayer" style="top:'+data.bannerPopupTop+'px; left:'+data.bannerPopupLeft+'px;">';
	        html += '<div class="pop" style="width:'+data.bannerPopupWidth+'px; height:'+data.bannerPopupHeight+'px;">';
		        html += '<div class="content" style="height:100%;display:flex;flex-direction:column;">';
                if(link == ""){
		            html += '<a id="imgA" style="background-image: url('+data.filePath+''+data.fileMask+'); background-size: 100% 100%; display: block; width: 100%;height: 100%" />';
                }else{
                    if(data.bannerPopupTarget == 1) {
                        html += '<a href="' + link + '" target="_self" id="imgA" style="background-image: url(' + data.filePath + '' + data.fileMask + '); background-size: 100% 100%; display: block; width: 100%;height: 100%" />';
                    }else{
                        html += '<a href="' + link + '" target="_blank" id="imgA" style="background-image: url(' + data.filePath + '' + data.fileMask + '); background-size: 100% 100%; display: block; width: 100%;height: 100%" />';
                    }
                }
		        html += '<div>';
		        html += '<p class="btn_today_close" style="text-align:right;margin:0;">';
			        html += '<span id="tcSpan" style="letter-spacing:5px;">';
			        html += '<input type="checkbox" style="vertical-align:middle;" id="popupCloseCheck" onclick="rayerDayClose('+data.uuid+')">';
			        html += '<span style="vertical-align:middle;margin-right:15px;">오늘 하루 열지 않음</span>';
			        html += '<a href="" class="tcA" style="vertical-align:middle;" onclick="rayerClose('+data.uuid+');">닫기</a>';
			        html += '</span>';
		        html += '</p>';
	        html += '</div>';
        html += '</div>';

        $("#rayer-background").append(html);

        $("#rayer"+data.uuid).show();
    }

    //레이어 팝업 닫기
    function rayerClose(e){
        event.preventDefault(); // 새로고침 방지
        $("#rayer"+e).hide();
    }

    //레이어 팝업 하루종일 닫기
    function rayerDayClose(key){
        setRayerCookie('rayer'+key, 'Y', 1);

        $("#rayer"+key).hide();
    }

    //레이어 팝업 쿠키 set
    function setRayerCookie(name, value, expiredays) {
        var today = new Date();
        today.setDate(today.getDate() + expiredays);
        document.cookie = name + '=' + escape(value) + '; path=/; expires = '+ today.toGMTString() + ';';
    }

    //레이어 팝업 쿠키 get
    function getRayerCookie(name){
        var obj = name + '=';
        var x = 0;
        while (x <= document.cookie.length ) {
            var y = (x+obj.length);
            if(document.cookie.substring(x,y) == obj) {
                if((endOfCookie = document.cookie.indexOf(";",y)) == -1)
                    endOfCookie = document.cookie.length;
                return unescape(document.cookie.substring(y,endOfCookie));
            }
            x = document.cookie.indexOf(" ",x)+1;
            if(x == 0) break;
        }
        return "";
    }
</script>

</body>
</html>