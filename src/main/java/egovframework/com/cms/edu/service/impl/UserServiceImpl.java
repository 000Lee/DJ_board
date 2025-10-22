package egovframework.com.cms.edu.service.impl;

import egovframework.com.cms.edu.model.UserVO;
import egovframework.com.cms.edu.repository.UserDAO;
import egovframework.com.cms.edu.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource(name = "userDAO")
    private UserDAO userDAO;

    @Override
    public void register(UserVO user) throws Exception {
        // 아이디 중복 체크
        if (isUsernameDuplicate(user.getUsername())) {
            throw new Exception("이미 존재하는 아이디입니다.");
        }
        
        // 회원 가입
        userDAO.insertUser(user);
    }

    @Override
    public UserVO login(String username, String password) throws Exception {
        // 아이디로 회원 조회
        UserVO user = userDAO.findByUsername(username);
        
        // 회원이 없거나 비밀번호가 틀린 경우
        if (user == null || !user.getPassword().equals(password)) {
            throw new Exception("아이디 또는 비밀번호가 올바르지 않습니다.");
        }
        
        return user;
    }

    @Override
    public boolean isUsernameDuplicate(String username) throws Exception {
        return userDAO.countByUsername(username) > 0;
    }

    @Override
    public void withdraw(Long userId) throws Exception {
        int result = userDAO.deleteUser(userId);
        if (result == 0) {
            throw new Exception("회원 탈퇴에 실패했습니다.");
        }
    }
}

