* DB 모델링 주소 

  URL : https://aquerytool.com/aquerymain/index/?rurl=51da5bd1-5aae-4b40-b501-0c156a471fc5&
  Password : 84gpzc


* 팀명 : 초바오
  팀원 : 방찬유, 강다연, 김은석, 한채연, 이초원
  주제 : 냉장고를 부탁해 
  
  * 비밀번호 암호화 : 
  select count(*) from members;
select * from members;

select * from members;

-- 비밀번호 암호화 : AES / MD5 / SHA / SHA2 

SELECT MD5('1234'); # (32글자) 81dc9bdb52d04dc20036dbd8313ed055
SELECT SHA('1234'); # (40글자) 7110eda4d09e062aa5e4a390b0a572ac0d2c0220
SELECT SHA2('1234', 224); # (56글자) 99fb2f48c6af4761f904fc85f95eb56190e5d40b1f44ec3a9c1fa319
SELECT SHA2('1234', 256); # (64글자) 03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4
SELECT SHA2('1234', 384); # (96글자) 504f008c8fcf8b2ed5dfcde752fc5464ab8ba064215d9c5b5fc486af3d9ab8c81b14785180d2ad7cee1ab792ad44798c
SELECT SHA2('1234', 512); #(128글자) d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db


INSERT INTO members (mem_id, mem_pw, mem_name, mem_phone, mem_email, mem_refri, joined_at, mem_type) 
VALUES ('mem_id 1', SHA2('mem_pw 1', 384), 'mem_name 1', 'mem_phone 1', 'mem_email 1', 'mem_refri 1', NOW(), 'mem_type 1');

