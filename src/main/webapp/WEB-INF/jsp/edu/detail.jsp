<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시글 상세보기</title>
    <style>
        body { font-family: 'Malgun Gothic', sans-serif; margin: 20px; }
        .detail-container { max-width: 800px; margin: 0 auto; }
        .detail-header { border-bottom: 2px solid #ddd; padding-bottom: 20px; margin-bottom: 20px; }
        .detail-title { font-size: 24px; font-weight: bold; margin-bottom: 10px; }
        .detail-meta { color: #666; font-size: 14px; }
        .detail-meta span { margin-right: 20px; }
        .btn { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; text-decoration: none; display: inline-block; }
        .btn:hover { background: #0056b3; }
        .btn-danger { background: #dc3545; }
        .btn-danger:hover { background: #c82333; }
        .btn-secondary { background: #6c757d; }
        .btn-secondary:hover { background: #545b62; }
        .btn-group { margin-top: 20px; }
        .btn-group a { margin-right: 10px; }
        .error { color: red; background: #ffe6e6; padding: 10px; border-radius: 5px; margin: 10px 0; }
        .nav-buttons { display: flex; justify-content: space-between; margin-bottom: 20px; }
        .nav-btn { background: #6c757d; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; text-decoration: none; display: inline-block; }
        .nav-btn:hover { background: #545b62; }
        .nav-btn:disabled, .nav-btn.disabled { background: #ccc; color: #666; cursor: not-allowed; }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/edu/common/header.jsp" flush="false"/>

<div class="detail-container">
    <c:if test="${not empty error}">
        <div class="error">오류: ${error}</div>
    </c:if>
    
    <c:if test="${not empty board}">
        <!-- 이전글/다음글 버튼 -->
        <div class="nav-buttons">
            <c:choose>
                <c:when test="${not empty prevPost}">
                    <a href="/edu/detail.do?id=${prevPost.id}" class="nav-btn">← 이전글</a>
                </c:when>
                <c:otherwise>
                    <span class="nav-btn disabled">← 이전글</span>
                </c:otherwise>
            </c:choose>
            
            <c:choose>
                <c:when test="${not empty nextPost}">
                    <a href="/edu/detail.do?id=${nextPost.id}" class="nav-btn">다음글 →</a>
                </c:when>
                <c:otherwise>
                    <span class="nav-btn disabled">다음글 →</span>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="detail-header">
            <c:if test="${board.isNotice}">
                <div style="background: #fff8dc; border-left: 4px solid #ff6b6b; padding: 10px; margin-bottom: 10px; border-radius: 5px;">
                    <span style="color: #ff6b6b; font-weight: bold; font-size: 14px;">🔔 공지사항</span>
                </div>
            </c:if>
            <div class="detail-title">
                <c:if test="${board.isNotice}"><span style="color: #ff6b6b;">[공지]</span> </c:if>
                ${board.title}
            </div>
            <div class="detail-meta">
                <span>작성자: ${board.writer}</span>
                <span>작성일: <fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm"/></span>
                <span>조회수: ${board.views}</span>
            </div>
        </div>
        
        <div class="detail-content" style="min-height: 300px; padding: 20px; background: #f9f9f9; border-radius: 5px; margin-bottom: 20px; line-height: 1.6; white-space: pre-wrap;">
${board.content}
        </div>
        
        <!-- 첨부파일 다운로드 (다중 파일) -->
        <c:if test="${not empty files}">
            <div style="padding: 15px; background: #f0f8ff; border: 1px solid #d0e8ff; border-radius: 5px; margin-bottom: 20px;">
                <strong>📎 첨부파일 (${files.size()}개)</strong>
                <div style="margin-top: 10px;">
                    <c:forEach var="file" items="${files}" varStatus="status">
                        <div style="margin-bottom: 8px; padding: 8px; background: white; border-radius: 3px;">
                            <a href="/edu/download.do?fileId=${file.id}" 
                               style="text-decoration: none; color: #007bff; font-size: 14px;">
                                📄 ${file.originalName}
                            </a>
                            <span style="color: #666; font-size: 12px; margin-left: 10px;">
                                (${file.fileSize} bytes)
                            </span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
        
        <div class="btn-group">
            <%-- 관리자이거나 작성자인 경우 수정/삭제 버튼 표시 --%>
            <c:if test="${not empty loginUser and (loginUser.isAdmin or loginUser.name eq board.writer)}">
                <a href="/edu/edit.do?id=${board.id}" class="btn">수정</a>
                <a href="/edu/delete.do?id=${board.id}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
            </c:if>
            <a href="/edu/start.do" class="btn btn-secondary">목록</a>
        </div>
        
        <!-- 댓글 영역 -->
        <div class="comment-section" style="margin-top: 40px; border-top: 2px solid #ddd; padding-top: 30px;">
            <h3 style="margin-bottom: 20px;">댓글 <span style="color: #007bff;">${comments.size()}</span>개</h3>
            
            <!-- 댓글 작성 폼 (로그인한 경우만 표시) -->
            <c:choose>
                <c:when test="${not empty loginUser}">
                    <div class="comment-write" style="background: #f9f9f9; padding: 20px; border-radius: 8px; margin-bottom: 30px;">
                        <form action="/edu/comment/insert.do" method="post">
                            <input type="hidden" name="boardId" value="${board.id}">
                            <div style="margin-bottom: 10px;">
                                <strong>${loginUser.name}</strong>님
                            </div>
                            <textarea name="content" rows="3" placeholder="댓글을 입력하세요" required 
                                      style="width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 5px; resize: vertical; font-size: 14px;"></textarea>
                            <div style="text-align: right; margin-top: 10px;">
                                <button type="submit" class="btn" style="padding: 8px 20px; font-size: 14px;">댓글 작성</button>
                            </div>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="background: #f0f0f0; padding: 20px; border-radius: 8px; margin-bottom: 30px; text-align: center;">
                        <a href="/edu/login.do" style="color: #007bff; text-decoration: none;">로그인</a>하시면 댓글을 작성할 수 있습니다.
                    </div>
                </c:otherwise>
            </c:choose>
            
            <!-- 댓글 목록 -->
            <div class="comment-list">
                <c:choose>
                    <c:when test="${not empty comments}">
                        <c:forEach var="comment" items="${comments}">
                            <div class="comment-item" id="comment-${comment.id}" style="padding: 15px 0; border-bottom: 1px solid #eee;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                                    <div>
                                        <strong style="color: #333;">${comment.writer}</strong>
                                        <span style="color: #999; font-size: 13px; margin-left: 10px;">
                                            <fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                        </span>
                                    </div>
                                    <!-- 관리자이거나 본인이 쓴 댓글만 수정/삭제 가능 -->
                                    <c:if test="${not empty loginUser and (loginUser.isAdmin or loginUser.name eq comment.writer)}">
                                        <div>
                                            <a href="javascript:void(0)" onclick="toggleEditComment(${comment.id})"
                                               style="color: #007bff; font-size: 13px; text-decoration: none; margin-right: 10px;">수정</a>
                                            <a href="/edu/comment/delete.do?id=${comment.id}&boardId=${board.id}" 
                                               onclick="return confirm('댓글을 삭제하시겠습니까?')"
                                               style="color: #dc3545; font-size: 13px; text-decoration: none;">삭제</a>
                                        </div>
                                    </c:if>
                                </div>
                                <!-- 댓글 내용 표시 -->
                                <div class="comment-content-${comment.id}" style="color: #555; line-height: 1.6; white-space: pre-wrap;">${comment.content}</div>
                                
                                <!-- 댓글 수정 폼 (숨김 상태) -->
                                <div class="comment-edit-${comment.id}" style="display: none;">
                                    <form action="/edu/comment/update.do" method="post">
                                        <input type="hidden" name="id" value="${comment.id}">
                                        <input type="hidden" name="boardId" value="${board.id}">
                                        <textarea name="content" rows="3" required 
                                                  style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; resize: vertical; font-size: 14px;">${comment.content}</textarea>
                                        <div style="text-align: right; margin-top: 10px;">
                                            <button type="button" onclick="toggleEditComment(${comment.id})" 
                                                    style="padding: 6px 15px; background: #6c757d; color: white; border: none; border-radius: 5px; cursor: pointer; margin-right: 5px;">취소</button>
                                            <button type="submit" 
                                                    style="padding: 6px 15px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">수정 완료</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div style="text-align: center; padding: 40px 0; color: #999;">
                            첫 댓글을 작성해보세요!
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:if>
</div>

<script>
    // 댓글 수정 폼 토글
    function toggleEditComment(commentId) {
        var contentDiv = document.querySelector('.comment-content-' + commentId);
        var editDiv = document.querySelector('.comment-edit-' + commentId);
        
        if (editDiv.style.display === 'none') {
            contentDiv.style.display = 'none';
            editDiv.style.display = 'block';
        } else {
            contentDiv.style.display = 'block';
            editDiv.style.display = 'none';
        }
    }
</script>
</body>
</html>
