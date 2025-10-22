package egovframework.com.cms.edu.model;

import lombok.Data;
import java.util.Date;

@Data
public class CommentVO {
    private Long id;              // 댓글 ID
    private Long boardId;         // 게시글 ID (외래키)
    private String content;       // 댓글 내용
    private String writer;        // 작성자
    private Date createdAt;       // 작성일
}

