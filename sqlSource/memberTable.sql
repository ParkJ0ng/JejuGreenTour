DROP TABLE JEJU_MEMBER;

CREATE TABLE JEJU_MEMBER(
    MEMBER_ID VARCHAR2(50) CONSTRAINT PK_MEMBER PRIMARY KEY
    , MEMBER_PW VARCHAR2(50) NOT NULL
    , MEMBER_NAME VARCHAR2(50) NOT NULL
    , MEMBER_TEL VARCHAR2(30) UNIQUE -- 010-1111-2222
    , GENDER VARCHAR2(5) ---- '남','여'

);

--어드민 등록
INSERT INTO JEJU_MEMBER(
    MEMBER_ID
    , MEMBER_PW
    , MEMBER_NAME
    , MEMBER_TEL
    , GENDER
    , BIRTH_DATE
    , MEMBER_MAIL
)VALUES(
    'admin'
    , '1q2w3e4r'
    , '관리자'
    , '010-1111-1111'
    , '남'
    , '1996-01-01'
    , 'admin@jejutour.com'
);

--테스터 회원 등록
INSERT INTO JEJU_MEMBER(
    MEMBER_ID
    , MEMBER_PW
    , MEMBER_NAME
    , MEMBER_TEL
    , GENDER
    , BIRTH_DATE
    , MEMBER_MAIL
)VALUES(
    'guest'
    , '1q2w3e4r'
    , '엄준식'
    , '010-1111-1112'
    , '남'
    , '2000-01-01'
    , 'hownameiseom@jejutour.com'
);

SELECT * FROM JEJU_MEMBER;

UPDATE JEJU_MEMBER
SET MEMBER_ROLL = 'ADMIN'
WHERE MEMBER_ID = 'admin';



COMMIT;