package egovframework.com.cms.edu.repository;

import egovframework.com.cms.edu.model.EduBoardVO;
import egovframework.com.cms.edu.model.PagingVO;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;

@Repository("eduBoardDAO")
public class EduBoardDAO {

    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

    private static final String NAMESPACE = "eduBoard";

    /**
     * 게시글 목록 조회 (전체)
     */
    public List<EduBoardVO> selectList() {
        return sqlSession.selectList(NAMESPACE + ".selectList");
    }

    /**
     * 게시글 목록 조회 (페이징)
     */
    public List<EduBoardVO> selectListWithPaging(PagingVO paging) {
        return sqlSession.selectList(NAMESPACE + ".selectListWithPaging", paging);
    }

    /**
     * 전체 게시글 수 조회 (검색 조건 포함)
     */
    public int selectTotalCount(PagingVO paging) {
        return sqlSession.selectOne(NAMESPACE + ".selectTotalCount", paging);
    }

    /**
     * 게시글 상세 조회
     */
    public EduBoardVO selectDetail(Long id) {
        return sqlSession.selectOne(NAMESPACE + ".selectDetail", id);
    }

    /**
     * 게시글 등록
     */
    public int insert(EduBoardVO vo) {
        return sqlSession.insert(NAMESPACE + ".insert", vo);
    }

    /**
     * 게시글 수정
     */
    public int update(EduBoardVO vo) {
        return sqlSession.update(NAMESPACE + ".update", vo);
    }

    /**
     * 게시글 삭제
     */
    public int delete(Long id) {
        return sqlSession.delete(NAMESPACE + ".delete", id);
    }

    /**
     * 조회수 증가
     */
    public int updateViews(Long id) {
        return sqlSession.update(NAMESPACE + ".updateViews", id);
    }

    /**
     * 이전글 조회
     */
    public EduBoardVO selectPrevPost(Long id) {
        return sqlSession.selectOne(NAMESPACE + ".selectPrevPost", id);
    }

    /**
     * 다음글 조회
     */
    public EduBoardVO selectNextPost(Long id) {
        return sqlSession.selectOne(NAMESPACE + ".selectNextPost", id);
    }
}
