<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시판</title>
    <style>
        body { font-family: 'Malgun Gothic', sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background: #f4f4f4; font-weight: bold; }
        tr:hover { background-color: #f5f5f5; }
        h2 { color: #333; margin-bottom: 10px; }
        .error { color: red; background: #ffe6e6; padding: 10px; border-radius: 5px; margin: 10px 0; }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/edu/common/header.jsp" flush="false"/>
<!-- flush="false" = 버퍼(임시저장공간)에 모아두고 나중에 한번에 출력 -->

<h2>게시판 목록</h2>

<!-- 탭 네비게이션 -->
<div style="border-bottom: 2px solid #007bff; margin-bottom: 20px;">
    <div style="display: flex; gap: 5px;">
        <!-- 일반게시판 -->
        <a href="/edu/start.do?tab=board&sortType=${sortType}&searchType=${searchType}&searchKeyword=${searchKeyword}" 
           style="padding: 12px 30px; text-decoration: none; display: inline-block;
                  border: 2px solid ${empty param.tab || param.tab == 'board' ? '#007bff' : '#ddd'};
                  border-bottom: ${empty param.tab || param.tab == 'board' ? '2px solid white' : '2px solid #007bff'};
                  background: white;
                  color: ${empty param.tab || param.tab == 'board' ? '#007bff' : '#666'};
                  font-weight: ${empty param.tab || param.tab == 'board' ? 'bold' : 'normal'};
                  border-radius: 5px 5px 0 0;
                  margin-bottom: -2px;
                  position: relative;
                  z-index: ${empty param.tab || param.tab == 'board' ? 1 : 0};">
            📋 일반게시판
        </a>

        <!-- 공지사항 -->
        <a href="/edu/start.do?tab=notice&sortType=${sortType}&searchType=${searchType}&searchKeyword=${searchKeyword}" 
           style="padding: 12px 30px; text-decoration: none; display: inline-block;
                  border: 2px solid ${param.tab == 'notice' ? '#007bff' : '#ddd'};
                  border-bottom: ${param.tab == 'notice' ? '2px solid white' : '2px solid #007bff'};
                  background: white;
                  color: ${param.tab == 'notice' ? '#007bff' : '#666'};
                  font-weight: ${param.tab == 'notice' ? 'bold' : 'normal'};
                  border-radius: 5px 5px 0 0;
                  margin-bottom: -2px;
                  position: relative;
                  z-index: ${param.tab == 'notice' ? 1 : 0};">
             공지사항
        </a>
    </div>
</div>



<div style="margin: 20px 0; display: flex; justify-content: space-between; align-items: center;">
    <div>
        <a href="/edu/write.do" style="background: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">글쓰기</a>
    </div>
    <div style="display: flex; align-items: center; gap: 10px;">
        <label for="sortType" style="font-weight: bold;">정렬:</label>
        <select id="sortType" name="sortType" onchange="changeSortType(this.value)" 
                style="padding: 8px 5px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            <option value="latest" ${sortType == 'latest' || empty sortType ? 'selected' : ''}>최신순</option>
            <option value="views" ${sortType == 'views' ? 'selected' : ''}>조회수순</option>
        </select>
    </div>
</div>

<script>
function changeSortType(sortType) {
    // 현재 페이지, 검색 조건, 탭 상태 유지하면서 정렬 변경
    const urlParams = new URLSearchParams(window.location.search);
    const currentPage = urlParams.get('page') || '1';
    const searchType = urlParams.get('searchType') || 'titleContent';
    const searchKeyword = urlParams.get('searchKeyword') || '';
    const tab = urlParams.get('tab') || 'board';
    
    let url = '/edu/start.do?page=' + currentPage + '&sortType=' + sortType + '&tab=' + tab;
    url += '&searchType=' + searchType;
    if (searchKeyword) {
        url += '&searchKeyword=' + encodeURIComponent(searchKeyword);
    }
    window.location.href = url;
}
</script>

<c:if test="${param.withdraw == 'success'}">
    <div style="color: green; background: #e6ffe6; padding: 10px; border-radius: 5px; margin: 10px 0;">
        회원탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.
    </div>
</c:if>

<c:if test="${not empty error}">
    <div class="error">오류: ${error}</div>
</c:if>

<c:choose>
    <c:when test="${not empty boards}">
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회</th>
            </tr>
            </thead>
            <tbody>
            <!-- 현재 페이지의 중요 공지/일반 공지 개수 카운트 -->
            <c:set var="importantCount" value="0"/>
            <c:set var="normalNoticeCount" value="0"/>
            <c:forEach var="b" items="${boards}">
                <c:if test="${b.isImportant}">
                    <c:set var="importantCount" value="${importantCount + 1}"/>
                </c:if>
                <c:if test="${b.isNotice && !b.isImportant}">
                    <c:set var="normalNoticeCount" value="${normalNoticeCount + 1}"/>
                </c:if>
            </c:forEach>
            
            <!-- 일반글 카운터 초기화 -->
            <c:set var="normalPostIndex" value="0"/>
            <!-- 중요 공지 카운터 초기화 -->
            <c:set var="importantIndex" value="0"/>
            <!-- 일반 공지 카운터 초기화 -->
            <c:set var="normalNoticeIndex" value="0"/>
            
            <c:forEach var="b" items="${boards}" varStatus="status">
                <tr>
                    <td>
                        <c:choose>
                            <c:when test="${b.isImportant}">
                                <!-- 중요 공지 번호 매기기 (역순) -->
                                <span style="color: #ff6b6b; font-weight: bold;">
                                    ${importantCount - importantIndex}
                                </span>
                                <c:set var="importantIndex" value="${importantIndex + 1}"/>
                            </c:when>
                            <c:when test="${b.isNotice}">
                                <!-- 일반 공지 (공지사항 탭에서만) - 따로 번호 매기기 (역순) -->
                                <span style="color: #ffa500; font-weight: bold;">
                                    ${normalNoticeCount - normalNoticeIndex}
                                </span>
                                <c:set var="normalNoticeIndex" value="${normalNoticeIndex + 1}"/>
                            </c:when>
                            <c:otherwise>
                                <!-- 일반글 번호 계산 -->
                                ${paging.totalCount - ((paging.currentPage - 1) * paging.pageSize) - normalPostIndex}
                                <c:set var="normalPostIndex" value="${normalPostIndex + 1}"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="/edu/detail.do?id=${b.id}&returnTab=${empty param.tab ? 'board' : param.tab}" 
                           style="text-decoration: none; color: ${b.isSecret ? '#888' : '#000'}; ${b.isNotice ? 'font-weight: bold;' : ''}">
                            <c:if test="${b.isImportant}"><span style="color: #ff6b6b;">[중요]</span> </c:if>
                            <c:if test="${b.isNotice && !b.isImportant}"><span style="color: #ffa500;">[공지]</span> </c:if>
                            <c:if test="${b.isSecret}">[비밀글] </c:if>${b.title}
                        </a>
                    </td>
                    <td>${b.writer}</td>
                    <td><fmt:formatDate value="${b.createdAt}" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td>${b.views}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
        <!-- 검색 폼 -->
        <div style="text-align: center; margin: 30px 0 20px 0; padding: 20px; background: #f8f9fa; border-radius: 5px;">
            <form method="get" action="/edu/start.do" style="display: flex; justify-content: center; align-items: center; gap: 10px;">
                <select name="searchType" style="padding: 8px 12px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
                    <option value="titleContent" ${searchType == 'titleContent' || empty searchType ? 'selected' : ''}>제목+내용</option>
                    <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
                    <option value="writer" ${searchType == 'writer' ? 'selected' : ''}>작성자</option>
                </select>
                <input type="text" name="searchKeyword" value="${searchKeyword}" 
                       placeholder="검색어를 입력하세요" 
                       style="padding: 8px 12px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; width: 300px;">
                <input type="hidden" name="sortType" value="${sortType}">
                <input type="hidden" name="tab" value="${empty param.tab ? 'board' : param.tab}">
                <button type="submit" style="padding: 8px 20px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 14px;">검색</button>
                <c:if test="${not empty searchKeyword}">
                    <a href="/edu/start.do?sortType=${sortType}&tab=${empty param.tab ? 'board' : param.tab}" 
                       style="padding: 8px 20px; background: #6c757d; color: white; text-decoration: none; border-radius: 5px; font-size: 14px;">
                        초기화
                    </a>
                </c:if>
            </form>
        </div>
        
        <!-- 페이징 네비게이션 -->
        <c:if test="${paging.totalPages > 0}">
            <div style="text-align: center; margin-top: 20px;">
                <div style="display: inline-block;">
                    <!-- 이전 그룹 버튼 -->
                    <c:if test="${paging.hasPreviousPageGroup()}">
                        <a href="/edu/start.do?page=${paging.previousPageGroupEnd}&sortType=${sortType}&searchType=${searchType}&searchKeyword=${searchKeyword}&tab=${empty param.tab ? 'board' : param.tab}" 
                           style="display: inline-block; padding: 8px 12px; margin: 0 2px; text-decoration: none; 
                                  border: 1px solid #ddd; background: #f8f9fa; color: #333; border-radius: 3px;">
                            &laquo; 이전
                        </a>
                    </c:if>
                    
                    <!-- 페이지 번호 -->
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="pageNum">
                        <c:choose>
                            <c:when test="${pageNum == paging.currentPage}">
                                <span style="display: inline-block; padding: 8px 12px; margin: 0 2px; 
                                             border: 1px solid #007bff; background: #007bff; color: white; 
                                             border-radius: 3px; font-weight: bold;">
                                    ${pageNum}
                                </span>
                            </c:when>
                            <c:otherwise>
                                <a href="/edu/start.do?page=${pageNum}&sortType=${sortType}&searchType=${searchType}&searchKeyword=${searchKeyword}&tab=${empty param.tab ? 'board' : param.tab}" 
                                   style="display: inline-block; padding: 8px 12px; margin: 0 2px; text-decoration: none; 
                                          border: 1px solid #ddd; background: white; color: #333; border-radius: 3px;">
                                    ${pageNum}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <!-- 다음 그룹 버튼 -->
                    <c:if test="${paging.hasNextPageGroup()}">
                        <a href="/edu/start.do?page=${paging.nextPageGroupStart}&sortType=${sortType}&searchType=${searchType}&searchKeyword=${searchKeyword}&tab=${empty param.tab ? 'board' : param.tab}" 
                           style="display: inline-block; padding: 8px 12px; margin: 0 2px; text-decoration: none; 
                                  border: 1px solid #ddd; background: #f8f9fa; color: #333; border-radius: 3px;">
                            다음 &raquo;
                        </a>
                    </c:if>
                </div>
                
                <!-- 페이징 정보 표시 -->
                <div style="margin-top: 10px; color: #666; font-size: 14px;">
                    전체 ${paging.totalCount}개 | 현재 ${paging.currentPage}/${paging.totalPages} 페이지
                </div>
            </div>
        </c:if>
    </c:when>
    <c:otherwise>
        <p>게시글이 없습니다.</p>
    </c:otherwise>
</c:choose>
</body>
</html>
