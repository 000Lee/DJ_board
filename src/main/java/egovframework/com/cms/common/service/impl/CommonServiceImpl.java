package egovframework.com.cms.common.service.impl;

import egovframework.com.cms.common.repository.CommonRepository;
import egovframework.com.cms.common.service.CommonService;
import egovframework.com.cms.common.utiles.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.net.ssl.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.*;

@Service
public class CommonServiceImpl implements CommonService {

    private static final Logger logger = LoggerFactory.getLogger(CommonServiceImpl.class);

    @Autowired
    private CommonRepository commonRepository;

    @Override
    public void insFileInfo(List<Map<String, Object>> list, Map<String, Object> params, String path) {

        for(int i = 0 ; i < list.size() ; i++){
            list.get(i).put("empSeq", params.get("empSeq"));
            list.get(i).put("fileCd", params.get("menuCd").toString());
            list.get(i).put("filePath", path);
            list.get(i).put("fileOrgName", list.get(i).get("orgFilename").toString().split("[.]")[0]);
            list.get(i).put("fileExt", list.get(i).get("orgFilename").toString().split("[.]")[1]);
            list.get(i).put("frKey", params.get("frKey"));
        }

        commonRepository.insFileInfo(list);

    }

    @Override
    public Map<String, Object> getContentFileOne(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<>();

        try {
            Map<String, Object> fileMap = new HashMap<>();
            fileMap = commonRepository.getContentFileOne(params);

            CommonUtil commonUtil = new CommonUtil();
            boolean isDelete = commonUtil.deleteFile(new String[]{fileMap.get("file_uuid").toString()}, fileMap.get("file_path").toString());

            if(isDelete){
                commonRepository.getContentFileDelOne(params);
            }else{
                throw new Exception();
            }

            result.put("code", "200");
            result.put("message", "파일이 삭제되었습니다.");
        }catch (Exception e){
            result.put("code", "500");
            result.put("message", "파일 삭제 중 에러가 발생했습니다.");
        }

        return result;
    }

    @Override
    @Transactional
    public Map<String, Object> commonFileDelList(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<>();

        String[] fileNos = params.get("fileNos").toString().split(",");
        try {
            for(int i = 0; i < fileNos.length; i++){
                Map<String, Object> fileMap = new HashMap<>();
                Map<String, Object> searchMap = new HashMap<>();
                searchMap.put("fileNo", fileNos[i]);
                fileMap = commonRepository.getContentFileOne(searchMap);

                CommonUtil commonUtil = new CommonUtil();
                boolean isDelete = commonUtil.deleteFile(new String[]{fileMap.get("file_uuid").toString()}, fileMap.get("file_path").toString());

                if(isDelete){
                    commonRepository.getContentFileDelOne(searchMap);
                }else{
                    throw new Exception();
                }
            }

            result.put("code", "200");
            result.put("message", "파일이 삭제되었습니다.");
        }catch (Exception e){
            result.put("code", "500");
            result.put("message", "파일 삭제 중 에러가 발생했습니다.");
        }

        return result;
    }

    @Override
    public List<Map<String, Object>> getCommCodeList(Map<String, Object> map) {
        return commonRepository.getCommCodeList(map);
    }

    @Override
    public void fileDownLoad(String fileNm, String path, String fileType, HttpServletRequest request, HttpServletResponse response) throws Exception {
        InputStream in = null;
        OutputStream out = null;

        if(request.getServerName().contains("localhost") || request.getServerName().contains("127.0.0.1") || request.getServerName().contains("121.186.165.80")){
            path = "http://121.186.165.80" + path;
            /*path = "http://www.jiat.re.kr" + path;*/

        }else{
            /*path = "https://192.168.34.101:16327" + path;*/
            path = "http://127.0.0.1" + path;
        }

        String header = request.getHeader("User-Agent");
        if(header.contains("MSIE") || header.contains("Trident")) {
            fileNm = URLEncoder.encode(fileNm, "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-Disposition", "attachment; filename="+ fileNm +";");
        } else {
            fileNm = new String(fileNm.getBytes("UTF-8"), "iso-8859-1");
            response.setHeader("Content-Disposition", "attachment; filename=\""+ fileNm +"\"");
        }

        response.setHeader("Pragma", "no-cache;");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary");

        out = response.getOutputStream();
        String fileUrl = path;
        URL url = new URL(fileUrl);

        // 만약 프로토콜이 https 라면 https SSL을 무시하는 로직을 수행해주어야 한다.('https 인증서 무시' 라는 키워드로 구글에 검색하면 많이 나옵니다.)
        disableSslVerification();

        in = url.openStream();
        while(true){
            //파일을 읽어온다.
            int data = in.read();
            if(data == -1){
                break;
            }
            //파일을 쓴다.
            out.write(data);
        }
        in.close();
        out.close();
    }

