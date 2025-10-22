package egovframework.com.cms.category.controller;

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
@RequestMapping("/mngr/category")
public class CategoryMngrController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryMngrController.class);
	
	/**
	 * 관리자 - 카테고리 목록 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {

		return "/mngr/category/list";
	}
	
	/**
	 * 관리자 - 카테고리 등록 수정 폼 이동
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request, Model model) {

		return "/mngr/category/write";
	}
	
}
