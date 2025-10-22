package egovframework.com.cms.edu.repository;

import egovframework.com.cms.edu.model.UserVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository("userDAO")
public class UserDAO {

    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

    private static final String NAMESPACE = "User";

    /**
     * 아이디로 회원 조회
     */
    public UserVO findByUsername(String username) {
        return sqlSession.selectOne(NAMESPACE + ".findByUsername", username);
    }

    /**
     * 회원 가입
     */
    public int insertUser(UserVO user) {
        return sqlSession.insert(NAMESPACE + ".insertUser", user);
    }

    /**
     * 아이디 중복 체크
     */
    public int countByUsername(String username) {
        return sqlSession.selectOne(NAMESPACE + ".countByUsername", username);
    }

    /**
     * 회원 탈퇴
     */
    public int deleteUser(Long id) {
        return sqlSession.delete(NAMESPACE + ".deleteUser", id);
    }
}

