package egovframework.com.cms.code.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/code/group")
public class CodeGroupMngrController {

	
	/**
	 * 코드 그룹 목록 조회
	 * @param model
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(Model model) {
		
		return "mngr/code/group/list";
	}
	
	/**
	 * 코드그룹 등록, 수정 폼
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request, Model model) {
		
		return "mngr/code/group/write";
	}

}
