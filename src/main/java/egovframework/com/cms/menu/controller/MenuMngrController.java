package egovframework.com.cms.menu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/menu")
public class MenuMngrController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuMngrController.class);

	
	/**
	 * 관리자 - 메뉴 목록
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {
		
		return "mngr/menu/list";
	}
	
	/**
	 * 관리자 - 메뉴 등록 수정 폼 이동
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request, Model model) {
		
		return "mngr/menu/write";
	}
}
