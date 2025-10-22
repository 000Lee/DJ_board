package egovframework.com.cms.hp.board.util;

import java.time.LocalDateTime;

public class PostResponse {


    private Long BOARD_ARTICLE_ID;                       // PK
    private String BOARD_ARTICLE_TITLE;                  // 제목
    private String REG_EMP_NAME;                 // 작성자
    private String BOARD_ARTICLE_CONTENT;                 // 작성 내용
    private int BOARD_ARTICLE_VIEW_COUNT;                   // 조회 수
    private String PUBLIC_YN;              // 공개유무
    private String FILE_YN;              // 파일유무
    private LocalDateTime REG_DATE;     // 생성일시
    private String WRITE_DATE;     // 작성일시
    private String BOARD_ARTICLE_GROUP;    // 게시글 그룹

    private String EMP_SEQ;    // 작성자 사원번호

    private String FILE_PATH;
    private String BOARD_ARTICLE_CONTENT_URL;
    private String BOARD_ARTICLE_HASHTAG;
    private String BOARD_ARTICLE_DOC_NUM;
    private String ETC;

    private Long EDU_BOARD_ID; // 교육 PK
    private String EDU_BOARD_TITLE; //교육 제목
    private String EDU_BOARD_SDATE; //교육 시작일
    private String EDU_BOARD_EDATE; //교육 종료일
    private String EDU_STATUS; //교육 상태

    private Long EM_BOARD_ID; // 장비 PK
    private String EM_BOARD_TITLE; //장비 제목

    //cms 영역
    private Long BANNER_POPUP_UUID;
    private int BANNER_POPUP_GUBUN;
    private int BANNER_POPUP_WIDTH;
    private int BANNER_POPUP_HEIGHT;
    private int BANNER_POPUP_TOP;
    private int BANNER_POPUP_LEFT;
    private LocalDateTime BANNER_POPUP_START_DT;
    private LocalDateTime BANNER_POPUP_END_DT;
    private String BANNER_POPUP_TITLE;
    private String USE_AT;



    public Long getBOARD_ARTICLE_ID() {
        return BOARD_ARTICLE_ID;
    }
    public Long getEM_BOARD_ID() { return EM_BOARD_ID;}
    public Long getEDU_BOARD_ID() { return EDU_BOARD_ID; }
    public String getEDU_BOARD_TITLE() {
        return EDU_BOARD_TITLE;
    }
    public String getEDU_BOARD_SDATE() {
        return EDU_BOARD_SDATE;
    }
    public String getEDU_BOARD_EDATE() {
        return EDU_BOARD_EDATE;
    }
    public String getEDU_STATUS() {
        return EDU_STATUS;
    }

    public String getBOARD_ARTICLE_TITLE() {
        return BOARD_ARTICLE_TITLE;
    }
    public String getBOARD_ARTICLE_CONTENT() { return BOARD_ARTICLE_CONTENT; }

    public String getBOARD_ARTICLE_CONTENT_URL() { return BOARD_ARTICLE_CONTENT_URL; }
    public String getBOARD_ARTICLE_HASHTAG() { return BOARD_ARTICLE_HASHTAG; }
    public String getBOARD_ARTICLE_DOC_NUM() { return BOARD_ARTICLE_DOC_NUM; }

    public String getREG_EMP_NAME() {
        return REG_EMP_NAME;
    }

    public int getBOARD_ARTICLE_VIEW_COUNT() {
        return BOARD_ARTICLE_VIEW_COUNT;
    }

    public String getPUBLIC_YN() {
        return PUBLIC_YN;
    }

    public String getFILE_YN() {
        return FILE_YN;
    }

    public LocalDateTime getREG_DATE() {
        return REG_DATE;
    }
    public String getWRITE_DATE() { return WRITE_DATE; }

    public String getBOARD_ARTICLE_GROUP() {
        return BOARD_ARTICLE_GROUP;
    }

    public String getEMP_SEQ() {
        return EMP_SEQ;
    }

    public String getFIle_PATH() {
        return FILE_PATH;
    }
    public String getETC() {
        return ETC;
    }
    public String getEM_BOARD_TITLE() {
        return EM_BOARD_TITLE;
    }

    //cms 영역
    public Long getBANNER_POPUP_UUID() { return BANNER_POPUP_UUID; }
    public int getBANNER_POPUP_GUBUN() {
        return BANNER_POPUP_GUBUN;
    }
    public int getBANNER_POPUP_WIDTH() {
        return BANNER_POPUP_WIDTH;
    }
    public int getBANNER_POPUP_HEIGHT() {
        return BANNER_POPUP_HEIGHT;
    }
    public int getBANNER_POPUP_TOP() {
        return BANNER_POPUP_TOP;
    }
    public int getBANNER_POPUP_LEFT() {
        return BANNER_POPUP_LEFT;
    }
    public LocalDateTime getBANNER_POPUP_START_DT() {
        return BANNER_POPUP_START_DT;
    }
    public LocalDateTime getBANNER_POPUP_END_DT() {
        return BANNER_POPUP_END_DT;
    }
    public String getBANNER_POPUP_TITLE() {
        return BANNER_POPUP_TITLE;
    }
    public String getUSE_AT() {
        return USE_AT;
    }

}

