package egovframework.com.cms.mngr.controller;

import egovframework.com.cms.mngr.service.MngrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MngrController {

    @Autowired
    private MngrService mngrService;

    @RequestMapping("/mngr/index.do")
    public String mngrIndex(HttpServletRequest request, HttpServletResponse response, Model model) {

        return "mngr/index";
    }

    @RequestMapping(value="/mngr/login.do")
    public String mngrLogin(HttpServletRequest request) {

        /*HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("loginUser");*/
        String url = "mngr/login";

        /*if(userVO != null) {
            url = "redirect:/mngr/index.do";
        }*/

        return url;
    }
}
