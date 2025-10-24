<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시판</title>
    <style>
        body { 
            font-family: 'Malgun Gothic', sans-serif; 
            margin: 20px;
        }
        
        /* 모달 배경 */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 10000;
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideUp {
            from { 
                opacity: 0;
                transform: translateY(30px);
            }
            to { 
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* 모달 컨테이너 */
        .modal-container { 
            max-width: 400px; 
            width: 90%;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            animation: slideUp 0.3s ease;
        }
        
        .lock-icon {
            text-align: center;
            font-size: 48px;
            margin-bottom: 15px;
            color: #667eea;
        }
        
        h2 {
            text-align: center;
            color: #333;
            margin: 0 0 8px 0;
            font-size: 24px;
        }
        
        .subtitle {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-bottom: 25px;
        }
        
        .form-group { 
            margin-bottom: 20px; 
        }
        
        label { 
            display: block; 
            margin-bottom: 8px; 
            font-weight: bold;
            color: #333;
            font-size: 14px;
        }
        
        input[type="password"] { 
            width: 100%; 
            padding: 12px; 
            border: 2px solid #e0e0e0; 
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }
        
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }
        
        .btn { 
            width: 100%;
            padding: 13px 20px;
            border: none; 
            border-radius: 8px; 
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        
        .btn:hover { 
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-secondary {
            box-sizing: border-box;
            background: #6c757d;
            margin-top: 10px;
            text-decoration: none;
            display: block;
            text-align: center;
            padding: 13px 20px;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            font-size: 15px;
        }
        
        .btn-secondary:hover { 
            background: #545b62;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(108, 117, 125, 0.4);
        }
        
        .error { 
            color: #dc3545; 
            background: #ffe6e6; 
            padding: 10px; 
            border-radius: 8px; 
            margin-bottom: 20px;
            text-align: center;
            font-size: 13px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/edu/common/header.jsp" flush="false"/>

<!-- 모달 배경 + 모달창 -->
<div class="modal-overlay">
    <div class="modal-container">
        <div class="lock-icon"></div>
        <h2>비밀글입니다</h2>
        <p class="subtitle">비밀번호를 입력해주세요</p>
        
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        
        <form action="/edu/detail.do" method="get">
            <input type="hidden" name="id" value="${boardId}">
            
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required autofocus placeholder="비밀번호를 입력하세요">
            </div>
            
            <button type="submit" class="btn">확인</button>
            <a href="/edu/start.do" class="btn btn-secondary">목록으로</a>
        </form>
    </div>
</div>
</body>
</html>

