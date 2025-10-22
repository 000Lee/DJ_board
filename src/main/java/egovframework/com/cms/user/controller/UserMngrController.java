package egovframework.com.cms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/user")
public class UserMngrController {

	
	/**
	 * 관리자 - 사용자 목록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) throws Exception {

		return "mngr/user/list";
	}
	
	/**
	 * 관리자 - 사용자 등록 수정 폼 이동
	 * @param paramMap
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/register.do")
	public String register(@RequestParam Map<String,String> paramMap, HttpServletRequest request, Model model) throws Exception {
		
		return "mngr/user/write";
	}

}
