package egovframework.com.cms.common.repository;

import egovframework.com.cms.intro.login.dto.LoginVO;
import egovframework.com.cms.intro.login.repository.AbstractDAO;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommonRepository extends AbstractDAO {
    public List<Map<String,Object>> getBoardDataSet(Map<String, Object> map) {return selectList("search.getBoardDataSet", map);}
    public List<Map<String,Object>> getFileCodeList(Map<String, Object> map) {return selectList("search.getFileCodeList", map);}
    public List<Map<String,Object>> getFileDataSet(Map<String, Object> map) {return selectList("search.getFileDataSet", map);}
    public List<Map<String, Object>> getGroupList(Map<String, Object> params) { return selectList("common.getGroupList", params);}
    public Map<String, Object> getGroupInfo(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getGroupInfo", params);}
    public List<Map<String, Object>> getManageDeptPath(Map<String, Object> params) { return selectList("common.getManageDeptPath", params);}
    public Map<String, Object> getMyPath(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getMyPath", params);}

    public List<Map<String, Object>> getMyPathAdmin(Map<String, Object> params) { return selectList("common.getMyPathAdmin", params);}
    public List<Map<String, Object>> getOrgFullList(Map<String, Object> params) { return selectList("common.getOrgFullList", params);}
    public List<Map<String, Object>> getGroupItemList(Map<String, Object> params) { return selectList("common.getGroupItemList", params);}
    public Map<String, Object> getOptionSetValueMap(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getOptionSetValueMap", params);}
    public List<Map<String, Object>> getOrgFullOrBatch(Map<String, Object> params, String queryId) { return selectList(queryId, params);}
    /** "common.getOrgFullListAdmin" */
    /** "common.getOrgBatchPreviewList" */

    public void insFileInfo(List<Map<String, Object>> list) {
        insert("common.insFileInfo", list);
    }
    public void insFileInfo2(List<Map<String, Object>> list) {
        insert("common.insFileInfo", list);
    }
    public void insOneFileInfo(Map<String, Object> params) { insert("common.insOneFileInfo", params);}
    public void updOneFileInfo(Map<String, Object> params) { update("common.updOneFileInfo", params);}
    public void setFileInfoContentIdUpd(Map<String, Object> params) { update("common.setFileInfoContentIdUpd", params);}
    public void updOneFileApproveNReturn(Map<String, Object> params) { update("common.updOneFileApproveNReturn", params);}
    public List<Map<String, Object>> getContentFileList(Map<String, Object> params) { return selectList("common.getContentFileList", params);}
    public Map<String, Object> getContentFileOne(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getContentFileOne", params);}
    public Map<String, Object> getApprovalDocHwpFile(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getApprovalDocHwpFile", params);}
    public void getContentFileDelOne(Map<String, Object> params) { delete("common.getContentFileDelOne", params);}

    public List<Map<String, Object>> ctDept() {
        return selectList("common.ctDept");
    }

    public List<Map<String, Object>> getCtDeptLevelNot0(Map<String, Object> params) { return selectList("common.getCtDeptLevelNot0", params);}
    public Map<String, Object> getDept(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getDept", params);}
    public List<Map<String, Object>> getDpList(Map<String, Object> params) { return selectList("common.getDpList", params);}
    public List<Map<String, Object>> getPersonnelInfoSetCodeList(){ return selectList("common.getPersonnelInfoSetCodeList");}
    public Map<String, Object> getDutyList(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getDutyList", params); }
    public Map<String, Object> getApplyDateAttCheck(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getApplyDateAttCheck", params);}
    public Map<String, Object> getApplyDateOwpCheck(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getApplyDateOwpCheck", params);}
    public List<Map<String, Object>> getCode(Map<String, String> map) {
        return selectList("common.getCode", map);
    }
    public List<Map<String, Object>> getCommCodeList(Map<String, Object> map) { return (List<Map<String, Object>>)selectList("common.getCommCodeList", map);}
    public Map<String, Object> getEmpDeptParentDept(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getEmpDeptParentDept", params);}
    public List<Map<String, Object>> getPurcDeptList() {
        return selectList("common.getPurcDeptList");
    }

    public Map<String, Object> getPurcParentDept(Map<String, Object> map) {
        return (Map<String, Object>) selectOne("common.getPurcParentDept", map);
    }

    public List<Map<String, Object>> empInformation(Map<String, Object> map) {
        return selectList("common.empInformation", map);
    }

    public Map<String, Object> empInformationOne(Map<String, Object> map) {
        return (Map<String, Object>) selectOne("common.empInformationOne", map);
    }

    public int empInformationTotal(Map<String, Object> map) {
        return (int) selectOne("common.empInformationTotal",map);
    }

    /* TODO. G20 연결 완료 후 작업 진행*/
//    public List<Map<String, Object>> getBankCode() {
//        return selectListMs("common.getBankCode");
//    }


    public List<Map<String, Object>> getCompList(Map<String, Object> params) { return selectList("common.getCompList", params);}

    public List<Map<String, Object>> getAllDept() {
        return selectList("common.getAllDept");
    }

    public Map<String, Object> templateUserInfo(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.templateUserInfo", params);}

    public List<Map<String, Object>> getComboList(HashMap<String, Object> map) {
        return selectList("common.getComboList", map);
    }

    public void alarmLook(Map<String, Object> params) {
        insert("common.alarmLook", params);
    }

    public List<Map<String, Object>> alarmLookList(Map<String, Object> param) {
        return selectList("common.alarmLookList", param);
    }

    public Map<String, Object> alarmLookListStatus(LoginVO loginVO) { return (Map<String, Object>) selectOne("common.alarmLookListStatus", loginVO);}

    public void alarmLookListDel(Map<String, Object> params) { update("common.alarmLookListDel", params);}

    public void alarmLookListCount(Map<String, Object> params) { update("common.alarmLookListCount", params);}

    public void sndAlermCt(Map<String, Object> params) {
        insert("common.sndAlermCt", params);
    }

    public void delFileInfo(Map<String, Object> params) {
        delete("common.delFileInfo", params);
    }

    public void checkDashBoard(Map<String, Object> params) {
        insert("common.checkDashBoard", params);
    }

    public Map<String, Object> checkDashBoardLook(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.checkDashBoardLook", params);}

    public void checkDashBoardLookUpdate(Map<String, Object> params) { update("common.checkDashBoardLookUpdate", params);}

    public Map<String, Object> getCustomDocNum(Map<String, Object> params) { return (Map<String, Object>) selectOne("common.getCustomDocNum", params);}
    public void setCustomDocNumUpd(Map<String, Object> params){ update("common.setCustomDocNumUpd", params);}
    public String getMaxKeycode(String seqName) { return (String) selectOne("common.getMaxKeycode", seqName);}

    public LoginVO actionLogin2(Map<String, Object> params) {
        return (LoginVO) selectOne("common.actionLogin2", params);
    }
}
