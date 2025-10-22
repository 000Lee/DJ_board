<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="MENU ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<%--<h2 class="sub-header">${fn:toUpperCase(mode)}</h2>--%>
			<h2 class="sub-header">대메뉴 등록</h2>
			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>
			<div class="row">
				<div class="col-sm-12 pt-3">
					<form id="menuFrm">
					<input type="hidden" id="mode" 			 name="mode" 			value="${mode}"/>
					<input type="hidden" id="searchContent"  name="searchContent" 	value="${searchContent}"/>
					<input type="hidden" id="parentMenuUUID" name="parentMenuUUID"	value="${parentMenuUUID}"/>
					<input type="hidden" id="useAt" 		 name="useAt"			value="${menuVO.useAt}"/>
					<input type="hidden" id="menuDisplayYn"  name="menuDisplayYn"	value="${menuVO.menuDisplayYn}"/>
					<c:if test="${mode eq 'update'}">
					<input type="hidden" id="menuUUID" 		 name="menuUUID"  		value="${menuVO.menuUUID}">
					<input type="hidden" id="menuGroup" 	 name="menuGroup"  		value="${menuVO.menuGroup}">
					<input type="hidden" id="menuLeft" 		 name="menuLeft"  		value="${menuVO.menuLeft}">
					<input type="hidden" id="menuRight" 	 name="menuRight"  		value="${menuVO.menuRight}">
					</c:if>


				<table class="__tbl respond2 fix">
					<tbody>
					<tr>
						<th>메뉴명</th>
						<td class="tal" colspan="3">
							<input type="text" id="menuName" name="menuName" class="__inp" value="${menuVO.menuName}" maxlength="30"/>
						</td>
					</tr>
					<tr>
						<th>메뉴유형</th>
						<td class="tal" colspan="3">
							<select id="menuType" name="menuType" onchange="fn_typeChange(this.value)" class="__inp" >
								<option value="0" <c:if test="${menuVO.menuType eq 0}">selected</c:if>>없음</option>
								<option value="1" <c:if test="${menuVO.menuType eq 1}">selected</c:if>>링크</option>
								<option value="2" <c:if test="${menuVO.menuType eq 2}">selected</c:if>>컨텐츠</option>
								<option value="3" <c:if test="${menuVO.menuType eq 3}">selected</c:if>>게시판</option>
								<option value="4" <c:if test="${menuVO.menuType eq 4}">selected</c:if>>설문</option>
								<option value="5" <c:if test="${menuVO.menuType eq 5}">selected</c:if>>예약</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>링크주소</th>
						<td class="tal" colspan="3">
							<select class="__inp" name="selectUrl" id="selectUrl" onchange="fn_urlChange(this)">
								<option value="" selected>직접입력</option>
								<c:forEach var="item" items="${boardList}">
								<option value="${item.boardUUID}" <c:if test="${fn:indexOf(menuVO.menuUrl, item.boardUUID) ne -1}">selected</c:if> >[${item.boardId}]&nbsp;${item.boardName}</option>
								</c:forEach>
							</select>
							<input type="text" class="__inpLink" id="menuUrl" name="menuUrl" value="${menuVO.menuUrl}"/>
						</td>
					</tr>
					<tr>
						<th>링크타겟</th>
						<td class="tal" colspan="3">
							<select class="__inp" id="menuTarget" name="menuTarget" >
								<option value="0" <c:if test="${menuVO.menuTarget eq 0 }">selected</c:if> >현재창</option>
								<option value="1" <c:if test="${menuVO.menuTarget eq 1 }">selected</c:if>>새창</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>화면표시여부</th>
						<td class="tal" colspan="3">
							<label class="__lab">
								<input type="checkbox" id="chkDisplayYn" name="chkDisplayYn" <c:if test="${menuVO.menuDisplayYn eq 1}">checked</c:if>/>
								<i></i>
								<span>예</span>
							</label>
						</td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td class="tal" colspan="3">
							<label class="__lab">
								<input type="checkbox" id="chkUseAt" name="chkUseAt" <c:if test="${menuVO.useAt eq 1}">checked</c:if>/>
								<i></i>
								<span>예</span>
							</label>
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
						
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
	<script type="text/javascript">
	$(function(){
		$("#btnList").on("click", function(e){
			e.preventDefault();
			fn_list();
		});
		
		$("#btnSave").on("click", function(e){
			e.preventDefault();
			fn_save();
		});
		
		fn_typeChange('${menuVO.menuType}');
	});
	
	// 메뉴유형 변경
	function fn_typeChange(val){
		switch(val){
		// 없음
		case '0':
			$("#selectUrl").val("");
			$("#menuUrl").val("");
			$("#selectUrl").prop("disabled",true);
			$("#menuUrl").prop("disabled",true);
			break;
		// 링크
		case '1':
			$("#selectUrl").val("");
			$("#selectUrl").prop("disabled",true);
			$("#menuUrl").prop("disabled",false);
			break;
		// 컨텐츠
		case '2':
			$("#selectUrl").val("");
			$("#menuUrl").val("");
			$("#selectUrl").prop("disabled",true);
			$("#menuUrl").prop("disabled",true);
			break;
		// 게시판
		case '3':
			$("#selectUrl").prop("disabled",false);
			$("#menuUrl").prop("disabled",false);
			break;
		// 설문
		case '4':
			break;
		// 예약
		case '5':
			break;
		}
	}
	
	// 링크주소 변경
	function fn_urlChange(obj){
		var url = "";
		if(obj.value != ""){
			// 게시판 링크
			url = "/board/list.do?boardUUID="+obj.value;
		} 
		$("#menuUrl").val(url);
	}
	
	// 목록으로 이동
	function fn_list() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/menu/list.do");
		comSubmit.addParam("menuGroup",${menuGroup});
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 저장
	function fn_save() {
		if(!$("#menuName").val()){
			alert("메뉴명은 필수입력사항입니다.");
			$("#menuName").focus();
			return false;
		}
		
		if($("input[name='chkDisplayYn']").prop("checked")){
			$("#menuDisplayYn").val(1);
		} else {
			$("#menuDisplayYn").val(0);
		}
		
		if($("input[name='chkUseAt']").prop("checked")){
			$("#useAt").val(1);
		} else {
			$("#useAt").val(0);
		}
		
		var comSubmit = new ComSubmit("menuFrm");
		if($("#mode").val() == 'update'){
			comSubmit.setUrl("/mngr/menu/update.do");
		} else {
			comSubmit.setUrl("/mngr/menu/save.do");
		}
		comSubmit.submit();
		
	}
	
	</script>
	
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>