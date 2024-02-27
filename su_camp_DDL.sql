-- 테이블 생성
CREATE TABLE app_user(
  	u_number INT(3) PRIMARY KEY,
  	u_id VARCHAR(20) UNIQUE NOT NULL,
    u_name VARCHAR(30) NOT NULL,
    email VARCHAR(80)
);

SHOW CREATE TABLE app_user;
-- 테이블 변경 (컬럼 추가)
ALTER TABLE app_user ADD COLUMN (u_address varchar(30));
SHOW CREATE TABLE app_user;
-- 테이블 변경 (컬럼 삭제)
ALTER TABLE app_user DROP COLUMN email;
SHOW CREATE TABLE app_user;

-- u_address 컬럼에 UNIQUE 제약조건 별칭 부여해서 걸기
ALTER TABLE app_user ADD CONSTRAINT u_address_unique UNIQUE (u_address);
SHOW CREATE TABLE app_user;

-- 제약조건 위배 쿼리 시도

-- u_address 컬럼에 부여한 UNIQUE 제약조건 삭제
ALTER TABLE app_user DROP CONSTRAINT u_address_unique;
SHOW CREATE TABLE app_user;

-- app_user 테이블명을 member로 변경
RENAME TABLE app_user to member;
SELECT * FROM app_user;
SELECT * FROM member;

-- TRUNCATE TABLE은 내부 데이터를 삭제 (테이블 스키마는 유지)
TRUNCATE TABLE member;
SELECT * FROM member;

-- DROP TABLE은 내부 데이터와 테이블 모두 삭제
DROP TABLE member;
SELECT * FROM member;