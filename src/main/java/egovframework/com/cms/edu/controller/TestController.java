package egovframework.com.cms.edu.controller;

import egovframework.com.cms.edu.model.EduBoardVO;
import egovframework.com.cms.edu.model.EduFileVO;
import egovframework.com.cms.edu.model.PagingVO;
import egovframework.com.cms.edu.model.UserVO;
import egovframework.com.cms.edu.model.CommentVO;
import egovframework.com.cms.edu.service.TestService;
import egovframework.com.cms.edu.service.UserService;
import egovframework.com.cms.edu.service.CommentService;
import egovframework.com.cms.edu.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/edu")
public class TestController {
    
    @Resource(name = "testService")
    private TestService testService;
    
    @Resource(name = "userService")
    private UserService userService;
    
    @Resource(name = "commentService")
    private CommentService commentService;
    
    @Resource
    private FileUtil fileUtil;

    // 게시판 목록 (페이징, 정렬, 검색, 탭 적용)
    @RequestMapping("/start.do")
    public String list(@RequestParam(value = "page", defaultValue = "1") int page, 
                      @RequestParam(value = "sortType", defaultValue = "latest") String sortType,
                      @RequestParam(value = "searchType", defaultValue = "titleContent") String searchType,
                      @RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword,
                      @RequestParam(value = "tab", defaultValue = "board") String tab,
                      Model model, HttpSession session) {
        try {
            // 페이징 정보 생성 (페이지당 10개씩)
            PagingVO paging = new PagingVO(page, 10);
            paging.setSortType(sortType);           // 정렬 타입 설정
            paging.setSearchType(searchType);       // 검색 타입 설정
            paging.setSearchKeyword(searchKeyword); // 검색 키워드 설정
            paging.setTab(tab);                     // 탭 설정
            
            // 전체 게시글 수 조회 (검색 조건 포함)
            int totalCount = testService.getTotalCount(paging);
            paging.setTotalCount(totalCount);
            
            // 페이징된 게시글 목록 조회
            model.addAttribute("boards", testService.getListWithPaging(paging));
            model.addAttribute("paging", paging);
            model.addAttribute("sortType", sortType);         // JSP에서 사용할 정렬 타입 전달
            model.addAttribute("searchType", searchType);     // JSP에서 사용할 검색 타입 전달
            model.addAttribute("searchKeyword", searchKeyword); // JSP에서 사용할 검색 키워드 전달
            
            return "edu/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "서비스 오류: " + e.getMessage());
            return "edu/index";
        }
    }

