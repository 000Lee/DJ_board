<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 작성</title>
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
    <h2>게시글 작성</h2>
    
    <c:if test="${param.error == 'true'}">
        <div class="error">게시글 등록 중 오류가 발생했습니다.</div>
    </c:if>
    
    <form action="/edu/insert.do" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" required>
        </div>
        
        <div class="form-group">
            <label for="writer">작성자: ${loginUser.name}</label>
            <input type="hidden" name="writer" value="${loginUser.name}">
        </div>
        
        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" required></textarea>
        </div>
        
        <!-- 게시글 유형 선택 (라디오 버튼) -->
        <div class="form-group">
            <label>게시글 유형</label>
            <div style="margin-top: 10px;">
                <label style="display: inline-block; margin-right: 20px; font-weight: normal;">
                    <input type="radio" name="postType" value="normal" checked onchange="handlePostTypeChange()">
                    일반글
                </label>
                <label style="display: inline-block; margin-right: 20px; font-weight: normal;">
                    <input type="radio" name="postType" value="secret" onchange="handlePostTypeChange()">
                     비밀글
                </label>
                <c:if test="${loginUser.isAdmin}">
                    <label style="display: inline-block; margin-right: 20px; font-weight: normal; color: #ffa500;">
                        <input type="radio" name="postType" value="notice" onchange="handlePostTypeChange()">
                         공지사항
                    </label>
                    <label style="display: inline-block; font-weight: normal; color: #ff6b6b;">
                        <input type="radio" name="postType" value="important" onchange="handlePostTypeChange()">
                         중요 공지
                    </label>
                </c:if>
            </div>
            <small style="color: #666; font-size: 12px; display: block; margin-top: 5px;">
                ※ 비밀글: 비밀번호 필요 / 공지사항: 공지 탭에 표시 / 중요 공지: 일반게시판 상단 고정 (최대 2개)
            </small>
            <!-- hidden fields: 백엔드에서 사용 -->
            <input type="hidden" id="isSecret" name="isSecret" value="false">
            <input type="hidden" id="isNotice" name="isNotice" value="false">
            <input type="hidden" id="isImportant" name="isImportant" value="false">
        </div>
        
        <!-- 비밀글 선택 시만 표시되는 비밀번호 입력란 -->
        <div class="form-group" id="secretPasswordDiv" style="display: none;">
            <label for="secretPassword">비밀번호 (4자리 이상)</label>
            <input type="password" id="secretPassword" name="secretPassword" minlength="4" placeholder="비밀번호를 입력하세요">
            <small style="color: #666; font-size: 12px;">※ 작성자 외에는 비밀번호를 입력해야 볼 수 있습니다.</small>
        </div>
        
        <!-- 파일 첨부 (다중 파일) -->
        <div class="form-group">
            <label for="files">파일 첨부</label>
            <input type="file" id="files" name="files" multiple style="border: 1px solid #ddd; padding: 8px; border-radius: 5px;">
            <small style="color: #666; font-size: 12px;">※ 여러 파일을 한 번에 선택할 수 있습니다. 최대 10MB까지 업로드 가능합니다.</small>
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn">등록</button>
            <a href="/edu/start.do" class="btn btn-secondary" style="text-decoration: none; margin-left: 10px;">목록</a>
        </div>
    </form>
    
    <script>
        // 게시글 유형 변경 핸들러
        function handlePostTypeChange() {
            var postType = document.querySelector('input[name="postType"]:checked').value;
            var passwordDiv = document.getElementById('secretPasswordDiv');
            var passwordInput = document.getElementById('secretPassword');
            var isSecretField = document.getElementById('isSecret');
            var isNoticeField = document.getElementById('isNotice');
            var isImportantField = document.getElementById('isImportant');
            
            // 모든 hidden field 초기화
            isSecretField.value = 'false';
            isNoticeField.value = 'false';
            isImportantField.value = 'false';
            
            if (postType === 'secret') {
                // 비밀글 선택
                passwordDiv.style.display = 'block';
                passwordInput.required = true;
                isSecretField.value = 'true';
            } else if (postType === 'notice') {
                // 일반 공지사항 선택
                passwordDiv.style.display = 'none';
                passwordInput.required = false;
                passwordInput.value = '';
                isNoticeField.value = 'true';
            } else if (postType === 'important') {
                // 중요 공지사항 선택
                passwordDiv.style.display = 'none';
                passwordInput.required = false;
                passwordInput.value = '';
                isNoticeField.value = 'true';
                isImportantField.value = 'true';
            } else {
                // 일반글 선택
                passwordDiv.style.display = 'none';
                passwordInput.required = false;
                passwordInput.value = '';
            }
        }
    </script>
</div>
</body>
</html>
