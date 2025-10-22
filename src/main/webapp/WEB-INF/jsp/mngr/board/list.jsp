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
		<jsp:param value="BOARD LIST" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

			<h2 class="sub-header">게시판 관리</h2>

			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>
			<div class="form-inline text-right">
				<div class="form-group col-sm2">
					<select class="form-control" name="searchType" id="searchType">
						<option value="0"<c:if test="${searchType == 0}">selected</c:if>>선택</option>
						<option value="1"<c:if test="${searchType == 1}">selected</c:if> >아이디</option>
						<option value="2"<c:if test="${searchType == 2}">selected</c:if>>이름</option>
					</select>
				</div>
				<div class="form-group col-sm6">	
					<input type="text" class="form-control" name="searchContent" id="searchContent" value="${searchContent}" />
				</div>	
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default btn-primary" id="btnSearch">검색</button>
				</div>
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default" id="btnRegister">신규등록</button>
				</div>
			</div>
			
			<div class="table-responsive">
				<table class="table cmsTable">
	            	<thead>
	            		<tr>
	            			<th class="text-center" style="vertical-align: middle;">No</th>
	                  		<th class="text-center" style="vertical-align: middle;">게시판 이름</th>
	                  		<th class="text-center" style="vertical-align: middle;">키복사</th>
	                  		<th class="text-center">게시판 유형</th>
	                  		<th class="text-center">공개 비공개 사용여부</th>
	                  		<th class="text-center">기간 첫번째 사용여부</th>
	                  		<th class="text-center">기간 두번째 사용여부</th>
	                  		<th class="text-center">답글 사용여부</th>
	                  		<th class="text-center">파일업로드 사용여부</th>
	                  		<th class="text-center">게시판 사용여부</th>
	                  		<th colspan="4" class="text-center" style="vertical-align: middle;">관리</th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              	<c:forEach var="item" items="${list}" varStatus="status">
	              		 <tr>
			                <td class="text-center">${totalCount - ((pagenation.curPage-1) * rowCount + status.index) }</td>
			                <td class="text-center">[${item.boardId}]&nbsp;${item.boardName}</td>
			                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.boardUUID}')">키복사</button></td>
			                <td class="text-center">${item.getStrBoardType() }</td>
			                <td class="text-center">${item.getStrBoardUseSecret() }</td>
			                <td class="text-center">${item.getStrBoardFstPeriodYn()}</td>
			                <td class="text-center">${item.getStrBoardSndPeriodYn()}</td>
			                <td class="text-center">${item.getStrBoardReplyYn()}</td>
			                <td class="text-center">${item.getStrBoardFileUploadYn()}</td>
			                <td class="text-center">${item.getStrBoardUseYn()}</td>
			                <td class="text-center"><button type="button" class="btn btn-success" onclick="fn_categoryList('${item.boardUUID}')">카테고리 목록</button></td>
			                <td class="text-center"><button type="button" class="btn btn-success" onclick="fn_articleList('${item.boardUUID}')">게시글 목록</button></td>
			                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.boardUUID}')">수정</button></td>
			                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.boardUUID}')">삭제</button></td>
		                </tr>
	              	</c:forEach>

	                <tr>
		                <td class="text-center">1</td>
		                <td class="text-center">[게시판ID]&nbsp;공지사항</td>
		                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.boardUUID}')">키복사</button></td>
		                <td class="text-center">일반</td>
		                <td class="text-center">미사용</td>
		                <td class="text-center">미사용</td>
		                <td class="text-center">미사용</td>
		                <td class="text-center">미사용</td>
		                <td class="text-center">사용</td>
		                <td class="text-center">사용</td>
		                <td class="text-center"><button type="button" class="btn btn-success" onclick="fn_categoryList('${item.boardUUID}')">카테고리 목록</button></td>
		                <td class="text-center"><button type="button" class="btn btn-success" onclick="fn_articleList('${item.boardUUID}')">게시글 목록</button></td>
		                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.boardUUID}')">수정</button></td>
		                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.boardUUID}')">삭제</button></td>
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
			});

			dataChk();
			drawPage();
		});
	
		// 게시판 등록
		function fn_write(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/board/register.do");
			comSubmit.addParam("mode",'write');
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.addParam("page",${page});
			comSubmit.addParam("rowCount",${rowCount});
			comSubmit.submit();
		}
	
		// 게시판 수정
		function fn_update(uuid){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/board/register.do");
			comSubmit.addParam("mode",'update');
			comSubmit.addParam("boardUUID",uuid);
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.addParam("page",${page});
			comSubmit.addParam("rowCount",${rowCount});
			comSubmit.submit();
		}
		
		// 게시판삭제
		function fn_delete(uuid){
			if(confirm("게시판을 삭제하시겠습니까?")){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("/mngr/board/delete.do");
				comSubmit.addParam("boardUUID",uuid);
				comSubmit.addParam("searchContent",'${searchContent}');
				comSubmit.addParam("page",${page});
				comSubmit.addParam("rowCount",${rowCount});
				comSubmit.submit();
			} else return false;
		}
		
		// 게시판 검색
		function fn_search(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/board/list.do");
			comSubmit.addParam("searchContent",$("#searchContent").val());
			comSubmit.addParam("page",${page});
			comSubmit.addParam("rowCount",${rowCount});
			comSubmit.submit();
		}
		
		// 게시글 목록으로 이동
		function fn_articleList(uuid){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/board/article/list.do");
			comSubmit.addParam("boardUUID",uuid);
			comSubmit.submit();
		}
		
		// 카테고리 목록으로 이동
		function fn_categoryList(uuid){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/board/category/list.do");
			comSubmit.addParam("boardUUID",uuid);
			comSubmit.submit();
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