    @Override
    public void fileDownLoad2(String fileNm, String path, String fileType, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //if(fileType.equals("form") && (request.getServerName().contains("localhost") || request.getServerName().contains("127.0.0.1"))){
        InputStream in = null;
        OutputStream out = null;

        fileNm = URLDecoder.decode(fileNm, "utf-8");

        if(request.getServerName().contains("localhost") || request.getServerName().contains("127.0.0.1") || request.getServerName().contains("121.186.165.80")){
            path = "http://121.186.165.80:8010" + path;
        }else{
            path = "http://10.10.10.114:80" + path;
        }

        String header = request.getHeader("User-Agent");
        if(header.contains("MSIE") || header.contains("Trident")) {
            fileNm = URLEncoder.encode(fileNm, "UTF-8").replaceAll("\\+", "%20");
            System.out.println("MSIE" + fileNm);
            response.setHeader("Content-Disposition", "attachment; filename="+ fileNm +";");
        } else {
            System.out.println("else" + fileNm);
            fileNm = new String(fileNm.getBytes("UTF-8"), "iso-8859-1");
            response.setHeader("Content-Disposition", "attachment; filename=\""+ fileNm +"\"");
        }

        response.setHeader("Pragma", "no-cache;");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary");

        out = response.getOutputStream();
        String fileUrl = path;
        URL url = new URL(fileUrl);

        // 만약 프로토콜이 https 라면 https SSL을 무시하는 로직을 수행해주어야 한다.('https 인증서 무시' 라는 키워드로 구글에 검색하면 많이 나옵니다.)
        disableSslVerification();

        in = url.openStream();
        while(true){
            //파일을 읽어온다.
            int data = in.read();
            if(data == -1){
                break;
            }
            //파일을 쓴다.
            out.write(data);
        }
        in.close();
        out.close();
    }

    @Override
    public void insOneFileInfo(Map<String, Object> params) {
        commonRepository.insOneFileInfo(params);
    }

    private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String browser = getBrowser(request);

        String dispositionPrefix = "attachment; filename=";
        String encodedFilename = null;

        if (browser.equals("MSIE")) {
            encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.equals("Firefox")) {
            encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "ISO-8859-1") + "\"";
        } else if (browser.equals("Opera")) {
            encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.equals("Chrome")) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < filename.length(); i++) {
                char c = filename.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }
            encodedFilename = sb.toString();
        } else {

        }

        response.setHeader("Content-Disposition", dispositionPrefix + "\"" + encodedFilename + "\"");

        if ("Opera".equals(browser)) {
            response.setContentType("application/octet-stream;charset=UTF-8");
        }
    }

    public void disableSslVerification(){
        // TODO Auto-generated method stub
        try
        {
            // Create a trust manager that does not validate certificate chains
            TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
                public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
                public void checkClientTrusted(X509Certificate[] certs, String authType){
                }
                public void checkServerTrusted(X509Certificate[] certs, String authType){
                }
            }
            };

            // Install the all-trusting trust manager
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

            // Create all-trusting host name verifier
            HostnameVerifier allHostsValid = new HostnameVerifier() {
                public boolean verify(String hostname, SSLSession session){
                    return true;
                }
            };

            // Install the all-trusting host verifier
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (KeyManagementException e) {
            e.printStackTrace();
        }
    }

    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) { // IE 10 �씠�븯
            return "MSIE";
        } else if (header.indexOf("Trident") > -1) { // IE 11
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }
}
