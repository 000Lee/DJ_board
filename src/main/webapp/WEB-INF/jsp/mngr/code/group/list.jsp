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
		<jsp:param value="CODE GROUP LIST" name="headerTitle"/>
	</jsp:include>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h2 class="sub-header">코드 그룹 관리</h2>
			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>
			<div class="form-inline text-right">
				<div class="form-group col-sm2">
					<select class="form-control" name="searchColumn" id="searchColumn">
						<option value="">선택</option>
						<option value="codeGroup" <c:if test="${searchColumn eq 'codeGroup'}">selected</c:if>>코드그룹</option>
						<option value="codeGroupNm" <c:if test="${searchColumn eq 'codeGroupNm'}">selected</c:if>>코드그룹명</option>
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
					<colgroup>
						<col width="5%">
						<col width="15%">
						<col width="auto">
						<col width="15%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
					</colgroup>
	            	<thead>
	            		<tr>
	            			<th class="text-center">No</th>
	                  		<th class="text-center">코드그룹</th>
	                  		<th class="text-center">코드그룹명</th>
	                  		<th class="text-center">사용여부</th>
	                  		<th colspan="3" class="text-center">관리</th>
	                  		<th></th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              	<c:forEach var="item" items="${list}" varStatus="status">
	              		 <tr>
			                <td class="text-center">${totalCount - ((pagenation.curPage-1) * rowCount + status.index) }</td>
			                <td class="text-center">${item.codeGroup}</td>
			                <td class="text-center">${item.codeGroupNm}</td>
			                <td class="text-center">${item.getStrUseAt()}</td>
			                <td class="text-center"><button type="button" class="btn btn-success" onclick="fn_codeList(${item.codeGroupIdx})">코드 목록</button></td>
			                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update(${item.codeGroupIdx})">수정</button></td>
			                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete(${item.codeGroupIdx})">삭제</button></td>
		                </tr>
	              	</c:forEach>
	                <tr>
		                <td class="text-center">1</td>
		                <td class="text-center">1111</td>
		                <td class="text-center">테스트 코드그룹</td>
		                <td class="text-center">사용함</td>
		                <td class="text-center"><button type="button" class="btn btn-success" onclick="fn_codeList(${item.codeGroupIdx})">코드 목록</button></td>
		                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update(${item.codeGroupIdx})">수정</button></td>
		                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete(${item.codeGroupIdx})">삭제</button></td>
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
		comSubmit.setUrl("/mngr/code/group/register.do");
		comSubmit.addParam("mode",'write');
		comSubmit.addParam("searchColumn",'${searchColumn}');
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}

	function fn_update(idx){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/code/group/register.do");
		comSubmit.addParam("mode",'update');
		comSubmit.addParam("codeGroupIdx",idx);
		comSubmit.addParam("searchColumn",'${searchColumn}');
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}
	
	function fn_delete(idx){
		if(confirm("상품을 삭제하시겠습니까?")){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/code/group/delete.do");
			comSubmit.addParam("codeGroupIdx",idx);
			comSubmit.addParam("searchColumn",'${searchColumn}');
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.addParam("page",${page});
			comSubmit.addParam("rowCount",${rowCount});
			comSubmit.submit();
		} else return false;
	}
	
	function fn_search(){
		
		if(!$("#searchColumn").val()){
			return false;
		}
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/code/group/list.do");
		comSubmit.addParam("searchColumn",$("#searchColumn").val());
		comSubmit.addParam("searchContent",$("#searchContent").val());
		comSubmit.addParam("page",${page});
		comSubmit.addParam("rowCount",${rowCount});
		comSubmit.submit();
	}
	
	function fn_codeList(idx){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/code/list.do");
		comSubmit.addParam("codeGroupIdx",idx);
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