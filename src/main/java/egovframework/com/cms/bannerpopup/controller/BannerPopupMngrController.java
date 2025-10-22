package egovframework.com.cms.bannerpopup.controller;

import egovframework.com.cms.bannerpopup.service.BannerPopupMngrService;
import egovframework.com.cms.hp.board.util.ArticlePage;
import egovframework.com.cms.hp.board.util.PagingResponse;
import egovframework.com.cms.hp.board.util.PostResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mngr/bannerpopup")
public class BannerPopupMngrController {

	private static final Logger logger = LoggerFactory.getLogger(BannerPopupMngrController.class);

	@Autowired
	private BannerPopupMngrService bannerPopupMngrService;

	@Value("#{properties['File.Server.Dir']}")
	private String SERVER_DIR;

	@Value("#{properties['File.Base.Directory']}")
	private String BASE_DIR;
	
	/**
	 * 관리자 - 배너 목록
	 * @param paramMap
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/bannerList.do")
	public String bannerList(@RequestParam Map<String, String> paramMap, HttpServletRequest request, Model model) {
		return "mngr/bannerpopup/bannerList";
	}
	/**
	 * 관리자 - 팝업 목록
	 * @param model
	 * @return
	 */
	@RequestMapping("/popupList.do")
	public String popupList(@RequestParam Map<String, Object> params, ArticlePage articlePage, Model model) {
		return "mngr/bannerpopup/popupList";
	}
	/**
	 * 관리자 - 팝업 목록
	 * @param model
	 * @return
	 */
	@RequestMapping("/getPopupList.do")
	public String getPopupList(@RequestParam Map<String, Object> params, ArticlePage articlePage, Model model) {

		int recordSize = Integer.parseInt(String.valueOf(params.get("recordSize")));

		articlePage.setSearchInput((String) params.get("searchInput"));
		articlePage.setRecordSize(recordSize);

		PagingResponse<PostResponse> response = bannerPopupMngrService.getPopupList(articlePage);

		model.addAttribute("list", response);
		model.addAttribute("page", articlePage.getPage());
		model.addAttribute("pagination", articlePage.getPagination());
		return "jsonView";
	}
	/**
	 * 관리자 - 배너 팝업 등록/수정 폼 이동
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	public String register(@RequestParam Map<String, Object> params, HttpServletRequest request, Model model) {

		String gubun = params.get("gubun") == null ? "" : params.get("gubun").toString();
		String mode = params.get("mode") == null ? "write" : params.get("mode").toString();

		if(params.get("mode").equals("update")){
			Map<String, Object> map = bannerPopupMngrService.getBannerPopupOne(params);
			Map<String, Object> fileMap = bannerPopupMngrService.getBannerPopupFile(params);

			model.addAttribute("map", map);
			model.addAttribute("fileMap", fileMap);
		}
		model.addAttribute("gubun", gubun).addAttribute("mode",  mode);
		return "mngr/bannerpopup/write";
	}
	/**
	 * 관리자 - 배너 팝업 등록 및 수정
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/save")
	public String save(@RequestParam Map<String, Object> params, MultipartHttpServletRequest request, Model model) {
		MultipartFile[] file = request.getFiles("popupFile").toArray(new MultipartFile[0]);
		bannerPopupMngrService.setBannerPopupInsert(params, file, SERVER_DIR, BASE_DIR);
		model.addAttribute("rs", "sc");
		return "jsonView";
	}
	/**
	 * 관리자 - 배너 팝업 게시글 삭제
	 * @param param
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam Map<String, Object> param) {
		bannerPopupMngrService.setBannerPopupDelete(param);
		return "jsonView";
	}

}
