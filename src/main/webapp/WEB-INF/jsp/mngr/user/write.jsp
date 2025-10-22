<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="USER ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
	<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
<div class="row">
	<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h2 class="sub-header">사용자 신규등록</h2>
		<div class="form-inline text-right" style="width: 80%;">
			<img width="90" height="40" src="/asset/images/logo.png">
		</div>
		<div class="row">
			<div class="col-sm-12 pt-3">
				<table class="__tbl respond2 fix">
					<tbody>
					<tr>
						<th>아이디</th>
						<td class="tal" colspan="3">
							<input type="text" id="userId" name="userId" class="__inp" onkeyup="checkRegexpValue('en',this);" value="${userVO.userId}" <c:if test="${mode eq 'update'}">readonly</c:if> maxlength="20" />
							<c:if test="${mode eq 'write'}">
								<button type="button" class="btn btn-default" id="btnCheck">중복검사</button>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>권한그룹</th>
						<td class="tal" colspan="3">
							<select class="__inp" id="authorityGroupUUID" name="authorityGroupUUID" style="width:25%;">
								<c:forEach var="item" items="${authorityGroupList}">
								<option value="${item.authorityGroupUUID}" <c:if test="${item.authorityGroupUUID eq userVO.authorityGroupUUID}">selected</c:if>>${item.authorityGroupName}</option>
								</c:forEach>
						</td>
					</tr>
					<c:if test="${mode eq 'write'}">
						<tr>
							<th>비밀번호</th>
							<td class="tal" colspan="3">
								<input type="password" id="userPassword" name="userPassword" class="__inp" value="" maxlength="50">
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td class="tal" colspan="3">
								<input type="password" id="userPasswordChk" name="userPasswordChk" class="__inp" value="" maxlength="50">
							</td>
						</tr>
					</c:if>
					<tr>
						<th>이름</th>
						<td class="tal" colspan="3">
							<input type="text" id="userName" name="userName" class="__inp" value="" maxlength="20">
						</td>
					</tr>
					<tr>
						<th>별명</th>
						<td class="tal" colspan="3">
							<input type="text" id="userNickname" name="userNickname" class="__inp" value="" maxlength="20">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td class="tal" colspan="3">
							<div class="form-inline">
								<input type="text" id="userAddress" name="userAddress" class="__inpAdr" value="" maxlength="50">
								<input type="text" id="userDetailAddress" name="userDetailAddress" class="__inpAdr" value="" maxlength="50">
								<input type="text" id="userZipcode" name="userZipcode" class="__inpAdr" value="" maxlength="7">
								<button type="button" class="btn btn-default" id="btnFindAddr">주소찾기</button>
							</div>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td class="tal" colspan="3">
							<select class="__inp" id="categoryUUID" name="categoryUUID" style="width:25%;">
								<option value="">선택</option>
								<option value=""></option>
							</select>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td class="tal" colspan="3">
							<input type="text" id="userEmailFst" name="userEmailFst" class="__inpAdr" value="" maxlength="40">@
							<input type="text" id="userEmailSnd" name="userEmailSnd" class="__inpAdr" value="" maxlength="40" style="margin-left:10px;">
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td class="tal" colspan="3">
							<div class="form-inline">
								<input type="text" id="userPhoneFst" name="userPhoneFst" class="__inpNum" value="" maxlength="3" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userPhoneSnd" name="userPhoneSnd" class="__inpNum" value="" maxlength="4" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userPhoneTrd" name="userPhoneTrd" class="__inpNum" value="" maxlength="4" onkeyup="checkRegexpValue('n',this)">
							</div>
						</td>
					</tr>
					<tr>
						<th>팩스번호</th>
						<td class="tal" colspan="3">
							<div class="form-inline">
								<input type="text" id="userFaxFst" name="userFaxFst" class="__inpNum" value="" maxlength="3" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userFaxSnd" name="userFaxSnd" class="__inpNum" value="" maxlength="4" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userFaxTrd" name="userFaxTrd" class="__inpNum" value="" maxlength="4" onkeyup="checkRegexpValue('n',this)">
							</div>
						</td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td class="tal" colspan="3">
							<div class="form-inline">
								<input type="text" id="userCompanyNumberFst" name="userCompanyNumberFst" class="__inpNum" value="" maxlength="3" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userCompanyNumberSnd" name="userCompanyNumberSnd" class="__inpNum" value="" maxlength="2" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userCompanyNumberTrd" name="userCompanyNumberTrd" class="__inpNum" value="" maxlength="5" onkeyup="checkRegexpValue('n',this)">
							</div>
						</td>
					</tr>
					<tr>
						<th>회사명</th>
						<td class="tal" colspan="3">
							<input type="text" id="userCompanyName" name="userCompanyName" class="__inp" value="" maxlength="50">
						</td>
					</tr>
					<tr>
						<th>설립년도</th>
						<td class="tal" colspan="3">
							<input type="text" id="userCompanyYear" name="userCompanyYear" class="__inp" value="" maxlength="4" onkeyup="checkRegexpValue('n',this)">
						</td>
					</tr>
					<tr>
						<th>휴대번호</th>
						<td class="tal" colspan="3">
							<div class="form-inline">
								<input type="text" id="userCellPhoneFst" name="userCellPhoneFst" class="__inpNum" value="" maxlength="3" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userCellPhoneSnd" name="userCellPhoneSnd" class="__inpNum" value="" maxlength="4" onkeyup="checkRegexpValue('n',this)">-
								<input type="text" id="userCellPhoneTrd" name="userCellPhoneTrd" class="__inpNum" value="" maxlength="4" onkeyup="checkRegexpValue('n',this)">
							</div>
						</td>
					</tr>
					<tr>
						<th>대표자명</th>
						<td class="tal" colspan="3">
							<input type="text" id="userCeoName" name="userCeoName" class="__inp" value="" maxlength="6" onkeyup="checkRegexpValue('k',this)">
						</td>
					</tr>
					<tr>
						<th>홈페이지 주소</th>
						<td class="tal" colspan="3">
							<input type="text" id="userHomepage" name="userHomepage" class="__inp" value="" maxlength="80">
						</td>
					</tr>
					<tr>
						<th>직위</th>
						<td class="tal" colspan="3">
							<input type="text" id="userRank" name="userRank" class="__inp" value="" maxlength="10" onkeyup="checkRegexpValue('k',this)">
						</td>
					</tr>
					<tr>
						<th>부서</th>
						<td class="tal" colspan="3">
							<input type="text" id="userDept" name="userDept" class="__inp" value="" maxlength="40">
						</td>
					</tr>
					<tr>
						<th>추가정보</th>
						<td class="tal" colspan="3">
							<button type="button" id="btnExtraInfo" name="btnExtraInfo" class="btn btn-default">추가정보팝업</button>
						</td>
					</tr>
					</tbody>
				</table>

				<div class="__btWrap cen __mt40" style="margin-right:300px;">
					<button class="__btn1 blue" id="btnList">
						<span>목록</span>
					</button>
					<button class="__btn1 black" id="btnSave">
						<span>저장</span>
					</button>
				</div>
				<%--<div class="text-right">
					<button type="button" class="btn btn-default" id="btnSave">저장</button>
				</div>--%>
				<%--<c:set var="fileLength" value=""/>
                <c:if test="${userVO.fileList ne null}">
                <c:set var="fileLength" value="${fn:length(userVO.fileList)}"/>
                <div class="form-row">
                    <c:forEach var="f" items="${userVO.fileList}">
                    <div class="form-inline" id="${f.userFileUUID}">
                        <a href="/downloadFile.do?pathNum=4&amp;fileUUID=${f.userFileUUID}">${f.userFileName}</a>
                        <button type="button" class="btn btn-danger" onclick="fn_deleteFile('${f.userFileUUID}', 4)">삭제</button>
                    </div>
                    </c:forEach>

                    <c:forEach var="i" begin="${fileLength + 1}" end="9">
                        <input type="file" id="file${i}" name="file${i}" class="__inp"/>
                    </c:forEach>
                </div>
                </c:if>--%>

			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>

