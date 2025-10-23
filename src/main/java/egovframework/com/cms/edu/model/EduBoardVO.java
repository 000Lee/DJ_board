package egovframework.com.cms.edu.model;

import lombok.Data;
import java.util.Date;

@Data
public class EduBoardVO {
    private Long id;
    private String title;
    private String content;
    private String writer;
    private Date createdAt;
    private Integer views;
    private Boolean isSecret;       // 비밀글 여부
    private String secretPassword;  // 비밀글 비밀번호
    private Boolean isNotice;       // 공지사항 여부
}
