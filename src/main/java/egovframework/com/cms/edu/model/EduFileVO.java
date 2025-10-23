package egovframework.com.cms.edu.model;

import lombok.Data;
import java.util.Date;

/**
 * 게시글 첨부파일 정보 VO
 */
@Data
public class EduFileVO {
    private Long id;                    // 파일 ID
    private Long boardId;               // 게시글 ID
    private String originalName;        // 원본 파일명
    private String savedName;           // 저장된 파일명
    private String filePath;            // 파일 저장 경로
    private Long fileSize;              // 파일 크기
    private Date uploadDate;            // 업로드 날짜
}
