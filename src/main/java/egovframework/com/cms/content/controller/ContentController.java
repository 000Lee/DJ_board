package egovframework.com.cms.content.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/content/mngr")
public class ContentController {
	
	/**
	 * 사용자 화면에서 컨텐츠 상세 내용을 볼수 있도록 작성
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view.do")
	public String view(HttpServletRequest request, Model model) {
		
		return "content/mngr/view";
	}
	
	/**
	 * 사용자 화면에서 컨텐츠 수정 하도록 작성
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request, Model model) {
		
		return "content/mngr/write";
	}
}
