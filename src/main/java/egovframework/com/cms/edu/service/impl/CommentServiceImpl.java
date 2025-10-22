package egovframework.com.cms.edu.service.impl;

import egovframework.com.cms.edu.model.CommentVO;
import egovframework.com.cms.edu.repository.CommentDAO;
import egovframework.com.cms.edu.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource(name = "commentDAO")
    private CommentDAO commentDAO;

    @Override
    public List<CommentVO> getCommentsByBoardId(Long boardId) {
        return commentDAO.selectCommentsByBoardId(boardId);
    }

    @Override
    public void insertComment(CommentVO vo) {
        commentDAO.insertComment(vo);
    }

    @Override
    public void deleteComment(Long id) {
        commentDAO.deleteComment(id);
    }

    @Override
    public void updateComment(CommentVO vo) {
        commentDAO.updateComment(vo);
    }

    @Override
    public int getCommentCount(Long boardId) {
        return commentDAO.selectCommentCount(boardId);
    }
    
    @Override
    public CommentVO getComment(Long id) {
        // 단일 댓글 조회 로직 (필요시 DAO에 추가)
        return null;
    }
}

