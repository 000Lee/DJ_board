package egovframework.com.cms.intro.login.service.impl;

import egovframework.com.cms.intro.login.dto.LoginVO;
import egovframework.com.cms.intro.login.repository.LoginRepository;
import egovframework.com.cms.intro.login.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginRepository loginRepository;

    @Override
    public LoginVO actionLogin(LoginVO loginVO) {
        LoginVO login = loginRepository.actionLogin(loginVO);
        return login;
    }
}
