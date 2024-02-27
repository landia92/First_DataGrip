show databases;
create database su_camp default character set utf8mb4;
use su_camp;

SELECT @@sql_mode;
-- ONLY_FULL_GROUP_BY
-- STRICT_TRANS_TABLES
-- NO_ZERO_IN_DATE
-- NO_ZERO_DATE
-- ERROR_FOR_DIVISION_BY_ZERO
-- NO_ENGINE_SUBSTITUTION

CREATE USER 'admin' IDENTIFIED BY '1234';
CREATE USER 'app_service_acc' IDENTIFIED BY '1234';

-- ADMIN 권한 부여
GRANT ALL PRIVILEGES ON *.* to 'admin';
SELECT * FROM mysql.user WHERE User = 'admin';
-- 개발용 계정 권한 부여
GRANT SELECT ON *.* to 'app_service_acc';
SELECT * FROM mysql.user WHERE User = 'app_service_acc';

-- 계정 생성 및 password 지정
CREATE USER 'admin_acc'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'developer_acc'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'readonly_acc'@'localhost' IDENTIFIED BY '1234';

-- Role 생성
CREATE ROLE admin;
CREATE ROLE developer;
CREATE ROLE readonly;

-- Role에 권한 할당
GRANT ALL PRIVILEGES ON *.* TO 'admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'developer';
GRANT SELECT ON *.* TO 'readonly';

-- 계정에 Role 할당
GRANT admin TO 'admin_acc'@'localhost';
GRANT developer TO 'developer_acc'@'localhost';
GRANT readonly TO 'readonly_acc'@'localhost';
