<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="BOARD CATEGORY ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		
			<h2 class="sub-header">${fn:toUpperCase(mode)}</h2>
			<div class="row">
				<div class="col-sm-12 pt-3">
					<form id="categoryFrm">
					<input type="hidden" id="mode" 			 	 name="mode" 				value="${mode}"/>
					<input type="hidden" id="searchContent"  	 name="searchContent" 		value="${searchContent}"/>
					<input type="hidden" id="parentCategoryUUID" name="parentCategoryUUID"	value="${parentCategoryUUID}"/>
					<input type="hidden" id="boardUUID" 		 name="boardUUID"			value="${boardUUID}"/>
					<input type="hidden" id="categoryGroup" 	 name="categoryGroup"		value="${categoryGroup}"/>
					<input type="hidden" id="useAt" 		 	 name="useAt"				value="${boardCategoryVO.useAt}"/>
					<c:if test="${mode eq 'update'}">
					<input type="hidden" id="boardCategoryUUID"  name="boardCategoryUUID"  	value="${boardCategoryVO.boardCategoryUUID}">
					<input type="hidden" id="boardCategoryGroup" name="boardCategoryGroup"  value="${boardCategoryVO.boardCategoryGroup}">
					<input type="hidden" id="boardCategoryLeft"  name="boardCategoryLeft"  	value="${boardCategoryVO.boardCategoryLeft}">
					<input type="hidden" id="boardCategoryRight" name="boardCategoryRight"  value="${boardCategoryVO.boardCategoryRight}">
					</c:if>
					<div class="form-row">
						<div class="form-group">
							<label for="menuName">게시판 카테고리명</label>
							<input type="text" id="boardCategoryName" name="boardCategoryName" class="form-control" value="${boardCategoryVO.boardCategoryName}" maxlength="30"/>
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="chkUseAt">사용여부</label>
							<div class="form-check row">
								<div class="col-sm-10">
									<input type="checkbox" id="chkUseAt" name="chkUseAt" class="form-check-input" <c:if test="${boardCategoryVO.useAt eq 1}">checked</c:if>/>
								</div>
							</div>
						</div>
					</div>
					</form>
					<div class="form-group row">
						<div class="col-sm-12 text-right">
							<button type="button" class="btn btn-primary" id="btnList">목록</button>
							<button type="button" class="btn btn-default" id="btnSave">${fn:toUpperCase(mode)}</button>
						</div>
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
	});

	// 목록으로 이동
	function fn_list() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/category/list.do");
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("categoryGroup",${categoryGroup});
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 저장
	function fn_save() {
		if(!$("#boardCategoryName").val()){
			alert("게시판 카테고리명은 필수입력사항입니다.");
			$("#boardCategoryName").focus();
			return false;
		}
		
		if($("input[name='chkUseAt']").prop("checked")){
			$("#useAt").val(1);
		} else {
			$("#useAt").val(0);
		}
		
		var comSubmit = new ComSubmit("categoryFrm");
		if($("#mode").val() == 'update'){
			comSubmit.setUrl("/mngr/board/category/update.do");
		} else {
			comSubmit.setUrl("/mngr/board/category/save.do");
		}
		comSubmit.submit();
		
	}
	
	</script>
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>