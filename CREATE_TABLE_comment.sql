-- 댓글 테이블 생성
CREATE TABLE edu_comment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '댓글 ID',
    board_id BIGINT NOT NULL COMMENT '게시글 ID',
    content TEXT NOT NULL COMMENT '댓글 내용',
    writer VARCHAR(50) NOT NULL COMMENT '작성자',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
    FOREIGN KEY (board_id) REFERENCES edu_board(id) ON DELETE CASCADE
) COMMENT='교육 게시판 댓글';

-- 인덱스 추가 (조회 성능 향상)
CREATE INDEX idx_board_id ON edu_comment(board_id);
CREATE INDEX idx_created_at ON edu_comment(created_at);

