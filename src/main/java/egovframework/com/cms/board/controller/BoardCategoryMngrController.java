package egovframework.com.cms.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/mngr/board/category")
public class BoardCategoryMngrController {

	private static final Logger logger = LoggerFactory.getLogger(BoardCategoryMngrController.class);
	
	/**
	 * 관리자 - 게시판 카테고리 목록
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {
		
		return "mngr/board/category/list";
	}
	
	/**
	 * 관리자 - 게시판 카테고리 등록 수정 폼 이동
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request, Model model) {
		
		return "mngr/board/category/write";
	}
}
