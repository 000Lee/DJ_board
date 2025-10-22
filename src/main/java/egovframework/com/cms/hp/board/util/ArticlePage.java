package egovframework.com.cms.hp.board.util;

public class ArticlePage {


    private String categoryKey;
    private String inputText;
    private String searchCategory;
    private String searchInput;
    private String inSearchContent;
    private String emCode;
    private int page;             // 현재 페이지 번호
    private int recordSize;       // 페이지당 출력할 데이터 개수
    private int pageSize;         // 화면 하단에 출력할 페이지 사이즈

    private Pagination pagination;


    public ArticlePage() {
        this.page = 1;
        this.recordSize = 10;
        this.pageSize = 10;
    }

    public String getSearchCategory() {
        return searchCategory;
    }

    public void setSearchCategory(String searchCategory) {
        this.searchCategory = searchCategory;
    }

    public String getSearchInput() {
        return searchInput;
    }
    public String getInSearchContent() { return inSearchContent; }
    public String getEmCode() { return emCode; }

    public void setSearchInput(String searchInput) {
        this.searchInput = searchInput;
    }
    public void setInSearchContent(String inSearchContent) { this.inSearchContent = inSearchContent; }
    public void setEmCode(String emCode) { this.emCode = emCode; }

    public String getCategoryKey() {
        return categoryKey;
    }

    public void setCategoryKey(String categoryKey) {
        this.categoryKey = categoryKey;
    }

    public String getInputText() {
        return inputText;
    }

    public void setInputText(String inputText) {
        this.inputText = inputText;
    }

    public int getOffset() {
        return (page - 1) * recordSize;
    }


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRecordSize() {
        return recordSize;
    }

    public void setRecordSize(int recordSize) {
        this.recordSize = recordSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
}