SELECT * FROM members ORDER BY joined_at DESC LIMIT 20;


  
  
  CREATE TABLE IF NOT EXISTS `members` (
      `id` VARCHAR(20) NOT NULL,
      `pw` VARCHAR(20) NOT NULL,
      `name` VARCHAR(45) NOT NULL,
      `pn` VARCHAR(11) NOT NULL,
      `email` VARCHAR(50) NOT NULL,
      `re` INT NOT NULL,
      PRIMARY KEY (`id`),
      UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci


    * 이미지 처리 하기 

      file_folder = 'd:/uploads/';
      file_name = 'image0001.jpg';
      file_basename = 'image0001';
      file_ext = 'jpg';
      file_size = 234234320;
      file_rname = file_basename + '2f48f241-9d64-4d16-bf56-70b9d4e0e79a' + '.' + file_ext;
      file_path = file_folder + file_name;

      * 중복을 회피하기 위해서 UUID()를 사용함

      *DB에 컬럼으로 저장할 내용은?

      카테고리 / file_name / file_rname / file_ext / file_size 

* VO : DTO : Java Model : Java Bean : POJO 
  UserVO.java, MemberDTO.java 


  VO(Value Object)
  DTO(Data Transfer Object)
  POJO(Plain Old Java Object)

  

  Member    : PASKCAL CASE(클래스)
  memberId  : CAMEL CASE(변수, 컬럼)
  member_id : snake lower case(변수, 컬럼)
  MEMBER_ID : SNAKE UPPER CASE(상수)



  // 회원 
public class MemberDTO {

    // 아이디 
    private String mem_id;

    // 비밀번호 
    private String mem_pw;

    // 이름 
    private String mem_name;

    // 연락처 
    private String mem_phone;

    // 이메일 
    private String mem_email;

    // 냉장고 종류 
    private String mem_refri;

    // 가입일자 
    private Timestamp joined_at;

    // 회원유형 
    private String mem_type;

    public String getMemId() {
        return mem_id;
    }

    public void setMemId(String memId) {
        this.mem_id = mem_id;
    }

    public String getMemPw() {
        return mem_pw;
    }

    public void setMemPw(String memPw) {
        this.mem_pw = mem_pw;
    }

    public String getMemName() {
        return mem_name;
    }

    public void setMemName(String memName) {
        this.mem_name = mem_name;
    }

    public String getMemPhone() {
        return mem_phone;
    }

    public void setMemPhone(String memPhone) {
        this.mem_phone = mem_phone;
    }

    public String getMemEmail() {
        return mem_email;
    }

    public void setMemEmail(String memEmail) {
        this.mem_email = mem_email;
    }

    public String getMemRefri() {
        return mem_refri;
    }

    public void setMemRefri(String memRefri) {
        this.mem_refri = mem_refri;
    }

    public Timestamp getJoinedAt() {
        return joined_at;
    }

    public void setJoinedAt(Timestamp joinedAt) {
        this.joined_at = joined_at;
    }

    public String getMemType() {
        return mem_type;
    }

    public void setMemType(String memType) {
        this.mem_type = mem_type;
    }

    // members 모델 복사
    public void CopyData(members param)
    {
        this.mem_id = param.getMemId();
        this.mem_pw = param.getMemPw();
        this.mem_name = param.getMemName();
        this.mem_phone = param.getMemPhone();
        this.mem_email = param.getMemEmail();
        this.mem_refri = param.getMemRefri();
        this.joined_at = param.getJoinedAt();
        this.mem_type = param.getMemType();
    }
}

# 말풍선(Verbose, 말이 많은) : 상세모드

(32비트)
INT            ... 32 BIT 정수(-2147483648~-1, 0~2147483647)  * 대략 -21억 ~ + 21억 
INT UNSIGNED   ... 32 BIT 정수(0~2147483647 + 2147483648)     * 대략 0 ~ + 42억 

(64비트)
BIGINT         ... 64 BIT 정수(-9223372036854775808~-1, 0~9223372036854775807) * 대략 -922경 ~ + 922경
BIGINT UNSIGNED... 64 BIT 정수(0~9223372036854775807 +9223372036854775808)     * 대략   0 ~ + 1844경

use campus_24SW_BD_p2_2;

SELECT * FROM boards2;

ALTER TABLE boards AUTO_INCREMENT=2530001;



INSERT INTO boards (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 1', 'bo_content 1', 'bo_file 1', NOW(), 1, 1, 'mem_id 01');
INSERT INTO boards (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 2', 'bo_content 2', 'bo_file 2', NOW(), 2, 2, 'mem_id 02');
INSERT INTO boards (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 3', 'bo_content 3', 'bo_file 3', NOW(), 3, 3, 'mem_id 03');

SELECT * FROM boards;
SELECT UUID();
SELECT UUID_SHORT();


-- 테이블 생성 SQL - boards3
CREATE TABLE boards3
(
    `bo_idx`      INT UNSIGNED     NOT NULL    DEFAULT (UUID_SHORT()) COMMENT '글 식별자', 
    `bo_title`    VARCHAR(1500)    NOT NULL    COMMENT '글 제목', 
    `bo_content`  TEXT             NOT NULL    COMMENT '글 내용', 
    `bo_file`     VARCHAR(1000)    NOT NULL    COMMENT '글 첨부파일', 
    `created_at`  DATETIME         NOT NULL    DEFAULT NOW() COMMENT '글 작성일자', 
    `bo_views`    INT              NOT NULL    COMMENT '글 조회수', 
    `bo_likes`    INT              NOT NULL    COMMENT '글 좋아요수', 
    `mem_id`      VARCHAR(30)      NOT NULL    COMMENT '글 작성자', 
     PRIMARY KEY (bo_idx)
);

-- 테이블 Comment 설정 SQL - boards3
ALTER TABLE boards3 COMMENT '게시판';

SELECT UUID_SHORT(); # 100774676296368241 : 10경..18자리

SELECT UUID();
SELECT LENGTH('58571b38-2a32-11ef-986b-0242ac14000b');


-- 테이블 생성 SQL - boards4
CREATE TABLE boards4
(
    `bo_idx`      VARCHAR(36)      NOT NULL    DEFAULT 'UUID()' COMMENT '글 식별자', 
    `bo_title`    VARCHAR(1500)    NOT NULL    COMMENT '글 제목', 
    `bo_content`  TEXT             NOT NULL    COMMENT '글 내용', 
    `bo_file`     VARCHAR(1000)    NOT NULL    COMMENT '글 첨부파일', 
    `created_at`  DATETIME         NOT NULL    DEFAULT NOW() COMMENT '글 작성일자', 
    `bo_views`    INT              NOT NULL    COMMENT '글 조회수', 
    `bo_likes`    INT              NOT NULL    COMMENT '글 좋아요수', 
    `mem_id`      VARCHAR(30)      NOT NULL    COMMENT '글 작성자', 
     PRIMARY KEY (bo_idx)
);

-- 테이블 Comment 설정 SQL - boards4
ALTER TABLE boards4 COMMENT '게시판4';



INSERT INTO boards3 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 1', 'bo_content 1', 'bo_file 1', NOW(), 1, 1, 'mem_id 1');
INSERT INTO boards3 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 2', 'bo_content 2', 'bo_file 2', NOW(), 2, 2, 'mem_id 2');
INSERT INTO boards3 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 3', 'bo_content 3', 'bo_file 3', NOW(), 3, 3, 'mem_id 3');
INSERT INTO boards3 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 4', 'bo_content 4', 'bo_file 4', NOW(), 4, 4, 'mem_id 4');
INSERT INTO boards3 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 5', 'bo_content 5', 'bo_file 5', NOW(), 5, 5, 'mem_id 5');

SELECT * FROM boards3;



-- 테이블 생성 SQL - boards4
CREATE TABLE boards4
(
    `bo_idx`      VARCHAR(36)      NOT NULL    DEFAULT (UUID()) COMMENT '글 식별자', 
    `bo_title`    VARCHAR(1500)    NOT NULL    COMMENT '글 제목', 
    `bo_content`  TEXT             NOT NULL    COMMENT '글 내용', 
    `bo_file`     VARCHAR(1000)    NOT NULL    COMMENT '글 첨부파일', 
    `created_at`  DATETIME         NOT NULL    DEFAULT NOW() COMMENT '글 작성일자', 
    `bo_views`    INT              NOT NULL    COMMENT '글 조회수', 
    `bo_likes`    INT              NOT NULL    COMMENT '글 좋아요수', 
    `mem_id`      VARCHAR(30)      NOT NULL    COMMENT '글 작성자', 
     PRIMARY KEY (bo_idx)
);

-- 테이블 Comment 설정 SQL - boards4
ALTER TABLE boards4 COMMENT '게시판4';


INSERT INTO boards4 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 1', 'bo_content 1', 'bo_file 1', NOW(), 1, 1, 'mem_id 1');
INSERT INTO boards4 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 2', 'bo_content 2', 'bo_file 2', NOW(), 2, 2, 'mem_id 2');
INSERT INTO boards4 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 3', 'bo_content 3', 'bo_file 3', NOW(), 3, 3, 'mem_id 3');
INSERT INTO boards4 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 4', 'bo_content 4', 'bo_file 4', NOW(), 4, 4, 'mem_id 4');
INSERT INTO boards4 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 5', 'bo_content 5', 'bo_file 5', NOW(), 5, 5, 'mem_id 5');

-- 하이픈 없애기 
SELECT REPLACE(UUID(),'-','');

-- 소문자를 대문자로
SELECT UPPER(REPLACE(UUID(),'-',''));

-- 년도 + 코드 
SELECT YEAR(NOW());

-- 문자열 합치기 
-- 자바 : 'A' + 'B'
-- 오라클 : 'A'||'B'
-- MYSQL : CONCAT('A', 'B',.....);

SELECT CONCAT(YEAR(NOW()), UPPER(REPLACE(UUID(),'-','')));

SELECT SUBSTRING(YEAR(NOW()), 3);


SELECT CONCAT(SUBSTRING(YEAR(NOW()), 3), UPPER(REPLACE(UUID(),'-','')));


-- 테이블 생성 SQL - boards5
CREATE TABLE boards5
(
    `bo_idx`      VARCHAR(36)      NOT NULL    DEFAULT (CONCAT(SUBSTRING(YEAR(NOW()), 3), UPPER(REPLACE(UUID(),'-','')))) COMMENT '글 식별자', 
    `bo_title`    VARCHAR(1500)    NOT NULL    COMMENT '글 제목', 
    `bo_content`  TEXT             NOT NULL    COMMENT '글 내용', 
    `bo_file`     VARCHAR(1000)    NOT NULL    COMMENT '글 첨부파일', 
    `created_at`  DATETIME         NOT NULL    DEFAULT NOW() COMMENT '글 작성일자', 
    `bo_views`    INT              NOT NULL    COMMENT '글 조회수', 
    `bo_likes`    INT              NOT NULL    COMMENT '글 좋아요수', 
    `mem_id`      VARCHAR(30)      NOT NULL    COMMENT '글 작성자', 
     PRIMARY KEY (bo_idx)
);

-- 테이블 Comment 설정 SQL - boards5
ALTER TABLE boards5 COMMENT '게시판5';

SELECT * FROM boards4;


INSERT INTO boards5 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 1', 'bo_content 1', 'bo_file 1', NOW(), 1, 1, 'mem_id 1');
INSERT INTO boards5 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 2', 'bo_content 2', 'bo_file 2', NOW(), 2, 2, 'mem_id 2');
INSERT INTO boards5 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 3', 'bo_content 3', 'bo_file 3', NOW(), 3, 3, 'mem_id 3');
INSERT INTO boards5 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 4', 'bo_content 4', 'bo_file 4', NOW(), 4, 4, 'mem_id 4');
INSERT INTO boards5 (bo_title, bo_content, bo_file, created_at, bo_views, bo_likes, mem_id) VALUES ('bo_title 5', 'bo_content 5', 'bo_file 5', NOW(), 5, 5, 'mem_id 5');

SELECT * FROM boards5;

-- UUID() 너무 촌시럽다!! 
-- LENGTH : 36
-- 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

-- SELECT 1 + 2;  // SQL --> PL/SQL(function, procedure, trigger) 

DELIMITER //
DROP TRIGGER IF EXISTS TRG_GENERATE_STRINGS //
CREATE TRIGGER TRG_GENERATE_STRINGS 
BEFORE INSERT ON boards5
FOR EACH ROW
BEGIN 
   SET @characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
   SET @char_length = LENGTH(@characters);
   SET @key = UPPER(TO_BASE64(NOW(6)));
   SET @i = 0;
   
   WHILE @i < 100 -36 DO 
	SET @key = CONCAT(@key, SUBSTRING(@characters, FLOOR(1 + RAND() * @char_length), 1));
    SET @i = @i + 1;
   END WHILE;
   
   SET NEW.bo_idx = @key;
   
END//
DELIMITER ;
 

-- NEW.bo_idx = 'bo_idx 1'
-- NEW.bo_title = 'bo_title 1';

DELETE FROM boards5;

SELECT * FROM boards5; -- 36 * 100승 = 234059842034920394023904820394109324120340243

SELECT UPPER(TO_BASE64(NOW(6)));

SELECT LENGTH(UPPER(TO_BASE64(NOW(6))));
---------------------------------------------------------------------------------------
(핵심프로젝트 MySQL SQL문)      
use campus_24SW_BD_p2_2;
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- members Table Create SQL
-- 테이블 생성 SQL - members
CREATE TABLE members
(
    `mem_id`     VARCHAR(30)    NOT NULL    COMMENT '아이디', 
    `mem_pw`     VARCHAR(30)    NOT NULL    COMMENT '비밀번호', 
    `mem_name`   VARCHAR(50)    NOT NULL    COMMENT '이름', 
    `mem_phone`  VARCHAR(20)    NOT NULL    COMMENT '연락처', 
    `mem_email`  VARCHAR(50)    NOT NULL    COMMENT '이메일', 
    `mem_refri`  VARCHAR(50)    NOT NULL    COMMENT '냉장고 종류', 
    `joined_at`  DATETIME       NOT NULL    COMMENT '가입일자', 
    `mem_type`   VARCHAR(10)    NOT NULL    COMMENT '회원유형', 
     PRIMARY KEY (mem_id)
);

-- 테이블 Comment 설정 SQL - members
ALTER TABLE members COMMENT '회원';


-- ingredients Table Create SQL
-- 테이블 생성 SQL - ingredients
CREATE TABLE ingredients
(
    `ingre_idx`     INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '재료 식별자', 
    `ingre_name`    VARCHAR(50)     NOT NULL    COMMENT '재료 이름', 
    `mem_id`        VARCHAR(30)     NOT NULL    COMMENT '회원 아이디', 
    `purchased_at`  DATE            NOT NULL    COMMENT '구매 일자', 
    `expired_at`    DATE            NOT NULL    COMMENT '유통 기한', 
    `ingre_stock`   INT             NOT NULL    COMMENT '재고 수량', 
    `ingre_loc`     INT             NOT NULL    COMMENT '저장 위치', 
     PRIMARY KEY (ingre_idx)
);

-- 테이블 Comment 설정 SQL - ingredients
ALTER TABLE ingredients COMMENT '냉장고 재료 성분';

-- Foreign Key 설정 SQL - ingredients(mem_id) -> members(mem_id)
ALTER TABLE ingredients
    ADD CONSTRAINT FK_ingredients_mem_id_members_mem_id FOREIGN KEY (mem_id)
        REFERENCES members (mem_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - ingredients(mem_id)
-- ALTER TABLE ingredients
-- DROP FOREIGN KEY FK_ingredients_mem_id_members_mem_id;


-- orders Table Create SQL
-- 테이블 생성 SQL - orders
CREATE TABLE orders
(
    `order_idx`   INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '주문 식별자', 
    `mem_id`      VARCHAR(30)     NOT NULL    COMMENT '회원 아이디', 
    `ingre_idx`   INT UNSIGNED    NOT NULL    COMMENT '식재료 식별자', 
    `order_cnt`   INT             NOT NULL    COMMENT '주문 수량', 
    `ordered_at`  DATETIME        NOT NULL    COMMENT '주문 날짜', 
     PRIMARY KEY (order_idx)
);

-- 테이블 Comment 설정 SQL - orders
ALTER TABLE orders COMMENT '주문예약';

-- Foreign Key 설정 SQL - orders(mem_id) -> members(mem_id)
ALTER TABLE orders
    ADD CONSTRAINT FK_orders_mem_id_members_mem_id FOREIGN KEY (mem_id)
        REFERENCES members (mem_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - orders(mem_id)
-- ALTER TABLE orders
-- DROP FOREIGN KEY FK_orders_mem_id_members_mem_id;

-- Foreign Key 설정 SQL - orders(ingre_idx) -> ingredients(ingre_idx)
ALTER TABLE orders
    ADD CONSTRAINT FK_orders_ingre_idx_ingredients_ingre_idx FOREIGN KEY (ingre_idx)
        REFERENCES ingredients (ingre_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - orders(ingre_idx)
-- ALTER TABLE orders
-- DROP FOREIGN KEY FK_orders_ingre_idx_ingredients_ingre_idx;


-- images Table Create SQL
-- 테이블 생성 SQL - images
CREATE TABLE images
(
    `img_idx`    INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '이미지 식별자', 
    `img_name`   VARCHAR(100)     NOT NULL    COMMENT '이미지 이름', 
    `img_rname`  VARCHAR(1000)    NOT NULL    COMMENT '이미지 실제 이름', 
    `img_ext`    VARCHAR(10)      NOT NULL    COMMENT '이미지 확장자', 
    `img_size`   INT              NOT NULL    COMMENT '이미지 사이즈', 
    `ingre_idx`  INT UNSIGNED     NOT NULL    COMMENT '재료 식별자', 
    `img_color`  VARCHAR(20)      NULL        COMMENT '이미지 칼라', 
     PRIMARY KEY (img_idx)
);

-- 테이블 Comment 설정 SQL - images
ALTER TABLE images COMMENT '이미지정보';

-- Foreign Key 설정 SQL - images(ingre_idx) -> ingredients(ingre_idx)
ALTER TABLE images
    ADD CONSTRAINT FK_images_ingre_idx_ingredients_ingre_idx FOREIGN KEY (ingre_idx)
        REFERENCES ingredients (ingre_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - images(ingre_idx)
-- ALTER TABLE images
-- DROP FOREIGN KEY FK_images_ingre_idx_ingredients_ingre_idx;


-- boards Table Create SQL
-- 테이블 생성 SQL - boards
CREATE TABLE boards
(
    `bo_idx`      INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '글 식별자', 
    `bo_title`    VARCHAR(1500)    NOT NULL    COMMENT '글 제목', 
    `bo_content`  TEXT             NOT NULL    COMMENT '글 내용', 
    `bo_file`     VARCHAR(1000)    NOT NULL    COMMENT '글 첨부파일', 
    `created_at`  DATETIME         NOT NULL    COMMENT '글 작성일자', 
    `bo_views`    INT              NOT NULL    COMMENT '글 조회수', 
    `bo_likes`    INT              NOT NULL    COMMENT '글 좋아요수', 
    `mem_id`      VARCHAR(30)      NOT NULL    COMMENT '글 작성자', 
     PRIMARY KEY (bo_idx)
);

-- 테이블 Comment 설정 SQL - boards
ALTER TABLE boards COMMENT '게시판';

-- Foreign Key 설정 SQL - boards(mem_id) -> members(mem_id)
ALTER TABLE boards
    ADD CONSTRAINT FK_boards_mem_id_members_mem_id FOREIGN KEY (mem_id)
        REFERENCES members (mem_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - boards(mem_id)
-- ALTER TABLE boards
-- DROP FOREIGN KEY FK_boards_mem_id_members_mem_id;


-- comments Table Create SQL
-- 테이블 생성 SQL - comments
CREATE TABLE comments
(
    `cmt_idx`      INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '댓글 식별자', 
    `bo_idx`       INT UNSIGNED    NOT NULL    COMMENT '원글 식별자', 
    `cmt_content`  VARCHAR(900)    NOT NULL    COMMENT '댓글 내용', 
    `created_at`   DATETIME        NOT NULL    COMMENT '댓글 작성일자', 
    `mem_id`       VARCHAR(30)     NOT NULL    COMMENT '댓글 작성자', 
    `cmt_likes`    INT             NOT NULL    COMMENT '댓글 공감수', 
     PRIMARY KEY (cmt_idx)
);

-- 테이블 Comment 설정 SQL - comments
ALTER TABLE comments COMMENT '댓글';

-- Foreign Key 설정 SQL - comments(mem_id) -> members(mem_id)
ALTER TABLE comments
    ADD CONSTRAINT FK_comments_mem_id_members_mem_id FOREIGN KEY (mem_id)
        REFERENCES members (mem_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - comments(mem_id)
-- ALTER TABLE comments
-- DROP FOREIGN KEY FK_comments_mem_id_members_mem_id;







