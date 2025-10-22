//package egovframework.com.cms.board.controller;
//
//import egovframework.com.cms.authority.model.AuthorityVO;
//import egovframework.com.cms.authority.service.AuthorityService;
//import egovframework.com.cms.board.model.BoardArticleFileVO;
//import egovframework.com.cms.board.model.BoardArticleVO;
//import egovframework.com.cms.board.model.BoardCategoryVO;
//import egovframework.com.cms.board.model.BoardVO;
//import egovframework.com.cms.common.model.BoardSearchVO;
//import egovframework.com.cms.common.utils.FileUtil;
//import egovframework.com.cms.common.utils.Pagenation;
//import egovframework.com.cms.common.utils.RequestInformation;
//import egovframework.com.cms.common.utils.ReturnErrorView;
//import egovframework.com.cms.common.valid.BoardArticleValidator;
//import egovframework.com.cms.other.service.AdminMemberManagementService;
//import egovframework.com.cms.user.model.UserVO;
//import egovframework.com.devjitsu.hp.board.service.BoardService;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mobile.device.Device;
//import org.springframework.mobile.device.DeviceUtils;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.validation.FieldError;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.servlet.http.HttpServletRequest;
//import java.text.ParseException;
//import java.util.*;
//
//@Controller
//@RequestMapping("/board")
//public class BoardController {
//
//	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
//
//	/**
//	 * 게시글 목록 조회
//	 * @param boardVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping(value="/list.do")
//	public String list(BoardVO boardVO, BoardSearchVO boardSearchVO, HttpServletRequest request
//			, Model model) throws ParseException {
//
//		Device device = DeviceUtils.getCurrentDevice(request);
//
//		// 접근 권한 체크
//		String errorView = accessValidate(boardVO, request, model, 1);
//		if(errorView != null) {
//			return errorView;
//		}
//
//		// 게시판 조회
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		// 기본 리턴값 설정
//		addModel(boardVO, boardSearchVO, model);
//		model.addAttribute("menuUUID",request.getParameter("menuUUID"));
//
//		// 게시글 목록 조회
//		List<BoardArticleVO> list = boardArticleService.findBoardArticleMultiColumnSearchList(
//				boardVO.getBoardUUID()
//				, null
//				, boardSearchVO.getCategoryUUID()
//				, boardSearchVO.getSearchMultipleColumn()
//				, boardSearchVO.getSearchColumn()
//				, boardSearchVO.getSearchContent()
//				, boardSearchVO.getStartDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getEndDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getBeginDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getFinishDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSpecificDateToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSearchType()
//				, boardSearchVO.getSecretYn()
//				, 1
//				, boardSearchVO.getPage()
//				, boardVO.getBoardArticleRow()
//				, boardSearchVO.getSorts());
//
//		// 게시글 수 조회
//		Long totalCount = boardArticleService.findBoardArticleMultiColumnSearchCount(
//				boardVO.getBoardUUID()
//				, null
//				, boardSearchVO.getCategoryUUID()
//				, boardSearchVO.getSearchMultipleColumn()
//				, boardSearchVO.getSearchColumn()
//				, boardSearchVO.getSearchContent()
//				, boardSearchVO.getStartDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getEndDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getBeginDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getFinishDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSpecificDateToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSearchType()
//				, boardSearchVO.getSecretYn()
//				, 1);
//
//		// 상단글
//		List<BoardArticleVO> topList = boardArticleService.findByBoardArticleStateList(boardVO.getBoardUUID(), 3, true);
//
//		// 페이징
//		Pagenation pagenation = new Pagenation(Integer.parseInt(totalCount.toString()), boardSearchVO.getPage(), boardVO.getBoardArticleRow(), boardVO.getBoardPageBlock());
//
//		// 카테고리
//		List<BoardCategoryVO> categoryList = boardCategoryService.findDepthCategoryList(boardVO.getBoardUUID(), 1, 1, 2);
//
//		// 게시판 목록 페이지 설정
//		String boardListPage = "/board/"+boardVO.getStrBoardTypeEng()+"/list";
//		if(device.isMobile()) {
//			boardListPage = "/board/"+boardVO.getStrBoardTypeEng()+"/m_list";
//		}else {
//			boardListPage = "/board/"+boardVO.getStrBoardTypeEng()+"/list";
//		}
//		if(boardVO.getBoardListPage() != null && !"".equals(boardVO.getBoardListPage())) {
//			if(device.isMobile()) {
//				if(boardVO.getBoardListPage().indexOf("/") > -1) {
//					String[] boardListPage2 = boardVO.getBoardListPage().split("/");
//					boardListPage = "/board/"+boardListPage2[0]+"/m_"+boardListPage2[1];
//				}else {
//					boardListPage = "/board/m_"+ boardVO.getBoardListPage();
//				}
//			} else {
//				boardListPage = "/board/"+ boardVO.getBoardListPage();
//			}
//		}
//		System.out.println("리스트페이지"+boardListPage);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		model.addAttribute("list", list)
//			.addAttribute("totalCount", totalCount)
//			.addAttribute("pagenation", pagenation)
//			.addAttribute("categoryList", categoryList)
//			.addAttribute("topList", topList);
//
//		System.out.println("viewName = " + boardListPage);
//
//		return boardListPage;
//	}
//
//	/**
//	 * 게시글 등록, 수정 폼 이동
//	 * @param boardVO
//	 * @param boardArticleVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/register.do")
//	public String register(BoardVO boardVO, BoardArticleVO boardArticleVO, BoardSearchVO boardSearchVO
//			, HttpServletRequest request, Model model) {
//
//		// 접근 권한 체크
//		String errorView = accessValidate(boardVO, request, model, 2);
//		if(errorView != null) {
//			return errorView;
//		}
//
//		// 게시판 조회
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		RequestInformation requestInfo = new RequestInformation(request);
//
//		// 기본 리턴값 설정
//		addModel(boardVO, boardSearchVO, model);
//		model.addAttribute("menuUUID",request.getParameter("menuUUID"));
//
//		errorView = checkMode(boardSearchVO.getMode(), requestInfo, model);
//		if(errorView != null) return errorView;
//
//
//		if("update".equals(boardSearchVO.getMode())) {
//
//			errorView = checkArticleUUID(boardArticleVO.getBoardArticleUUID(),requestInfo, model);
//			if(errorView != null) return errorView;
//
//			// 게시글 정보 조회
//			boardArticleVO = boardArticleService.findByBoardArticleUUID(boardArticleVO.getBoardArticleUUID());
//
//			if(boardArticleVO == null) {
//				return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "게시글 정보가 없습니다."}, requestInfo, model);
//			}
//
//			model.addAttribute("boardArticleVO", boardArticleVO);
//
//		} else if("reply".equals(boardSearchVO.getMode())) {
//
//			String parentBoardArticleUUID = request.getParameter("parentBoardArticleUUID");
//
//			errorView = checkParentUUID(parentBoardArticleUUID, requestInfo, model);
//			if(errorView != null) return errorView;
//
//			model.addAttribute("parentBoardArticleUUID", parentBoardArticleUUID);
//
//		}
//
//		// 카테고리
//		List<BoardCategoryVO> categoryList = boardCategoryService.findDepthCategoryList(boardVO.getBoardUUID(), 1, 1, 2);;
//		model.addAttribute("categoryList", categoryList);
//
//		// 게시판 등록 페이지 설정
//		String boardWritePage = "/board/"+boardVO.getStrBoardTypeEng()+"/write";
//		if(boardVO.getBoardWritePage() != null && !"".equals(boardVO.getBoardWritePage())) {
//			boardWritePage = "/board/"+ boardVO.getBoardWritePage();
//		}
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		if(!requestInfo.getIsAdmin()) {
//			Map<String, Object> categoryMap = new HashMap<String, Object>();
//			categoryMap.put("userUID", requestInfo.getLoginUser().getUserUUID());
//
//			model.addAttribute("loginAgency", adminMemberManagementService.selectEditAgencyUser(categoryMap));
//		}
//
//		return boardWritePage;
//	}
//
//	/**
//	 * 게시글 등록
//	 * @param boardArticleVO
//	 * @param result
//	 * @param boardVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/save.do", method=RequestMethod.POST)
//	public String save(BoardArticleVO boardArticleVO, BindingResult result, BoardVO boardVO
//			, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model) {
//
//		// 접근 권한 체크
//		String errorView = accessValidate(boardVO, request, model, 2);
//		if(errorView != null) {
//			return errorView;
//		}
//
//		// 게시판 조회
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		RequestInformation requestInfo = new RequestInformation(request);
//
//		// 기본 리턴값 설정
//		addModel(boardVO, boardSearchVO, model);
//		model.addAttribute("menuUUID",request.getParameter("menuUUID"));
//
//		// 필수항목 체크
//		this.validator.validate(boardArticleVO, result);
//		if(result.hasErrors()) {
//
//        	Map<String,String> errMap = new HashMap<String,String>();
//        	for(FieldError err : result.getFieldErrors()) {
//        		errMap.put(err.getField(), err.getCode());
//        	}
//
//        	model.addAttribute("errMap", errMap)
//        		.addAttribute("returnUrl", "/board/register.do")
//        		.addAttribute("boardArticleVO", boardArticleVO)
//        		.addAttribute("mode", "write");
//
//        	return "/common/validatorError";
//        }
//
//		UserVO userVO = requestInfo.getLoginUser();
//
//		Integer boardArticleMaxGroup = boardArticleService.findByBoardArticleMaxGroup(boardArticleVO.getBoardUUID());
//
//		boardArticleVO.setBoardArticleGroup(boardArticleMaxGroup+1);
//		boardArticleVO.setBoardArticleSeq(1);
//		boardArticleVO.setBoardArticleLevel(0);
//		boardArticleVO.setRegistDt(new Date());
//		boardArticleVO.setRegistId(userVO.getUserId());
//		// 직접입력한 작성자명으로 들어갈수 있도록 해줌
//		if(boardArticleVO.getRegistName() == null || "".equals(boardArticleVO.getRegistName())) {
//			boardArticleVO.setRegistName(userVO.getUserName());
//		}
//
//		// 게시글 등록
//		boardArticleVO = boardArticleService.saveBoardArticle(boardArticleVO);
//
//		// 파일업로드
//		fileUpload(boardVO, boardArticleVO, userVO, request);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		//return "redirect:/board/list.do";
//
//		model.addAttribute("returnUrl", "/board/list.do");
//
//		return "/common/redirectView";
//	}
//
//	/**
//	 * 게시글 수정
//	 * @param boardArticleVO
//	 * @param result
//	 * @param boardVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/update.do", method=RequestMethod.POST)
//	public String update(BoardArticleVO boardArticleVO, BindingResult result, BoardVO boardVO
//			, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model) {
//
//		// 접근 권한 체크
//		String errorView = accessValidate(boardVO, request, model, 3);
//		if(errorView != null) {
//			return errorView;
//		}
//
//		// 게시판 조회
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		RequestInformation requestInfo = new RequestInformation(request);
//
//		// 기본 리턴값 설정
//		addModel(boardVO, boardSearchVO, model);
//		model.addAttribute("menuUUID",request.getParameter("menuUUID"));
//		model.addAttribute("boardArticleUUID",boardArticleVO.getBoardArticleUUID());
//
//		// 필수항목 체크
//		this.validator.validate(boardArticleVO, result);
//		if(result.hasErrors()) {
//
//        	Map<String,String> errMap = new HashMap<String,String>();
//        	for(FieldError err : result.getFieldErrors()) {
//        		errMap.put(err.getField(), err.getCode());
//        	}
//
//        	model.addAttribute("errMap", errMap)
//        		.addAttribute("returnUrl", "/board/register.do")
//        		.addAttribute("boardArticleVO", boardArticleVO)
//        		.addAttribute("mode", "write");
//
//        	return "/common/validatorError";
//        }
//
//		errorView = checkArticleUUID(boardArticleVO.getBoardArticleUUID(),requestInfo, model);
//		if(errorView != null) return errorView;
//
//		UserVO userVO = requestInfo.getLoginUser();
//
//		boardArticleVO.setModifyDt(new Date());
//		boardArticleVO.setModifyId(userVO.getUserId());
//
//		// 게시글 수정
//		boardArticleVO = boardArticleService.saveBoardArticle(boardArticleVO);
//
//		// 파일업로드
//		fileUpload(boardVO, boardArticleVO, userVO, request);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		// return "redirect:/board/view.do";
//
//		model.addAttribute("returnUrl", "/board/view.do");
//
//		return "/common/redirectView";
//	}
//
//	/**
//	 * 게시글 답글 등록
//	 * @param boardArticleVO
//	 * @param result
//	 * @param boardVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/reply.do", method=RequestMethod.POST)
//	public String reply(BoardArticleVO boardArticleVO, BindingResult result, BoardVO boardVO,
//			BoardSearchVO boardSearchVO, HttpServletRequest request, Model model) {
//
//		// 접근 권한 체크
//		String errorView = accessValidate(boardVO, request, model, 2);
//		if(errorView != null) {
//			return errorView;
//		}
//
//		// 게시판 조회
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		RequestInformation requestInfo = new RequestInformation(request);
//
//		// 기본 리턴값 설정
//		addModel(boardVO, boardSearchVO, model);
//		model.addAttribute("menuUUID",request.getParameter("menuUUID"));
//
//		// 필수항목 체크
//		this.validator.validate(boardArticleVO, result);
//		if(result.hasErrors()) {
//
//        	Map<String,String> errMap = new HashMap<String,String>();
//        	for(FieldError err : result.getFieldErrors()) {
//        		errMap.put(err.getField(), err.getCode());
//        	}
//
//        	model.addAttribute("errMap", errMap)
//        		.addAttribute("returnUrl", "/board/register.do")
//        		.addAttribute("boardArticleVO", boardArticleVO)
//        		.addAttribute("mode", "write");
//
//        	return "/common/validatorError";
//        }
//
//		// 원글 키를 가졌는지 확인
//		String parentBoardArticleUUID = request.getParameter("parentBoardArticleUUID");
//		errorView = checkParentUUID(parentBoardArticleUUID, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		UserVO userVO = requestInfo.getLoginUser();
//
//		boardArticleVO.setRegistDt(new Date());
//		boardArticleVO.setRegistId(userVO.getUserId());
//
//		// 답글 저장
//		boardArticleVO = boardArticleService.saveReplyBoardArticle(parentBoardArticleUUID, boardArticleVO);
//
//		// 파일업로드
//		fileUpload(boardVO, boardArticleVO, userVO, request);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		// return "redirect:/board/list.do";
//
//		model.addAttribute("returnUrl", "/board/list.do");
//
//		return "/common/redirectView";
//	}
//
//	/**
//	 * 게시글 삭제
//	 * @param boardVO
//	 * @param boardArticleVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/delete.do")
//	public String delete(BoardVO boardVO, BoardArticleVO boardArticleVO, BoardSearchVO boardSearchVO
//			, HttpServletRequest request, Model model) {
//
//		// 접근 권한 체크
//		String errorView = accessValidate(boardVO, request, model, 5);
//		if(errorView != null) {
//			return errorView;
//		}
//
//		// 게시판 조회
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		RequestInformation requestInfo = new RequestInformation(request);
//
//		// 기본 리턴값 설정
//		addModel(boardVO, boardSearchVO, model);
//		model.addAttribute("menuUUID",request.getParameter("menuUUID"));
//
//		errorView = checkArticleUUID(boardArticleVO.getBoardArticleUUID(),requestInfo, model);
//		if(errorView != null) return errorView;
//
//		// 게시글 정보 조회
//		boardArticleVO = boardArticleService.findByBoardArticleUUID(boardArticleVO.getBoardArticleUUID());
//		if(boardArticleVO != null) {
//			List<BoardArticleFileVO> fileList = boardArticleVO.getFileList();
//
//			// 삭제할 파일 이름 저장
//			if(fileList != null && fileList.size() > 0){
//				String[] fileNames = new String[fileList.size()];
//				for(int i = 0; i < fileList.size(); i++){
//					fileNames[i] = fileList.get(i).getBoardArticleFileMask();
//				}
//
//				// 파일 삭제
//				FileUtil fileUtil = new FileUtil();
//				fileUtil.deleteFile(fileNames, 1);
//
//				// 파일테이블 데이터 삭제
//				boardArticleFileService.deleteBoardArticleByBoardArticleUUID(boardArticleVO.getBoardArticleUUID());
//			}
//
//			// 게시글 삭제
//			boardArticleService.deleteBoardArticle(boardArticleVO.getBoardArticleUUID());
//		}
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		// return "redirect:/board/list.do";
//
//		model.addAttribute("returnUrl", "/board/list.do");
//
//		return "/common/redirectView";
//	}
//
//	/**
//	 * 게시글 상세보기
//	 * @param boardVO
//	 * @param boardArticleVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/view.do")
//	public String view(BoardVO boardVO, BoardArticleVO boardArticleVO, BoardSearchVO boardSearchVO
//			, HttpServletRequest request, Model model) throws Exception {
//
//		Device device = DeviceUtils.getCurrentDevice(request);
//
//		// 접근 권한 체크
//		String errorView = accessValidate(boardVO, request, model, 4);
//		if(errorView != null) {
//			return errorView;
//		}
//
//		// 게시판 조회
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		RequestInformation requestInfo = new RequestInformation(request);
//
//		// 기본 리턴값 설정
//		addModel(boardVO, boardSearchVO, model);
//		model.addAttribute("menuUUID",request.getParameter("menuUUID"));
//
//		errorView = checkArticleUUID(boardArticleVO.getBoardArticleUUID(), requestInfo, model);
//		if(errorView != null) return errorView;
//
//		// 조회수 증가
//		boardArticleService.updateViewCount(boardArticleVO.getBoardArticleUUID());
//
//		// 게시글 조회
//		boardArticleVO = boardArticleService.findByBoardArticleUUID(boardArticleVO.getBoardArticleUUID());
//		if(boardArticleVO == null) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "게시글의 정보가 없습니다."}, requestInfo, model);
//		}
//
//		// 게시글 차단여부 확인
//		if(boardArticleVO.getBoardArticleState() == 2) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "해당글은 차단되었습니다."}, requestInfo, model);
//		}
//
//		// 공개여부를 사용하는 게시판인경우
//		if(boardVO.getBoardUseSecret() == 1) {
//
//			// 비공개 게시글인경우
//			if(boardArticleVO.getBoardArticleSecretYn() == 2) {
//				if(requestInfo.getLoginUser() == null) {
//					return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "해당 게시글은 비공개 글입니다. 로그인을 해주세요."}, requestInfo, model);
//				}
//
//				// 총관리자여부
//				boolean isAdmin = requestInfo.getSessionAttribute("isAdmin") == null ? false : Boolean.valueOf(requestInfo.getSessionAttribute("isAdmin").toString());
//
//				// 답글인경우
//				if(boardArticleVO.getBoardArticleSeq() > 1) {
//
//					// 부모글 검색
//					BoardArticleVO parentArticle = boardArticleService.findParentArticle(boardVO.getBoardUUID(), boardArticleVO.getBoardArticleGroup());
//
//					if(parentArticle == null) {
//						return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "원글 정보가 존재하지 않습니다."}, requestInfo, model);
//					}
//
//					// 총관리자가 아니고
//					// 부모글을 작성한 사람이 아니고
//					// 자기가 쓴글인 경우가 아니면 오류
//					if(!isAdmin &&
//						!parentArticle.getRegistId().equals(requestInfo.getLoginUser().getUserId()) &&
//						!boardArticleVO.getRegistId().equals(requestInfo.getLoginUser().getUserId())) {
//						logger.debug("secret article access denied - 1");
//						return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "해당 게시글에 접근하실수 없습니다."}, requestInfo, model);
//					}
//
//				} else {
//					// 총관리자가 아니고 본인이 작성한 글이 아닌경우 접근 불가
//					if(!isAdmin && !boardArticleVO.getRegistId().equals(requestInfo.getLoginUser().getUserId())) {
//						logger.debug("secret article access denied - 2");
//						return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "해당 게시글에 접근하실수 없습니다."}, requestInfo, model);
//					}
//				}
//			}
//		}
//
//		// 이전글
//		BoardArticleVO preArticleVO = boardArticleService.findPrevArticle(boardVO.getBoardUUID(), boardArticleVO.getBoardArticleUUID(), 1);
//
//		// 다음글
//		BoardArticleVO nextArticleVO = boardArticleService.findNextArticle(boardVO.getBoardUUID(), boardArticleVO.getBoardArticleUUID(), 1);
//
//		// 카테고리 명 조회
//		setCategoryName(boardArticleVO);
//		setCategoryName(preArticleVO);
//		setCategoryName(nextArticleVO);
//
//		// 게시판 보기 페이지 설정
//		String boardViewPage = "/board/"+boardVO.getStrBoardTypeEng()+"/view";
//		if(device.isMobile()) {
//			boardViewPage = "/board/"+boardVO.getStrBoardTypeEng()+"/m_view";
//		}else {
//			boardViewPage = "/board/"+boardVO.getStrBoardTypeEng()+"/view";
//		}
//
//		if(boardVO.getBoardViewPage() != null && !"".equals(boardVO.getBoardViewPage())) {
//			if(device.isMobile()) {
//				boardViewPage = "/board/m_" + boardVO.getBoardViewPage();
//			} else {
//				boardViewPage = "/board/" + boardVO.getBoardViewPage();
//			}
//
//		}
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		model.addAttribute("boardArticleVO",boardArticleVO)
//			.addAttribute("preArticleVO",preArticleVO)
//			.addAttribute("nextArticleVO",nextArticleVO);
//
//		return boardViewPage;
//	}
//
//	/**
//	 * 게시판ID 중복 조회
//	 * @param request
//	 * @return
//	 */
//	@RequestMapping("/api/chk/boardId.do")
//	@ResponseBody
//	public  Map<String,String> checkBoardId(HttpServletRequest request) {
//		String boardId = request.getParameter("boardId");
//
//		Map<String,String> map = new HashMap<String, String>();
//
//		if(boardId == null || "".equals(boardId)) {
//			map.put("code", "500");
//			map.put("message", "게시판ID는 필수 조회 정보가 입니다.");
//		}
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//
//		if(boardVO == null) {
//			map.put("code", "200");
//			map.put("message", "사용가능한 ID입니다.");
//		} else {
//			map.put("code", "500");
//			map.put("message", "사용중인 ID입니다.");
//		}
//
//		return map;
//	}
//
//	// 게시글 키 체크
//	private String checkArticleUUID(String articleUUID, RequestInformation requestInfo, Model model) {
//		if(articleUUID == null || "".equals(articleUUID)) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "게시글 정보(키)가 부정확합니다."}, requestInfo, model);
//		}
//
//		BoardArticleVO articleVO = boardArticleService.findByBoardArticleUUID(articleUUID);
//		if(articleVO == null) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardArticleUUID", "조회된 게시글 정보가 없습니다."}, requestInfo, model);
//		}
//
//		return null;
//	}
//
//	// 부모글 키 체크
//	private String checkParentUUID(String parentUUID, RequestInformation requestInfo, Model model) {
//		if(parentUUID == null || "".equals(parentUUID)) {
//			return ReturnErrorView.returnErrorView(new String[]{"parentUUID", "부모글 정보가 부정확합니다."}, requestInfo, model);
//		}
//
//		return null;
//	}
//
//	// mode 체크
//	private String checkMode(String mode, RequestInformation requestInfo, Model model) {
//		if(mode == null || "".equals(mode)) {
//			return ReturnErrorView.returnErrorView(new String[]{"mode", "유형 정보가 부정확합니다."}, requestInfo, model);
//		}
//
//		return null;
//	}
//
//	// 메뉴 키 체크
//	private boolean checkMenuUUID(String menuUUID) {
//
//		if(menuUUID == null || "".equals(menuUUID)) {
//			return false;
//		}
//
//		return true;
//	}
//
//	// 게시판 키 체크
//	private boolean checkBoardVO(BoardVO boardVO) {
//
//		if(boardVO == null || (boardVO.getBoardUUID() == null || "".equals(boardVO.getBoardUUID())) ) {
//			return false;
//		}
//
//		return true;
//	}
//
//	// 게시판 조회
//	private boolean checkExists(BoardVO boardVO) {
//
//		if(boardVO == null) {
//			return false;
//		}
//
//		return true;
//	}
//
//	// 게시판 사용여부 체크
//	private boolean checkUse(BoardVO boardVO) {
//
//		if(boardVO.getBoardUseYn() == 0) {
//			return false;
//		}
//
//		return true;
//	}
//
//	// 게시판 사용 권한 체크
//	private boolean checkAuth(RequestInformation requestInfo, BoardVO boardVO, int type) {
//		// 로그인 사용자 정보
//		UserVO loginUser = requestInfo.getLoginUser();
//
//		// 게시판 사용 권한 목록 조회
//		List<AuthorityVO> authList = authorityService.findAuthList("boardUUID", boardVO.getBoardUUID());
//
//		// 게시판 사용 권한 체크
//		if(authList != null && authList.size() > 0) {
//
//			// 리스트, 보기의 경우 게시판 로그인사용여부에 따라 접근 결정
//			// type = 2 에서 4로 수정
//			if(type == 1 || type == 4) {
//				if(boardVO.getBoardLoginYn() == 0 && loginUser == null) {
//					return true;
//				}
//			}
//
//			if(loginUser == null) {
//				return false;
//			}
//
//			// 총관리자의 경우 권한체크 패스
//			if(requestInfo.getIsAdmin()) {
//				return true;
//			}
//
//			@SuppressWarnings("unchecked")
//			Map<String, Map<String,Boolean>> authBoardMap = (Map<String, Map<String,Boolean>>) requestInfo.getSessionAttribute("accessBoard");
//
//			boolean isAccessibility = false;
//
//			if(authBoardMap != null && authBoardMap.size() > 0) {
//
//				BoardAccessCheck authCheck = new BoardAccessCheck(authList, authBoardMap);
//
//				// 1 : 리스트 , 2 : 저장 , 3 : 수정 , 4 : 보기 , 5 : 삭제
//				switch(type) {
//					case 1 : isAccessibility = authCheck.isListYn(boardVO.getBoardUUID()); break;
//					case 2 : isAccessibility = authCheck.isSaveYn(boardVO.getBoardUUID()); break;
//					case 3 : isAccessibility = authCheck.isUpdateYn(boardVO.getBoardUUID()); break;
//					case 4 : isAccessibility = authCheck.isViewYn(boardVO.getBoardUUID()); break;
//					case 5 : isAccessibility = authCheck.isDeleteYn(boardVO.getBoardUUID()); break;
//				}
//			}
//
//			if(!isAccessibility) {
//				return false;
//			}
//		}
//
//		return true;
//	}
//
//	// 게시판 접근 권한 체크
//	private String accessValidate(BoardVO boardVO, HttpServletRequest request, Model model, int type) {
//		String menuUUID = request.getParameter("menuUUID");
//		RequestInformation requestInfo = new RequestInformation(request);
//
//		if( !checkMenuUUID(menuUUID) ) {
//			return ReturnErrorView.returnErrorView(new String[]{"menuUUID", "메뉴 정보가 없습니다."}, requestInfo, model);
//		}
//
//		if( !checkBoardVO(boardVO) ) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardUUID", "게시판 정보가 없습니다."}, requestInfo, model);
//		}
//
//		boardVO = boardService.findByBoardUUID(boardVO.getBoardUUID());
//
//		if( !checkExists(boardVO) ) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardUUID", "등록된 게시판이 아닙니다."}, requestInfo, model);
//		}
//
//		if( !checkUse(boardVO) ) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardUUID", "사용불가한 게시판 입니다."}, requestInfo, model);
//		}
//
//		if ( !checkAuth(requestInfo, boardVO, type) ) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardUUID", "게시판 사용권한이 없습니다."}, requestInfo, model);
//		}
//
//		return null;
//	}
//
//	// 리턴될 기본 값 설정
//	private void addModel(BoardVO boardVO, BoardSearchVO boardSearchVO, Model model) {
//
//		model.addAttribute("boardVO", boardVO)
//			.addAttribute("boardUUID", boardVO.getBoardUUID())
//			.addAttribute("mode", boardSearchVO.getMode())
//			.addAttribute("page", boardSearchVO.getPage())
//			.addAttribute("rowCount", boardVO.getBoardArticleRow())
//			.addAttribute("searchMultipleColumn", boardSearchVO.getSearchMultipleColumn())
//			.addAttribute("searchType", boardSearchVO.getSearchType())
//			.addAttribute("searchColumn", boardSearchVO.getSearchColumn())
//			.addAttribute("searchContent", boardSearchVO.getSearchContent())
//			.addAttribute("startDt", boardSearchVO.getStartDt())
//			.addAttribute("endDt", boardSearchVO.getEndDt())
//			.addAttribute("beginDt", boardSearchVO.getBeginDt())
//			.addAttribute("finishDt", boardSearchVO.getFinishDt())
//			.addAttribute("secretYn", boardSearchVO.getSecretYn())
//			.addAttribute("articleState", boardSearchVO.getArticleState())
//			.addAttribute("sorts", boardSearchVO.getSorts())
//			.addAttribute("categoryGroup", boardSearchVO.getCategoryGroup())
//			.addAttribute("categoryUUID", boardSearchVO.getCategoryUUID());
//	}
//
//	// 파일업로드
//	private void fileUpload(BoardVO boardVO, BoardArticleVO articleVO, UserVO userVO, HttpServletRequest request) {
//		if( boardVO.getBoardFileUploadYn() == 1 ) {
//
//			FileUtil fileUtil = new FileUtil();
//			List<Map<String, Object>> fileList = fileUtil.storedFileInfo(request, "files", 1, boardVO.getBoardFileAllowTypeArray());
//			logger.info("===========fileUpload============" + fileList.size());
//			for(Map<String, Object> map : fileList) {
//
//				BoardArticleFileVO boardArticleFileVO = new BoardArticleFileVO();
//				boardArticleFileVO.setBoardArticleUUID(articleVO.getBoardArticleUUID());
//				boardArticleFileVO.setBoardArticleFileName(map.get("originFileName").toString());
//				boardArticleFileVO.setBoardArticleFileMask(map.get("storedFileName").toString());
//				boardArticleFileVO.setBoardArticleFileExtention(map.get("originFileExt").toString());
//				boardArticleFileVO.setBoardArticleFileSize(Long.valueOf(map.get("fileSize").toString()));
//				boardArticleFileVO.setRegistDt(new Date());
//				boardArticleFileVO.setRegistId(userVO.getUserId());
//
//				boardArticleFileService.saveBoardArticleFileVO(boardArticleFileVO);
//			}
//		}
//	}
//
//	// 카테고리 명 조회
//	private void setCategoryName(BoardArticleVO boardArticleVO) {
//
//		if(boardArticleVO != null) {
//			if(boardArticleVO.getBoardCategoryUUID() != null && !"".equals(boardArticleVO.getBoardCategoryUUID())) {
//				BoardCategoryVO categoryVO = boardCategoryService.findByBoardCategoryUUID(boardArticleVO.getBoardCategoryUUID());
//				if(categoryVO != null) {
//					boardArticleVO.setTempStrField1(categoryVO.getBoardCategoryName());
//				}
//			}
//		}
//
//	}
//
//	/**
//	 * 사용자화면에서 관리자가 게시글 목록 정보를 관리하기위해 작성
//	 * @param boardId
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping("/mngr/{boardId}/list.do")
//	public String mngrList(@PathVariable("boardId") String boardId, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model ) throws ParseException {
//
//		RequestInformation requestInfo = new RequestInformation(request);
//		String menuUUID = request.getParameter("menuUUID");
//		String errorView = checkId(menuUUID, boardId, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		model.addAttribute("menuUUID", menuUUID);
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		addModel(boardVO, boardSearchVO, model);
//
//		// 게시글 목록 조회
//		List<BoardArticleVO> list = boardArticleService.findBoardArticleMultiColumnSearchList(
//				boardVO.getBoardUUID()
//				, null
//				, boardSearchVO.getCategoryUUID()
//				, boardSearchVO.getSearchMultipleColumn()
//				, boardSearchVO.getSearchColumn()
//				, boardSearchVO.getSearchContent()
//				, boardSearchVO.getStartDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getEndDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getBeginDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getFinishDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSpecificDateToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSearchType()
//				, boardSearchVO.getSecretYn()
//				, 0
//				, boardSearchVO.getPage()
//				, boardVO.getBoardArticleRow()
//				, boardSearchVO.getSorts());
//
//		// 게시글 수 조회
//		Long totalCount = boardArticleService.findBoardArticleMultiColumnSearchCount(
//				boardVO.getBoardUUID()
//				, null
//				, boardSearchVO.getCategoryUUID()
//				, boardSearchVO.getSearchMultipleColumn()
//				, boardSearchVO.getSearchColumn()
//				, boardSearchVO.getSearchContent()
//				, boardSearchVO.getStartDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getEndDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getBeginDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getFinishDtToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSpecificDateToDateTime("yyyy-MM-dd")
//				, boardSearchVO.getSearchType()
//				, boardSearchVO.getSecretYn()
//				, 0);
//
//		Pagenation pagenation = new Pagenation(Integer.parseInt(totalCount.toString()), boardSearchVO.getPage(), boardVO.getBoardArticleRow(), boardVO.getBoardPageBlock());
//
//		// 카테고리
//		List<BoardCategoryVO> categoryList = boardCategoryService.findDepthCategoryList(boardVO.getBoardUUID(), 1, 1, 2);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		model.addAttribute("list", list)
//			.addAttribute("totalCount", totalCount)
//			.addAttribute("pagenation", pagenation)
//			.addAttribute("categoryList", categoryList);
//
//		return "/board/mngr/list";
//	}
//
//	/**
//	 * 사용자화면에서 관리자가 게시글 정보를 보기 위해 작성
//	 * @param boardId
//	 * @param articleVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping("/mngr/{boardId}/view.do")
//	public String mngrView(@PathVariable("boardId") String boardId, BoardArticleVO articleVO, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model ) throws ParseException {
//
//		RequestInformation requestInfo = new RequestInformation(request);
//		String menuUUID = request.getParameter("menuUUID");
//		String errorView = checkId(menuUUID, boardId, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		model.addAttribute("menuUUID", menuUUID);
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		addModel(boardVO, boardSearchVO, model);
//
//		// 게시글 조회
//		articleVO = boardArticleService.findByBoardArticleUUID(articleVO.getBoardArticleUUID());
//
//		// 이전글
//		BoardArticleVO preArticleVO = boardArticleService.findPrevArticle(boardVO.getBoardUUID(), articleVO.getBoardArticleUUID(), 0);
//
//		// 다음글
//		BoardArticleVO nextArticleVO = boardArticleService.findNextArticle(boardVO.getBoardUUID(), articleVO.getBoardArticleUUID(), 0);
//
//		// 카테고리 명 조회
//		setCategoryName(articleVO);
//		setCategoryName(preArticleVO);
//		setCategoryName(nextArticleVO);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		model.addAttribute("boardArticleVO",articleVO)
//			.addAttribute("preArticleVO",preArticleVO)
//			.addAttribute("nextArticleVO",nextArticleVO);
//
//		return "/board/mngr/view";
//	}
//
//	/**
//	 * 사용자화면에서 관리자가 게시글 정보를 등록 또는 수정하기 위해 작성
//	 * @param boardId
//	 * @param articleVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping("/mngr/{boardId}/register.do")
//	public String mngrRegister(@PathVariable("boardId") String boardId, BoardArticleVO articleVO, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model ) throws ParseException {
//
//		RequestInformation requestInfo = new RequestInformation(request);
//		String menuUUID = request.getParameter("menuUUID");
//		String errorView = checkId(menuUUID, boardId, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		model.addAttribute("menuUUID", menuUUID);
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		addModel(boardVO, boardSearchVO, model);
//
//		String mode = boardSearchVO.getMode();
//		errorView = checkMode(boardSearchVO.getMode(), requestInfo, model);
//		if(errorView != null) return errorView;
//
//		if("update".equals(mode)) {
//
//			errorView = checkArticleUUID(articleVO.getBoardArticleUUID(),requestInfo, model);
//			if(errorView != null) return errorView;
//
//			articleVO = boardArticleService.findByBoardArticleUUID(articleVO.getBoardArticleUUID());
//
//			model.addAttribute("boardArticleVO", articleVO);
//
//		}  else if("reply".equals(mode)) {
//
//			String parentBoardArticleUUID = request.getParameter("parentBoardArticleUUID");
//			errorView = checkParentUUID(parentBoardArticleUUID, requestInfo, model);
//			if(errorView != null) return errorView;
//
//			model.addAttribute("parentBoardArticleUUID", parentBoardArticleUUID);
//		}
//
//		// 카테고리
//		List<BoardCategoryVO> categoryList = boardCategoryService.findDepthCategoryList(boardVO.getBoardUUID(), 1, 1, 2);;
//		model.addAttribute("categoryList", categoryList);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		return "/board/mngr/write";
//	}
//
//	/**
//	 * 사용자화면에서 관리자가 게시글 정보를 등록 하기 위해 작성
//	 * @param boardId
//	 * @param articleVO
//	 * @param result
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping("/mngr/{boardId}/save.do")
//	public String mngrSave(@PathVariable("boardId") String boardId, BoardArticleVO articleVO, BindingResult result, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model ) throws ParseException {
//
//		RequestInformation requestInfo = new RequestInformation(request);
//		String menuUUID = request.getParameter("menuUUID");
//		String errorView = checkId(menuUUID, boardId, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		model.addAttribute("menuUUID", menuUUID);
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		addModel(boardVO, boardSearchVO, model);
//
//		// 필수항목 체크
//		this.validator.validate(articleVO, result);
//		if(result.hasErrors()) {
//
//        	Map<String,String> errMap = new HashMap<String,String>();
//        	for(FieldError err : result.getFieldErrors()) {
//        		errMap.put(err.getField(), err.getCode());
//        	}
//
//        	model.addAttribute("errMap", errMap)
//        		.addAttribute("returnUrl", "/board/mgnr/"+boardId+"/register.do")
//        		.addAttribute("boardArticleVO", articleVO)
//        		.addAttribute("mode", "write");
//
//        	return "/common/validatorError";
//        }
//
//		UserVO userVO = requestInfo.getLoginUser();
//
//		Integer boardArticleMaxGroup = boardArticleService.findByBoardArticleMaxGroup(boardVO.getBoardUUID());
//
//		articleVO.setBoardArticleGroup(boardArticleMaxGroup+1);
//		articleVO.setBoardArticleSeq(1);
//		articleVO.setBoardArticleLevel(0);
//		articleVO.setRegistDt(new Date());
//		articleVO.setRegistId(userVO.getUserId());
//		articleVO.setRegistName(userVO.getUserName());
//
//		// 게시글 등록
//		articleVO = boardArticleService.saveBoardArticle(articleVO);
//
//		// 파일업로드
//		fileUpload(boardVO, articleVO, userVO, request);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		//return "redirect:/board/mngr/"+boardId+"/list.do";
//
//
//		model.addAttribute("returnUrl", "/board/mngr/"+boardId+"/list.do");
//
//		return "/common/redirectView";
//	}
//
//	/**
//	 *  사용자화면에서 관리자가 게시글 정보를 수정하기 위해 작성
//	 * @param boardId
//	 * @param articleVO
//	 * @param result
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping("/mngr/{boardId}/update.do")
//	public String mngrUpdate(@PathVariable("boardId") String boardId, BoardArticleVO articleVO, BindingResult result, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model ) throws ParseException {
//
//		RequestInformation requestInfo = new RequestInformation(request);
//		String menuUUID = request.getParameter("menuUUID");
//		String errorView = checkId(menuUUID, boardId, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		model.addAttribute("menuUUID", menuUUID);
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		addModel(boardVO, boardSearchVO, model);
//
//		errorView = checkArticleUUID(articleVO.getBoardArticleUUID(),requestInfo, model);
//		if(errorView != null) return errorView;
//
//		// 필수항목 체크
//		this.validator.validate(articleVO, result);
//		if(result.hasErrors()) {
//
//        	Map<String,String> errMap = new HashMap<String,String>();
//        	for(FieldError err : result.getFieldErrors()) {
//        		errMap.put(err.getField(), err.getCode());
//        	}
//
//        	model.addAttribute("errMap", errMap)
//        		.addAttribute("returnUrl", "/board/mgnr/"+boardId+"/register.do")
//        		.addAttribute("boardArticleVO", articleVO)
//        		.addAttribute("mode", "write");
//
//        	return "/common/validatorError";
//        }
//
//		UserVO userVO = requestInfo.getLoginUser();
//
//		articleVO.setModifyDt(new Date());
//		articleVO.setModifyId(userVO.getUserId());
//
//		// 게시글 수정
//		articleVO = boardArticleService.saveBoardArticle(articleVO);
//
//		// 파일업로드
//		fileUpload(boardVO, articleVO, userVO, request);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		// return "redirect:/board/mngr/"+boardId+"/list.do";
//
//		model.addAttribute("returnUrl", "/board/mngr/"+boardId+"/list.do");
//
//		return "/common/redirectView";
//	}
//
//	/**
//	 *  사용자화면에서 관리자가 게시글 정보를 삭제하기 위해 작성
//	 * @param boardId
//	 * @param articleVO
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping("/mngr/{boardId}/delete.do")
//	public String mngrDelete(@PathVariable("boardId") String boardId, BoardArticleVO articleVO, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model ) throws ParseException {
//
//		RequestInformation requestInfo = new RequestInformation(request);
//		String menuUUID = request.getParameter("menuUUID");
//		String errorView = checkId(menuUUID, boardId, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		model.addAttribute("menuUUID", menuUUID);
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		addModel(boardVO, boardSearchVO, model);
//
//		errorView = checkArticleUUID(articleVO.getBoardArticleUUID(),requestInfo, model);
//		if(errorView != null) return errorView;
//
//		// 게시글 정보 조회
//		articleVO = boardArticleService.findByBoardArticleUUID(articleVO.getBoardArticleUUID());
//		if(articleVO != null) {
//			List<BoardArticleFileVO> fileList = articleVO.getFileList();
//
//			// 삭제할 파일 이름 저장
//			if(fileList != null && fileList.size() > 0){
//				String[] fileNames = new String[fileList.size()];
//				for(int i = 0; i < fileList.size(); i++){
//					fileNames[i] = fileList.get(i).getBoardArticleFileMask();
//				}
//
//				// 파일 삭제
//				FileUtil fileUtil = new FileUtil();
//				fileUtil.deleteFile(fileNames, 1);
//
//				// 파일테이블 데이터 삭제
//				boardArticleFileService.deleteBoardArticleByBoardArticleUUID(articleVO.getBoardArticleUUID());
//			}
//
//			// 게시글 삭제
//			boardArticleService.deleteBoardArticle(articleVO.getBoardArticleUUID());
//		}
//
//		// return "redirect:/board/mngr/"+boardId+"/list.do";
//
//		model.addAttribute("returnUrl", "/board/mngr/"+boardId+"/list.do");
//
//		return "/common/redirectView";
//	}
//
//	/**
//	 *  사용자화면에서 관리자가 게시글의 답글을 등록하기 위해 작성
//	 * @param boardId
//	 * @param articleVO
//	 * @param result
//	 * @param boardSearchVO
//	 * @param request
//	 * @param model
//	 * @return
//	 * @throws ParseException
//	 */
//	@RequestMapping("/mngr/{boardId}/reply.do")
//	public String mngrReply(@PathVariable("boardId") String boardId, BoardArticleVO articleVO, BindingResult result, BoardSearchVO boardSearchVO, HttpServletRequest request, Model model ) throws ParseException {
//
//		RequestInformation requestInfo = new RequestInformation(request);
//		String menuUUID = request.getParameter("menuUUID");
//		String errorView = checkId(menuUUID, boardId, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		model.addAttribute("menuUUID", menuUUID);
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		addModel(boardVO, boardSearchVO, model);
//
//		// 필수항목 체크
//		this.validator.validate(articleVO, result);
//		if(result.hasErrors()) {
//
//        	Map<String,String> errMap = new HashMap<String,String>();
//        	for(FieldError err : result.getFieldErrors()) {
//        		errMap.put(err.getField(), err.getCode());
//        	}
//
//        	model.addAttribute("errMap", errMap)
//        		.addAttribute("returnUrl", "/board/mngr/"+boardId+"/register.do")
//        		.addAttribute("boardArticleVO", articleVO)
//        		.addAttribute("mode", "write");
//
//        	return "/common/validatorError";
//        }
//
//		// 원글 키를 가졌는지 확인
//		String parentBoardArticleUUID = request.getParameter("parentBoardArticleUUID");
//		errorView = checkParentUUID(parentBoardArticleUUID, requestInfo, model);
//		if(errorView != null) return errorView;
//
//		UserVO userVO = requestInfo.getLoginUser();
//
//		articleVO.setRegistDt(new Date());
//		articleVO.setRegistId(userVO.getUserId());
//		articleVO.setRegistName(userVO.getUserName());
//
//		// 답글 저장
//		articleVO = boardArticleService.saveReplyBoardArticle(parentBoardArticleUUID, articleVO);
//
//		// 파일업로드
//		fileUpload(boardVO, articleVO, userVO, request);
//
//		// 달력형인경우
//		if( boardVO.getBoardType() == 1 ) {
//			model.addAttribute("year", request.getParameter("year") == null ? Calendar.getInstance().get( Calendar.YEAR ) : request.getParameter("year"));
//			model.addAttribute("month", request.getParameter("month") == null ? Calendar.getInstance().get( Calendar.MONTH ) + 1 : request.getParameter("month"));
//		}
//
//		// return "redirect:/board/mngr/"+boardId+"/list.do";
//
//		model.addAttribute("returnUrl", "/board/mngr/"+boardId+"/list.do");
//
//		return "/common/redirectView";
//	}
//
//
//	// 게시글 키 체크
//	public String checkId(String menuUUID, String boardId, RequestInformation requestInfo, Model model) {
//
//		if(menuUUID == null || "".equals(menuUUID)) {
//			return ReturnErrorView.returnErrorView(new String[]{"menuUUID", "메뉴 정보가 없습니다."}, requestInfo, model);
//		}
//
//		if(boardId == null || "".equals(boardId)) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardId", "게시판 ID가 없습니다."}, requestInfo, model);
//		}
//
//		BoardVO boardVO = boardService.findByBoardId(boardId);
//		if(boardVO == null) {
//			return ReturnErrorView.returnErrorView(new String[]{"boardId", "조회된 게시판 정보가 없습니다."}, requestInfo, model);
//		}
//
//		return null;
//	}
//
//}
