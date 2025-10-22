package egovframework.com.cms.common.controller;

import egovframework.com.cms.common.service.CommonCodeService;
import egovframework.com.cms.intro.login.dto.LoginVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class CommonCodeController {

    private static final Logger logger = (Logger) LoggerFactory.getLogger(CommonCodeController.class);

    @Autowired
    private CommonCodeService commonCodeService;

    /**
     * 공통 코드 관리 - 페이지
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/system/code/comCodeM.do")
    public String comCodeM(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        model.addAttribute("loginVO", (LoginVO) session.getAttribute("LoginVO"));

        return "system/code/comCodeM";
    }

    /**
     * 공통코드관리 - 그룹코드 리스트
     * @param model
     * @param params
     * @return
     */
    @RequestMapping("/system/code/getCmGroupCodeList.do")
    public String getCmGroupCodeList(Model model, @RequestParam Map<String, Object> params){
        model.addAttribute("groupCodeList", commonCodeService.getCmGroupCodeList(params));
        return "jsonView";
    }

    /**
     * 공통코드관리 - 그룹코드 저장/수정
     * @param params
     * @param model
     * @return
     */
    @RequestMapping("/system/code/setCmGroupCodeSave.do")
    public String setCmGroupCodeSave(@RequestParam Map<String, Object> params, Model model){
        Map<String, Object> result = commonCodeService.setCmGroupCodeSave(params);
        model.addAttribute("result", result);
        return "jsonView";
    }

    /**
     * 공통코드관리 - 그룹코드별 코드 리스트
     * @param model
     * @param params
     * @return
     */
    @RequestMapping("/system/code/getCmCodeList.do")
    public String getCmCodeList(@RequestParam Map<String, Object> params, Model model){
        model.addAttribute("list", commonCodeService.getCmCodeList(params));
        return "jsonView";
    }

    /**
     * 공통코드관리 - 그룹코드 정보 조회
     * @param model
     * @param params
     * @return
     */
    @RequestMapping("/system/code/getCmGroupCodeInfo.do")
    public String getCmGroupCodeInfo(@RequestParam Map<String, Object> params, Model model){
        model.addAttribute("result", commonCodeService.getCmGroupCodeInfo(params));
        return "jsonView";
    }

    /**
     * 공통코드관리 - 그룹코드별 공통코드 데이터 조회
     * @param params
     * @param model
     * @return
     */
    @RequestMapping("/system/code/getCmCodeInfo.do")
    public String vacCodeDataInfo(@RequestParam Map<String, Object> params, Model model){
        model.addAttribute("result", commonCodeService.getCmCodeInfo(params));
        return "jsonView";
    }

    /**
     * 공통코드관리 - 그룹코드별 공통코드 중복코드 체크
     * @param params
     * @param model
     * @return
     */
    @RequestMapping("/system/code/getCodeValidationChk.do")
    public String getCodeValidationChk(@RequestParam Map<String, Object> params, Model model){
        model.addAttribute("rs", commonCodeService.getCodeValidationChk(params));
        return "jsonView";
    }

    /**
     * 공통코드관리 - 그룹코드별 공통코드 저장/수정
     * @param params
     * @return
     */
    @RequestMapping("/system/code/setCmCodeSave.do")
    public String setCmCodeSave(@RequestParam Map<String, Object> params){
        commonCodeService.setCmCodeSave(params);
        return "jsonView";
    }

    /**
     * 공통코드관리 - 그룹코드별 공통코드 삭제
     * @param params
     * @return
     */
    @RequestMapping("/system/code/setCmCodeDel.do")
    public String setCmCodeDel(@RequestParam Map<String, Object> params){
        commonCodeService.setCmCodeDel(params);
        return "jsonView";
    }
}