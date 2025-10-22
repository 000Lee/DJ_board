<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="BOARD ARTIVLE VIEW" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<h2 class="sub-header">VIEW</h2>
			<div class="row">
				<div class="col-sm-12 pt-3">
					<c:if test="${boardArticleVO.boardCategoryUUID ne null }">
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleTitle">카테고리</label>
							<p>${boardArticleVO.getTempStrField1()}</p>
						</div>
					</div>
					</c:if>
					
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleTitle">게시글 제목</label>
							<p>테스트 게시글</p>
						</div>
					</div>
					
					
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleContent">게시글 내용</label>
							<p>테스트입니다.</p>
						</div>
					</div>	
					
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleSecretYn">공개 여부</label>
							<p>공개</p>
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group">
							<label for="boardArticleSecretYn">게시글 상태</label>
							<p>일반</p>
						</div>
					</div>
					
					<div class="form-row">
						<c:if test="${boardVO.boardFstPeriodYn eq 1 }">
						<div class="form-group col-md-3">
							<label for="period1">첫번째 기간</label>
							<p>${boardArticleVO.getStrBoardArticleStartDt('yyyy-MM-dd') }&nbsp;~&nbsp;${boardArticleVO.getStrBoardArticleEndDt('yyyy-MM-dd') }</p>
						</div>
						</c:if>
						<c:if test="${boardVO.boardSndPeriodYn eq 1 }">	
						<div class="form-group col-md-3">
							<label for="period2">기간</label>
							<p>${boardArticleVO.getStrBoardArticleBeginDt('yyyy-MM-dd') }&nbsp;~&nbsp;${boardArticleVO.getStrBoardArticleFinishDt('yyyy-MM-dd') }</p>
						</div>
						</c:if>						
						<div class="form-group col-md-3">
							<label for="period2">특정일자</label>
							<p>${boardArticleVO.getStrBoardArticleSpecificDt('yyyy-MM-dd') }</p>
						</div>
					</div>
					
					<c:if test="${boardVO.boardFileUploadYn eq 1 }">
					<div class="form-row">
						<div class="form-group">
							<label for="fileList">첨부파일</label>
							<c:forEach var="item" items="${boardArticleVO.fileList}">
							<div class="form-inline" id="${item.boardArticleFileUUID}">
								<a href="/downloadFile.do?pathNum=1&amp;fileUUID=${item.boardArticleFileUUID}">${item.boardArticleFileName}</a>
							</div> 
							</c:forEach>
						</div>
					</div>	
					</c:if>

					<div class="form-row">
						<div class="form-group">
							<label for="fileList">첨부파일</label>
							<c:forEach var="item" items="${boardArticleVO.fileList}">
								<div class="form-inline" id="${item.boardArticleFileUUID}">
									<a href="/downloadFile.do?pathNum=1&amp;fileUUID=${item.boardArticleFileUUID}">${item.boardArticleFileName}</a>
								</div>
							</c:forEach>
							<div class="form-inline" id="${item.boardArticleFileUUID}">
								<a href="/downloadFile.do?pathNum=1&amp;fileUUID=${item.boardArticleFileUUID}">테스트 파일.text</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="form-group row">
				<div class="col-sm-12 text-right">
					<button type="button" class="btn btn-primary" id="btnList">목록</button>
					<button type="button" class="btn btn-default" id="btnRegister">수정</button>
					<c:if test="${boardVO.boardReplyYn eq 1 && (boardArticleVO.boardArticleUUID ne null && boardArticleVO.boardArticleUUID ne '')}">
					<button type="button" class="btn btn-default" id="btnReply">답글</button>
					</c:if>
				</div>
			</div>
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
	<script type="text/javascript">
	$(function(){
		$("#btnRegister").on("click", function(e){
			e.preventDefault();
			fn_register();
		});
		
		$("#btnList").on("click", function(e){
			e.preventDefault();
			fn_list();
		});
		
		$("#btnReply").on("click", function(e){
			e.preventDefault();
			fn_reply();
		});
	});
	
	// 목록으로 이동
	function fn_list(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/list.do");
		/*comSubmit.addParam("boardUUID",'${boardVO.boardUUID}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});*/
		comSubmit.submit();
	}
	
	// 수정
	function fn_register() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/register.do");
		comSubmit.addParam("mode",'update');
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("boardArticleUUID",'${boardArticleVO.boardArticleUUID}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}
	
	// 답글
	function fn_reply() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/board/article/register.do");
		comSubmit.addParam("mode",'reply');
		comSubmit.addParam("boardUUID",'${boardUUID}');
		comSubmit.addParam("parentBoardArticleUUID",'${boardArticleVO.boardArticleUUID}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}
	
	</script>
	
	<jsp:include page="/WEB-INF/jsp/mngr/template/bottem.jsp" flush="true"></jsp:include>
</body>
</html>