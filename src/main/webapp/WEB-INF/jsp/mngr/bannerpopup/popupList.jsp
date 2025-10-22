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
		<jsp:param value="팝업관리" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<h2 class="sub-header">팝업&nbsp;관리</h2>
			<div class="form-inline text-left">
				등록 팝업 총 <strong id="totalCnt">0</strong> 건
			</div>
			<div class="form-inline text-right">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>

			<div class="form-inline text-right" style="width: 80%;">
				<div class="form-group col-sm2">
					<%--<select class="form-control" name="searchType" id="searchType">
						<option value="0"<c:if test="${searchType == 0}">selected</c:if>>제목</option>
						<option value="1"<c:if test="${searchType == 1}">selected</c:if> >내용</option>
					</select>--%>
					<span>팝업제목</span>
				</div>
				<div class="form-group col-sm6">
					<input type="text" class="form-control" name="inputText" id="inputText" placeholder="검색어 입력" onkeydown="searchOnEnter(event);" />
				</div>
				<div class="form-group col-sm1">
					<button type="button" class="btn btn-default btn-primary" id="btnSearch" onclick="fn_searchInput();">검색</button>
				</div>
				<div class="form-group col-sm1">
					<button type="button" class="btn btn-default" id="btnRegister">신규등록</button>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table cmsTable">
					<colgroup>
						<col style="width:10rem;">
						<col style="width:30rem;">
						<col style="width:30rem;">
						<col style="width:10em;">
						<col style="width:10em;">
						<col style="width:15rem;">
						<col style="width:15rem;">
						<col style="width:15rem;">
					</colgroup>
	            	<thead>
	            		<tr>
	            			<th class="text-center">번호</th>
	                  		<th class="text-center">팝업설정 기간</th>
	                  		<th class="text-center">제목</th>
	                  		<th class="text-center">TOP</th>
	                  		<th class="text-center">LEFT</th>
	                  		<th class="text-center">팝업크기</th>
	                  		<th class="text-center">출력방식</th>
	                  		<th class="text-center">상태</th>
	                  		<th colspan="2" class="text-center">관리</th>
	                	</tr>
	              	</thead>
					<tbody id="tableBody">
					</tbody>
	            </table>
			</div>
		<%--</div>--%>
	<%--</div>--%>
			<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>

			<div class="row text-center" style="width: 80%;">
				<nav class="paging">
					<ul class="pagination">
					</ul>
				</nav>
			</div>

			<%--<div class="text-center" style="width: 80%;">
				<button type="button" class="btn btn-default" id="btnRegister">신규등록</button>
			</div>--%>
		</div>
	</div>

	<script type="text/javascript">
	var gubun = '${gubun}';
    var inputText = $("#inputText").val();

    var firstData = fn_customAjax('/mngr/bannerpopup/getPopupList.do?recordSize=10','');
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
        drawTable(data);

        pagingTxtSet();
	});

    function pagingTxtSet(f) {
        if(f == 0){
            $("#totalCnt").text(0);
        }else{
            $("#totalCnt").text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        }
    }

    function searchOnEnter(event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Enter 키의 기본 동작 방지
            fn_searchInput(); // 검색 함수 호출
        }
    }

    function fn_searchInput(){
        inputText = $("#inputText").val();
        var result = fn_customAjax('/mngr/bannerpopup/getPopupList.do?recordSize=10&searchInput=' + encodeURI(inputText, "UTF-8"),'');

        flag = true;

        if(result.articlePage.pagination != null){
            dataChk(result);
            drawPage();
            pagingTxtSet();
        }
        drawTable(result.list.list);
    }

	function fn_write(){
        location.href = '/mngr/bannerpopup/register.do?gubun=popup&mode=write';
	}

	function fn_update(uuid){
        location.href = '/mngr/bannerpopup/register.do?gubun=popup&mode=update&uuid=' + uuid;
	}
	
	function fn_delete(uuid){
		if(confirm("게시판을 삭제하시겠습니까?")){
            $.ajax({
                url : "/mngr/bannerpopup/delete",
                data : {"uuid" : uuid},
                type : "post",
                dataType : "json",
                async : false,
                success : function(rs) {
                    alert("삭제 완료");
                    location.reload();
                }
            });

		} else return false;
	}

    //게시글 리스트 HTML
    function drawTable(data) {
        if (data.length == 0) {
            document.querySelector('.pagination').innerHTML = '';
            pagingTxtSet(0);
            $("#tableBody").html('');
            return;
        }
        $("#tableBody").html('');

        let html = "";

        let num = total + 1;

        if(page != 1){
            num = num - ((page - 1) * 10);
        }

        let startDt;
        let endDt;

        data.forEach((item, index) => {
            num = num - 1;

            startDt = item.banner_POPUP_START_DT.year +'-'+String(item.banner_POPUP_START_DT.monthValue).padStart(2, '0')+'-'+String(item.banner_POPUP_START_DT.dayOfMonth).padStart(2, '0');
            endDt = item.banner_POPUP_END_DT.year +'-'+String(item.banner_POPUP_END_DT.monthValue).padStart(2, '0')+'-'+String(item.banner_POPUP_END_DT.dayOfMonth).padStart(2, '0');

            html += "<tr>";
            html += '<td class="text-center">'+ num +'</td>';
            html += '<td class="text-center">'+startDt+' ~ '+endDt+'</td>';
            html += '<td class="text-left" style="color:black">'+ item.banner_POPUP_TITLE +'</td>';
            html += '<td class="text-center">'+ item.banner_POPUP_TOP +'</td>';
            html += '<td class="text-center">'+ item.banner_POPUP_LEFT +'</td>';
            html += '<td class="text-center">'+ item.banner_POPUP_WIDTH +'X'+ item.banner_POPUP_HEIGHT +'</td>';
            if(item.banner_POPUP_GUBUN == 0){ html += '<td class="text-center">레이어</td>'; }else{ html += '<td class="text-center">팝업</td>'; }
            if(item.use_AT == 0){html += '<td class="text-center">출력중</td>';}else{html += '<td class="text-center">출력중X</td>';}
            html += '<td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('+ item.banner_POPUP_UUID +')">수정</button></td>';
            html += '<td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('+ item.banner_POPUP_UUID +')">삭제</button></td>';
            html += "</tr>";
        });

        /*tableBody.innerHTML = html;*/
        $("#tableBody").append(html);
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

    /**
     * 페이지 이동
     * page : 페이지
     * recordSize : 리스트에 출력할 데이터 수
     * pageSize : 페이징 넘버 수
     * ArticlePage.java 참조
     * */
    function movePage(page){
        const queryParams = {
            page: (page) ? page : 1,
            recordSize: 10,
            pageSize: 10
        }
        var result = fn_customAjax("/mngr/bannerpopup/getPopupList.do?" + new URLSearchParams(queryParams).toString() + '&recordSize=10', "");

        flag = true;

        dataChk(result, flag);
        drawTable(result.list.list);
        drawPage();

        pagingTxtSet();
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

</body>
</html>