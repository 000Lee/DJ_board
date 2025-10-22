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
			<jsp:param value="BOARD MANAGE POPUP" name="headerTitle"/>
		</jsp:include>
	</head>
	<body>
		<ul class="nav nav-pills navbar-fixed-top">
		  <li role="presentation" class="active"><a href="#">게시판</a></li>
		</ul>
	
		<div class="row"> 
			<div class="form-group col-md-4">
			<select class="form-control" multiple size="9" id="boardUUID" name="boardUUID">
			<c:forEach var="item" items="${boardList}">
				<option value="${item.boardUUID}">${item.boardName}</option>
			</c:forEach>
				<option value="" onclick="fn_chkReset()">정보마당</option>

			</select>
			</div>
									
			<div class="form-group col-md-1">
				<div class="row">
				<button type="button" class="btn btn-default" id="btnAdd">&raquo;</button>
				</div>
				<div class="row">
				<button type="button" class="btn btn-default" id="btnRemove">&laquo;</button>
				</div>
			</div>
			
			<div class="form-group col-md-4">
			<select class="form-control" multiple size="9" id="authorityUUID" name="authorityUUID">
			<c:forEach var="item" items="${authoiryList}">
				<option value="${item.boardUUID}" onclick="fn_chkReset()">${item.tempStrField1 }</option>
			</c:forEach>
			</select>
			</div>
			
			<div class="form-group col-md-3">
				<div class="form-row">
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label">전체</label>
							<input type="checkbox" class="form-check-input" id="chkAll" name="chkAll" onclick="fn_checkAll()"/>
						</div>
					</div>
				
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label">목록</label>
							<input type="checkbox" class="form-check-input" id="chkListYn" name="chkListYn" onclick="fn_checkYn('List')"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label">보기</label>
							<input type="checkbox" class="form-check-input" id="chkViewYn" name="chkViewYn" onclick="fn_checkYn('View')"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label">수정</label>
							<input type="checkbox" class="form-check-input" id="chkUpdateYn" name="chkUpdateYn" onclick="fn_checkYn('Update')"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label">등록</label>
							<input type="checkbox" class="form-check-input" id="chkSaveYn" name="chkSaveYn" onclick="fn_checkYn('Save')"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label">삭제</label>
							<input type="checkbox" class="form-check-input" id="chkDeleteYn" name="chkDeleteYn" onclick="fn_checkYn('Delete')"/>
						</div>
					</div>
					
					<div class="form-group">
						<button type="button" id="btnSave" name="btnSave" class="btn btn-default">등록</button>
					</div>
				</div>
			</div>

		</div>
		
		<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
		
		<script type="text/javascript">
			$(function(){
				$("#btnAdd").on("click",function(e){
					e.preventDefault();
					fn_add();
				});
				
				$("#btnRemove").on("click",function(e){
					e.preventDefault();
					fn_remove();
				});
				
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
			var updateArray = new Array();
			var deleteArray = new Array(); 
			
			// 권한 추가
			function fn_add(){
				
				if($("#boardUUID option:selected").val() == undefined){
					return false;
				}
				
				var boardUUID = $("#boardUUID option:selected").val();
				var boardText = $("#boardUUID option:selected").text();
				
				// 삭제의 경우 넣어둔 삭제와 동일한 권한을 추가하려는 경우 지워줌
				if(deleteArray.length > 0){
					for(idx in deleteArray){
						if(boardUUID == deleteArray[idx].id){
							deleteArray.splice(idx);
							break;
						}		
					}	
				}
				
				if($("#authorityUUID option").size() == 0){
					
					// 데이터가 하나도 없을경우 초기화 한번 해줌
					saveArray = new Array();
					updateArray = new Array();
										
					$("#authorityUUID").append("<option value=\""+boardUUID + "\" onclick=\"fn_chkReset()\"> "+boardText+" </option>");
				} else {
					
					var isAppend = true;
					
					for(var i = 0; i < $("#authorityUUID option").size(); i++){
						if(boardUUID == $("#authorityUUID option:eq("+i+")").val()){
							isAppend = false;
						} 
					}
					
					if(isAppend) {
						$("#authorityUUID").append("<option value=\""+boardUUID + "\" onclick=\"fn_chkReset()\" > "+boardText+" </option>");	
					}
				}
					
			}
			
			// 권한 제거 
			// 등록되어있던 권한이 있었을 경우를 체크하여 deleteArray에 추가해줌
			function fn_remove(){
				if($("#authorityUUID option:selected").val() == undefined){
					return false;
				}
				
				var boardUUID = $("#authorityUUID option:selected").val();
				
				if(originArray.length > 0){
					
					var authUId = ""; 
					var deleteFlag = false;					
					// 존재하는 데이터가 있었는지 체크
					for(var idx in originArray){
						if(originArray[idx].id == boardUUID){
							authUId = originArray[idx].authId; 
							deleteFlag = true;
							break;
						}
					}
					
					if(deleteFlag){
						
						if(deleteArray.length > 0){
							
							for(var idx in deleteArray){
								if(gfn_isNull(deleteArray[idx].id) && boardUUID != deleteArray[idx].id){
									deleteArray.push({id:boardUUID, authId:authUId});
								}
							}
							
						} else {
							deleteArray.push({id:boardUUID, authId:authUId});
						}
					}
					
				}
				
				// 해당 아이디로 수정할 데이터가 있었으면 삭제
				for(var idx in updateArray) {
					if( boardUUID == updateArray[idx].id ) {
						updateArray.splice(idx);	
						break;
					}
				}
				
				// 해당 아이디로 추가할 데이터가 있었으면 삭제
				for(var idx in saveArray) {
					if( boardUUID == saveArray[idx].id ) {
						saveArray.splice(idx);	
						break;
					}
				}
				
				$("#authorityUUID option:selected").remove();
				
				if($("#authorityUUID option").size() == 0 || $("#authorityUUID option:selected").val() == undefined){
					comCheckProp(["chkListYn", "chkViewYn", "chkUpdateYn", "chkSaveYn", "chkDeleteYn"], false);
				}
			}
			
			// 전체 체크 
			function fn_checkAll(){
				
				if($("#authorityUUID option:selected").val() == undefined){
					return false;
				}
				
				var boardUUID = $("#authorityUUID option:selected").val();
				
				var chkFlag = $("input[name='chkListYn']").prop("checked");
				chkFlag = !chkFlag;
				
				comCheckProp(["chkListYn", "chkViewYn", "chkUpdateYn", "chkSaveYn", "chkDeleteYn"], chkFlag);
				
				var listYn = ($("input[name='chkListYn']").prop("checked") == true) ? 1 : 0;
				var viewYn = ($("input[name='chkViewYn']").prop("checked") == true) ? 1 : 0;
				var updateYn = ($("input[name='chkUpdateYn']").prop("checked") == true) ? 1 : 0;
				var saveYn = ($("input[name='chkSaveYn']").prop("checked") == true) ? 1 : 0;
				var deleteYn = ($("input[name='chkDeleteYn']").prop("checked") == true) ? 1 : 0;
				
				var gubun = chkOriginArray(boardUUID, chkFlag);
				
				switch(gubun[0]){
					case "update":
						fn_arrayPush(updateArray, boardUUID, listYn, 	"listYn", 	gubun[1]);
						fn_arrayPush(updateArray, boardUUID, viewYn, 	"viewYn", 	gubun[1]);
						fn_arrayPush(updateArray, boardUUID, updateYn, 	"updateYn", gubun[1]);
						fn_arrayPush(updateArray, boardUUID, saveYn, 	"saveYn", 	gubun[1]);
						fn_arrayPush(updateArray, boardUUID, deleteYn, 	"deleteYn", gubun[1]);
						break;
					
					case "save":
						fn_arrayPush(saveArray, boardUUID, listYn, 	 "listYn", 	 gubun[1]);
						fn_arrayPush(saveArray, boardUUID, viewYn, 	 "viewYn",   gubun[1]);
						fn_arrayPush(saveArray, boardUUID, updateYn, "updateYn", gubun[1]);
						fn_arrayPush(saveArray, boardUUID, saveYn,   "saveYn", 	 gubun[1]);
						fn_arrayPush(saveArray, boardUUID, deleteYn, "deleteYn", gubun[1]);
						break;
				}
				
			}
			
			// 개별 체크
			function fn_checkYn(gubunYn) {
				
				if($("#authorityUUID option:selected").val() == undefined){
					return false;
				}
				
				var boardUUID = $("#authorityUUID option:selected").val();
				var chkYn = ($("input[name='chk"+gubunYn+"Yn']").prop("checked") == true) ? 1 : 0;
				var gubun = chkOriginArray(boardUUID);
				var toLowerYn = gubunYn.toLowerCase();
				
				switch(gubun[0]){
					case "update":
						fn_arrayPush(updateArray, boardUUID, chkYn, toLowerYn+"Yn", gubun[1]);
						break;
					case "save":
						fn_arrayPush(saveArray, boardUUID, chkYn, toLowerYn+"Yn", gubun[1]);
						break;
				}
			}
			
			// 저장할 array를 선택하여 데이터 입력 ( saveArray, updateArray ) 삭제는 remove에서 진행
			function fn_arrayPush(arr, id, yn, objNm, authId){
				
				if(arr.length > 0){
					
					var existsId = false;
					
					for(var idx in arr){
						
						if((!gfn_isNull(arr[idx].id)) && (id == arr[idx].id)){
							
							existsId = true;
							
							if(!gfn_isNull(arr[idx].obj)){
								
								var notExistsNm = false;
								
								for(var objIdx in arr[idx].obj){
									
									if( objNm == objIdx){
										if(arr[idx].obj[objIdx] != yn){
											arr[idx].obj[objIdx] = yn;
										} 
										
										notExistsNm = true;	
									}
								}
								
								if(!notExistsNm){
									arr[idx].obj[objNm]= yn;
								}
								
							} else {
								arr[idx].obj[objNm] = yn
							}
						} 
					}
					
					if(!existsId){
						arr.push({"id" : id, "obj" : { [objNm] : yn }, "authId" : authId, "groupId" : groupId});	
					}
					
				} else {
					arr.push({"id" : id, "obj" : { [objNm] : yn }, "authId" : authId, "groupId" : groupId});	
				}
			}
			
			// 입력할 권한을 선택할 경우 체크박스 리셋
			function fn_chkReset(){
				
				if($("#authorityUUID option:selected").val() == undefined){
					return false;
				}
				
				var boardUUID = $("#authorityUUID option:selected").val();
				
				var exists = false;
				
				if(!exists){
					if(saveArray.length > 0) {
						exists = fn_defualtCheck(saveArray, boardUUID);
					}
				}
				
				if(!exists){
					if(updateArray.length > 0) {
						exists = fn_defualtCheck(updateArray, boardUUID);
					}
				}
				
				if(!exists){
					if(originArray.length > 0){
						exists = fn_defualtCheck(originArray, boardUUID);	
					}
				}
				
				if(!exists){
					comCheckProp(["chkAll", "chkListYn", "chkViewYn", "chkUpdateYn", "chkSaveYn", "chkDeleteYn"], false);
				}
				
			}
			
			// 기본 체크
			function fn_defualtCheck(arr, uuid) {
				
				var exists = false;
				var objArray = new Array();
				
				for(var idx in arr){
					if(arr[idx].id == uuid){
						
						exists = true;
						
						for(var nm in arr[idx].obj){
							
							objArray.push(nm);
							
							var flag = false;
							if(arr[idx].obj[nm] == 1){
								flag = true;
							}
							
							switch(nm){
								case "listYn":
									comCheckProp(["chkListYn"], flag);
									break;
								case "viewYn":
									comCheckProp(["chkViewYn"], flag);
									break;
								case "updateYn":
									comCheckProp(["chkUpdateYn"], flag);
									break;
								case "saveYn":
									comCheckProp(["chkSaveYn"], flag);
									break;
								case "deleteYn":
									comCheckProp(["chkDeleteYn"], flag);
									break;
							}
							
						}
					}
				}
				
				var chkArray = {"listYn": "chkListYn", "viewYn" : "chkViewYn", "updateYn":"chkUpdateYn", "saveYn":"chkSaveYn", "deleteYn":"chkDeleteYn"};
				if(objArray.length != 5){
					for(var obj in chkArray){
						for(j in objArray){
							if(obj === objArray[j]){
								delete chkArray[obj];							
							}
						}
					}
				}
				 
				if(chkArray.length > 0){
					for(var obj in chkArray){
						comCheckProp([chkArray[obj]], false);
					}
				}				 
				
				if(!exists){
					comCheckProp(["chkAll", "chkListYn", "chkViewYn", "chkUpdateYn", "chkSaveYn", "chkDeleteYn"], false);
				} 
				
				return exists;
			}
			
			// 원본데이터에 데이터가 있는지 체크
			function chkOriginArray(uuid){
				var gubun = "";
				var authId = ""; 
				if(originArray.length > 0){
					for(var idx in originArray){
						if( originArray[idx].id == uuid ){
							authId = originArray[idx].authId;
							gubun = "update";
						} 
					}
					
					if(gubun == ""){
						authId = "";
						gubun = "save";
					}
				} else {
					authId = "";
					gubun = "save";
				}
				
				return [gubun, authId];
			}
			
			function arrayToJson(arr){
				return JSON.stringify(arr);
			}
			
			// 데이터 저장
			function fn_save(){
				if(saveArray.length == 0 && updateArray.length == 0 && deleteArray.length == 0){
					alert("저장할 내용이 없습니다.");
					return false;
				}
				
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("/mngr/auth/board/action.do");
				if(saveArray.length > 0){
					comSubmit.addParam("saveArray",  arrayToJson(saveArray));
				} 
				if(updateArray.length > 0){
					comSubmit.addParam("updateArray",  arrayToJson(updateArray));
				}
				if(deleteArray.length > 0){
					comSubmit.addParam("deleteArray",  arrayToJson(deleteArray));
				}
				comSubmit.submit();
			}
			
		</script>
		
	</body>
</html>
