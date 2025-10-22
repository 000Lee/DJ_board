<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="BOARD CATEGORY LIST" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

			<h2 class="sub-header">게시판 카테고리 관리</h2>

			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>

			<div class="form-inline text-right">
				<div class="form-group col-sm2">
					<select class="form-control" name="categoryGroup" id="categoryGroup">
						<c:forEach var="item" items="${groupList}">
						<option value="${item.boardCategoryGroup}" <c:if test="${categoryGroup == item.boardCategoryGroup}">selected</c:if>>${item.boardCategoryName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-sm6">	
					<input type="text" class="form-control" name="searchContent" id="searchContent" value="${searchContent}" />
				</div>	
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default btn-primary" id="btnSearch">검색</button>
				</div>
				<%-- 상위카테고리는 하나만 등록되도록하자 --%>
				<c:if test="${fn:length(groupList) eq 0}">
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default" id="btnRegister">상위 카테고리 등록</button>
				</div>
				</c:if>
			</div>
			
			<div class="table-responsive">
				<table class="table cmsTable">
					<thead>
	            		<tr>
	            			<th class="text-center">게시판 카테고리명</th>
	            			<th class="text-center">그룹</th>
	            			<th class="text-center">사용여부</th>
	                  		<th colspan="2" class="text-center">관리</th>
	                  		<th></th>
	                  		<th></th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              		<c:forEach var="item" items="${list}">
	              		<tr>
	              			<td><c:forEach var="i" begin="1" end="${item.getTempIntField1()}">▷</c:forEach>▶${item.boardCategoryName}</td>
	              			<td class="text-center">${item.boardCategoryGroup}</td>
	              			<td class="text-center">${item.getStrUseAt()}</td>
	              			<td class="text-center"><button type="button" class="btn btn-default" onclick="fn_childRegister('${item.boardCategoryUUID}')">＋ 하위카테고리등록</button></td>
	              			<td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.boardCategoryUUID}')">수정</button></td>
	              			<td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.boardCategoryUUID}')">삭제</button></td>
	              		</tr>
	              		</c:forEach>
	              	</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>

	<div class="row text-center">
		<nav class="paging">
			<ul class="pagination">
			</ul>
		</nav>
	</div>

	<script type="text/javascript">
	
	var categoryGroup = ${categoryGroup};

	var firstData = fn_customAjax('/mngr/bannerpopup/selectBoardList.do?recordSize=4','');
	var flag = false;

	var paginationData;
	var startPage;
	var endPage;
	var totalEndPage;
	var page;
	var total = firstData.articlePage.pagination.totalRecordCount;

	/** 최초의 데이터와 페이지 이동할 때의 데이터 구분 */
	function dataChk(e, f) {
		if(flag == false){
			paginationData = firstData.articlePage.pagination;
			startPage = paginationData.startPage;
			endPage = paginationData.endPage;
			totalEndPage = paginationData.totalPageCount;
			page = firstData.articlePage.page;
		}else if(flag == true){
			paginationData = e.articlePage.pagination;
			startPage = paginationData.startPage;
			endPage = paginationData.endPage;
			totalEndPage = paginationData.totalPageCount;
			page = e.articlePage.page;
			total = e.articlePage.pagination.totalRecordCount;
		}
	}

	var data = firstData.list.list;
	
	$(function() {
		$("#btnSearch").on("click",function(e){
			e.preventDefault();
			fn_search();
		});
		
		$("#btnRegister").on("click",function(e){
			e.preventDefault();
			fn_register();
		});

		dataChk();
		drawPage();

	});
	
	// 게시판 카테고리 검색
	function fn_search(){
		
		if($("#categoryGroup").val()){
			categoryGroup = $("#categoryGroup").val();	
		}
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/category/list.do");
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("categoryGroup", categoryGroup);
		comSubmit.addParam("searchContent",$("#searchContent").val());
		comSubmit.submit();
	}
	
	// 상위 카테고리 등록
	function fn_register(){
		
		if($("#categoryGroup").val()){
			categoryGroup = $("#categoryGroup").val();	
		}
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/category/register.do");
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("mode",'write');
		comSubmit.addParam("categoryGroup", categoryGroup);
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 하위 카테고리 등록
	function fn_childRegister(uuid){
		
		if($("#categoryGroup").val()){
			categoryGroup = $("#categoryGroup").val();	
		}
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/category/register.do");
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("mode",'write');
		comSubmit.addParam("parentCategoryUUID",uuid);
		comSubmit.addParam("categoryGroup", categoryGroup);
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 게시판 카테고리 수정
	function fn_update(uuid){
		
		if($("#categoryGroup").val()){
			categoryGroup = $("#categoryGroup").val();	
		}
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/category/register.do");
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("mode",'update');
		comSubmit.addParam("boardCategoryUUID",uuid);
		comSubmit.addParam("categoryGroup", categoryGroup);
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 게시판 카테고리 삭제
	function fn_delete(uuid){
		
		if($("#categoryGroup").val()){
			categoryGroup = $("#categoryGroup").val();	
		}
		
		if(confirm("게시판 카테고리를 삭제하시겠습니까?")){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/board/category/delete.do");
			comSubmit.addParam("boardUUID",'${boardUUID}');
			comSubmit.addParam("boardCategoryUUID",uuid);
			comSubmit.addParam("categoryGroup", categoryGroup);
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.submit();
		} else return false;
	}

	//페이징 HTML
	function drawPage(){
		let html = '';
		html += '<li><a href="javascript:void(0);" onclick="movePage(' + 1 + ')" aria-label="Previous" ><span aria-hidden="true">&laquo;</span></a></li>';
		html += '<li><a href="javascript:void(0);" onclick="movePage(' + (page - 1) + ')" ><span aria-hidden="true">&lt;</span></a></li>';

		for (let i =startPage; i <= endPage; i++) {
			html += (i !== page)
					? '<li><a href="javascript:void(0);" onclick="movePage('+i+');">'+ i +'</a><li>'
					: '<li class="active"><a>' + i + '</a></li>'
		}

		html += '<li><a href="javascript:void(0);" onclick="movePage(' + (page + 1) + ');" ><span aria-hidden="true">&gt;</span></a></li>';
		html += '<li><a href="javascript:void(0);" onclick="movePage(' + totalEndPage + ');" ><span aria-hidden="true">&raquo;</span></a></li>';

		$(".pagination").html(html);
	}

	function fn_customAjax(url, data){
		var result;

		$.ajax({
			url : url,
			data : data,
			type : "post",
			dataType : "json",
			async : false,
			success : function(rs) {
				result = rs;
				result.flag = true;
			},
			error :function (e) {
				result.flag = false;
				console.log('error : ', e);
			}
		});

		return result;
	}

	</script>
	
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>