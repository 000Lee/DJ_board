-- edu_board 테이블에 is_important 컬럼 추가
-- 중요 공지사항 여부 (일반게시판 상단에 최대 2개까지 고정)
ALTER TABLE edu_board ADD COLUMN is_important BOOLEAN DEFAULT FALSE COMMENT '중요 공지사항 여부';

-- 기존 인덱스 확인 및 정렬 최적화를 위한 인덱스 추가
CREATE INDEX idx_notice_important ON edu_board(is_important DESC, is_notice DESC, created_at DESC);