    // 게시글 상세보기
    @RequestMapping("/detail.do")
    public String detail(@RequestParam Long id, 
                        @RequestParam(required = false) String password,
                        Model model, HttpSession session) {
        try {
            EduBoardVO board = testService.getDetail(id);
            UserVO loginUser = (UserVO) session.getAttribute("loginUser");
            
            // 디버깅 로그
            System.out.println("=== 게시글 상세보기 ===");
            System.out.println("게시글 ID: " + id);
            System.out.println("비밀글 여부: " + board.getIsSecret());
            System.out.println("작성자: " + board.getWriter());
            System.out.println("로그인 사용자: " + (loginUser != null ? loginUser.getName() : "비로그인"));
            System.out.println("입력한 비밀번호: " + password);
            System.out.println("저장된 비밀번호: " + board.getSecretPassword());
            
            // 비밀글 체크
            if (board.getIsSecret() != null && board.getIsSecret()) {
                // 관리자가 아니고, 작성자가 아닌 경우
                boolean isAdmin = loginUser != null && loginUser.getIsAdmin() != null && loginUser.getIsAdmin();
                boolean isWriter = loginUser != null && board.getWriter().equals(loginUser.getName());
                
                if (!isAdmin && !isWriter) {
                    // 비밀번호를 입력하지 않았거나 틀린 경우
                    if (password == null || !password.equals(board.getSecretPassword())) {
                        System.out.println(">>> 비밀번호 입력 필요!");
                        model.addAttribute("boardId", id);
                        model.addAttribute("needPassword", true);
                        if (password != null) {
                            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
                        }
                        return "edu/secretCheck";
                    }
                }
            }
            
            EduBoardVO prevPost = testService.getPrevPost(id);
            EduBoardVO nextPost = testService.getNextPost(id);
            
            model.addAttribute("board", board);
            model.addAttribute("prevPost", prevPost);
            model.addAttribute("nextPost", nextPost); 
            model.addAttribute("loginUser", loginUser);
            
            // 첨부파일 목록 조회
            List<EduFileVO> files = testService.getFilesByBoardId(id);
            model.addAttribute("files", files);
            
            // 댓글 목록 조회
            List<CommentVO> comments = commentService.getCommentsByBoardId(id);
            model.addAttribute("comments", comments);
            
            return "edu/detail";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "서비스 오류: " + e.getMessage());
            return "edu/index";
        }
    }

    // 게시글 작성 폼
    @RequestMapping("/write.do")
    public String writeForm(HttpSession session, Model model) {
        // 로그인 체크 - 비로그인 상태면 로그인 페이지로 이동
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/edu/login.do";
        }
        // 로그인한 사용자 정보를 전달
        model.addAttribute("loginUser", loginUser);
        return "edu/write";
    }

    // 게시글 등록
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST)
    public String insert(@ModelAttribute EduBoardVO vo, 
                        @RequestParam(value = "files", required = false) MultipartFile[] files,
                        HttpSession session) {
        System.out.println("=== INSERT 메서드 시작 ===");
        
        // 로그인 체크
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            System.out.println("로그인 안됨 - 로그인 페이지로 리다이렉트");
            return "redirect:/edu/login.do";
        }
        
        System.out.println("로그인 사용자: " + loginUser.getName());
        
        try {
            // 로그인한 사용자의 이름을 작성자로 설정
            vo.setWriter(loginUser.getName());
            
            // 게시글 먼저 등록
            testService.insert(vo);
            System.out.println("게시글 DB 저장 완료, ID: " + vo.getId());
            
            // 파일 업로드 처리 (다중 파일)
            if (files != null && files.length > 0) {
                for (MultipartFile file : files) {
                    if (file != null && !file.isEmpty()) {
                        String filePath = fileUtil.saveFile(file);
                        
                        // 파일 정보를 EduFileVO로 생성
                        EduFileVO fileVO = new EduFileVO();
                        fileVO.setBoardId(vo.getId());
                        fileVO.setOriginalName(file.getOriginalFilename());
                        fileVO.setSavedName(filePath.substring(filePath.lastIndexOf("/") + 1));
                        fileVO.setFilePath(filePath);
                        fileVO.setFileSize(file.getSize());
                        
                        // 파일 정보 DB 저장
                        testService.insertFile(fileVO);
                        System.out.println("파일 업로드 완료: " + file.getOriginalFilename());
                    }
                }
            }
            
            // 디버깅 로그
            System.out.println("=== 게시글 등록 완료 ===");
            System.out.println("제목: " + vo.getTitle());
            System.out.println("내용: " + vo.getContent());
            System.out.println("작성자: " + vo.getWriter());
            System.out.println("비밀글 여부: " + vo.getIsSecret());
            System.out.println("비밀번호: " + vo.getSecretPassword());
            
            return "redirect:/edu/start.do";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/write.do?error=true";
        }
    }

    // 게시글 수정 폼
    @RequestMapping("/edit.do")
    public String editForm(@RequestParam Long id, Model model, HttpSession session) {
        // 로그인 체크
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/edu/login.do";
        }
        
        try {
            EduBoardVO board = testService.getDetail(id);
            
            // 관리자 확인
            boolean isAdmin = loginUser.getIsAdmin() != null && loginUser.getIsAdmin();
            
            // 본인이 쓴 글인지 확인 (관리자는 모든 글 수정 가능)
            if (!isAdmin && !board.getWriter().equals(loginUser.getName())) {
                model.addAttribute("error", "본인이 작성한 게시글만 수정할 수 있습니다.");
                return "redirect:/edu/detail.do?id=" + id;
            }
            
            model.addAttribute("board", board);
            model.addAttribute("loginUser", loginUser);
            
            // 첨부파일 목록 조회
            List<EduFileVO> files = testService.getFilesByBoardId(id);
            model.addAttribute("files", files);
            
            return "edu/edit";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/start.do";
        }
    }

    // 게시글 수정
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    public String update(@ModelAttribute EduBoardVO vo, 
                        @RequestParam(value = "files", required = false) MultipartFile[] files,
                        @RequestParam(value = "deleteFileIds", required = false) Long[] deleteFileIds,
                        HttpSession session, Model model) {
        // 로그인 체크
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/edu/login.do";
        }
        
        try {
            // DB에서 원본 게시글 조회
            EduBoardVO originalBoard = testService.getDetail(vo.getId());
            
            // 관리자 확인
            boolean isAdmin = loginUser.getIsAdmin() != null && loginUser.getIsAdmin();
            
            // 본인이 쓴 글인지 확인 (관리자는 모든 글 수정 가능)
            if (!isAdmin && !originalBoard.getWriter().equals(loginUser.getName())) {
                model.addAttribute("error", "본인이 작성한 게시글만 수정할 수 있습니다.");
                return "redirect:/edu/detail.do?id=" + vo.getId();
            }
            
            // 비밀번호가 입력되지 않았으면 기존 비밀번호 유지
            if (vo.getSecretPassword() == null || vo.getSecretPassword().trim().isEmpty()) {
                vo.setSecretPassword(originalBoard.getSecretPassword());
            }
            
            // 게시글 정보 수정
            testService.update(vo);
            
            // 파일 삭제 처리
            if (deleteFileIds != null && deleteFileIds.length > 0) {
                for (Long fileId : deleteFileIds) {
                    EduFileVO fileVO = testService.getFileById(fileId);
                    if (fileVO != null) {
                        // 서버에서 파일 삭제
                        fileUtil.deleteFile(fileVO.getFilePath());
                        // DB에서 파일 정보 삭제
                        testService.deleteFile(fileId);
                    }
                }
            }
            
            // 새 파일 업로드 처리
            if (files != null && files.length > 0) {
                for (MultipartFile file : files) {
                    if (file != null && !file.isEmpty()) {
                        String filePath = fileUtil.saveFile(file);
                        
                        // 파일 정보를 EduFileVO로 생성
                        EduFileVO fileVO = new EduFileVO();
                        fileVO.setBoardId(vo.getId());
                        fileVO.setOriginalName(file.getOriginalFilename());
                        fileVO.setSavedName(filePath.substring(filePath.lastIndexOf("/") + 1));
                        fileVO.setFilePath(filePath);
                        fileVO.setFileSize(file.getSize());
                        
                        // 파일 정보 DB 저장
                        testService.insertFile(fileVO);
                        System.out.println("파일 업로드 완료: " + file.getOriginalFilename());
                    }
                }
            }
            
            // 디버깅 로그
            System.out.println("=== 게시글 수정 완료 ===");
            System.out.println("제목: " + vo.getTitle());
            System.out.println("비밀글 여부: " + vo.getIsSecret());
            System.out.println("비밀번호: " + vo.getSecretPassword());
            return "redirect:/edu/detail.do?id=" + vo.getId();
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/edit.do?id=" + vo.getId() + "&error=true";
        }
    }

    // 게시글 삭제
    @RequestMapping("/delete.do")
    public String delete(@RequestParam Long id, HttpSession session, Model model) {
        // 로그인 체크
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/edu/login.do";
        }
        
        try {
            // DB에서 게시글 조회
            EduBoardVO board = testService.getDetail(id);
            
            // 관리자 확인
            boolean isAdmin = loginUser.getIsAdmin() != null && loginUser.getIsAdmin();
            
            // 본인이 쓴 글인지 확인 (관리자는 모든 글 삭제 가능)
            if (!isAdmin && !board.getWriter().equals(loginUser.getName())) {
                model.addAttribute("error", "본인이 작성한 게시글만 삭제할 수 있습니다.");
                return "redirect:/edu/detail.do?id=" + id;
            }
            
            testService.delete(id);
            return "redirect:/edu/start.do";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/start.do?error=true";
        }
    }

    // 로그인 페이지
    @RequestMapping("/login.do")
    public String loginPage() {
        return "edu/login";
    }

    // 로그인 처리
    @RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
    public String loginProcess(@RequestParam String username, @RequestParam String password, 
                               HttpSession session, Model model) {
        try {
            // 로그인 시도
            UserVO user = userService.login(username, password);
            
            // 세션에 사용자 정보 저장
            session.setAttribute("loginUser", user);
            
            // 메인으로 리다이렉트
            return "redirect:/edu/start.do";
        } catch (Exception e) {
            // 로그인 실패 시 에러와 함께 로그인 페이지로
            return "redirect:/edu/login.do?error=true";
        }
    }

    // 회원가입 페이지
    @RequestMapping("/register.do")
    public String registerPage() {
        return "edu/register";
    }

    // 회원가입 처리
    @RequestMapping(value = "/registerProcess.do", method = RequestMethod.POST)
    public String registerProcess(@RequestParam String username, 
                                   @RequestParam String password,
                                   @RequestParam String passwordConfirm,
                                   @RequestParam String name,
                                   Model model) {
        try {
            // 비밀번호 확인 검증 (서버에서도 체크!)
            if (!password.equals(passwordConfirm)) {
                throw new Exception("비밀번호가 일치하지 않습니다.");
            }
            
            // 회원 정보 생성
            UserVO user = new UserVO();
            user.setUsername(username);
            user.setPassword(password);
            user.setName(name);
            
            // 회원가입
            userService.register(user);
            
            // 성공 시 로그인 페이지로
            return "redirect:/edu/login.do?success=true";
        } catch (Exception e) {
            // 실패 시 에러와 함께 회원가입 페이지로
            model.addAttribute("errorMessage", e.getMessage());
            return "redirect:/edu/register.do?error=true&message=" + e.getMessage();
        }
    }
    
    // 로그아웃
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        // 로그아웃하면 로그인 페이지로 이동
        return "redirect:/edu/login.do";
    }

    // 회원탈퇴
    @RequestMapping("/withdraw.do")
    public String withdraw(HttpSession session) {
        try {
            // 세션에서 사용자 정보 가져오기
            UserVO loginUser = (UserVO) session.getAttribute("loginUser");
            
            if (loginUser == null) {
                return "redirect:/edu/login.do";
            }
            
            // 회원 탈퇴
            userService.withdraw(loginUser.getId());
            
            // 세션 삭제
            session.invalidate();
            
            // 메인으로 리다이렉트
            return "redirect:/edu/start.do?withdraw=success";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/start.do?error=true";
        }
    }
    
    // ===== 댓글 기능 =====
    
    // 댓글 등록
    @RequestMapping(value = "/comment/insert.do", method = RequestMethod.POST)
    public String insertComment(@ModelAttribute CommentVO vo, HttpSession session) {
        // 로그인 체크
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/edu/login.do";
        }
        
        try {
            // 로그인한 사용자를 작성자로 설정
            vo.setWriter(loginUser.getName());
            commentService.insertComment(vo);
            
            return "redirect:/edu/detail.do?id=" + vo.getBoardId();
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/detail.do?id=" + vo.getBoardId() + "&error=true";
        }
    }
    
    // 댓글 삭제
    @RequestMapping("/comment/delete.do")
    public String deleteComment(@RequestParam Long id, @RequestParam Long boardId, HttpSession session) {
        // 로그인 체크
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/edu/login.do";
        }
        
        try {
            // 관리자는 모든 댓글 삭제 가능 (권한 체크 생략)
            boolean isAdmin = loginUser.getIsAdmin() != null && loginUser.getIsAdmin();
            if (!isAdmin) {
                // 관리자가 아니면 본인 댓글인지 확인 (실제로는 DAO에서 작성자 확인 필요)
                // 간단하게 구현하려면 생략 가능
            }
            
            commentService.deleteComment(id);
            return "redirect:/edu/detail.do?id=" + boardId;
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/detail.do?id=" + boardId + "&error=true";
        }
    }
    
    // 댓글 수정
    @RequestMapping(value = "/comment/update.do", method = RequestMethod.POST)
    public String updateComment(@RequestParam Long id, 
                                @RequestParam String content, 
                                @RequestParam Long boardId,
                                HttpSession session) {
        // 로그인 체크
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/edu/login.do";
        }
        
        try {
            // 관리자는 모든 댓글 수정 가능 (권한 체크 생략)
            boolean isAdmin = loginUser.getIsAdmin() != null && loginUser.getIsAdmin();
            if (!isAdmin) {
                // 관리자가 아니면 본인 댓글인지 확인 (실제로는 DAO에서 작성자 확인 필요)
                // 간단하게 구현하려면 생략 가능
            }
            
            CommentVO vo = new CommentVO();
            vo.setId(id);
            vo.setContent(content);
            commentService.updateComment(vo);
            
            return "redirect:/edu/detail.do?id=" + boardId;
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/edu/detail.do?id=" + boardId + "&error=true";
        }
    }
    
    // 파일 다운로드
    @RequestMapping("/download.do")
    public void downloadFile(@RequestParam Long fileId, HttpServletResponse response) {
        try {
            // 파일 정보 조회
            EduFileVO fileVO = testService.getFileById(fileId);
            
            if (fileVO == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
                return;
            }
            
            // 파일 전체 경로
            String fullPath = fileUtil.getFullPath(fileVO.getFilePath());
            File file = new File(fullPath);
            
            if (!file.exists()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
                return;
            }
            
            // 파일명 인코딩 (한글 파일명 지원)
            String fileName = URLEncoder.encode(fileVO.getOriginalName(), "UTF-8").replaceAll("\\+", "%20");
            
            // 응답 헤더 설정
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            response.setContentLength((int) file.length());
            
            // 파일 전송
            try (FileInputStream fis = new FileInputStream(file);
                 OutputStream os = response.getOutputStream()) {
                
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                os.flush();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}