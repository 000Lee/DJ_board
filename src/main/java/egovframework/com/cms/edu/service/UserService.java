package egovframework.com.cms.edu.service;

import egovframework.com.cms.edu.model.UserVO;

public interface UserService {
    // 회원가입
    void register(UserVO user) throws Exception;
    
    // 로그인 (아이디, 비밀번호 확인)
    UserVO login(String username, String password) throws Exception;
    
    // 아이디 중복 체크
    boolean isUsernameDuplicate(String username) throws Exception;
    
    // 회원 탈퇴
    void withdraw(Long userId) throws Exception;
}

 