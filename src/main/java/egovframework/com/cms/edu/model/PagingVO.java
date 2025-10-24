package egovframework.com.cms.edu.model;

import lombok.Data;

/**
 * 페이징 정보를 담는 VO 클래스
 */
@Data
public class PagingVO {
    private int currentPage = 1;      // 현재 페이지
    private int pageSize = 10;        // 페이지당 게시글 수
    private int totalCount;           // 전체 게시글 수
    private int totalPages;           // 전체 페이지 수
    private int startPage;            // 페이징 영역의 시작 페이지
    private int endPage;              // 페이징 영역의 끝 페이지
    private int offset;               // SQL OFFSET 값
    
    private int pageGroupSize = 10;   // 페이징 네비게이션에 표시할 페이지 수
    private String sortType = "latest"; // 정렬 타입 (latest: 최신순, views: 조회수순)
    
    // 검색 조건
    private String searchType = "titleContent"; // 검색 타입 (title: 제목, titleContent: 제목+내용, writer: 작성자)
    private String searchKeyword = "";          // 검색 키워드
    
    // 탭 구분
    private String tab = "board";               // 탭 (board: 일반게시판, notice: 공지사항)
    
    public PagingVO() {
    }
    
    public PagingVO(int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }
    
    /**
     * 전체 게시글 수를 설정하고 페이징 정보를 계산
     */
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcPaging();
    }
    
    /**
     * 페이징 정보 계산
     */
    private void calcPaging() {
        // 전체 페이지 수 계산
        totalPages = (int) Math.ceil((double) totalCount / pageSize);
        
        // 현재 페이지가 유효한 범위인지 확인
        if (currentPage < 1) {
            currentPage = 1;
        }
        if (currentPage > totalPages && totalPages > 0) {
            currentPage = totalPages;
        }
        
        // SQL OFFSET 계산
        offset = (currentPage - 1) * pageSize;
        
        // 페이지 네비게이션 범위 계산 (1-10, 11-20, 21-30 ...)
        int currentPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize);
        startPage = (currentPageGroup - 1) * pageGroupSize + 1;
        endPage = Math.min(startPage + pageGroupSize - 1, totalPages);
    }
    
    /**
     * 이전 페이지 그룹이 있는지 확인
     */
    public boolean hasPreviousPageGroup() {
        return startPage > 1;
    }
    
    /**
     * 다음 페이지 그룹이 있는지 확인
     */
    public boolean hasNextPageGroup() {
        return endPage < totalPages;
    }
    
    /**
     * 이전 페이지 그룹의 마지막 페이지 번호
     */
    public int getPreviousPageGroupEnd() {
        return startPage - 1;
    }
    
    /**
     * 다음 페이지 그룹의 첫 페이지 번호
     */
    public int getNextPageGroupStart() {
        return endPage + 1;
    }
}

