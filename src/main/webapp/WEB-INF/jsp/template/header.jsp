<%--
  Created by IntelliJ IDEA.
  User: 정호진
  Date: 2023-07-30(030)
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<header class="fixed sub">
	<div class="box">
		<div class="header-logo">
			<h1><a href="/index.do">로고</a></h1>
		</div>
		<div class="header-gnb">
			<div class="gnb-inner">
				<div class="gnb-head">
					<img src="/asset/images/logo_w.png">
					<a href="javascript:;" onclick="menuClose();">닫기</a>

				</div>
				<div class="gnb-body">
					<ul>
						<li>
							<a href="/intro.do" class="is-pc link">기술원소개</a>
							<button class="is-m link">기술원소개</button>
							<dl>
								<dd><a href="/intro.do">인사말</a></dd>
								<dd><a href="/vision.do">비전과 목표</a></dd>
								<dd><a href="/history.do">연혁</a></dd>
								<dd><a href="/organization.do">조직도</a></dd>
								<dd><a href="/location.do">오시는 길</a></dd>
							</dl>
						</li>
						<li>
							<a href="/department01.do" class="is-pc link">사업분야</a>
							<button class="is-m link">사업분야</button>
							<dl>
								<dd><a href="/department01.do">연구개발</a></dd>
								<dd><a href="/department02.do">지원사업</a></dd>
								<dd><a href="/department04.do">장비활용</a></dd>
								<dd><a href="/department05.do">인력양성</a></dd>
							</dl>
						</li>
						<li>
							<a href="/em/equipment.do" class="is-pc link">보유장비</a>
							<button class="is-m link">보유장비</button>
							<dl>
								<dd><a href="/em/equipment.do">보유장비</a></dd>
							</dl>
						</li>
						<li>
							<a href="/facility01.do" class="is-pc link">시설안내</a>
							<button class="is-m link">시설안내</button>
							<dl>
								<dd><a href="/facility01.do">시설소개</a></dd>
								<dd><a href="/facility02.do">기술원 입주</a></dd>
								<dd><a href="/facility03.do">시설임대</a></dd>
								<dd><a href="/facility04.do">기술원 견학</a></dd>
							</dl>
						</li>
						<%--<li>
							<a href="/edu/education.do" class="is-pc link">인력양성</a>
							<button class="is-m link">인력양성</button>
							<dl>
								<dd><a href="/edu/education.do">교육과정 및 일정</a></dd>
							</dl>
						</li>--%>
						<li>
							<a href="/board/noamal/commonBoard.do?categoryKey=notice" class="is-pc link">정보마당</a>
							<button class="is-m link">정보마당</button>
							<dl>
								<dd class="nomal_notice"><a href="/board/noamal/commonBoard.do?categoryKey=notice" class="notice">공지사항</a></dd>
								<dd class="nomal_business"><a href="/board/noamal/commonBoard.do?categoryKey=business" class="business">사업공고</a></dd>
								<dd class="nomal_employment"><a href="/board/noamal/commonBoard.do?categoryKey=employment" class="employment">채용공고</a></dd>
								<dd class="nomal_global"><a href="/board/noamal/commonBoard.do?categoryKey=global" class="global">상용차 글로벌 산업동향</a></dd>
								<dd class="nomal_free"><a href="/board/noamal/commonBoard.do?categoryKey=free" class="free">특허현황</a></dd>
								<dd class="nomal_data"><a href="/board/noamal/commonBoard.do?categoryKey=data" class="data">자료실</a></dd>
							</dl>
						</li>
						<li>
							<a href="/government/government_Ethics.do" class="is-pc link">정부 3.0</a>
							<button class="is-m link">정부 3.0</button>
							<dl>
								<dd><a href="/government/government_Ethics.do">윤리현장</a></dd>
								<dd><a href="/government/government_MngDcs.do?categoryKey=mngdcs" class="mngdcs">경영공시</a></dd>
								<dd><a href="/government/commonBoard_gm.do?categoryKey=regulation" class="regulation">규정</a></dd>
								<dd><a href="/government/commonBoard_gm.do?categoryKey=upright" class="upright">청렴자료실</a></dd>
								<dd><a href="/government/contract_infoOld.do" class="contractold">(구)계약정보</a></dd>
								<dd><a href="/government/contract_info.do">계약정보</a></dd>
								<dd><a href="/government/government_DocList.do?categoryKey=doclist" class="doclist">문서목록</a></dd>
							</dl>
						</li>
						<li>
							<a href="/board/pr/board_webzine.do?categoryKey=webzine" class="is-pc link">홍보관</a>
							<button class="is-m link">홍보관</button>
							<dl>
								<dd><a href="/board/pr/board_webzine.do?categoryKey=webzine" class="webzine">웹진</a></dd>
								<dd><a href="/board/pr/board_photo.do?categoryKey=photo" class="photo">포토앨범</a></dd>
							</dl>
						</li>
						<c:if test="${isAdmin}">
							<li>
								<a href="/mngr/login.do" class="is-pc link">관리</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="header-lnb">
			<ul>

				<li class="search"><a href="javascript:;" onclick="srhToggle(this);">검색</a></li>
				<li class="menu"><a href="javascript:;" onclick="menuToggle(this);">메뉴바</a></li>
			</ul>
		</div>
		<div class="header-search">
			<form action="/integrated/search.do" id="integratedSearchFrm">
				<input type="text" placeholder="검색어를 입력하세요" id="inSearchContent" name="inSearchContent" autocomplete="off">
				<input type="hidden" name="skip" value=0>
				<input type="hidden" name="pageSize" value=3>
				<input type="hidden" name="fileSkip" value=0>
				<input type="hidden" name="filePageSize" value=10000>
				<input type="hidden" name="searchDateFst" value="">
				<input type="hidden" name="searchDateLst" value="">
				<input type="hidden" name="searchMode" value="N">
				<input type="hidden" name="searchType" value="">
				<i style="cursor: pointer;font-size: 0;width: 18px;height: 18px;background: url(/asset/images/icon_search_b.png) no-repeat center / cover;" onclick="$('#integratedSearchFrm').submit()"></i>
			</form>
		</div>
	</div>
</header>
<script>
	console.log('${isAdmin}');
</script>