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
		<jsp:param value="HEADER TITLE" name="headerTitle"/>
	</jsp:include>
</head>
<style>
    .popTable{border-top: 0.2rem solid #2a3278;margin-top:10px;}
    .popTable thead tr th {background: #f3f4f6;color: #000;}
    .popTable .btn-primary{background-color: #023269;border-radius: 0px;}
    .popTable .btn-danger{background-color: #e82a3d;border-radius: 0px;}
    .popTable .textTitle{text-align: left;}
    .btn_wrap .btn-primary{background-color: #023269;border-radius: 0px; padding: 0px 10px; width: 110px; height: 44px;}
    .btn_wrap .btn-danger{background-color: #e82a3d;border-radius: 0px; padding: 0px 10px; width: 110px; height: 44px;}


    .paging .pagination li a {border-radius: 0px; border: 0.1rem solid #ddd; margin: 0px 3px; color: #ddd; font-size: 14px; font-weight: 600;}
    .paging .pagination li a:hover {border: 0.1rem solid #000; background: #fff; color: #000;}
    .paging .pagination .active a {background: #fff; color: #000; border: 0.1rem solid #000;}

    .main .table-responsive{width: 80%;}
    .text-right{width: 80%;}
</style>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h2 class="sub-header">권한 그룹 관리</h2>

			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>

			<div class="form-inline text-right" >
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
				<table class="table popTable">
	            	<thead>
	            		<tr>
	            			<th class="text-center">No</th>
	            			<th class="text-center">권한그룹명</th>
	            			<th class="text-center">키복사</th>
	                  		<th class="text-center">사용자 접근 권한</th>
	                  		<th class="text-center">사용여부</th>
	                  		<th class="text-center">상품메뉴사용여부</th>
	                  		<th class="text-center">등록일</th>
	                  		<th colspan="4" class="text-center">관리</th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              	<c:forEach var="item" items="${list}" varStatus="status">
		              	<c:set var="btnVisible" value="visible"/>
	                	<c:forEach var="auth" items="${item.authoriyList}">
	                		<c:if test="${(auth.boardUUID eq null || auth.boardUUID eq '') && (auth.menuUUID eq null || auth.menuUUID eq '')}">
	                			<c:set var="btnVisible" value="hide"/>	
	                		</c:if>
	                	</c:forEach>
	              		<tr>
			                <td class="text-center">${totalCount - ((pagenation.curPage-1) * rowCount + status.index) }</td>
			                <td class="text-center">${item.authorityGroupName}</td>
			                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.authorityGroupUUID}')">키복사</button></td>
			                <td class="text-center">${item.getStrAuthorityUserPermission()}</td>
			                <td class="text-center">${item.getStrUseAt()}</td>
			                <td class="text-center">${item.getStrUseProductMenu()}</td>
			                <td class="text-center"><fmt:formatDate value="${item.registDt}" pattern="yyyy-MM-dd"/> </td>
			                <td class="text-center">
			                	<c:if test="${btnVisible eq 'visible' }">
				                	<button type="button" class="btn btn-success" onclick="fn_authPop('${item.authorityGroupUUID}','board')">게시판 권한설정</button>
			                	</c:if>
			                </td>
			                <td class="text-center">
			                	<c:if test="${btnVisible eq 'visible' }">
				                	<button type="button" class="btn btn-success" onclick="fn_authPop('${item.authorityGroupUUID}','menu')">메뉴 권한설정</button>
			                	</c:if>
			                </td>
			                <td class="text-center">
			                	<c:if test="${btnVisible eq 'visible' }">
			                		<button type="button" class="btn btn-primary" onclick="fn_update('${item.authorityGroupUUID}')">수정</button>
			                	</c:if>
			                </td>
			                <td class="text-center">
			                	<c:if test="${btnVisible eq 'visible' }">
			                		<button type="button" class="btn btn-danger" onclick="fn_delete('${item.authorityGroupUUID}')">삭제</button>
			                	</c:if>
			                </td>
		                </tr>
	              	</c:forEach>

	                <tr>
		                <td class="text-center">1</td>
		                <td class="text-center">테스트</td>
		                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.authorityGroupUUID}')">키복사</button></td>
		                <td class="text-center">모든 사용자</td>
		                <td class="text-center">사용</td>
		                <td class="text-center">미사용</td>
		                <td class="text-center">2023-09-21</td>
		                <td class="text-center">
				                <button type="button" class="btn btn-success" onclick="fn_authPop('${item.authorityGroupUUID}','board')">게시판 권한설정</button>
		                </td>
		                <td class="text-center">
				                <button type="button" class="btn btn-success" onclick="fn_authPop('${item.authorityGroupUUID}','menu')">메뉴 권한설정</button>
		                </td>
		                <td class="text-center">
				                <button type="button" class="btn btn-primary" onclick="fn_update('${item.authorityGroupUUID}')">수정</button>
		                </td>
		                <td class="text-center">
				                <button type="button" class="btn btn-danger" onclick="fn_delete('${item.authorityGroupUUID}')">삭제</button>
		                </td>
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

		location.href = "/mngr/auth/group/register.do";
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

	function fn_update(uuid){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/auth/group/register.do");
		comSubmit.addParam("mode",'update');
		comSubmit.addParam("authorityGroupUUID",uuid);
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}

	function fn_delete(uuid){
		if(confirm("권한 그룹 정보를 삭제하시겠습니까?")){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/auth/group/delete.do");
			comSubmit.addParam("authorityGroupUUID",uuid);
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.addParam("page",${page});
			comSubmit.addParam("rowCount",${rowCount});
			comSubmit.submit();
		} else return false;
	}

	function fn_search(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/auth/group/list.do");
		comSubmit.addParam("searchContent",$("#searchContent").val());
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}

	function fn_authPop(uuid, authType){
		window.open("/mngr/auth/"+authType+"/managepop.do?authorityGroupUUID="+uuid, "MANAGEPOP", "width=1000, height=430, menubar=no, status=no, toolbar=no, resizable=no");
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