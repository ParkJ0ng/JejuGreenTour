CREATE TABLE JEJU_MEMBER(
    MEMBER_ID VARCHAR2(50) CONSTRAINT PK_MEMBER PRIMARY KEY
    , MEMBER_PW VARCHAR2(50) NOT NULL
    , MEMBER_NAME VARCHAR2(50) NOT NULL
    , MEMBER_TEL VARCHAR2(30) UNIQUE -- 010-1111-2222
    , MEMBER_ADDR VARCHAR2(100)
    , ADDR_DETAIL VARCHAR2(100)
    , MEMBER_EMAIL VARCHAR2(100)
    , GENDER VARCHAR2(5) ---- '남','여'
    , MEMBER_ROLL VARCHAR2(5) DEFAULT 'USER' -- 'USER'(일반회원), 'ADMIN'(페이지 관리자) , '???'(업소등록 회원)

);


DROP TABLE JEJU_MEMBER;

--어드민 등록
INSERT INTO JEJU_MEMBER(
    MEMBER_ID
    , MEMBER_PW
    , MEMBER_NAME
    , MEMBER_TEL
    , MEMBER_ADDR
    , ADDR_DETAIL
    , MEMBER_EMAIL
    , GENDER
)VALUES(
    'admin'
    , '1q2w3e4r'
    , '관리자'
    , '010-1111-1111'
    , '울산시'
    , '제주그린사옥'
    , 'admin@jejugreen.com'
    , '남'
);

--테스터 회원 등록
INSERT INTO JEJU_MEMBER(
    MEMBER_ID
    , MEMBER_PW
    , MEMBER_NAME
    , MEMBER_TEL
    , MEMBER_ADDR
    , ADDR_DETAIL
    , MEMBER_EMAIL
    , GENDER
)VALUES(
    'guest'
    , '1q2w3e4r'
    , '엄준식'
    , '010-1111-1112'
    , '울산시'
    , '제주그린사옥'
    , 'HowNameIsEom@jejugreen.com'
    , '남'
);

SELECT * FROM JEJU_MEMBER;

UPDATE JEJU_MEMBER
SET MEMBER_ROLL = 'ADMIN'
WHERE MEMBER_ID = 'admin';



COMMIT;