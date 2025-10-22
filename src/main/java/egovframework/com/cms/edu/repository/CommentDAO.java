package egovframework.com.cms.edu.repository;

import egovframework.com.cms.edu.model.CommentVO;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;

@Repository("commentDAO")
public class CommentDAO {

    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

    private static final String NAMESPACE = "eduComment";

    /**
     * 특정 게시글의 댓글 목록 조회
     */
    public List<CommentVO> selectCommentsByBoardId(Long boardId) {
        return sqlSession.selectList(NAMESPACE + ".selectCommentsByBoardId", boardId);
    }

    /**
     * 댓글 등록
     */
    public int insertComment(CommentVO vo) {
        return sqlSession.insert(NAMESPACE + ".insertComment", vo);
    }

    /**
     * 댓글 삭제
     */
    public int deleteComment(Long id) {
        return sqlSession.delete(NAMESPACE + ".deleteComment", id);
    }

    /**
     * 댓글 수정
     */
    public int updateComment(CommentVO vo) {
        return sqlSession.update(NAMESPACE + ".updateComment", vo);
    }

    /**
     * 댓글 수 조회
     */
    public int selectCommentCount(Long boardId) {
        return sqlSession.selectOne(NAMESPACE + ".selectCommentCount", boardId);
    }
}

