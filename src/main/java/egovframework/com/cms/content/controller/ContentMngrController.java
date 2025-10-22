package egovframework.com.cms.content.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/content")
public class ContentMngrController {

	/**
	 * 관리자 - 컨텐츠 목록
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {
		
		return "mngr/content/list";
	}
	
	/**
	 * 관리자 - 컨텐츠 등록 수정 폼 이동
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request, Model model) {

		return "mngr/content/write";
	}
}
