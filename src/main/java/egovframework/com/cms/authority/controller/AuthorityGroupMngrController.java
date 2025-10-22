package egovframework.com.cms.authority.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/auth/group")
public class AuthorityGroupMngrController {

	/**
	 * 관리자 - 권한 그룹 목록 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {
		
		return "mngr/auth/group/list";
	}
	
	/**
	 * 관리자 - 권한 그룹 등록 수정 화면 이동
	 * @param paramMap
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(@RequestParam Map<String,String> paramMap, HttpServletRequest request, Model model) {
		
		return "mngr/auth/group/write";
	}
}
