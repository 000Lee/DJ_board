package egovframework.com.cms.common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface CommonService {
    /**
     * 파일 관련
     * @param list
     * @param params
     * @param path
     */
    void insFileInfo(List<Map<String, Object>> list, Map<String, Object> params, String path);
    Map<String, Object> getContentFileOne(Map<String, Object> params);
    Map<String, Object> commonFileDelList(Map<String, Object> params);
    List<Map<String, Object>> getCommCodeList(Map<String, Object> map);
    /**
     * 다운로드
     * @param fileNm
     * @param path
     * @param request
     * @param response
     * @throws Exception
     */
    void fileDownLoad(String fileNm, String path, String fileType, HttpServletRequest request, HttpServletResponse response) throws Exception;
    void fileDownLoad2(String fileNm, String path, String fileType, HttpServletRequest request, HttpServletResponse response) throws Exception;
    void insOneFileInfo(Map<String, Object> params);
}
