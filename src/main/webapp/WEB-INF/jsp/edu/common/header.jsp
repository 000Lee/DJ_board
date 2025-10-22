<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .edu-top-bar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 40px;
        background: #007bff;
        z-index: 9999;
        display: flex;
        align-items: center;
        justify-content: flex-end;
        padding-right: 20px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .edu-login-btn {
        background: white;
        color: #007bff;
        border: none;
        margin-right: 20px;
        padding: 5px 15px;
        border-radius: 3px;
        font-size: 12px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        font-weight: bold;
        transition: all 0.3s ease;

    }
    
    .edu-login-btn:hover {
        background: #f8f9fa;
        transform: translateY(-1px);
    }
    
    .edu-user-info {
        color: white;
        font-size: 12px;
        margin-right: 15px;
    }
    
    .edu-admin-badge {
        background: #ffc107;
        color: #000;
        padding: 2px 8px;
        border-radius: 10px;
        font-size: 10px;
        font-weight: bold;
        margin-right: 6px;
        display: inline-block;
        /* animation: pulse 2s infinite; */
    }
    
    /* @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.05); }
        100% { transform: scale(1); }
    }
     */
    .edu-logout-btn {
        background: white;
        color: #007bff;
        border: none;
        margin-right: 20px;
        padding: 5px 15px;
        border-radius: 3px;
        font-size: 12px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        font-weight: bold;
        transition: all 0.3s ease;
    }
    
    .edu-logout-btn:hover {
        background: #f8f9fa;
        transform: translateY(-1px);
    }
    
    .edu-withdraw-btn {
        background: #dc3545;
        color: white;
        border: none;
        margin-right: 10px;
        padding: 5px 15px;
        border-radius: 3px;
        font-size: 12px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        font-weight: bold;
        transition: all 0.3s ease;
    }
    
    .edu-withdraw-btn:hover {
        background: #c82333;
        transform: translateY(-1px);
    }
    
    /* body에 padding-top 추가해서 헤더와 겹치지 않게 */
    body {
        padding-top: 50px;
    }
</style>

<div class="edu-top-bar">
    <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
            <span class="edu-user-info">
                <c:if test="${sessionScope.loginUser.isAdmin}">
                    <span class="edu-admin-badge">관리자</span>
                </c:if>
                ${sessionScope.loginUser.name}님 환영합니다!
            </span>
            <a href="/edu/withdraw.do" class="edu-withdraw-btn" onclick="return confirm('정말 탈퇴하시겠습니까? 모든 데이터가 삭제됩니다.');">회원탈퇴</a>
            <a href="/edu/logout.do" class="edu-logout-btn">로그아웃</a>
        </c:when>
        <c:otherwise>
            <a href="/edu/login.do" class="edu-login-btn">로그인</a>
        </c:otherwise>
    </c:choose>
</div>

