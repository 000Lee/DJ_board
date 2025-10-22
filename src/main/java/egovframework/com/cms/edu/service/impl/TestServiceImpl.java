package egovframework.com.cms.edu.service.impl;

import egovframework.com.cms.edu.model.EduBoardVO;
import egovframework.com.cms.edu.model.PagingVO;
import egovframework.com.cms.edu.repository.EduBoardDAO;
import egovframework.com.cms.edu.service.TestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("testService")
public class TestServiceImpl implements TestService {
    
    @Resource(name = "eduBoardDAO")
    private EduBoardDAO eduBoardDAO;
    
    @Override
    public List<EduBoardVO> getList() {
        return eduBoardDAO.selectList();
    }
    
    @Override
    public List<EduBoardVO> getListWithPaging(PagingVO paging) {
        return eduBoardDAO.selectListWithPaging(paging);
    }
    
    @Override
    public int getTotalCount() {
        return eduBoardDAO.selectTotalCount();
    }
    
    @Override
    public EduBoardVO getDetail(Long id) {
        eduBoardDAO.updateViews(id); // 조회수 증가
        return eduBoardDAO.selectDetail(id);
    }
    
    @Override
    public void insert(EduBoardVO vo) {
        eduBoardDAO.insert(vo);
    }
    
    @Override
    public void update(EduBoardVO vo) {
        eduBoardDAO.update(vo);
    }
    
    @Override
    public void delete(Long id) {
        eduBoardDAO.delete(id);
    }
    
    @Override
    public void updateViews(Long id) {
        eduBoardDAO.updateViews(id);
    }
    
    @Override
    public EduBoardVO getPrevPost(Long id) {
        return eduBoardDAO.selectPrevPost(id);
    }
    
    @Override
    public EduBoardVO getNextPost(Long id) {
        return eduBoardDAO.selectNextPost(id);
    }
}
