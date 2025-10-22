package egovframework.com.cms.authority.controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/auth")
public class AuthorityMngrController {
	


	/**
	 * 관리자 - 메뉴 권한 설정 
	 * @param paramMap
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/board/managepop.do", method=RequestMethod.GET)
	public String boardManagepop(@RequestParam Map<String, String> paramMap, HttpServletRequest request, Model model) {
		
		return "mngr/auth/boardPop";
	}
	
	/**
	 * 메뉴 권한 관리 팝업
	 * @param paramMap
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/menu/managepop.do")
	public String menuManagepop(@RequestParam Map<String, String> paramMap, HttpServletRequest request, Model model) {

		return "mngr/auth/menuPop";
	}

}
