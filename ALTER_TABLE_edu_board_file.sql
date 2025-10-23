-- edu_board 테이블에 파일 정보 컬럼 추가
ALTER TABLE edu_board 
ADD COLUMN file_name VARCHAR(255) NULL COMMENT '원본 파일명',
ADD COLUMN file_path VARCHAR(500) NULL COMMENT '파일 저장 경로',
ADD COLUMN file_size BIGINT NULL COMMENT '파일 크기(byte)';

