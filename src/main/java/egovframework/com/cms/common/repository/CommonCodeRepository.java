package egovframework.com.cms.common.repository;

import egovframework.com.cms.intro.login.repository.AbstractDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CommonCodeRepository extends AbstractDAO {
    /**
     * Common Code
     */
    public List<Map<String, Object>> getCmGroupCodeList(Map<String, Object> params){ return selectList("commonCode.getCmGroupCodeList", params);}
    public List<Map<String, Object>> getCmCodeList(Map<String, Object> params){ return selectList("commonCode.getCmCodeList", params);}
    public List<Map<String, Object>> getCustomCodeList(Map<String, Object> params){ return selectList("commonCode.getCustomCodeList", params);}
    public Map<String, Object> getCmGroupCodeInfo(Map<String, Object> params) { return (Map<String, Object>) selectOne("commonCode.getCmGroupCodeInfo", params);}
    public void setCmGroupCodeSave(Map<String, Object> params) { insert("commonCode.setCmGroupCodeSave", params);}
    public void setCmGroupCodeUpdate(Map<String, Object> params) { update("commonCode.setCmGroupCodeUpdate", params);}
    public int getCodeValidationChk(Map<String, Object> params) { return (int)selectOne("commonCode.getCodeValidationChk", params);}
    public void setCmCodeSave(Map<String, Object> params){ insert("commonCode.setCmCodeSave", params);}
    public Map<String, Object> getCmCodeInfo(Map<String, Object> params){ return (Map<String, Object>) selectOne("commonCode.getCmCodeInfo", params);}
    public void setCmCodeUpdate(Map<String, Object> params){ update("commonCode.setCmCodeUpdate", params);}
    public void setCmCodeDel(Map<String, Object> params){ update("commonCode.setCmCodeDel", params);}
}
