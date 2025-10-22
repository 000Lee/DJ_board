-- edu_board 테이블에 비밀글 관련 컬럼 추가

-- MySQL/MariaDB (BOOLEAN은 TINYINT(1)로 저장됨: 0=false, 1=true)
ALTER TABLE edu_board ADD COLUMN is_secret BOOLEAN DEFAULT FALSE COMMENT '비밀글 여부' AFTER views;
ALTER TABLE edu_board ADD COLUMN secret_password VARCHAR(255) COMMENT '비밀글 비밀번호' AFTER is_secret;

-- 컬럼 확인
-- SHOW COLUMNS FROM edu_board;

-- 참고: MySQL의 BOOLEAN은 내부적으로 TINYINT(1)로 저장되며
-- 0 = false, 1 = true로 자동 매핑됩니다.

