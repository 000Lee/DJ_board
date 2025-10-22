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
		<jsp:param value="MENU LIST" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<h2 class="sub-header">메뉴 관리</h2>

			<div class="form-inline text-right" style="width: 80%;">
				<img width="90" height="40" src="/asset/images/logo.png">
			</div>

			<div class="form-inline text-right">
				<div class="form-group col-sm2">
					<select class="form-control" name="menuGroup" id="menuGroup">
						<c:forEach var="item" items="${groupList}">
						<option value="${item.menuGroup}" <c:if test="${menuGroup == item.menuGroup}">selected</c:if>>${item.menuName}</option>
						</c:forEach>
						<option value="" selected>정보마당</option>
					</select>
				</div>
				<div class="form-group col-sm6">	
					<input type="text" class="form-control" name="searchContent" id="searchContent" value="${searchContent}" />
				</div>	
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default btn-primary" id="btnSearch">검색</button>
				</div>
				<div class="form-group col-sm1">	
					<button type="button" class="btn btn-default" id="btnRegister">대메뉴등록</button>
				</div>
			</div>
			
			<div class="table-responsive">
				<table class="table cmsTable">
					<colgroup>
						<col width="auto">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					<thead>
	            		<tr>
	            			<th class="text-center">메뉴명</th>
	            			<th class="text-center">그룹</th>
	            			<th class="text-center">타겟</th>
	            			<th class="text-center">화면표시여부</th>
	            			<th class="text-center">사용여부</th>
	                  		<th colspan="4" class="text-center">관리</th>
	                	</tr>
	              	</thead>
	              	<tbody>
	              		<c:forEach var="item" items="${list}">
	              		<tr>
	              			<td><c:forEach var="i" begin="1" end="${item.getTempIntField1()}">▷</c:forEach>▶${item.menuName}</td>
	              			<td class="text-center">${item.menuGroup}</td>
	              			<td class="text-center">${item.getStrMenuTarget()}</td>
	              			<td class="text-center">${item.getStrMenuDisplayYn()}</td>
	              			<td class="text-center">${item.getStrUseAt()}</td>
	              			<td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.menuUUID}')">키복사</button></td>
	              			<td class="text-center"><button type="button" class="btn btn-default" onclick="fn_childRegister('${item.menuUUID}')">＋ 하위메뉴등록</button></td>
	              			<td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.menuUUID}')">수정</button></td>
	              			<td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.menuUUID}')">삭제</button></td>
	              		</tr>
	              		</c:forEach>

		                <tr>
			                <td>▶정보마당</td>
			                <td class="text-center">1</td>
			                <td class="text-center">현재창</td>
			                <td class="text-center">표기</td>
			                <td class="text-center">사용</td>
			                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.menuUUID}')">키복사</button></td>
			                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_childRegister('${item.menuUUID}')">＋ 하위메뉴등록</button></td>
			                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.menuUUID}')">수정</button></td>
			                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.menuUUID}')">삭제</button></td>
		                </tr>
		                <tr>
			                <td>▷▶공지사항</td>
			                <td class="text-center">1</td>
			                <td class="text-center">현재창</td>
			                <td class="text-center">표기</td>
			                <td class="text-center">사용</td>
			                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_copyClipboard('${item.menuUUID}')">키복사</button></td>
			                <td class="text-center"><button type="button" class="btn btn-default" onclick="fn_childRegister('${item.menuUUID}')">＋ 하위메뉴등록</button></td>
			                <td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_update('${item.menuUUID}')">수정</button></td>
			                <td class="text-center"><button type="button" class="btn btn-danger" onclick="fn_delete('${item.menuUUID}')">삭제</button></td>
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
	
	// 메뉴 검색
	function fn_search(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/menu/list.do");
		comSubmit.addParam("menuGroup",$("#menuGroup").val());
		comSubmit.addParam("searchContent",$("#searchContent").val());
		comSubmit.submit();
	}
	
	// 대메뉴 등록
	function fn_register(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/menu/register.do");
		comSubmit.addParam("mode",'write');
		comSubmit.addParam("menuGroup",${menuGroup});
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 하위메뉴 등록
	function fn_childRegister(uuid){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/menu/register.do");
		comSubmit.addParam("mode",'write');
		comSubmit.addParam("parentMenuUUID",uuid);
		comSubmit.addParam("menuGroup",${menuGroup});
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 메뉴 수정
	function fn_update(uuid){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/mngr/menu/register.do");
		comSubmit.addParam("mode",'update');
		comSubmit.addParam("menuUUID",uuid);
		comSubmit.addParam("searchContent",'${searchContent}');
		comSubmit.submit();
	}
	
	// 메뉴 삭제
	function fn_delete(uuid){
		if(confirm("메뉴를 삭제하시겠습니까?")){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/mngr/menu/delete.do");
			comSubmit.addParam("menuUUID",uuid);
			comSubmit.addParam("menuGroup",${menuGroup});
			comSubmit.addParam("searchContent",'${searchContent}');
			comSubmit.submit();
		} else return false;
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