package egovframework.com.cms.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/mngr/board")
public class BoardMngrController {
	
	/**
	 * 관리자 - 게시판 목록
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {

		return "mngr/board/list";
	}
	
	/**
	 * 관리자 - 게시판 등록 수정 폼 이동
	 * @param paramMap
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(@RequestParam Map<String, String> paramMap, HttpServletRequest request, Model model) {
		
		return "mngr/board/write";
	}
}
