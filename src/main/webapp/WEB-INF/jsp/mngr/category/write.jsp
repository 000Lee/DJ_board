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
		<jsp:param value="CATEGORY ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		
			<%--<h2 class="sub-header">${fn:toUpperCase(mode)}</h2>--%>
			<h2 class="sub-header">상위 카테고리 등록</h2>
			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>
			<div class="row">
				<div class="col-sm-12 pt-3">
					<form id="categoryFrm">
					<input type="hidden" id="mode" 			 	 name="mode" 				value="${mode}"/>
					<input type="hidden" id="searchContent"  	 name="searchContent" 		value="${searchContent}"/>
					<input type="hidden" id="parentCategoryUUID" name="parentCategoryUUID"	value="${parentCategoryUUID}"/>
					<input type="hidden" id="useAt" 		 	 name="useAt"				value="${categoryVO.useAt}"/>
					<c:if test="${mode eq 'update'}">
					<input type="hidden" id="categoryUUID" 		 name="categoryUUID"  		value="${categoryVO.categoryUUID}">
					<input type="hidden" id="categoryGroup" 	 name="categoryGroup"  		value="${categoryVO.categoryGroup}">
					<input type="hidden" id="categoryLeft" 		 name="categoryLeft"  		value="${categoryVO.categoryLeft}">
					<input type="hidden" id="categoryRight" 	 name="categoryRight"  		value="${categoryVO.categoryRight}">
					</c:if>


					<table class="__tbl respond2 fix">
						<tbody>
						<tr>
							<th>카테고리명(국문)</th>
							<td class="tal" colspan="3">
								<input type="text" id="categoryName" name="categoryName" class="__inp" value="${categoryVO.categoryName}"/>
							</td>
						</tr>
						<tr>
							<th>카테고리명(영문)</th>
							<td class="tal" colspan="3">
								<input type="text" id="categoryNameEng" name="categoryNameEng" class="__inp" value="${categoryVO.categoryNameEng}"/>
							</td>
						</tr>
						<tr>
							<th>사용여부</th>
							<td class="tal" colspan="3">
								<label class="__lab">
									<input type="checkbox" id="chkUseAt" name="chkUseAt" class="form-check-input" <c:if test="${categoryVO.useAt eq 1}">checked</c:if>/>
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
		comSubmit.setUrl("/mngr/category/list.do");
		/*comSubmit.addParam("categoryGroup",${categoryGroup});
		comSubmit.addParam("searchContent",'${searchContent}');*/
		comSubmit.submit();
	}
	
	// 저장
	function fn_save() {
		if(!$("#categoryName").val()){
			alert("카테고리명은 필수입력사항입니다.");
			$("#categoryName").focus();
			return false;
		}
		
		if($("input[name='chkUseAt']").prop("checked")){
			$("#useAt").val(1);
		} else {
			$("#useAt").val(0);
		}
		
		var comSubmit = new ComSubmit("categoryFrm");
		if($("#mode").val() == 'update'){
			comSubmit.setUrl("/mngr/category/update.do");
		} else {
			comSubmit.setUrl("/mngr/category/save.do");
		}
		comSubmit.submit();
		
	}
	
	</script>
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>