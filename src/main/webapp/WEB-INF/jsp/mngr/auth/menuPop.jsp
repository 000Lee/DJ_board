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
		<jsp:param value="MENU MANAGE POPUP" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	
	<div class="row" style="display:flex; justify-conent:center;">
		<ul class="nav nav-pills navbar-fixed-top">
		  <li role="presentation" class="active"><a href="#">메뉴</a></li>
		</ul>
		<div class="main" style="width:100%;">
			<div class="form-inline text-right">
				<div class="form-group col-sm2">
					<select class="form-control" name="menuGroup" id="menuGroup" onchange="fn_search()">
						<c:forEach var="item" items="${groupList}">
						<option value="${item.menuGroup}" <c:if test="${menuGroup == item.menuGroup}">selected</c:if>>${item.menuName}</option>
						</c:forEach>
						<option value="" selected>정보마당</option>
					</select>
				</div>
			</div> 
			
			<div class="table-responsive">
				<table class="table cmsTable">
					<thead>
	            		<tr>
	            			<th class="text-center">메뉴명</th>
	            			<th class="text-center">타겟</th>
	            			<th class="text-center">사용여부</th>
	                  		<th class="text-center">접근권한 <input type="checkbox" id="chkAll" name="chkAll" onclick="fn_checkAll()"/></th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              		<c:forEach var="item" items="${list}">
	              		<tr>
	              			<td><c:forEach var="i" begin="1" end="${item.getTempIntField1()}">▷</c:forEach>▶${item.menuName}</td>
	              			<td class="text-center">${item.getStrMenuTarget()}</td>
	              			<td class="text-center">${item.getStrUseAt()}</td>
	              			<c:set var="chk" value="0"/>
	              			<c:set var="authId" value=""/>
	              			<c:forEach var="auth" items="${authoiryList}">
	              				<c:if test="${auth.menuUUID eq item.menuUUID }">
	              					<c:set var="chk" value="1"/>
	              					<c:set var="authId" value="${auth.authorityUUID}"/>
	              				</c:if>
	              			</c:forEach>
	              			<td class="text-center">
	              				<input type="checkbox" name="chkAuth" onclick="fn_chkAuthOnclick('${item.menuUUID}', '${authId}', $(this))" <c:if test="${chk eq '1'}">checked</c:if> />
	              				<input type="hidden" name="menuId" value="${item.menuUUID}"/>
	              				<input type="hidden" name="authId" value="${authId}"/>
	              			</td>
	              		</tr>
	              		</c:forEach>

		                <td>▶정보마당</td>
		                <td class="text-center">현재창</td>
		                <td class="text-center">사용</td>
		                <td class="text-center">
			                <input type="checkbox" name="chkAuth" onclick="fn_chkAuthOnclick('${item.menuUUID}', '${authId}', $(this))" <c:if test="${chk eq '1'}">checked</c:if> />
			                <input type="hidden" name="menuId" value="${item.menuUUID}"/>
			                <input type="hidden" name="authId" value="${authId}"/>
		                </td>
	              	</tbody>
				</table>
			</div>
			<div class="form-group">
				<button type="button" id="btnSave" name="btnSave" class="btn btn-default">등록</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
		
	<script type="text/javascript">
	$(function(){
		$("#btnSave").on("click",function(e){
			e.preventDefault();
			fn_save();
		});
	});
	
	var groupId = '${authorityGroupUUID}';
	var data = ${jsonData};
	var originArray = new Array();
	if(!gfn_isNull(data)){
		originArray = data;
	}
	
	var saveArray = new Array();
	var deleteArray = new Array(); 
	
	// 체크박스 클릭 이벤트
	function fn_chkAuthOnclick(menuId, authId, obj){
		
		var gubun = chkOriginArray(menuId);
		
		// 체크된 경우 추가  
		if(obj.prop("checked")){
			// 원본데이터에 없는경우 saveArray추가
			if(!gubun[1]){
				var chkDelArray = fn_chkArray(deleteArray, menuId);
				var chkSaveArray = fn_chkArray(saveArray, menuId);
				
				if(chkDelArray[0]){
					delete deleteArray[chkDelArray[1]];
					deleteArray = deleteArray.filter(function(el){ return el != null; });
				} else {
					if(!chkSaveArray[0]){
						saveArray.push({"id" : menuId, "authId" : "", "groupId" : groupId});	
					}
				}
			}
		// 해제된경우 삭제	
		} else {
			var chkDelArray = fn_chkArray(deleteArray, menuId);
			var chkSaveArray = fn_chkArray(saveArray, menuId);
			
			if(chkSaveArray[0]){
				delete saveArray[chkSaveArray[1]];
				saveArray = saveArray.filter(function(el){ return el != null; });
			}
			
			// 원본데이터에 있는경우 deleteArray추가
			if(gubun[1]){
				if(!chkDelArray[0]){					
					deleteArray.push({"id" : menuId, "authId" : authId, "groupId" : groupId});
				}
			} 
		}
	}
	
	// 배열 요소 검사
	function fn_chkArray(arr, id){
		var index = 0;
		var flag = false;
		for(var idx in arr){
			if((!gfn_isNull(arr[idx].id)) && (id == arr[idx].id)){
				flag = true;
				index = idx;
			}
		}
		
		return [flag, index];
	}
	
	
	// 원본데이터에 데이터가 있는지 체크
	function chkOriginArray(uuid){
		var flag = false;
		var authId = ""; 
		if(originArray.length > 0){
			for(var idx in originArray){
				if( originArray[idx].id == uuid ){
					authId = originArray[idx].authId;
					flag = true;
				} 
			}
		}
		
		return [authId, flag];
	}
	
	// 전체 체크 
	function fn_checkAll(){
		var chkFlag = $("input[name='chkAll']").prop("checked");
		
		$("input[name='chkAuth']").each(function(idx){
			$(this).prop("checked", chkFlag)
			fn_chkAuthOnclick(
					$("input[name='menuId']").eq(idx).val(), 
					$("input[name='authId']").eq(idx).val(), 
					$(this));
		});
		
	}
	
	function arrayToJson(arr){
		return JSON.stringify(arr);
	}
	
	// 검색
	function fn_search(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/auth/menu/managepop.do")
		comSubmit.addParam("authorityGroupUUID", "${authorityGroupUUID}");
		comSubmit.addParam("menuGroup", $("#menuGroup").val());
		comSubmit.submit();
	}
	
	function fn_save(){
		if(saveArray.length == 0 && deleteArray.length == 0){
			alert("저장할 내용이 없습니다.");
			return false;
		}
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/auth/menu/action.do");
		if(saveArray.length > 0){
			comSubmit.addParam("saveArray",  arrayToJson(saveArray));
		} 
		if(deleteArray.length > 0){
			comSubmit.addParam("deleteArray",  arrayToJson(deleteArray));
		}
		comSubmit.submit();
	}
	
	</script>
</body>
</html>