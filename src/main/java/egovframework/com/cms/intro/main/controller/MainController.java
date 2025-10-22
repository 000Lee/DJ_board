package egovframework.com.cms.intro.main.controller;

import egovframework.com.cms.bannerpopup.service.BannerPopupMngrService;
import egovframework.com.cms.common.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private BannerPopupMngrService bannerPopupMngrService;

    @Autowired
    private CommonService commonService;

    @RequestMapping("/index.do")
    public String index(HttpServletRequest request, Model model){
        return "/index";
    }

    private Boolean isAdmin(HttpServletRequest request) {
        String ipAddress = (String) request.getHeader("X-Forwarded-For");

        if (ipAddress == null) {
            ipAddress = request.getHeader("Proxy-Client-IP");
            System.out.println("Proxy-Client-IP = " + ipAddress);
        }
        if (ipAddress == null) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
            System.out.println("WL-Proxy-Client-IP = " + ipAddress);
        }
        if (ipAddress == null) {
            ipAddress = request.getHeader("HTTP_CLIENT_IP");
            System.out.println("HTTP_CLIENT_IP = " + ipAddress);
        }
        if (ipAddress == null) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
            System.out.println("HTTP_X_FORWARDED_FOR = " + ipAddress);
        }
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
            System.out.println("getRemoteAddr = " + ipAddress);
        }

        if (ipAddress != null && !ipAddress.isEmpty()) {
            String[] ipAddresses = ipAddress.split(",");
            ipAddress = ipAddresses[0].trim(); // 가장 왼쪽 IP 주소 사용
        }

        boolean isAdmin = false;
        System.out.println("ipAddress = " + ipAddress);

        String admAllowIP = "";
        Properties properties = new Properties();
        try {
            properties.load(new FileInputStream(getClass().getClassLoader().getResource("egovframework/egovProps/admin_access_ip.properties").getFile()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        admAllowIP = properties.getProperty("admin.allow.ip");
        if(admAllowIP.indexOf(ipAddress) != -1){
            isAdmin = true;
        }

        /*
        * 개발서버 반영 및 로컬 작업 시 추가
        * 운영서버 반영 시 주석 처리
        * */
        
        isAdmin = true;

        System.out.println("isAdmin = " + isAdmin);
        return isAdmin;
    }
}
