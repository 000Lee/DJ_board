<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>        
<% pageContext.setAttribute("LF", "\r\n"); %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="CONTENT ${fn:toUpperCase(mode)}" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		<script type="text/javascript" src="<c:url value='/js/ckEditor/ckeditor.js'/>"></script>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<%--<h2 class="sub-header">${fn:toUpperCase(mode)}</h2>--%>
			<h2 class="sub-header">상위 카테고리 등록/수정</h2>
			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>
			<div class="row">
				<div class="col-sm-12 pt-3">
					<form id="contentFrm">
					<input type="hidden" id="mode" 			 	 name="mode" 				value="${mode}"/>
					<input type="hidden" id="searchContent"  	 name="searchContent" 		value="${searchContent}"/>
					<input type="hidden" id="menuGroup"  		 name="menuGroup" 			value="${menuGroup}"/>
					<input type="hidden" id="menuUUID" 		 	 name="menuUUID"			value="${contentVO.menuUUID}"/>
					<c:if test="${mode eq 'update'}">
					<input type="hidden" id="contentUUID" 		 name="contentUUID"  		value="${contentVO.contentUUID}">
					</c:if>

					<table class="__tbl respond2 fix">
						<tbody>
						<tr>
							<th>컨텐츠 제목</th>
							<td class="tal" colspan="3">
								<input type="text" id="contentTitle" name="contentTitle" class="__inp" value="${contentVO.contentTitle}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>컨텐츠 내용</th>
							<td class="tal" colspan="3">
								<textarea rows="20" cols="100" id="ckeditor1" name="contentContents"></textarea>
							</td>
						</tr>
						<tr>
							<th>컨텐츠 보기페이지</th>
							<td class="tal" colspan="3">
								<input type="text" id="contentViewName" name="contentViewName" class="__inp" value="${contentVO.contentViewName}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>컨텐츠 기간</th>
							<td class="tal" colspan="3">
								<input type="text" class="dateInput" id="startDt" name="startDt" style="width:25rem" value=""/>&nbsp&nbsp~&nbsp&nbsp
								<input type="hidden" id="returnStartDay" value="${contentVO.getStrContentStartDt}">
							   	<input type="text" class="dateInput" id="endDt" name="endDt" style="width:25rem" value=""/>
								<input type="hidden" id="returnEndDay" name="returnEndDay" value="${contentVO.getStrContentEndDt}"
								<%--<input type="text" class="__inp" id="startDt" name="startDt" value="${contentVO.getStrContentStartDt('yyyy-MM-dd') }"/>
								<input type="text" class="__inp" id="endDt" name="endDt" value="${contentVO.getStrContentEndDt('yyyy-MM-dd') }"/>--%>
							</td>
						</tr>
						<tr>
							<th>임시컬럼1</th>
							<td class="tal" colspan="3">
								<input type="text" id="contentEtc1" name="contentEtc1" class="__inp" value="${contentVO.contentEtc1}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>임시컬럼2</th>
							<td class="tal" colspan="3">
								<input type="text" id="contentEtc2" name="contentEtc2" class="__inp" value="${contentVO.contentEtc2}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>임시컬럼3</th>
							<td class="tal" colspan="3">
								<input type="text" id="contentEtc3" name="contentEtc3" class="__inp" value="${contentVO.contentEtc3}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>임시컬럼4</th>
							<td class="tal" colspan="3">
								<input type="text" id="contentEtc4" name="contentEtc4" class="__inp" value="${contentVO.contentEtc4}" maxlength="30"/>
							</td>
						</tr>
						<tr>
							<th>임시컬럼5</th>
							<td class="tal" colspan="3">
								<input type="text" id="contentEtc5" name="contentEtc5" class="__inp" value="${contentVO.contentEtc5}" maxlength="30"/>
							</td>
						</tr>
						</tbody>
					</table>
					</form>

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
	$(function () {


		var today = new Date();
		var tomorrow = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
		var defalutStartTime = "09시";
		var defalutEndTime = "18시";

		var finalStartDt;
		var finalEndDt;

		if(!$("#returnStartDt").val()){
			finalStartDt = today;
			finalEndDt = tomorrow;
			finalStartTime = defalutStartTime;
			finalEndTime = defalutEndTime;
		}else{
			finalStartDt = $("#returnStartDt").val();
			finalEndDt = $("#returnEndDt").val();
			finalStartTime = returnStartTime + "시";
			finalEndTime = returnEndTime + "시";
		}

		$("#startDt").kendoDatePicker({
			depth: "",
			start: "",
			culture: "ko-KR",
			format: "yyyy-MM-dd",
			value: finalStartDt
		});

		$("#endDt").kendoDatePicker({
			depth: "",
			start: "",
			culture: "ko-KR",
			format: "yyyy-MM-dd",
			value: finalEndDt
		});


		CKEDITOR.replace('ckeditor1', {
			filebrowserUploadUrl:'/ckeditor/fileupload.do',
			uploadUrl:'/ckeditor/fileupload.do'
		});
		
		var defaultSet = {
			format: "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )	
			autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			language : "kr" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.	
		};
		
		$("#startDt").datepicker(defaultSet);
		$("#endDt").datepicker(defaultSet);
		
		$("#btnSave").on("click", function(e){
			e.preventDefault();
			fn_save();
		});
		
		$("#btnList").on("click", function(e){
			e.preventDefault();
			fn_list();
		});
		
		<c:if test="${mode eq 'update'}">
		CKEDITOR.instances.ckeditor1.setData('${fn:replace(contentVO.contentContents, LF,'')}');
		</c:if>
		
	});
	
	$("#endDt").on("changeDate", function(e){
		if(!$("#startDt").val()){
			alert("시작일이 선택되지 않았습니다.");
			$("#endDt").val('');
			$("#startDt").focus();
			return false;
		}
		
		var strtDt = $("#startDt").val();
		strtDt = strtDt.replace(/(-)/g,'');
		
		var endDt = timestampToYYYYMMDD(e.date.valueOf(),'');
		
		if(endDt < strtDt){
			alert("종료일이 잘못 입력되었습니다.");
			$("#endDt").val('');
			$("#startDt").focus();
			return false;
		}
		
	});
	
	// 목록으로 이동
	function fn_list(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/content/list.do");
		comSubmit.addParam("menuGroup",${menuGroup});
		comSubmit.addParam("searchContent",${searchContent});
		comSubmit.submit();
	}
	
	// 저장
	function fn_save(){

		var startDate = $("#startDt").val();
		var endDate = $("#endDt").val();
		
		if(!$("#contentTitle").val()){
			alert('제목을 입력해주십시오.');
			$("#contentTitle").focus();
			return false;
		}
		
		var content = CKEDITOR.instances.ckeditor1.getData();
		if(content == null || content == ''){
			alert('내용을 입력해주십시오.');
			return false;
		}
		
		if($("#startDt").val() && $("#endDt").val()){
			var startDt = $("#startDt").val();
			startDt = startDt.replace(/(-)/g,'');
			var endDt = $("#endDt").val();
			endDt = endDt.replace(/(-)/g,'');
			
			if(endDt < startDt){
				alert("종료일이 잘못 입력되었습니다.");
				$("#endDt").val('');
				$("#endDt").focus();
				return false;
			}
		}
		
		var mode = '${mode}';
		var comSubmit = new ComSubmit("contentFrm");
		if(mode == 'update'){
			comSubmit.setUrl("/mngr/content/update.do");
		} else {
			comSubmit.setUrl("/mngr/content/save.do");
		}
		
		if($("#startDt").val() && $("#endDt").val()){
			comSubmit.addParam("contentStartDt", $("#startDt").val());
			comSubmit.addParam("contentEndDt", $("#endDt").val());
		}
		comSubmit.submit();
	}
	</script>
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>