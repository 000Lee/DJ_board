package egovframework.com.cms.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/board/article")
public class BoardArticleMngrController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardArticleMngrController.class);
	
	/**
	 * 관리자 - 게시글 목록
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) throws ParseException{
		
		return "/mngr/board/article/list";
	}
	
	/**
	 * 관리자 - 게시글 등록 수정 폼 이동
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request, Model model) throws ParseException {

		return "mngr/board/article/write";
	}
	
	/**
	 * 관리자 - 게시글 상세보기
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view.do")
	public String view(HttpServletRequest request, Model model) {
		

		
		return "mngr/board/article/view";
	}
}
