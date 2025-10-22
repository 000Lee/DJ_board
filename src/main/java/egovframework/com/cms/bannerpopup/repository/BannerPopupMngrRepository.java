package egovframework.com.cms.bannerpopup.repository;

import egovframework.com.cms.hp.board.util.ArticlePage;
import egovframework.com.cms.hp.board.util.PostResponse;
import egovframework.com.cms.intro.login.repository.AbstractDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BannerPopupMngrRepository extends AbstractDAO {

    public List<PostResponse> getPopupList(ArticlePage articlePage) {
        return selectList("mngr.getPopupList", articlePage);
    }

    public List<Map<String, Object>> getMainPopupList() {
        return selectList("mngr.getMainPopupList");
    }
    public Object getPopupListCnt(ArticlePage articlePage) {
        return (int) selectOne("mngr.getPopupListCnt", articlePage);
    }
    public Map<String, Object> getBannerPopupOpenOne(Map<String, Object> params) {
        return (Map<String, Object>) selectOne("mngr.getBannerPopupOpenOne", params);
    }
    public Map<String, Object> getBannerPopupOne(Map<String, Object> params) {
        return (Map<String, Object>) selectOne("mngr.getBannerPopupOne", params);
    }

    public Map<String, Object> getBannerPopupFile(Map<String, Object> params) {
        return (Map<String, Object>) selectOne("mngr.getBannerPopupFile", params);
    }

    public void setBannerPopupInsert(Map<String, Object> params) {
        insert("mngr.setBannerPopupInsert", params);
    }
    public void setBannerPopupUpdate(Map<String, Object> params) {
        update("mngr.setBannerPopupUpdate", params);
    }
    public void setBannerPopupInsertFile(List<Map<String, Object>> list) {
        insert("mngr.setBannerPopupInsertFile", list);
    }
    public void setBannerPopupDelete(Map<String, Object> params) {
        update("mngr.setBannerPopupDelete", params);
    }
}
