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
		<jsp:param value="배너관리" name="headerTitle"/>
	</jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
<div class="row">
	<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h2 class="sub-header">배너&nbsp;관리</h2>
		<div class="form-inline text-right" style="width: 80%;">
			<img width="90" height="40" src="/asset/images/logo.png">
		</div>
		<div class="form-inline text-right" style="width: 80%;">
			<div class="form-group col-sm2">
				<%--<select class="form-control" name="searchType" id="searchType">
					<option value="0"<c:if test="${searchType == 0}">selected</c:if>>제목</option>
					<option value="1"<c:if test="${searchType == 1}">selected</c:if> >내용</option>
				</select>--%>
				<span>배너제목</span>
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
				<colgroup>
					<col width="10%">
					<col width="60%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="50%">
				</colgroup>
				<thead>
				<tr>
					<th class="text-center">No</th>
					<th class="text-center">제목</th>
					<th class="text-center">그룹</th>
					<th class="text-center">타겟</th>
					<th class="text-center">사용여부</th>
					<th colspan="2" class="text-center">관리</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td class="text-center">${totalCount - ((pagenation.curPage-1) * rowCount + status.index) }</td>
						<td class="text-center">${item.bannerPopupTitle}</td>
						<td class="text-center">${item.getStrBannerPopupGroup()}</td>
						<td class="text-center">${item.getStrBannerPopupTarget()}</td>
						<td class="text-center">${item.getStrUseAt()}</td>
						<td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.bannerPopupUUID}')">수정</button></td>
						<td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.bannerPopupUUID}')">삭제</button></td>
					</tr>
				</c:forEach>

				<tr>
					<td class="text-center">1</td>
					<td class="text-center">테스트 팝업</td>
					<td class="text-center">메인</td>
					<td class="text-center">새창</td>
					<td class="text-center">사용</td>
					<td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.bannerPopupUUID}')">수정</button></td>
					<td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.bannerPopupUUID}')">삭제</button></td>
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

    function fn_write(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("/mngr/bannerpopup/register.do");
        comSubmit.addParam("gubun", "banner");
        comSubmit.addParam("mode",'write');
        comSubmit.addParam("searchType", ${searchType});
        comSubmit.addParam("searchContent", '${searchContent}');
        comSubmit.addParam("page",${page});
        comSubmit.addParam("rowCount",${rowCount});
        comSubmit.submit();
    }

    function fn_update(uuid){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("/mngr/bannerpopup/register.do");
        comSubmit.addParam("gubun", "banner");
        comSubmit.addParam("bannerPopupUUID", uuid);
        comSubmit.addParam("mode",'update');
        comSubmit.addParam("searchType", ${searchType});
        comSubmit.addParam("searchContent", '${searchContent}');
        comSubmit.addParam("page",${page});
        comSubmit.addParam("rowCount",${rowCount});
        comSubmit.submit();
    }

    function fn_delete(uuid){
        if(confirm("게시판을 삭제하시겠습니까?")){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("/mngr/bannerpopup/delete.do");
            comSubmit.addParam("gubun",${gubun});
            comSubmit.addParam("bannerPopupUUID",uuid);
            comSubmit.addParam("searchType", ${searchType});
            comSubmit.addParam("searchContent", '${searchContent}');
            comSubmit.addParam("page",${page});
            comSubmit.addParam("rowCount",${rowCount});
            comSubmit.submit();
        } else return false;
    }

    function fn_search(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("/mngr/bannerpopup/list.do");
        comSubmit.addParam("gubun",${gubun});
        comSubmit.addParam("searchType", $("#searchType").val());
        comSubmit.addParam("searchContent", $("#searchContent").val());
        comSubmit.addParam("page",${page});
        comSubmit.addParam("rowCount",${rowCount});
        comSubmit.submit();
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