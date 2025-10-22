<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원가입</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Malgun Gothic', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            padding: 20px;
        }
        
        .register-header {
            padding: 40px 30px;
            text-align: center;
        }
        
        .register-title {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .register-subtitle {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .register-body {
            padding: 40px 30px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }
        
        .form-input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
        }
        
        .form-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }
        
        .form-input::placeholder {
            color: #aaa;
        }
        
        .register-btn {
            width: 100%;
            padding: 16px;
            background-color: #007afd;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        
        .register-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }
        
        .register-btn:active {
            transform: translateY(-1px);
        }
        
        .login-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .login-link:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #999;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .back-link:hover {
            color: #666;
            text-decoration: underline;
        }
        
        .error-message {
            background: #ffe6e6;
            color: #c00;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
        }
        
        .success-message {
            background: #e6ffe6;
            color: #0a0;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
        }
        
        .password-helper {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }
        
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* 반응형 */
        @media (max-width: 480px) {
            .register-container {
                border-radius: 15px;
            }
            
            .register-header {
                padding: 30px 20px;
            }
            
            .register-title {
                font-size: 28px;
            }
            
            .register-body {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/edu/common/header.jsp" flush="false"/>

<div class="register-container">
    <div class="register-header">
        <h1 class="register-title">회원가입</h1>
        <p class="register-subtitle">게시판</p>
    </div>
    
    <div class="register-body">
        <c:if test="${param.error == 'true'}">
            <div class="error-message">
                회원가입에 실패했습니다. 다시 시도해주세요.
            </div>
        </c:if>
        
        <c:if test="${param.success == 'true'}">
            <div class="success-message">
                회원가입이 완료되었습니다! 로그인해주세요.
            </div>
        </c:if>
        
        <form action="/edu/registerProcess.do" method="post">
            <div class="form-group">
                <label class="form-label">아이디</label>
                <input type="text" name="username" class="form-input" placeholder="아이디를 입력하세요 (4-20자)" required minlength="4" maxlength="20">
            </div>
            
            <div class="form-group">
                <label class="form-label">비밀번호</label>
                <input type="password" name="password" class="form-input" placeholder="비밀번호를 입력하세요" required minlength="6">
                <div class="password-helper">※ 6자 이상 입력해주세요</div>
            </div>
            
            <div class="form-group">
                <label class="form-label">비밀번호 확인</label>
                <input type="password" name="passwordConfirm" class="form-input" placeholder="비밀번호를 다시 입력하세요" required minlength="6">
            </div>
            
            <div class="form-group">
                <label class="form-label">이름</label>
                <input type="text" name="name" class="form-input" placeholder="이름을 입력하세요" required maxlength="50">
            </div>
            
            <button type="submit" class="register-btn">회원가입</button>
        </form>
        
        <a href="/edu/login.do" class="login-link">이미 계정이 있으신가요? 로그인하기 →</a>
        <a href="/edu/start.do" class="back-link">← 메인으로 돌아가기</a>
    </div>
</div>

<script>
    // 폼 제출 시 검증
    document.querySelector('form').addEventListener('submit', function(e) {
        const username = document.querySelector('input[name="username"]').value;
        const password = document.querySelector('input[name="password"]').value;
        const passwordConfirm = document.querySelector('input[name="passwordConfirm"]').value;
        const name = document.querySelector('input[name="name"]').value;
        
        // 1. 아이디 길이 검증
        if (username.length < 4 || username.length > 20) {
            e.preventDefault();
            alert('아이디는 4~20자로 입력해주세요.');
            return false;
        }
        
        // 2. 비밀번호 길이 검증
        if (password.length < 6) {
            e.preventDefault();
            alert('비밀번호는 6자 이상 입력해주세요.');
            return false;
        }
        
        // 3. 비밀번호 확인 검증
        if (password !== passwordConfirm) {
            e.preventDefault();
            alert('비밀번호가 일치하지 않습니다.');
            return false;
        }
        
        // 4. 이름 검증
        if (name.trim() === '') {
            e.preventDefault();
            alert('이름을 입력해주세요.');
            return false;
        }
    });
</script>
</body>
</html>

