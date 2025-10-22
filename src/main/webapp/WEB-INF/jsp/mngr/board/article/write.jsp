<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("LF", "\r\n"); %> 
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="BOARD ARTICLE ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		<script type="text/javascript" src="<c:url value='/js/ckEditor/ckeditor.js'/>"></script>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<h2 class="sub-header">${boardVO.boardId}&nbsp;${fn:toUpperCase(mode)}</h2>
			<form id="articleFrm" enctype="multipart/form-data">
			
			<input type="hidden" id="mode" 						name="mode" 					value="${mode}"/>
			<input type="hidden" id="page" 						name="page" 					value="${page}"/>
			<input type="hidden" id="rowCount" 					name="rowCount" 				value="${rowCount}"/>
			<input type="hidden" id="categoryUUID" 				name="categoryUUID" 			value="${categoryUUID}"/>
			<input type="hidden" id="boardUUID" 				name="boardUUID" 				value="${boardVO.boardUUID}"/>
			<c:if test="${boardVO.boardUseSecret eq 0}">
			<input type="hidden" id="boardArticleSecretYn" 		name="boardArticleSecretYn" 	value="${boardArticleVO.boardArticleSecretYn eq 0 ? 1 : boardArticleVO.boardArticleSecretYn}"/>
			</c:if>
			<input type="hidden" id="boardArticleState" 		name="boardArticleState" 		value="${boardArticleVO.boardArticleState}"/>
			<c:if test="${mode eq 'reply'}">
			<input type="hidden" id="parentBoardArticleUUID" 	name="parentBoardArticleUUID" 	value="${parentBoardArticleUUID}"/>
			</c:if>
			<c:if test="${mode eq 'update'}">
			<input type="hidden" id="boardArticleUUID" 			name="boardArticleUUID" 		value="${boardArticleVO.boardArticleUUID}"/>
			<input type="hidden" id="boardArticleGroup" 		name="boardArticleGroup" 		value="${boardArticleVO.boardArticleGroup}"/>
			<input type="hidden" id="boardArticleSeq" 			name="boardArticleSeq" 			value="${boardArticleVO.boardArticleSeq}"/>
			<input type="hidden" id="boardArticleLevel" 		name="boardArticleLevel" 		value="${boardArticleVO.boardArticleLevel}"/>
			<input type="hidden" id="boardArticleEtc1" 			name="boardArticleEtc1" 		value="${boardArticleVO.boardArticleEtc1}"/>
			<input type="hidden" id="boardArticleEtc2" 			name="boardArticleEtc2" 		value="${boardArticleVO.boardArticleEtc2}"/>
			<input type="hidden" id="boardArticleEtc3" 			name="boardArticleEtc3" 		value="${boardArticleVO.boardArticleEtc3}"/>
			<input type="hidden" id="boardArticleEtc4" 			name="boardArticleEtc4" 		value="${boardArticleVO.boardArticleEtc4}"/>
			<input type="hidden" id="boardArticleEtc5" 			name="boardArticleEtc5" 		value="${boardArticleVO.boardArticleEtc5}"/>
			</c:if>
			
			<div class="row">
				<div class="col-sm-12 pt-3">
				
					<c:if test="${fn:length(categoryList) gt 0}">
					<div class="form-row">
						<div class="form-group">
							<label for="boardCategoryUUID">카테고리목록</label>
							<select class="form-control" id="boardCategoryUUID" name="boardCategoryUUID">
								<option value="">선택</option>
								<c:forEach var="item" items="${categoryList}">
								<option value="${item.boardCategoryUUID}" 
								 <c:choose>
								 	<c:when test="${item.boardCategoryUUID eq boardArticleVO.boardCategoryUUID}">selected
								 	</c:when>
								 	<c:otherwise>
								 		<c:if test="${item.boardCategoryUUID eq categoryUUID }">selected</c:if>
								 	</c:otherwise>
								 </c:choose>
								>${item.boardCategoryName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					</c:if>
				
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleTitle">게시글 제목</label>
							<input type="text" id="boardArticleTitle" name="boardArticleTitle" class="form-control" <c:choose><c:when test="${mode eq 'reply'}">value="[답글]"</c:when><c:otherwise>value="${boardArticleVO.boardArticleTitle}"</c:otherwise></c:choose> />
						</div>
					</div>
					
					
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleContent">게시글 내용</label>
							<textarea rows="20" cols="100" id="ckeditor1" name="boardArticleContent"></textarea>
						</div>
					</div>	
					
					<c:if test="${boardVO.boardUseSecret eq 1}">
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleSecretYn">공개 여부</label>
							<select id="boardArticleSecretYn" name="boardArticleSecretYn" class="form-control">
								<option value="1" <c:if test="${boardArticleVO.boardArticleSecretYn eq 1}">selected</c:if>>공개</option>
								<option value="2" <c:if test="${boardArticleVO.boardArticleSecretYn eq 2}">selected</c:if>>비공개</option>
							</select>
						</div>
					</div>
					</c:if>
					
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleSecretYn">게시글 상태</label>
							<input type="radio" id="chkState1" name="chkState" value="1" <c:if test="${boardArticleVO.boardArticleState eq 1}">checked</c:if> />일반
							<input type="radio" id="chkState2" name="chkState" value="2" <c:if test="${boardArticleVO.boardArticleState eq 2}">checked</c:if> />차단
							<input type="radio" id="chkState3" name="chkState" value="3" <c:if test="${boardArticleVO.boardArticleState eq 3}">checked</c:if> />공지
						</div>
					</div>
					
					<div class="form-row">
						<c:if test="${boardVO.boardFstPeriodYn eq 1 }">
						<div class="form-group col-md-3">
							<label for="period1">첫번째 기간</label>
							<input type="text" class="form-control" id="boardArticleStartDt" name="boardArticleStartDt" value="${boardArticleVO.getStrBoardArticleStartDt('yyyy-MM-dd') }"/>
							<input type="text" class="form-control" id="boardArticleEndDt" name="boardArticleEndDt" value="${boardArticleVO.getStrBoardArticleEndDt('yyyy-MM-dd') }"/>
						</div>
						</c:if>
						<c:if test="${boardVO.boardSndPeriodYn eq 1 }">	
						<div class="form-group col-md-3">
							<label for="period2">기간</label>
							<input type="text" class="form-control" id="boardArticleBeginDt" name="boardArticleBeginDt" value="${boardArticleVO.getStrBoardArticleBeginDt('yyyy-MM-dd') }"/>
							<input type="text" class="form-control" id="boardArticleFinishDt" name="boardArticleFinishDt" value="${boardArticleVO.getStrBoardArticleFinishDt('yyyy-MM-dd') }"/>
						</div>
						</c:if>						
						<div class="form-group col-md-3">
							<label for="period2">특정일자</label>
							<input type="text" class="form-control" id="specificDt" name="specificDt" value="${boardArticleVO.getStrBoardArticleSpecificDt('yyyy-MM-dd') }"/>
						</div>
					</div>
					
					
					<c:if test="${boardVO.boardFileUploadYn eq 1 }">
					<div class="form-row">
						<div class="form-group">
							<label for="fileList">첨부파일</label>
							<c:forEach var="item" items="${boardArticleVO.fileList}">
							<div class="form-inline" id="${item.boardArticleFileUUID}">
								<a href="/downloadFile.do?pathNum=1&amp;fileUUID=${item.boardArticleFileUUID}">${item.boardArticleFileName}</a>
								<button type="button" class="btn btn-danger" onclick="fn_deleteFile('${item.boardArticleFileUUID}', 1)">삭제</button>
							</div> 
							</c:forEach>
							<input type="file" id="files" name="files" class="form-control"/>
						</div>
					</div>	
					</c:if>
				</div>
			</div>
			</form>
			
			<div class="form-group row">
				<div class="col-sm-12 text-right">
					<button type="button" class="btn btn-primary" id="btnList">목록</button>
					<button type="button" class="btn btn-default" id="btnSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
	<script type="text/javascript">
	$(function(){
		
		CKEDITOR.replace('ckeditor1', {
			filebrowserUploadUrl:'/ckeditor/fileupload.do',
			uploadUrl:'/ckeditor/fileupload.do'
		});	
					
		var defaultSet = {
			format: "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )	
			autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			language : "kr" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.	
		}
		
		<c:if test="${boardVO.boardFstPeriodYn eq 1 }">
		$("#boardArticleStartDt").datepicker(defaultSet);
		$("#boardArticleEndDt").datepicker(defaultSet);
		</c:if>
		
		<c:if test="${boardVO.boardSndPeriodYn eq 1 }">
		$("#boardArticleBeginDt").datepicker(defaultSet);
		$("#boardArticleFinishDt").datepicker(defaultSet);
		</c:if>
		
		$("#specificDt").datepicker(defaultSet);
		
		$("#btnSave").on("click", function(e){
			e.preventDefault();
			fn_save();
		});
		
		$("#btnList").on("click", function(e){
			e.preventDefault();
			fn_list();
		});
		
		$("#btnReply").on("click", function(e){
			e.preventDefault();
			fn_reply();
		});
		
		<c:if test="${mode eq 'update'}">
		CKEDITOR.instances.ckeditor1.setData('${fn:replace(boardArticleVO.boardArticleContent, LF,'')}');
		</c:if>
		
	});
	
	<c:if test="${boardVO.boardFstPeriodYn eq 1 }">
	$("#boardArticleEndDt").on("changeDate", function(e){
		if(!$("#boardArticleStartDt").val()){
			alert("시작일이 선택되지 않았습니다.");
			$("#boardArticleEndDt").val('');
			$("#boardArticleStartDt").focus();
			return false;
		}
		
		var strtDt = $("#boardArticleStartDt").val();
		strtDt = strtDt.replace(/(-)/g,'');
		
		var endDt = timestampToYYYYMMDD(e.date.valueOf(),'');
		
		if(endDt < strtDt){
			alert("종료일이 잘못 입력되었습니다.");
			$("#boardArticleEndDt").val('');
			$("#boardArticleEndDt").focus();
			return false;
		}
		
	});
	</c:if>
	
	<c:if test="${boardVO.boardSndPeriodYn eq 1 }">
	$("#boardArticleFinishDt").on("changeDate", function(e){
		if(!$("#boardArticleBeginDt").val()){
			alert("시작일이 선택되지 않았습니다.");
			$("#boardArticleFinishDt").val('');
			$("#boardArticleBeginDt").focus();
			return false;
		}
		
		var strtDt = $("#boardArticleBeginDt").val();
		strtDt = strtDt.replace(/(-)/g,'');
		
		var endDt = timestampToYYYYMMDD(e.date.valueOf(),'');
		
		if(endDt < strtDt){
			alert("종료일이 잘못 입력되었습니다.");
			$("#boardArticleFinishDt").val('');
			$("#boardArticleFinishDt").focus();
			return false;
		}	
	});
	</c:if>
	
	// 목록으로 이동
	function fn_list(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/list.do");
		/*comSubmit.addParam("boardUUID",'${boardVO.boardUUID}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});*/
		comSubmit.submit();
	}
	
	// 저장
	function fn_save(){
		
		if(!$("#boardArticleTitle").val()){
			alert('제목을 입력해주십시오.');
			$("#boardArticleTitle").focus();
			return false;
		}
		
		var content = CKEDITOR.instances.ckeditor1.getData();
		if(content == null || content == ''){
			alert('내용을 입력해주십시오.');
			return false;
		}
		
		var state = $("input[name='chkState']:checked").val();
		
		if(state == null || state == undefined){
			$("#chkState").val("1");
		} else {
			$("#boardArticleState").val(state);
		}
		
		<c:if test="${boardVO.boardFstPeriodYn eq 1 }">
		if(!$("#boardArticleStartDt").val()){
			alert("시작일이 선택되지 않았습니다.");
			$("#boardArticleStartDt").focus();
			return false;
		}
		if(!$("#boardArticleEndDt").val()){
			alert("종료일이 선택되지 않았습니다.");
			$("#boardArticleEndDt").focus();
			return false;
		}
		
		var startDt = $("#boardArticleStartDt").val();
		startDt = startDt.replace(/(-)/g,'');
		var endDt = $("#boardArticleEndDt").val();
		endDt = endDt.replace(/(-)/g,'');
		
		if(endDt < startDt){
			alert("종료일이 잘못 입력되었습니다.");
			$("#boardArticleEndDt").val('');
			$("#boardArticleEndDt").focus();
			return false;
		}
		</c:if>
		
		<c:if test="${boardVO.boardSndPeriodYn eq 1 }">
		if(!$("#boardArticleBeginDt").val()){
			alert("시작일이 선택되지 않았습니다.");
			$("#boardArticleBeginDt").focus();
			return false;
		}
		if(!$("#boardArticleFinishDt").val()){
			alert("종료일이 선택되지 않았습니다.");
			$("#boardArticleFinishDt").focus();
			return false;
		}
		
		var beginDt = $("#boardArticleBeginDt").val();
		beginDt = beginDt.replace(/(-)/g,'');
		var finishDt = $("#boardArticleFinishDt").val();
		finishDt = finishDt.replace(/(-)/g,'');
		
		if(finishDt < beginDt){
			alert("종료일이 잘못 입력되었습니다.");
			$("#boardArticleFinishDt").val('');
			$("#boardArticleFinishDt").focus();
			return false;
		}
		</c:if>
		
		var mode = '${mode}';
		var comSubmit = new ComSubmit("articleFrm");
		if(mode == 'update'){
			comSubmit.setUrl("/mngr/board/article/update.do");
		} else if (mode == 'write'){
			comSubmit.setUrl("/mngr/board/article/save.do");
		} else {
			comSubmit.setUrl("/mngr/board/article/reply.do");
		}
		if($("#specificDt").val()){
			comSubmit.addParam("boardArticleSpecificDt",$("#specificDt").val());
		}
		comSubmit.submit();
	}
	
	// 파일삭제
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
					
					if(data.code == "200"){
						$("#"+uuid).remove();
					}
					
					alert(data.message);
					
				},
				error: function (err) {
					console.log(err);
				}
			});
		} else return false;
	}
	</script>
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>