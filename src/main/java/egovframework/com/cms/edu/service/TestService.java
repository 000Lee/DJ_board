package egovframework.com.cms.edu.service;

import egovframework.com.cms.edu.model.EduBoardVO;
import egovframework.com.cms.edu.model.PagingVO;
import java.util.List;

public interface TestService {
    List<EduBoardVO> getList();
    List<EduBoardVO> getListWithPaging(PagingVO paging);
    int getTotalCount(PagingVO paging);
    EduBoardVO getDetail(Long id);
    void insert(EduBoardVO vo);
    void update(EduBoardVO vo);
    void delete(Long id);
    void updateViews(Long id);
    EduBoardVO getPrevPost(Long id);
    EduBoardVO getNextPost(Long id);
}
