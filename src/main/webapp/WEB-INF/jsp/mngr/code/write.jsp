<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="CODE ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<%--<h2 class="sub-header">${fn:toUpperCase(mode)}</h2>--%>
				<h2 class="sub-header">코드 목록 등록</h2>
				<div class="form-inline text-right" style="width: 80%;">
					<img width="90" height="40" src="/asset/images/logo.png">
				</div>
			<div class="row">
				<div class="col-sm-12 pt-3">
					<form id="codeFrm">
						<input type="hidden" id="mode" name="mode" value="${mode}">
						<input type="hidden" id="searchType" name="searchType" value="${searchType}">
						<input type="hidden" id="searchColumn" name="searchColumn" value="${searchColumn}">
						<input type="hidden" id="searchContent" name="searchContent" value="${searchContent}">
						<input type="hidden" id="page" name="page" value="${page}">
						<input type="hidden" id="rowCount" name="rowCount" value="${rowCount}">
						
						<input type="hidden" id="codeGroupIdx" name="codeGroupIdx" value="${codeGroupIdx}">
						
						<c:if test="${mode eq 'update'}">
						<input type="hidden" id="codeIdx" name="codeIdx" value="${codeVO.codeIdx}">
						</c:if>

						<table class="__tbl respond2 fix">
							<tbody>
							<tr>
								<th>코드</th>
								<td class="tal" colspan="3">
									<input type="text" class="__inp" id="code" name="code" value="${codeVO.code}" maxlength="100">
								</td>
							</tr>
							<tr>
								<th>코드명</th>
								<td class="tal" colspan="3">
									<input type="text" class="__inp" id="codeNm" name="codeNm" value="${codeVO.codeNm}" maxlength="100">
								</td>
							</tr>
							<tr>
								<th>비고</th>
								<td class="tal" colspan="3">
									<textarea rows="3" cols="40" class="__inp" id="remark" name="remark">${codeVO.remark}</textarea>
								</td>
							</tr>
							<tr>
								<th>기타1</th>
								<td class="tal" colspan="3">
									<input type="text" class="__inp" id="etc1" name="etc1" value="${codeVO.etc1}" maxlength="100">
								</td>
							</tr>
							<tr>
								<th>기타2</th>
								<td class="tal" colspan="3">
									<input type="text" class="__inp" id="etc2" name="etc2" value="${codeVO.etc2}" maxlength="100">
								</td>
							</tr>
							<tr>
								<th>기타3</th>
								<td class="tal" colspan="3">
									<input type="text" class="__inp" id="etc31" name="etc3" value="${codeVO.etc3}" maxlength="100">
								</td>
							</tr>
							<tr>
								<th>기타4</th>
								<td class="tal" colspan="3">
									<input type="text" class="__inp" id="etc4" name="etc4" value="${codeVO.etc4}" maxlength="100">
								</td>
							</tr>
							<tr>
								<th>기타5</th>
								<td class="tal" colspan="3">
									<input type="text" class="__inp" id="etc5" name="etc5" value="${codeVO.etc5}" maxlength="100">
								</td>
							</tr>
							<tr>
								<th>사용여부</th>
								<td class="tal" colspan="3">
									<select id="useAt" name="useAt" class="__inp">
										<option value="0" <c:if test="${codeVO.useAt eq 0}">selected</c:if>>사용안함</option>
										<option value="1" <c:if test="${codeVO.useAt eq 1}">selected</c:if>>사용함</option>
									</select>
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
		$("#btnList").on("click",function(e){
			e.preventDefault();
			fn_list();
		});
		$("#btnSave").on("click",function(e){
			e.preventDefault();
			fn_save();
		});
	});
	
	function fn_list(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/code/list.do");
		comSubmit.addParam("codeGroupIdx",${codeGroupIdx});
		comSubmit.addParam("searchColumn",'${searchColumn}');
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}
	
	function fn_save(){
		
		var validateFields = [ 
			{ f : "code" , m : "코드" , t : "t"},
			{ f : "codeNm" , m : "코드명" , t : "t"}
		];
		
		if(fn_inputValidation(validateFields)){
			
			var comSubmit = new ComSubmit("codeFrm");
			var mode = '${mode}';
			if(mode === 'write'){
				comSubmit.setUrl("/mngr/code/save.do");
			} else {
				comSubmit.setUrl("/mngr/code/update.do");
			}
			comSubmit.addParam("codeGroupIdx",${codeGroupIdx});
			comSubmit.addParam("searchColumn",'${searchColumn}');
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.addParam("page",${page});
			comSubmit.addParam("rowCount",${rowCount});
			comSubmit.submit();
		}
		
	}
	
	</script>
	
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>