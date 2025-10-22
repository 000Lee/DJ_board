<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
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
        

        
        .login-header {
            padding: 40px 30px;
            text-align: center;
        }
        
        .login-title {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .login-subtitle {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .login-body {
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
        
        .login-btn {
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
        
        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }
        
        .login-btn:active {
            transform: translateY(-1px);
        }
        
        .register-btn {
            width: 100%;
            padding: 16px;
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 15px;
        }
        
        .register-btn:hover {
            background: #667eea;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        
        .register-btn:active {
            transform: translateY(-1px);
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 25px 0;
            color: #999;
            font-size: 14px;
        }
        
        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e0e0e0;
        }
        
        .divider span {
            padding: 0 15px;
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .back-link:hover {
            color: #764ba2;
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
            .login-container {
                border-radius: 15px;
            }
            
            .login-header {
                padding: 30px 20px;
            }
            
            .login-title {
                font-size: 28px;
            }
            
            .login-body {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/edu/common/header.jsp" flush="false"/>

<div class="login-container">
    <div class="login-header">
        <h1 class="login-title">로그인</h1>
        <p class="login-subtitle">게시판</p>
    </div>
    
    <div class="login-body">
        <c:if test="${param.error == 'true'}">
            <div class="error-message">
                로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.
            </div>
        </c:if>
        
        <c:if test="${param.success == 'true'}">
            <div class="success-message" style="background: #e6ffe6; color: #0a0; padding: 12px; border-radius: 8px; margin-bottom: 20px; font-size: 14px; text-align: center;">
                회원가입이 완료되었습니다! 로그인해주세요.
            </div>
        </c:if>
        
        <form action="/edu/loginProcess.do" method="post">
            <div class="form-group">
                <label class="form-label">아이디</label>
                <input type="text" name="username" class="form-input" placeholder="아이디를 입력하세요" required>
            </div>
            
            <div class="form-group">
                <label class="form-label">비밀번호</label>
                <input type="password" name="password" class="form-input" placeholder="비밀번호를 입력하세요" required>
            </div>
            
            <button type="submit" class="login-btn">로그인</button>
        </form>
        
        <div class="divider">
            <span>또는</span>
        </div>
        
        <button type="button" class="register-btn" onclick="location.href='/edu/register.do'">회원가입</button>
        
        <a href="/edu/start.do" class="back-link">← 메인으로 돌아가기</a>
    </div>
</div>
</body>
</html>

