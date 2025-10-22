<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="CONTENT LIST" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<h2 class="sub-header">컨텐츠 관리</h2>
			<div class="form-inline text-right">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>
			<div class="form-inline text-right">
				<div class="form-group col-sm2">
					<select class="form-control" name="menuGroup" id="menuGroup">
						<c:forEach var="item" items="${groupList}">
						<option value="${item.menuGroup}" <c:if test="${menuGroup == item.menuGroup}">selected</c:if>>${item.menuName}</option>
						</c:forEach>
						<option value="" selected>정보마당</option>
					</select>
				</div>
				<div class="form-group col-sm6">	
					<input type="text" class="form-control" name="searchContent" id="searchContent" value="${searchContent}" />
				</div>	
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default btn-primary" id="btnSearch">검색</button>
				</div>
			</div>
			
			<div class="table-responsive">
				<table class="table cmsTable">
					<colgroup>
						<col width="auto">
						<col width="15%">
						<col width="15%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					<thead>
	            		<tr>
	            			<th class="text-center">메뉴명</th>
	            			<th class="text-center">타겟</th>
	            			<th class="text-center">사용여부</th>
	                  		<th colspan="3" class="text-center">관리</th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              		<c:forEach var="item" items="${list}">
	              		<tr>
	              			<td><c:forEach var="i" begin="1" end="${item.getTempIntField1()}">▷</c:forEach>▶${item.menuName}</td>
	              			<td class="text-center">${item.getStrMenuTarget()}</td>
	              			<td class="text-center">${item.getStrUseAt()}</td>
	              			
	              			<c:choose>
	              				<c:when test="${item.getTempStrField2() ne 'null'}">
	              			<td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.getTempStrField2()}')">키복사</button></td>
	              			<td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.getTempStrField2()}')">수정</button></td>	
	              			<td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.getTempStrField2()}')">삭제</button></td>
	              				</c:when>
	              				<c:otherwise>
	              			<td class="text-center" colspan="3"><button type="button" class="btn btn-primary" onclick="fn_register('${item.menuUUID}')">등록</button></td>
	              				</c:otherwise>
	              			</c:choose>
	              		</tr>
	              		</c:forEach>

		                <tr>
			                <td>▶정보마당</td>
			                <td class="text-center">현재창</td>
			                <td class="text-center">사용</td>
			                <td class="text-center" colspan="3"><button type="button" class="btn btn-primary" onclick="fn_register('${item.menuUUID}')">등록</button></td>
		                </tr>
		                <tr>
			                <td>▷▶공지사항</td>
			                <td class="text-center">현재창</td>
			                <td class="text-center">사용</td>
			                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.getTempStrField2()}')">키복사</button></td>
			                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.getTempStrField2()}')">수정</button></td>
			                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.getTempStrField2()}')">삭제</button></td>
		                </tr>
	              	</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
	<script type="text/javascript">
	$(function(){
		$("#btnSearch").on("click",function(e){
			e.preventDefault();
			fn_search();
		});
	});
	
	// 검색
	function fn_search(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/content/list.do");
		comSubmit.addParam("menuGroup",$("#menuGroup").val());
		comSubmit.addParam("searchContent",$("#searchContent").val());
		comSubmit.submit();
	}
	
	
	// 등록
	function fn_register(uuid){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/content/register.do");
		comSubmit.addParam("mode",'write');
		comSubmit.addParam("menuUUID",uuid);
		comSubmit.addParam("menuGroup",${menuGroup});
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 수정
	function fn_update(uuid){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/content/register.do");
		comSubmit.addParam("mode",'update');
		comSubmit.addParam("menuGroup",${menuGroup});
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.addParam("contentUUID",uuid);
		comSubmit.submit();
	}
	
	// 삭제
	function fn_delete(uuid){
		if(confirm("컨텐츠를 삭제하시겠습니까?")){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/content/delete.do");
			comSubmit.addParam("contentUUID",uuid);
			comSubmit.addParam("menuGroup",${menuGroup});
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.submit();
		} else return false;
	}
	
	// 클립보드로 키 복사
	function fn_copyClipboard(val){
		var tempElem = document.createElement('textarea');
		tempElem.value = val;  
		document.body.appendChild(tempElem);
	
		tempElem.select();
		document.execCommand("copy");
		document.body.removeChild(tempElem);
	}
	</script>
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>