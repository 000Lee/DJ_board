package egovframework.com.cms.edu.service;

import egovframework.com.cms.edu.model.CommentVO;
import java.util.List;

public interface CommentService {
    
    /**
     * 특정 게시글의 댓글 목록 조회
     */
    List<CommentVO> getCommentsByBoardId(Long boardId);
    
    /**
     * 댓글 등록
     */
    void insertComment(CommentVO vo);
    
    /**
     * 댓글 삭제
     */
    void deleteComment(Long id);
    
    /**
     * 댓글 수정
     */
    void updateComment(CommentVO vo);
    
    /**
     * 댓글 수 조회
     */
    int getCommentCount(Long boardId);
    
    /**
     * 특정 댓글 조회
     */
    CommentVO getComment(Long id);
}

