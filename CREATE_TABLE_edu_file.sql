-- 파일 정보를 저장하는 별도 테이블 생성
CREATE TABLE edu_file (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    board_id BIGINT NOT NULL,
    original_name VARCHAR(255) NOT NULL,
    saved_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_size BIGINT NOT NULL,
    upload_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (board_id) REFERENCES edu_board(id) ON DELETE CASCADE
);

-- 기존 edu_board 테이블에서 파일 관련 컬럼 제거
ALTER TABLE edu_board 
DROP COLUMN file_name,
DROP COLUMN file_path,
DROP COLUMN file_size;
