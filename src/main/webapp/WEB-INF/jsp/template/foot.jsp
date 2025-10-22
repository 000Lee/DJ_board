<%--
  Created by IntelliJ IDEA.
  User: 정호진
  Date: 2023-07-30(030)
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	.emailft{font-size: 25px;}
	.__pop-basic .bg{
		cursor: pointer;
		background: rgba(0,0,0,0.5);
		position: fixed;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		z-index: 0;
	}
	.__pop-basic .title{
		padding: 20px;
		position: relative;
		background: #333;
	}
	.__pop-basic .desc{
		padding: 20px;
		font-size: 15px;
		letter-spacing: -0.05em;
		line-height: 1.6em;
		max-height: 60vh;
		overflow: auto;
	}
	.fit{
		z-index: 100;
		background: #fff;
		border: 0.1rem solid #777;
		box-shadow: 0 0.5rem 0.5rem rgba(0,0,0,0.2);
		padding: 3rem;
		width: 104.6rem;
	}
	.cls{
		width: 5rem;
		height: 5rem;
		position: absolute;
		right: 0;
		top: 0;
		border: none;
		background: none;
		font-size: 2rem;
		color: #000;
	}
	.txt{
		font-size: 15px;
		line-height: 1.6em;
	}
	@media (max-width: 1024px){
		.p_size {
			max-width: 80% !important;
			left: 10% !important;
		}
	}

	@media (max-width: 600px){
		.cls {
			width: 1rem;
			height: 4rem;
		}
		.emailft{font-size: 22px;}
	}
