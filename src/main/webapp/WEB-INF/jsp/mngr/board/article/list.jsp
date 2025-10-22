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
		<jsp:param value="BOARD ARTICLE LIST" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<h2 class="sub-header">[게시판ID] 게시글 관리</h2>

			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>

			<div class="form-inline text-right">
				<c:if test="${fn:length(categoryList) gt 0 }">
				<div class="form-group col-sm2">
					<select class="form-control" name="categoryUUID" id="categoryUUID">
						<option value="">선택</option>
						<c:forEach var="item" items="${categoryList}">
						<option value="${item.boardCategoryUUID}" <c:if test="${categoryUUID eq item.boardCategoryUUID}">selected</c:if>>${item.boardCategoryName}</option>
						</c:forEach>
					</select>
				</div>
				</c:if>
			
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default btn-primary" id="btnSearch">검색</button>
				</div>
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default" id="btnRegister">신규등록</button>
				</div>
			</div>
			
			<div class="table-responsive">
				<table class="table cmsTable">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
					</colgroup>
	            	<thead>
	            		<tr>
	            			<th class="text-center">No</th>
	            			<th class="text-center">게시글 제목</th>
	            			<c:if test="${boardVO.boardUseSecret eq 1 }">
	            			<th class="text-center">공개 비공개 여부</th>
	            			</c:if>
	                  		<th class="text-center">게시글 조회수</th>
	                  		<c:if test="${boardVO.boardFileUploadYn eq 1 }">
	                  		<th class="text-center">게시글 첨부파일여부</th>
	                  		</c:if>
	                  		<th class="text-center">등록일</th>
	                  		<th colspan="4" class="text-center">관리</th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              	<c:forEach var="item" items="${list}" varStatus="status">
	              		 <tr>
			                <td class="text-center">${totalCount - ((pagenation.curPage-1) * rowCount + status.index) }</td>
			                <td class="text-center"><a href="#" onclick="fn_view('${item.boardArticleUUID}'); return false;">${item.boardArticleTitle}</a></td>
			               	<c:if test="${boardVO.boardUseSecret eq 1 }">
	            			<td class="text-center">${item.getStrBoardArticleSecretYn()}</td>
	            			</c:if>
			                <td class="text-center">${item.boardArticleViewCount}</td>
			                <c:if test="${boardVO.boardFileUploadYn == 1 }">
			                <td class="text-center"><c:if test="${fn:length(item.fileList) > 0}">첨부</c:if></td>
			                </c:if>
			                <td class="text-center"><fmt:formatDate value="${item.registDt}" pattern="yyyy-MM-dd"/> </td>
			                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.boardArticleUUID}')">수정</button></td>
			                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.boardArticleUUID}')">삭제</button></td>
		                </tr>
	              	</c:forEach>
	                <tr>
		                <td class="text-center">1</td>
		                <td class="text-center"><a href="#" onclick="fn_view('${item.boardArticleUUID}'); return false;">테스트 게시글</a></td>
		                <td class="text-center">1000</td>
		                <td class="text-center">2023-09-21</td>
		                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.boardArticleUUID}')">수정</button></td>
		                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.boardArticleUUID}')">삭제</button></td>
	                </tr>
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

		var gubun = '${gubun}';

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


	$(function(){
		$("#btnRegister").on("click", function(e){
			e.preventDefault();
			fn_write();
		});
		
		$("#btnSearch").on("click", function(e){
			e.preventDefault();
			fn_search();

			dataChk();
			drawPage();
		});
	});
	
	// 게시글 상세
	function fn_view(uuid){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/view.do");
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("boardArticleUUID",uuid);
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		<c:if test="${fn:length(categoryList) gt 0 }">
		comSubmit.addParam("categoryUUID",$("#categoryUUID").val());		
		</c:if>
		comSubmit.submit();
	}
		
	// 게시글 작성
	function fn_write(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/register.do");
		comSubmit.addParam("mode",'write');
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		<c:if test="${fn:length(categoryList) gt 0 }">
		comSubmit.addParam("categoryUUID",$("#categoryUUID").val());		
		</c:if>
		comSubmit.submit();
	}
	
	// 게시글 검색
	function fn_search(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/list.do");
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		<c:if test="${fn:length(categoryList) gt 0 }">
		comSubmit.addParam("categoryUUID",$("#categoryUUID").val());		
		</c:if>
		comSubmit.submit();
	}
	
	// 게시글 수정
	function fn_update(uuid){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/register.do");
		comSubmit.addParam("mode",'update');
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("boardArticleUUID",uuid);
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		<c:if test="${fn:length(categoryList) gt 0 }">
		comSubmit.addParam("categoryUUID",$("#categoryUUID").val());		
		</c:if>
		comSubmit.submit();
	}
	
	// 게시글 삭제
	function fn_delete(uuid){
		if(confirm("게시판을 삭제하시겠습니까?")){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/board/article/delete.do");
			comSubmit.addParam("boardUUID",'${boardUUID}');
			comSubmit.addParam("boardArticleUUID",uuid);
			comSubmit.addParam("page",${page});
			comSubmit.addParam("rowCount",${rowCount});
			<c:if test="${fn:length(categoryList) gt 0 }">
			comSubmit.addParam("categoryUUID",$("#categoryUUID").val());		
			</c:if>
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