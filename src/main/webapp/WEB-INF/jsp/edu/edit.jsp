<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 수정</title>
    <style>
        body { font-family: 'Malgun Gothic', sans-serif; margin: 20px; }
        .form-container { max-width: 600px; margin: 0 auto; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
        textarea { height: 200px; resize: vertical; }
        .btn { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; }
        .btn:hover { background: #0056b3; }
        .btn-secondary { background: #6c757d; }
        .btn-secondary:hover { background: #545b62; }
        .error { color: red; background: #ffe6e6; padding: 10px; border-radius: 5px; margin: 10px 0; }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/edu/common/header.jsp" flush="false"/>

<div class="form-container">
    <h2>게시글 수정</h2>
    
    <c:if test="${param.error == 'true'}">
        <div class="error">게시글 수정 중 오류가 발생했습니다.</div>
    </c:if>
    
    <c:if test="${not empty board}">
        <form action="/edu/update.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${board.id}">
            
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" value="${board.title}" required>
            </div>
            
            <div class="form-group">
                <label for="writer">작성자: ${board.writer}</label>
                <input type="hidden" name="writer" value="${board.writer}">
            </div>
            
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" required>${board.content}</textarea>
            </div>
            
            <div class="form-group">
                <label>
                    <input type="checkbox" id="isSecretCheck" <c:if test="${board.isSecret}">checked</c:if> onchange="toggleSecretPassword()">
                    비밀글로 설정
                </label>
                <!-- hidden field: 체크되면 true, 아니면 false -->
                <input type="hidden" id="isSecret" name="isSecret" value="${board.isSecret ? 'true' : 'false'}">
            </div>
            
            <div class="form-group" id="secretPasswordDiv" style="display: none;">
                <label for="secretPassword">비밀번호 (4자리 이상)</label>
                <input type="password" id="secretPassword" name="secretPassword" minlength="4" placeholder="비밀번호를 입력하세요 (변경하지 않으려면 비워두세요)">
                <small style="color: #666; font-size: 12px;">※ 비밀번호를 변경하지 않으려면 비워두세요.</small>
            </div>
            
            <!-- 관리자만 공지사항 설정 가능 -->
            <c:if test="${loginUser.isAdmin}">
                <div class="form-group">
                    <label style="color: #ff6b6b;">
                        <input type="checkbox" id="isNoticeCheck" <c:if test="${board.isNotice}">checked</c:if> onchange="toggleNotice()">
                        🔔 공지사항으로 등록
                    </label>
                    <input type="hidden" id="isNotice" name="isNotice" value="${board.isNotice ? 'true' : 'false'}">
                    <small style="color: #666; font-size: 12px;">※ 공지사항은 게시판 상단에 고정됩니다.</small>
                </div>
            </c:if>
            
            <!-- 기존 파일 정보 (다중 파일) -->
            <c:if test="${not empty files}">
                <div class="form-group">
                    <label>현재 첨부파일 (${files.size()}개)</label>
                    <div style="padding: 10px; background: #f9f9f9; border-radius: 5px;">
                        <c:forEach var="file" items="${files}" varStatus="status">
                            <div style="margin-bottom: 8px; padding: 8px; background: white; border-radius: 3px;">
                                <span>📄 ${file.originalName}</span>
                                <span style="color: #666; font-size: 12px; margin-left: 10px;">
                                    (${file.fileSize} bytes)
                                </span>
                                <label style="margin-left: 20px; color: #dc3545;">
                                    <input type="checkbox" name="deleteFileIds" value="${file.id}">
                                    삭제
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            
            <!-- 새 파일 첨부 (다중 파일) -->
            <div class="form-group">
                <label for="files">파일 첨부 ${not empty files ? '(추가 파일)' : ''}</label>
                <input type="file" id="files" name="files" multiple style="border: 1px solid #ddd; padding: 8px; border-radius: 5px;">
                <small style="color: #666; font-size: 12px;">※ 여러 파일을 한 번에 선택할 수 있습니다. 최대 10MB까지 업로드 가능합니다.</small>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn">수정</button>
                <a href="/edu/detail.do?id=${board.id}" class="btn btn-secondary" style="text-decoration: none; margin-left: 10px;">취소</a>
            </div>
        </form>
        
        <script>
            // 페이지 로드 시 비밀글 상태 확인
            window.onload = function() {
                var checkbox = document.getElementById('isSecretCheck');
                var passwordDiv = document.getElementById('secretPasswordDiv');
                
                if (checkbox.checked) {
                    passwordDiv.style.display = 'block';
                }
            };
            
            function toggleSecretPassword() {
                var checkbox = document.getElementById('isSecretCheck');
                var hiddenField = document.getElementById('isSecret');
                var passwordDiv = document.getElementById('secretPasswordDiv');
                var passwordInput = document.getElementById('secretPassword');
                
                if (checkbox.checked) {
                    passwordDiv.style.display = 'block';
                    hiddenField.value = 'true';  // hidden field를 true로 변경
                } else {
                    passwordDiv.style.display = 'none';
                    passwordInput.value = '';
                    hiddenField.value = 'false';  // hidden field를 false로 변경
                }
            }
            
            function toggleNotice() {
                var checkbox = document.getElementById('isNoticeCheck');
                var hiddenField = document.getElementById('isNotice');
                
                if (checkbox.checked) {
                    hiddenField.value = 'true';
                } else {
                    hiddenField.value = 'false';
                }
            }
        </script>
    </c:if>
</div>
</body>
</html>
