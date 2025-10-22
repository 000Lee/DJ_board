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
    
    <form action="/edu/insert.do" method="post">
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
        
        <div class="form-group">
            <label>
                <input type="checkbox" id="isSecretCheck" onchange="toggleSecretPassword()">
                비밀글로 설정
            </label>
            <!-- hidden field: 체크되면 true, 아니면 false -->
            <input type="hidden" id="isSecret" name="isSecret" value="false">
        </div>
        
        <div class="form-group" id="secretPasswordDiv" style="display: none;">
            <label for="secretPassword">비밀번호 (4자리 이상)</label>
            <input type="password" id="secretPassword" name="secretPassword" minlength="4" placeholder="비밀번호를 입력하세요">
            <small style="color: #666; font-size: 12px;">※ 비밀글로 설정하면 작성자 외에는 비밀번호를 입력해야 볼 수 있습니다.</small>
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn">등록</button>
            <a href="/edu/start.do" class="btn btn-secondary" style="text-decoration: none; margin-left: 10px;">목록</a>
        </div>
    </form>
    
    <script>
        function toggleSecretPassword() {
            var checkbox = document.getElementById('isSecretCheck');
            var hiddenField = document.getElementById('isSecret');
            var passwordDiv = document.getElementById('secretPasswordDiv');
            var passwordInput = document.getElementById('secretPassword');
            
            if (checkbox.checked) {
                passwordDiv.style.display = 'block';
                passwordInput.required = true;
                hiddenField.value = 'true';  // hidden field를 true로 변경
            } else {
                passwordDiv.style.display = 'none';
                passwordInput.required = false;
                passwordInput.value = '';
                hiddenField.value = 'false';  // hidden field를 false로 변경
            }
        }
    </script>
</div>
</body>
</html>
