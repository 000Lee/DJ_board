package egovframework.com.cms.common.service.impl;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import egovframework.com.cms.common.repository.CommonCodeRepository;
import egovframework.com.cms.common.service.CommonCodeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {

    private static final Logger logger = LoggerFactory.getLogger(CommonCodeServiceImpl.class);

    @Autowired
    private CommonCodeRepository commonCodeRepository;

    /**
     * Common Code
     */
    @Override
    public List<Map<String, Object>> getCmGroupCodeList(Map<String, Object> params) {
        List<Map<String, Object>> cmGroupCodeList = commonCodeRepository.getCmGroupCodeList(params);
        List<Map<String, Object>> cmCodeList = commonCodeRepository.getCmCodeList(params);

        for(Map<String, Object> parent : cmGroupCodeList){
            for(Map<String, Object> children : cmCodeList){
                if(parent.get("CM_GROUP_CODE_ID").equals(children.get("CM_GROUP_CODE_ID"))){
                    List<Map<String, Object>> childrenCode = new ArrayList<Map<String, Object>>();
                    if(parent.containsKey("childrenCode")){
                        childrenCode = (List<Map<String, Object>>) parent.get("childrenCode");
                        childrenCode.add(children);
                        parent.put("childrenCode", childrenCode);
                    }else{
                        childrenCode.add(children);
                        parent.put("childrenCode", childrenCode);
                    }
                }
            }
        }

        return cmGroupCodeList;
    }

    @Override
    public List<Map<String, Object>> getCmCodeList(Map<String, Object> params) {
        if(!StringUtils.isEmpty(params.get("searchType")) && params.get("searchType").equals("1")){
            Gson gson = new Gson();
            List<String> cmGroupCodeId = gson.fromJson((String) params.get("cmGroupCodeId"),new TypeToken<List<String>>(){}.getType());
            params.put("cmGroupCodeId", cmGroupCodeId);
        }

        return commonCodeRepository.getCmCodeList(params);
    }

    @Override
    public Map<String, Object> getCmGroupCodeInfo(Map<String, Object> params) {
        return commonCodeRepository.getCmGroupCodeInfo(params);
    }

    @Override
    @Transactional
    public Map<String, Object> setCmGroupCodeSave(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<>();

        try {
            if(StringUtils.isEmpty(params.get("cmGroupCodeId"))){
                commonCodeRepository.setCmGroupCodeSave(params);
            }else{
                commonCodeRepository.setCmGroupCodeUpdate(params);
            }

            result.put("code", "200");
            result.put("message", "공통 그룹코드 설정이 완료되었습니다.");
        } catch (Exception e) {
            result.put("code", "500");
            result.put("message", "공통 그룹코드 설정 저장 중 에러가 발생했습니다.");
        }

        return result;
    }

    @Override
    public int getCodeValidationChk(Map<String, Object> params) {
        return commonCodeRepository.getCodeValidationChk(params);
    }

    @Override
    @Transactional
    public void setCmCodeSave(Map<String, Object> params) {
        if(StringUtils.isEmpty(params.get("cmCodeId"))){
            commonCodeRepository.setCmCodeSave(params);
        }else{
            commonCodeRepository.setCmCodeUpdate(params);
        }
    }

    @Override
    public Map<String, Object> getCmCodeInfo(Map<String, Object> params) {
        return commonCodeRepository.getCmCodeInfo(params);
    }

    @Override
    public void setCmCodeDel(Map<String, Object> params) {
        commonCodeRepository.setCmCodeDel(params);
    }
}
