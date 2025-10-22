<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="AUTH GROUP ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
<div class="row">
	<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h2 class="sub-header">권한 그룹 작성</h2>
		<div class="form-inline text-right" style="width: 80%;">
			<img width="90" height="40" src="/asset/images/logo.png">
		</div>
		<div class="row">
			<div class="col-sm-12 pt-3">
				<form id="authGroupFrm">
					<input type="hidden" id="mode" 				 name="mode" 				value="${mode}"/>
					<input type="hidden" id="page" 				 name="page" 				value="${page}"/>
					<input type="hidden" id="rowCount" 			 name="rowCount" 			value="${rowCount}"/>
					<input type="hidden" id="searchContent" 	 name="searchContent" 		value="${searchContent}"/>
					<input type="hidden" id="useAt" 	 		 name="useAt" 				value="${authorityGroupVO.useAt}"/>
					<input type="hidden" id="useProductMenu" 	 name="useProductMenu" 		value="${authorityGroupVO.useProductMenu}"/>
					<c:if test="${mode eq 'update'}">
					<input type="hidden" id="authorityGroupUUID" name="authorityGroupUUID"  value="${authorityGroupVO.authorityGroupUUID}">
					</c:if>

					<table class="__tbl respond2 fix">
						<tbody>
						<tr>
							<th>권한그룹명</th>
							<td class="tal" colspan="3">
								<input type="text" id="authorityGroupName" name="authorityGroupName" class="__inp" value="${authorityGroupVO.authorityGroupName}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>사용자 접근 권한</th>
							<td class="tal" colspan="3">
								<select id="authorityUserPermission" name="authorityUserPermission" class="__inp" style="width:25%;">
									<option value="0" <c:if test="${authorityGroupVO.authorityUserPermission eq 0 }">selected</c:if>>접근 권한 없음 </option>
									<option value="1" <c:if test="${authorityGroupVO.authorityUserPermission eq 1 }">selected</c:if>>그룹 사용자</option>
									<option value="2" <c:if test="${authorityGroupVO.authorityUserPermission eq 2 }">selected</c:if>>모든 사용자</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>상품메뉴사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkUseProductMenu" name="chkUseProductMenu" <c:if test="${authorityGroupVO.useProductMenu eq 1}">checked</c:if> />
									<i></i>
									<span>예</span>
								</label>
							</td>

						</tr>
						<tr>
							<th>사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkUseAt" name="chkUseAt" <c:if test="${authorityGroupVO.useAt eq 1}">checked</c:if> />
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
						<button class="__btn1 black" id="btnSave">${fn:toUpperCase(mode)}
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
		$("#btnSave").on("click", function(e){
			e.preventDefault();
			fn_save();
		});
	});

	function fn_save(){

		if(!$("#authorityGroupName").val()){
			alert("권한그룹명은 필수 입력항목입니다.");
			$("#authorityGroupName").focus();
			return false;
		}

		if($("input[name='chkUseAt']").prop("checked")){
			$("#useAt").val(1);
		} else {
			$("#useAt").val(0);
		}

		if($("input[name='chkUseProductMenu']").prop("checked")){
			$("#useProductMenu").val(1);
		} else {
			$("#useProductMenu").val(0);
		}

		var comSubmit = new ComSubmit("authGroupFrm");

		if($("#mode").val() == 'update'){
			comSubmit.setUrl("/mngr/auth/group/update.do");
		} else {
			comSubmit.setUrl("/mngr/auth/group/save.do");
		}

		comSubmit.submit();

	}

</script>

<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>