<script type="text/javascript">
	$(function(){
		$("#btnCheck").on("click", function(e){
			e.preventDefault();
			fn_check();
		});

		$("#btnSave").on("click", function(e){
			e.preventDefault();
			fn_save();
		});

		$("#btnExtraInfo").on("click", function(e){
			e.preventDefault();
			window.open('/mngr/user/extra/pop.do?userUUID=${userVO.userUUID}', 'POPUP_${userVO.userUUID}', "width=700px, height=800px, top=300px, left=400px, location=no");
		});

		$("#btnFindAddr").on("click", function(e){
			e.preventDefault();
			fn_addr();
		});
	});

	// 아이디 중복체크
	function fn_check() {
		if(!$("#userId").val()){
			alert("아이디는 필수입력사항입니다.");
			$("#userId").focus();
			return false;
		}

		$.ajax({
			type : 'GET',
			url : '/user/api/chk/userId.do',
			data : 'userId='+$("#userId").val(),
			cache : false,
			dataType : 'json',
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			timeout: 60000,
			success: function (data) {

				if(data.code == "200"){
					$("#userCheck").val("1");
					$("#authorityGroupUUID").focus();
				} else if (data.code == "500"){
					$("#userId").val("");
					$("#userId").focus();
				}

				alert(data.message);

			},
			error: function (err) {
				console.log(err);
			}
		});
	}

	// 사용자 정보 저장
	function fn_save() {

		if(!$("#userId").val()){
			alert("아이디는 필수입력사항입니다.");
			$("#userId").focus();
			return false;
		}

		if($("#mode").val() == 'write' && $("#userCheck").val() != '1') {
			alert("아이디 중복검사를 해주십시오.");
			$("#userId").focus();
			return false;
		}
		if($("#mode").val() == 'write'){
			if(!$("#userPassword").val()){
				alert("비밀번호는 필수입력사항입니다.");
				$("#userPassword").focus();
				return false;
			}

			if(!$("#userPasswordChk").val()){
				alert("비밀번호 확인을 입력해주십시오.");
				$("#userPasswordChk").focus();
				return false;
			}

			if($("#userPassword").val() != $("#userPasswordChk").val()){
				alert("비밀번호가 다릅니다.\n 비밀번호 확인해주십시오.");
				$("#userPasswordChk").focus();
				return false;
			}
		}

		if(!$("#userName").val()){
			alert("이름은 필수입력사항입니다.");
			$("#userName").focus();
			return false;
		}

		var comSubmit = new ComSubmit("userFrm");

		if($("#mode").val() == 'update'){
			comSubmit.setUrl("/mngr/user/update.do");
		} else {
			comSubmit.setUrl("/mngr/user/save.do");
		}

		comSubmit.submit();
	}

	// 첨부파일 삭제
	function fn_deleteFile(uuid, pathNum){

		if(confirm("파일을 삭제하시겠습니까?")){
			$.ajax({
				type : 'GET',
				url : '/deleteFile.do',
				data : 'fileUUID='+ uuid + '&pathNum='+ pathNum,
				cache : false,
				dataType : 'json',
				contentType : "application/x-www-form-urlencoded;charset=utf-8",
				timeout: 60000,
				success: function (data) {

					//if(data.code == "200"){
					//	$("#"+uuid).remove();
					//}

					alert(data.message);

				},
				error: function (err) {
					console.log(err);
				}
			});
		} else return false;
	}

	// 주소 검색
	function fn_addr(){
		daum.postcode.load(function(){
			new daum.Postcode({
				oncomplete: function(data){

					var addr = '';
					if(data.userSelectedType == 'R'){
						addr = data.roadAddress;
					} else {
						addr = data.jibunAddress;
					}

					$("#userZipcode").val(data.zonecode);
					$("#userAddress").val(addr);
					$("#userDetailAddress").focus();

				}
			}).open();
		});
	}
</script>

<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>