</style>
<footer>
	<div class="footer-link">
		<div class="container">
			<ul>
				<%--<li><a href="">개인정보취급방침</a></li>--%>
				<li><a href="#" onclick="fn_wrap1(); return false;">이용약관</a></li>
				<li><a href="#" onclick="fn_wrap2(); return false;">이메일무단수집거부</a></li>
				<li><a href="/location.do">찾아오시는길</a></li>
			</ul>
		</div>
	</div>
	<div class="footer-info">
		<div class="container">
			<ul>
				<li><span>54158 전라북도 군산시 동장산2길 6</span></li>
				<li>
					<span>전화 : 063-472-2300(대표전화)  063-472-2359(홈페이지 담당자)</span>
					<span>팩스 : 063-472-2398/2399</span>
					<span>이메일 : jiat@jiat.re.kr</span>
				</li>
				<li><span>ⓒ 자동차융합기술원 . All Rights Reserved.</span></li>
			</ul>
			<div class="footer-button">
				<a href="javascript:;" onclick="toTop();">상단이동</a>
			</div>
		</div>
	</div>
	<div class="__pop-basic _pop-ajax wrap1" style="display:none;">
		<div class="fit inner p_size" style="width:1280px; top:120px; position:fixed; left:17%;">
			<div class="title" style="background-color: white; border-bottom:2px solid black;">
				<h3 style="color: black;font-weight: 500;font-size: 25px;">이용약관</h3>
				<button type="button" class="pop-close _close cls" onclick="fn_wrap1Hiding(); return false;"><%--<i class="ri-close-line"></i>--%>x</button>
			</div>
			<div class="desc" style="font-size: 15px; color: #666;">
				<p class="tit" style="font-size: 20px;color: green;">(재)자동차융합기술원 대표 누리집 이용약관</p>

				<br>
				<p class="sub-tit" style="font-weight: bold;font-size: 17px;">제 1장 총칙</p>
				<p class="txt" style="font-weight: bold;">제 1 조 (목적)</p>
				<p class="txt">본 약관(이하 '약관'이라 합니다)은 (재)자동차융합기술원(이하 '기술원'이라 합니다)과 이용자 간에 기술원이 제공하는 (재)자동차융합기술원 대표 누리집 서비스(<a href="http://www.jiat.re.kr" target="_blank" style="font-size: 15px; line-height: 1.6em;">https://www.jiat.re.kr</a>)(이하 '서비스'라 합니다)의 이용에 필요한 사항을 구체적으로 규정함을 목적으로 합니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 2 조 (용어의 정의)</p>
				<p class="txt">(1) 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
				<p class="txt">-‘이용자’란 (재)자동차융합기술원 대표 누리집에 접속하여 본 약관에 따라</p>
				<p class="txt">(재)자동차융합기술원 대표 누리집이 제공하는 서비스를 받는 이용자를 말합니다.</p>
				<p class="txt">- ‘게시물’이라 함은 이용자가 기술원의 서비스를 이용하면서 작성한 모든 활동내역을 의미합니다.</p>
				<p class="txt">(2) 이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.</p>

				<br>
				<p class="sub-tit" style="font-weight: bold;font-size: 17px;">제 2장 계약 당사자의 권리와 의무</p>
				<p class="txt" style="font-weight: bold;">제 3 조 (기술원의 의무)</p>
				<p class="txt">(1) 기술원은 이용자가 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록 하여야 합니다.</p>
				<p class="txt">(2) 기술원은 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된 때에는 부득이한 사유가 없는 한 지체 없이 이를 수리 또는 복구합니다.</p>
				<p class="txt">기술원은 이용자로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 4 조 (이용자의 의무)</p>
				<p class="txt">(1) 이용자는 약관에서 규정하는 사항과 기타 기술원이 정한 제반 규정, 공지사항 등 기술원이 공지하는 사항 및 관계 법령을 준수하여야 하며, 기타 기술원의 업무에 방해가 되는 행위, 기술원의 명예를 손상시키는 행위, 타인에게 피해를 주는 행위를 해서는 안됩니다.</p>
				<p class="txt">(2) 이용자는 기술원의 사전 승낙 없이 서비스를 이용하여 영업활동을 할 수 없으며, 그 영업활동의 결과에 대해 기술원은 책임을 지지 않습니다. 또한 이용자의 이와 같은 영업활동으로 기술원이 손해를 입은 경우, 이용자는 기술원에 대해 손해배상의무를 지며, 기술원은 해당 이용자에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.</p>
				<p class="txt">(3) 이용자는 기술원의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.</p>
				<p class="txt">(4) 이용자는 기술원 및 제 3자의 지적 재산권을 포함한 제반 권리를 침해하거나 제17조 각 호에 해당하는 행위를 해서는 안됩니다.</p>

				<br>
				<p class="sub-tit" style="font-weight: bold;font-size: 17px;">제 4장 서비스의 이용</p>
				<p class="txt" style="font-weight: bold;">제 5 조 (서비스 제공 및 중단)</p>
				<p class="txt">(1) 서비스 이용은 기술원의 업무상 또는 기술상 특별한 지장이 없는 한 연중 무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 기술원은 시스템 정기점검, 증설 및 교체를 위해 기술원이 정한 날이나 시간에 서비스를 일시 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스 일시 중단은 사전에 공지합니다.</p>
				<p class="txt">(2) 기술원은 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고 없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스의 교체 등 기술원이 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.</p>
				<p class="txt">(3) 기술원은 국가 비상사태, 천재지변, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스가 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다. 다만 이 경우 그 사유 및 기간 등을 회원에게 사후 공지합니다.</p>
				<p class="txt">(4) 기술원은 통제할 수 없는 사유로 인한 서비스 중단의 경우 (시스템 관리자의 고의, 과실 없는 디스크장애, 시스템다운 등)에 사전통지가 불가능하며, 타인(PC통신회사, 기간통신사업자 등)의 고의, 과실로 인한 시스템 중단 등의 경우에는 통지하지 않습니다.</p>
				<p class="txt">(5) 기술원은 서비스를 특정범위로 분할하여 각 범위 별로 이용가능 시간을 별도로 지정할 수 있습니다. 다만 이 경우 그 내용을 공지합니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 6 조 (이용자의 게시물 등)</p>
				<p class="txt">(1) 게시물이라 함은 이용자가 서비스를 이용하면서 게시한 글, 사진, 각종 파일과 링크 등을 말합니다.</p>
				<p class="txt">(2) 이용자가 서비스에 등록하는 게시물 등으로 인하여 본인 또는 타인에게 손해나 기타 문제가 발생하는 경우 이용자는 이에 대한 책임을 지게 되며, 기술원은 특별한 사정이 없는 한 이에 대하여 책임을 지지 않습니다.</p>
				<p class="txt">(3) 기술원은 다음 각 호에 해당하는 게시물 등을 이용자의 사전 동의 없이 임시게시 중단, 수정, 삭제, 이동 또는 등록 거부 등의 관련 조치를 취할 수 있습니다.</p>
				<p class="txt">- 다른 이용자 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우</p>
				<p class="txt">- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우</p>
				<p class="txt">- 불법복제 또는 해킹을 조장하는 내용인 경우</p>
				<p class="txt">- 영리를 목적으로 하는 광고일 경우</p>
				<p class="txt">- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우</p>
				<p class="txt">- 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우</p>
				<p class="txt">- 사적인 정치적 판단이나 종교적 견해의 내용으로 기술원이 서비스 성격에 부합하지 않는다고 판단하는 경우</p>
				<p class="txt">- 기술원에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우</p>
				<p class="txt">- 기타 관계법령에 위배된다고 판단되는 경우</p>
				<p class="txt">(4) 기술원은 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 기술원에 접수된 경우 이에 따릅니다.</p>
				<p class="txt">(5) 해당 게시물 등에 대해 임시게시 중단이 된 경우, 게시물을 등록한 이용자는 재게 시(전송재개)를 기술원에 요청할 수 있으며, 게시 중단일로부터 30일 이내에 재게시를 요청하지 아니한 경우 기술원은 이를 삭제할 수 있습니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 7 조 (게시물에 대한 저작권)</p>
				<p class="txt">(1) 기술원이 작성한 게시물 또는 저작물에 대한 저작권 기타 지적재산권은 기술원에 귀속합니다.</p>
				<p class="txt">(2) 이용자가 서비스 내에 게시한 게시물의 저작권은 게시한 이용자에게 귀속됩니다. 단, 기술원은 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 합리적인 범위 내에서 다음과 같이 이용자가 등록한 게시물을 사용할 수 있습니다.</p>
				<p class="txt">- 서비스 내에서 이용자 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물성을 해치지 않는 범위 내에서의 편집 저작물 작성</p>
				<p class="txt">- 미디어, 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 전시 혹은 홍보하게 하는 것.</p>
				<p class="txt">단, 이 경우 기술원은 별도의 동의 없이 이용자의 정보를 제공하지 않습니다.</p>
				<p class="txt">(3) 기술원은 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 이용자의 동의를 얻어야 합니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 8 조 (정보의 제공)</p>
				<p class="txt">(1) 기술원은 이용자에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서 전자우편이나 서신, 우편, SMS, 전화 등의 방법으로 회원에게 제공할 수 있습니다.</p>
				<p class="txt">(2) 기술원은 서비스 개선 및 이용자 대상의 서비스 소개 등의 목적으로 이용자의 동의 하에 관련 법령에 따라 추가적인 개인 정보를 수집할 수 있습니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 9 조 (광고게재 및 광고주와의 거래)</p>
				<p class="txt">(1) 기술원이 이용자에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 이용자는 서비스 이용 시 노출되는 광고게재에 대해 동의합니다.</p>
				<p class="txt">(2) 기술원은 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 이용자가 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.</p>

				<br>
				<p class="sub-tit" style="font-weight: bold;font-size: 17px;">제 5 장 계약 해지 및 이용 제한</p>
				<p class="txt" style="font-weight: bold;">제 10 조 (서비스 이용제한)</p>
				<p class="txt">기술원은 이용자가 서비스 이용내용에 있어서 본 약관 제 4조 내용을 위반하거나, 다음 각 호에 해당하는 경우 서비스 이용 제한, 초기화, 이용계약 해지 및 기타 해당 조치를 할 수 있습니다.</p>
				<p class="txt">- 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용 또는 타인의 명예나 프라이버시를 침해할 수 있는 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위</p>
				<p class="txt">- 다른 이용자를 희롱 또는 위협하거나, 특정 이용자에게 지속적으로 고통 또는 불편을 주는 행위</p>
				<p class="txt">- 기술원으로부터 특별한 권리를 부여 받지 않고 기술원의 클라이언트 프로그램을 변경하거나, 기술원의 서버를 해킹하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위</p>
				<p class="txt">- 서비스를 통해 얻은 정보를 기술원의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제 3자에게 제공하는 행위</p>
				<p class="txt">- 기술원의 운영진, 직원 또는 관계자를 사칭하거나 고의로 서비스를 방해하는 등 정상적인 서비스 운영에 방해가 될 경우</p>
				<p class="txt">- 정보통신 윤리위원회 등 관련 공공기관의 시정 요구가 있는 경우</p>
				<p class="txt">- 약관을 포함하여 기술원이 정한 제반 규정을 위반하거나 범죄와 결부된다고 객관적으로 판단되는 등 제반 법령을 위반하는 행위</p>

				<br>
				<p class="sub-tit" style="font-weight: bold;font-size: 17px;">제 6 장 손해배상 및 기타사항</p>
				<p class="txt" style="font-weight: bold;">제 11 조 (손해배상)</p>
				<p class="txt">(1) 이용자는 제10조의 귀책사유로 인하여 기술원나 다른 이용자에게 입힌 손해를 배상할 민사상의 책임이 있으며, 범죄 행위에 대해서는 형사상의 책임을 부여합니다.</p>
				<p class="txt">(2) 기술원은 무료로 제공하는 서비스의 이용과 관련하여 개인정보취급방침에서 정하는 내용에 위반하지 않는 한 어떠한 손해도 책임을 지지 않습니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 12 조 (면책조항)</p>
				<p class="txt">(1) 기술원의 서비스는 이용자에게 제품에 대한 서비스 정보 및 부가정보를 제공하는 것에 불과하며, 회원에게 직접적인 영향을 주는 상행위는 하지 않습니다.</p>
				<p class="txt">(2) 기술원은 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.</p>
				<p class="txt">(3) 기술원은 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.</p>
				<p class="txt">(4) 기술원은 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우 책임을 지지 않습니다.</p>
				<p class="txt">(5) 기술원은 이용자가 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다.</p>
				<p class="txt">(6) 기술원은 이용자가 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않으며, 이용자 상호간 및 이용자와 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없고, 이로 인한 손해를 배상할 책임도 없습니다.</p>
				<p class="txt">(7) 기술원은 이용자의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 아니합니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 13 조 (통지 및 정보의 제공)</p>
				<p class="txt">(1) 기술원은 이용자에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서 전자우편이나 서신우편 등의 방법으로 이용자에게 통지할 수 있습니다.</p>
				<p class="txt">(2) 기술원은 서비스 개선 및 소개 등의 목적으로 이용자의 동의 하에 추가적인 개인 정보를 요구할 수 있습니다.</p>
				<p class="txt">(3) 기술원은 불특정 다수 이용자에 대한 통지의 경우 1주일 이상 기술원 게시판에 게재함으로써 개별 통지에 갈음할 수 있습니다.</p>

				<br>
				<p class="txt" style="font-weight: bold;">제 21 조 (재판권 및 준거법)</p>
				<p class="txt">(1) 본 약관에 명시되지 않은 사항은 관계법령과 상관습에 따릅니다.</p>
				<p class="txt">(2) 각종 분쟁에 대해 소송이 제기되는 경우 관할법원에 제소합니다.</p>
			</div>
		</div>
		<div class="bg _close" onclick="fn_wrap1Hiding(); return false;"></div>
	</div>

	<div class="__pop-basic _pop-ajax wrap2" style="display:none;">
		<div class="fit inner p_size" style="width:930px; top:120px; position:fixed; left:25%;">
			<div class="title" style="background-color: white; border-bottom:2px solid black;">
				<h3 class="emailft" style="color: black;font-weight: 500;">이메일무단수집거부</h3>
				<button type="button" class="pop-close _close cls" onclick="fn_wrap2Hiding(); return false;"><%--<i class="ri-close-line"></i>--%>x</button>
			</div>
			<div class="desc" style="font-size: 15px; color: #666;">
				<p class="txt">자동차융합기술원 사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.</p>
			</div>
		</div>
		<div class="bg _close" onclick="fn_wrap2Hiding(); return false;"></div>
	</div>
</footer>

<script src="/asset/js/swiper.js?"></script>
<script type="text/javascript">
	function fn_wrap1(){
		$(".wrap1").css("display","block");
	}
	function fn_wrap1Hiding(){
		$(".wrap1").css("display","none");
	}
	function fn_wrap2(){
		$(".wrap2").css("display","block");
	}
	function fn_wrap2Hiding(){
		$(".wrap2").css("display","none");
	}
</script>
