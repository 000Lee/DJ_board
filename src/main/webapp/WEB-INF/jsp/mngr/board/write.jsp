<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="BOARD ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		
			<%--<h2 class="sub-header">${fn:toUpperCase(mode)}</h2>--%>
			<h2 class="sub-header">게시판 등록</h2>
			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>
			<div class="row">
				<div class="col-sm-12 pt-3">
					<form id="boardFrm">
					<input type="hidden" id="boardCheck" 		 name="boardCheck" 			value="0"/>
					<input type="hidden" id="mode" 				 name="mode" 				value="${mode}"/>
					<input type="hidden" id="page" 				 name="page" 				value="${page}"/>
					<input type="hidden" id="rowCount" 			 name="rowCount" 			value="${rowCount}"/>
					<input type="hidden" id="searchContent" 	 name="searchContent" 		value="${searchContent}"/>
					<input type="hidden" id="boardUseSecret"     name="boardUseSecret" 	    value="${boardVO.boardUseSecret}"/>
					<input type="hidden" id="boardFileUploadYn"  name="boardFileUploadYn" 	value="${boardVO.boardFileUploadYn}"/>					
					<input type="hidden" id="boardFstPeriodYn" 	 name="boardFstPeriodYn" 	value="${boardVO.boardFstPeriodYn}"/>
					<input type="hidden" id="boardSndPeriodYn" 	 name="boardSndPeriodYn" 	value="${boardVO.boardSndPeriodYn}"/>
					<input type="hidden" id="boardReplyYn" 	 	 name="boardReplyYn" 		value="${boardVO.boardReplyYn}"/>					
					<input type="hidden" id="boardUseYn" 	 	 name="boardUseYn" 			value="${boardVO.boardUseYn}"/>
					<c:if test="${mode eq 'update'}">
					<input type="hidden" id="boardUUID" 		 name="boardUUID"  			value="${boardVO.boardUUID}">
					</c:if>

					<table class="__tbl respond2 fix">
						<tbody>
						<tr>
							<th>게시판 ID</th>
							<td class="tal" colspan="3">
								<input type="text" class="__inp" id="boardId" name="boardId" value="${boardVO.boardId}" <c:if test="${mode eq 'update'}">readonly</c:if> onkeyup="checkRegexpValue('en',this)"/>
								<c:if test="${mode eq 'write'}">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" id="btnCheck" type="button">중복조회</button>
									</div>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>게시판 명</th>
							<td class="tal" colspan="3">
								<input type="text" id="boardName" name="boardName" class="__inp" value="${boardVO.boardName}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>게시판 유형</th>
							<td class="tal" colspan="3">
								<select id="boardType" name="boardType" class="__inp">
									<option value="0" <c:if test="${boardVO.boardType eq 0}">selected</c:if> >일반</option>
									<option value="1" <c:if test="${boardVO.boardType eq 1}">selected</c:if> >달력</option>
									<option value="2" <c:if test="${boardVO.boardType eq 2}">selected</c:if> >블로그</option>
									<option value="3" <c:if test="${boardVO.boardType eq 3}">selected</c:if> >갤러리</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>공개 비공개 사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkUseSecret" name="chkUseSecret" class="form-check-input" <c:if test="${boardVO.boardUseSecret eq 1}">checked</c:if>/>
									<i></i>
									<span>예</span>
								</label>
							</td>
						</tr>
						<tr>
							<th>파일업로드 사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkFileUploadYn" name="chkFileUploadYn" class="form-check-input" <c:if test="${boardVO.boardFileUploadYn eq 1}">checked</c:if>/>
									<i></i>
									<span>예</span>
								</label>
							</td>
						</tr>
						<tr>
							<th>업로드 허용 확장자(구분자:',')</th>
							<td class="tal" colspan="3">
								<input type="text" id="boardFileAllowType" name="boardFileAllowType" class="__inp" value="${boardVO.boardFileAllowType}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>페이지 표출게시글 수</th>
							<td class="tal" colspan="3">
								<input type="text" id="boardArticleRow" name="boardArticleRow" class="__inp" value="${boardVO.boardArticleRow}" maxlength="3" onkeyup="checkRegexpValue('n',this)"/>
							</td>
						</tr>
						<tr>
							<th>페이지 표현 수</th>
							<td class="tal" colspan="3">
								<input type="text" id="boardPageBlock" name="boardPageBlock" class="__inp" value="${boardVO.boardPageBlock}" maxlength="3" onkeyup="checkRegexpValue('n',this)"/>
							</td>
						</tr>
						<tr>
							<th>게시판 첫번째 기간 사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkFstPeriodYn" name="chkFstPeriodYn" class="form-check-input" <c:if test="${boardVO.boardFstPeriodYn eq 1}">checked</c:if>/>
									<i></i>
									<span>예</span>
								</label>
							</td>
						</tr>
						<tr>
							<th>게시판 두번째 기간 사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkSndPeriodYn" name="chkSndPeriodYn" class="form-check-input" <c:if test="${boardVO.boardSndPeriodYn eq 1}">checked</c:if>/>
									<i></i>
									<span>예</span>
								</label>
							</td>
						</tr>
						<tr>
							<th>게시판 답글 사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkReplyYn" name="chkReplyYn" class="form-check-input" <c:if test="${boardVO.boardReplyYn eq 1}">checked</c:if>/>
									<i></i>
									<span>예</span>
								</label>
							</td>
						</tr>
						<tr>
							<th>게시판 목록 페이지</th>
							<td class="tal" colspan="3">
								<input type="text" id="boardListPage" name="boardListPage" class="__inp" value="${boardVO.boardListPage}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>게시판 보기 페이지</th>
							<td class="tal" colspan="3">
								<input type="text" id="boardViewPage" name="boardViewPage" class="__inp" value="${boardVO.boardViewPage}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>게시판 등록 페이지</th>
							<td class="tal" colspan="3">
								<input type="text" id="boardWritePage" name="boardWritePage" class="__inp" value="${boardVO.boardWritePage}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>로그인에 따른 사용여부</th>
							<td class="tal" colspan="3">
								<select id="boardLoginYn" name="boardLoginYn" class="__inp" style="width:25%;">
									<option value="0" <c:if test="${boardVO.boardLoginYn eq 0}">selected</c:if> >비로그인 사용가능</option>
									<option value="1" <c:if test="${boardVO.boardLoginYn eq 1}">selected</c:if> >비로그인 사용불가</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>게시판 사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkUseYn" name="chkUseYn" class="form-check-input" <c:if test="${boardVO.boardUseYn eq 1}">checked</c:if>/>
									<i></i>
									<span>예</span>
								</label>
							</td>
						</tr>
						</tbody>
					</table>
					</form>

					<div class="__btWrap cen __mt40" style="margin-right:300px;">
						<button class="__btn1 blue" id="btnList">
							<span>목록</span>
						</button>
						<button class="__btn1 black" id="btnSave">
							<span>저장</span>
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
	
	<script type="text/javascript">
		$(function (){
			$("#btnCheck").on("click", function(e){
				e.preventDefault();
				fn_check();
			});
			
			$("#btnSave").on("click", function(e){
				e.preventDefault();
				fn_save();
			});
		});
		
		function fn_check() {
			if(!$("#boardId").val()){
				alert("게시판아이디는 필수입력사항입니다.");
				$("#boardId").focus();
				return false;
			}
			
			$.ajax({
				type : 'GET',
				url : '/board/api/chk/boardId.do',
				data : 'boardId='+$("#boardId").val(),
				cache : false,
				dataType : 'json',
				contentType : "application/x-www-form-urlencoded;charset=utf-8",
				timeout: 60000, 
				success: function (data) {
					
					if(data.code == "200"){
						$("#boardCheck").val("1");
						$("#boardName").focus();
					} else if (data.code == "500"){
						$("#boardId").val("");
						$("#boardId").focus();
					}
					
					alert(data.message);
					
				},
				error: function (err) {
					console.log(err);
				}
			});
		}
		
		function fn_save() {
			if(!$("#boardId").val()){
				alert("게시판아이디는 필수입력사항입니다.");
				$("#boardId").focus();
				return false;
			}
			
			if($("#mode").val() == 'write' && $("#boardCheck").val() != '1'){
				alert("게시판아이디 중복확인을 해주세요.");
				$("#boardId").focus();
				return false;
			}
			
			if(!$("#boardName").val()){
				alert("게시판명은 필수입력사항입니다.");
				$("#boardName").focus();
				return false;
			}
			
			if(!$("#boardArticleRow").val()){
				$("#boardArticleRow").val(10);
			}
			
			if(!$("#boardPageBlock").val()){
				$("#boardPageBlock").val(10);
			}
			
			if($("input[name='chkUseSecret']").prop("checked")){
				$("#boardUseSecret").val(1);
			} else {
				$("#boardUseSecret").val(0);
			}
						
			if($("input[name='chkFileUploadYn']").prop("checked")){
				$("#boardFileUploadYn").val(1);
			} else {
				$("#boardFileUploadYn").val(0);
			}
			
			if($("input[name='chkFstPeriodYn']").prop("checked")){
				$("#boardFstPeriodYn").val(1);
			} else {
				$("#boardFstPeriodYn").val(0);
			}
			
			if($("input[name='chkSndPeriodYn']").prop("checked")){
				$("#boardSndPeriodYn").val(1);
			} else {
				$("#boardSndPeriodYn").val(0);
			}
			
			if($("input[name='chkReplyYn']").prop("checked")){
				$("#boardReplyYn").val(1);
			} else {
				$("#boardReplyYn").val(0);
			}
			
			if($("input[name='chkUseYn']").prop("checked")){
				$("#boardUseYn").val(1);
			} else {
				$("#boardUseYn").val(0);
			}
			
			var comSubmit = new ComSubmit("boardFrm");
			
			if($("#mode").val() == 'update'){
				comSubmit.setUrl("/mngr/board/update.do");
			} else {
				comSubmit.setUrl("/mngr/board/save.do");
			}
			
			comSubmit.submit();
			
		}
	</script>
	
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>