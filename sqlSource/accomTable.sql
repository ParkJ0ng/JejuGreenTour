
CREATE TABLE MAIN_ACCOM (
    ACCOM_CODE VARCHAR2(50) PRIMARY KEY
    , ACCOM_NAME VARCHAR2(50) NOT NULL
    , ACCOM_ADDR VARCHAR2(100)
    , ACCOM_INTRO VARCHAR2(100)
    , ACCOM_CEO VARCHAR2(50) REFERENCES JEJU_MEMBER(MEMBER_ID)
    , ACCOM_CATE VARCHAR2(30)
    , ADDR_DETAIL VARCHAR2(100)
    , ACCOM_LOC VARCHAR2(30)
);

CREATE TABLE MAIN_ACCOM_IMG (
    MAIN_IMG_CODE VARCHAR2(20) PRIMARY KEY
    , ORIGIN_FILE_NAME VARCHAR2(100)
    , ATTACHED_FILE_NAME VARCHAR2(100)
    , ACCOM_CODE VARCHAR2(50) NOT NULL, FOREIGN KEY (ACCOM_CODE) REFERENCES MAIN_ACCOM(ACCOM_CODE)
    , IS_MAIN VARCHAR2(3)
);

CREATE TABLE SUB_ACCOM (
    SUB_ACCOM_CODE VARCHAR2(50) PRIMARY KEY
    , ACCOM_CODE VARCHAR2(50) NOT NULL, FOREIGN KEY (ACCOM_CODE) REFERENCES MAIN_ACCOM(ACCOM_CODE)
    , SUB_ACCOM_NAME VARCHAR2(50)
    , SUB_ACCOM_INTRO VARCHAR2(100)
    , SUB_ACCOM_CATE VARCHAR2(50)
    , BASIC_MAN NUMBER
    , MAX_MAN NUMBER
    , ACCOM_START_TIME VARCHAR2(30)
    , ACCOM_END_TIME VARCHAR2(30)
    , RENT_TIME VARCHAR2(30)
    , DAYUSE_PRICE VARCHAR2(30)
    , RESERVATION_PRICE VARCHAR2(30)
    , SOLD_OUT VARCHAR2(3) DEFAULT 'N'
    , DAY_USE_CAN VARCHAR2(3) DEFAULT 'N'
    , SUB_DELETE VARCHAR2(3) DEFAULT 'N'
);

CREATE TABLE SUB_ACCOM_IMG (
    SUB_IMG_CODE VARCHAR2(20) PRIMARY KEY
    , ORIGIN_FILE_NAME VARCHAR2(100)
    , ATTACHED_FILE_NAME VARCHAR2(100)
    , SUB_ACCOM_CODE VARCHAR2(50) NOT NULL, FOREIGN KEY (SUB_ACCOM_CODE) REFERENCES SUB_ACCOM(SUB_ACCOM_CODE)
    , IS_MAIN VARCHAR2(3)
);

CREATE TABLE ACCOM_CATEGORY(
    ACCOM_CATE VARCHAR2(50) PRIMARY KEY
    , CATE_NAME VARCHAR2(30)
);

INSERT INTO ACCOM_CATEGORY (ACCOM_CATE, CATE_NAME) VALUES ('CATE_001', '호텔');
INSERT INTO ACCOM_CATEGORY (ACCOM_CATE, CATE_NAME) VALUES ('CATE_002', '모텔');
INSERT INTO ACCOM_CATEGORY (ACCOM_CATE, CATE_NAME) VALUES ('CATE_003', '펜션');
INSERT INTO ACCOM_CATEGORY (ACCOM_CATE, CATE_NAME) VALUES ('CATE_004', '글램핑');