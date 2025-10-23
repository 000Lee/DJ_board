package egovframework.com.cms.common.controller;

import com.google.gson.Gson;
// import dev_jitsu.MainLib;  // TODO: MainLib 클래스 누락으로 임시 주석
import egovframework.com.cms.common.service.CommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class CommonController {
    private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

    @Autowired
    private CommonService commonService;

    @Value("#{properties['File.Server.Dir']}")
    private String SERVER_DIR;

    @Value("#{properties['File.Server.Path']}")
    private String SERVER_PATH;

    @Value("#{properties['File.Base.Directory']}")
    private String BASE_DIR;


    // TODO: MainLib 누락으로 전체 메서드 임시 주석
    /*
    @RequestMapping(value = "/common/multiFileUpload.do", method = RequestMethod.POST)
    public String multiFileUpload(@RequestParam("fileNm") MultipartFile[] mpf, @requestParam Map<String, Object> params){

        LocalDate now = LocalDate.now();
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        String fmtNow = now.format(fmt);

        String server_path = SERVER_DIR + params.get("menuCd").toString()+"/" + fmtNow + "/";
        String base_path = BASE_DIR + params.get("menuCd").toString()+"/" + fmtNow + "/";

        MainLib mainLib = new MainLib();

        List<Map<String, Object>> list = mainLib.multiFileUpload(mpf, server_path);

        commonService.insFileInfo(list, params, base_path);

        return "redirect:/subHoliday/holidayDeptEmp.do";
    }
    */

    @RequestMapping(value = "/common/fileDownload.do")
    public void fileDownload(@RequestParam Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileName = params.get("fileName") != null ? String.valueOf(params.get("fileName")) : "";
        String filePath = params.get("filePath") != null ? String.valueOf(params.get("filePath")) : "";
        String fileType = params.get("fileType") != null ? String.valueOf(params.get("fileType")) : "";

        commonService.fileDownLoad(fileName, filePath, fileType, request, response);
    }

    @RequestMapping(value = "/common/fileDownload2.do")
    public void fileDownload2(@RequestParam Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileName = params.get("fileName") != null ? String.valueOf(params.get("fileName")) : "";
        String filePath = params.get("filePath") != null ? String.valueOf(params.get("filePath")) : "";
        String fileType = params.get("fileType") != null ? String.valueOf(params.get("fileType")) : "";

        commonService.fileDownLoad2(fileName, filePath, fileType, request, response);
    }

    // TODO: MainLib 누락으로 전체 메서드 임시 주석
    /*
    @RequestMapping(value = "/common/multiFileDownload.do")
    public void multiFileDownload(@RequestParam Map<String, Object> params, HttpServletResponse response, Model model) {
        MainLib mainLib = new MainLib();
        List<Map<String, Object>> result = new ArrayList<>();
        String dir = "";
        String zipName = "";

        mainLib.multiFileDownload(result, dir, zipName, response);
    }
    */

    @RequestMapping(value = "/common/commonFileDel.do")
    public String commonFileDel(@RequestParam Map<String, Object> params, HttpServletResponse response, Model model){
        model.addAttribute("rs", commonService.getContentFileOne(params));
        return "jsonView";
    }

    @RequestMapping(value = "/common/commonFileDelList.do")
    public String commonFileDelList(@RequestParam Map<String, Object> params, HttpServletResponse response, Model model){
        model.addAttribute("rs", commonService.commonFileDelList(params));
        return "jsonView";
    }

    @RequestMapping(value = "/commcode/getCommCodeList", method = RequestMethod.POST)
    public String getCommCodeList(@RequestParam Map<String, Object> params, Model model){
        model.addAttribute("rs", commonService.getCommCodeList(params));
        return "jsonView";
    }

    // TODO: MainLib 누락으로 전체 메서드 임시 주석
    /*
    @RequestMapping(value = "/commFile/commFileUpLoad", method = RequestMethod.POST)
    public String commFileUpLoad(@RequestParam Map<String, Object> params, @RequestParam("file_name") MultipartFile[] file_name, Model model) {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        String fmtNow = LocalDate.now().format(fmt);

        String server_path = SERVER_DIR + params.get("menuCd").toString()+"/" + fmtNow + "/";
        String base_path = BASE_DIR + params.get("menuCd").toString()+"/" + fmtNow + "/";

        MainLib mainLib = new MainLib();
        List<Map<String, Object>> list = mainLib.multiFileUpload(file_name, server_path);
        commonService.insFileInfo(list, params, base_path);


        model.addAttribute("commFileList", list);

        return "jsonView";
    }
    */
}
