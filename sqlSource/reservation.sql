CREATE TABLE BASKET_STAY_ACCOM (
    BASKET_CODE VARCHAR2(30) PRIMARY KEY  --BAS_001, BAS_002
    , SUB_ACCOM_CODE VARCHAR2(30) REFERENCES SUB_ACCOM(SUB_ACCOM_CODE)--수정해야 함
    , MEMBER_ID VARCHAR2(50) REFERENCES JEJU_MEMBER(MEMBER_ID)--수정해야 함
    , STAY_START_DATE VARCHAR2(20)
    , STAY_END_DATE VARCHAR2(20)
    , STAY_TERM NUMBER
    , DAY_USE VARCHAR2(10) DEFAULT 'N'
);

CREATE TABLE RESERVATION_STAY_ACCOM(
 RESERVATION_CODE  VARCHAR2(30) PRIMARY KEY --RES_001, RES_002
 , SUB_ACCOM_CODE VARCHAR2(30) REFERENCES SUB_ACCOM(SUB_ACCOM_CODE)--수정해야 함
 , MEMBER_ID VARCHAR2(50) REFERENCES JEJU_MEMBER(MEMBER_ID)--수정해야 함
 , STAY_START_DATE VARCHAR2(20)
 , STAY_END_DATE VARCHAR2(20)
 , RESERVATION_DATE DATE DEFAULT SYSDATE
 , RESERVATION_NAME VARCHAR2(20)
 , RESERVATION_PRICE NUMBER
 , DAY_USE VARCHAR2(10)
);
-- 테스트용 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
DROP TABLE BASKET_STAY_ACCOM;
DROP TABLE RESERVATION_STAY_ACCOM;
DROP TABLE SUB_ACCOM;
DROP TABLE JEJU_MEMBER;

CREATE TABLE SU_ACCOM(
SUB_ACCOM_CODE VARCHAR2(30) PRIMARY KEY
, ACCOM_START_TIME VARCHAR2(30) DEFAULT '11:00:00'
, ACCOM_END_TIME VARCHAR2(30) DEFAULT '09:00:00'
);

CREATE TABLE JEJ_MEMBER(
MEMBER_ID VARCHAR2(50) PRIMARY KEY
);

INSERT INTO SU_ACCOM(SUB_ACCOM_CODE)
VALUES ('SU_001');
INSERT INTO SU_ACCOM(SUB_ACCOM_CODE)
VALUES ('SU_002');


INSERT INTO JEJ_MEMBER(MEMBER_ID)
VALUES ('JEJ_001');
INSERT INTO JEJ_MEMBER(MEMBER_ID)
VALUES ('JEJ_002');

SELECT* FROM JEJ_MEMBER;
SELECT* FROM SU_ACCOM;
SELECT* FROM BASKET_STAY_ACCOM;
SELECT* FROM RESERVATION_STAY_ACCOM;

DELETE FROM RESERVATION_STAY_ACCOM WHERE RESERVATION_CODE='RESERV_002';

INSERT INTO BASKET_STAY_ACCOM(BASKET_CODE
, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, STAY_TERM)
VALUES((SELECT 'BAS_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(BASKET_CODE,5))),0)+1,3,'0')FROM BASKET_STAY_ACCOM)
, 'SU_001'
, 'JEJ_001'
, '2023-10-27', '2023-10-30', 2);

INSERT INTO BASKET_STAY_ACCOM(BASKET_CODE
, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, STAY_TERM)
VALUES((SELECT 'BAS_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(BASKET_CODE,5))),0)+1,3,'0')FROM BASKET_STAY_ACCOM)
, 'SU_001'
, 'JEJ_001'
, '2023-10-23', '2023-10-26', 2);

INSERT INTO RESERVATION_STAY_ACCOM(
RESERVATION_CODE, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, RESERVATION_PRICE)
VALUES((SELECT 'RESERV_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RESERVATION_CODE,8))),0)+1,3,'0')FROM RESERVATION_STAY_ACCOM)
, 'SU_001'
, 'JEJ_001'
, '2023-10-23', '2023-10-26'
,30000);
INSERT INTO RESERVATION_STAY_ACCOM(
RESERVATION_CODE, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, RESERVATION_PRICE)
VALUES((SELECT 'RESERV_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RESERVATION_CODE,8))),0)+1,3,'0')FROM RESERVATION_STAY_ACCOM)
, 'SU_001'
, 'JEJ_001'
, '2023-10-27', '2023-10-30'
,30000);

INSERT INTO RESERVATION_STAY_ACCOM(
RESERVATION_CODE, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, RESERVATION_PRICE)
VALUES((SELECT 'RESERV_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RESERVATION_CODE,8))),0)+1,3,'0')FROM RESERVATION_STAY_ACCOM)
, 'SU_001'
, 'JEJ_001'
, to_date((SELECT '2023-11-27'||ACCOM_START_TIME FROM SU_ACCOM
WHERE SUB_ACCOM_CODE='SU_001'),'YYYY-MM-DDHH:MI:SS'),  to_date((SELECT '2023-11-30'||ACCOM_END_TIME FROM SU_ACCOM
WHERE SUB_ACCOM_CODE='SU_001'),'YYYY-MM-DDHH:MI:SS')
,30000);

SELECT '2023/11/27 '||ACCOM_START_TIME FROM SU_ACCOM
WHERE SUB_ACCOM_CODE='SU_001';

SELECT TO_DATE(('2023-11-27'||ACCOM_START_TIME),'YYYY-MM-DDHH:MI:SS') FROM SU_ACCOM
WHERE SUB_ACCOM_CODE='SU_001';





SELECT RESERVATION_CODE
,  TO_CHAR(STAY_START_DATE, 'YYYY-MM-DD HH24:MI:SS') AS STAY_START_DATE
, TO_CHAR(STAY_END_DATE, 'YYYY-MM-DD HH24:MI:SS') AS STAY_END_DATE
FROM RESERVATION_STAY_ACCOM
WHERE SUB_ACCOM_CODE = 'SU_001';
-- 테스트용 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ끝

--SELECT RESERVATION_CODE
--,  TO_CHAR(STAY_START_DATE, 'YYYY-MM-DD HH24:MI:SS')
--, TO_CHAR(STAY_END_DATE, 'YYYY-MM-DD HH24:MI:SS')
--FROM RESERVATION_STAY_ACCOM
--WHERE SUB_ACCOM_CODE = #{};


--장바구니에 추가
--INSERT INTO BASKET_STAY_ACCOM(BASKET_CODE
--, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, STAY_TERM)
--VALUES((SELECT 'BAS_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(BASKET_CODE,5))),0)+1,3,'0')FROM BASKET_STAY_ACCOM)
--, #{방외래}, #{회원외래}
--, #{시작날짜}, #{끝날짜}, #{기간});


--결제시 위의 쿼리를 실행전 비동기로 비교후 가능 여부에 따라 결제
--SELECT RESERVATION_CODE
--,  TO_CHAR(STAY_START_DATE, 'YYYY-MM-DD HH24:MI:SS')
--, TO_CHAR(STAY_END_DATE, 'YYYY-MM-DD HH24:MI:SS')
--FROM RESERVATION_STAY_ACCOM
--WHERE SUB_ACCOM_CODE = #{};



--결제시 추가
--INSERT INTO RESERVATION_STAY_ACCOM(
--RESERVATION_CODE, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, RESERVATION_PRICE)
--VALUES((SELECT 'RESERV_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RESERVATION_CODE,8))),0)+1,3,'0')FROM RESERVATION_STAY_ACCOM)
--,#{},#{}
--,#{},#{},#{})



--결제시 추가 수정(체크 인/아웃 시간 가격계산 추가)
--INSERT INTO RESERVATION_STAY_ACCOM(
--RESERVATION_CODE, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, RESERVATION_PRICE)
--VALUES((SELECT 'RESERV_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RESERVATION_CODE,8))),0)+1,3,'0')FROM RESERVATION_STAY_ACCOM)
--, #{방외래}, #{회원외래}
--, to_date((SELECT (SELECT TO_CHAR(STAY_START_DATE, 'YYYY-MM-DD') FROM BASKET_STAY_ACCOM WHERE BASKET_CODE =#{장바구니 코드})||(ACCOM_START_TIME FROM SUB_ACCOM
--WHERE SUB_ACCOM_CODE=#{방외래})),'YYYY-MM-DDHH:MI:SS')
--, to_date((SELECT #{끝날짜}||(ACCOM_END_TIME FROM SUB_ACCOM
--WHERE SUB_ACCOM_CODE=#{방외래})),'YYYY-MM-DDHH:MI:SS')
--, #{SELECT STAY_TERM*ACCOM_PRICE FROM BASKET_STAY_ACCOM, SUB_ACCOM
--WHERE BASKET_STAY_ACCOM.SUB_ACCOM_CODE=SUB_ACCOM.SUB_ACCOM_CODE
--AND BASKET_CODE =#{장바구니 코드}
--})

--최종수정 장바구니 코드만 가지고 추가하기
INSERT INTO RESERVATION_STAY_ACCOM(
RESERVATION_CODE, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, RESERVATION_PRICE)
VALUES((SELECT 'RESERV_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RESERVATION_CODE,8))),0)+1,3,'0')FROM RESERVATION_STAY_ACCOM)
, (SELECT BAS.SUB_ACCOM_CODE
, MEMBER_ID
, TO_DATE((TO_CHAR(STAY_START_DATE, 'YYYY-MM-DD')||ACCOM_START_TIME),'YYYY-MM-DDHH:MI:SS') AS STAY_START_DATE
, TO_DATE((TO_CHAR(STAY_END_DATE, 'YYYY-MM-DD')||ACCOM_END_TIME),'YYYY-MM-DDHH:MI:SS') AS STAY_END_DATE
, (STAY_TERM*ACCOM_PRICE) AS RESERVATION_PRICE
FROM BASKET_STAY_ACCOM BAS, SUB_ACCOM SUB
WHERE BASKET_CODE = #{장바구니 코드}
AND BAS.SUB_ACCOM_CODE=SUB.SUB_ACCOM_CODE));

--파이널 라스트 수정
INSERT INTO RESERVATION_STAY_ACCOM(
RESERVATION_CODE, SUB_ACCOM_CODE, MEMBER_ID, STAY_START_DATE, STAY_END_DATE, RESERVATION_PRICE)
SELECT (SELECT 'RESERV_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RESERVATION_CODE,8))),0)+1,3,'0') FROM RESERVATION_STAY_ACCOM)  AS RESERVATION_CODE
, BAS.SUB_ACCOM_CODE
, MEMBER_ID
, TO_DATE((TO_CHAR(STAY_START_DATE, 'YYYY-MM-DD')||ACCOM_START_TIME),'YYYY-MM-DDHH:MI:SS') AS STAY_START_DATE
, TO_DATE((TO_CHAR(STAY_END_DATE, 'YYYY-MM-DD')||ACCOM_END_TIME),'YYYY-MM-DDHH:MI:SS') AS STAY_END_DATE
, (STAY_TERM*ACCOM_PRICE) AS RESERVATION_PRICE
FROM BASKET_STAY_ACCOM BAS, SUB_ACCOM SUB
WHERE BASKET_CODE = #{장바구니 코드}
AND BAS.SUB_ACCOM_CODE=SUB.SUB_ACCOM_CODE;


--결제시 장바구니삭제
--DELETE FROM BASKET_STAY_ACCOM
--WHERE BASKET_CODE=#{basketCode}


DROP TABLE SPOT;

CREATE TABLE  SPOT(
SPOT_CODE  VARCHAR2(30) PRIMARY KEY 
 ,SPOT_NAME  VARCHAR2(400)
 ,SPOT_ADDR  VARCHAR2(400)
);

SELECT* FROM SPOT;
-- 식당-관광지-관광지-식당
--UNION ALL  FROM DUAL
INSERT INTO SPOT(
SPOT_CODE
 ,SPOT_NAME
 ,SPOT_ADDR)
 SELECT
 (SELECT 'RES_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(SPOT_CODE,5))),0)+1,3,'0')FROM SPOT)
 ,'델문도_카파이풋 도두점_도치돌알파카목장_고집돌우럭 함덕점'
 ,'제주특별자치도 제주시 조천읍 조함해안로 519-10 1층_제주 제주시 백포북길 23 카파이풋 도두점_제주 제주시 애월읍 도치돌길 303 도치돌알파카목장_제주특별자치도 제주시 조천읍 조함해안로 519-10 1층' FROM DUAL
 UNION ALL 
 SELECT
 (SELECT 'RES_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(SPOT_CODE,5))),0)+2,3,'0')FROM SPOT)
 ,'올래국수 본점_새별오름_아쿠아플라넷 제주_더클리프'
 ,'제주특별자치도 제주시 귀아랑길 24 1층_제주 제주시 애월읍 봉성리 산59-8_제주 서귀포시 성산읍 섭지코지로 95 아쿠아플라넷 제주_제주특별자치도 서귀포시 중문관광로 154-17' FROM DUAL
UNION ALL 
 SELECT
 (SELECT 'RES_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(SPOT_CODE,5))),0)+3,3,'0')FROM SPOT)
 ,'오는정김밥_쇠소깍_카멜리아힐_랜디스도넛 제주애월점'
 ,'제주특별자치도 서귀포시 동문동로 2_제주 서귀포시 쇠소깍로 104_제주 서귀포시 안덕면 병악로 166_제주특별자치도 제주시 애월읍 애월로 27-1' FROM DUAL
 UNION ALL 
 SELECT
 (SELECT 'RES_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(SPOT_CODE,5))),0)+4,3,'0')FROM SPOT)
 ,'우무_스누피가든_에코랜드 테마파크네이버페이_색달식당'
 ,'제주특별자치도 제주시 한림읍 한림로 542-1 가동 1층_제주 제주시 구좌읍 금백조로 930_제주 제주시 조천읍 번영로 1278-169_제주특별자치도 서귀포시 예래로 255-18 1층' FROM DUAL
 UNION ALL 
 SELECT
 (SELECT 'RES_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(SPOT_CODE,5))),0)+5,3,'0')FROM SPOT)
 ,'제주김만복 김밥 본점_금오름_헬로키티아일랜드_제주광해 애월본점'
 ,'제주특별자치도 제주시 오라로 41_제주 제주시 한림읍 금악리 산1-1_제주 서귀포시 안덕면 한창로 340_제주특별자치도 제주시 애월읍 애월해안로 867 2층' FROM DUAL
 UNION ALL 
 SELECT
 (SELECT 'RES_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(SPOT_CODE,5))),0)+6,3,'0')FROM SPOT)
 ,'숙성도 노형점_용머리해안_마노르블랑_원앤온리'
 ,'제주특별자치도 제주시 원노형로 41_제주 서귀포시 안덕면 사계리 112-3_제주 서귀포시 안덕면 일주서로2100번길 46 1층_제주특별자치도 서귀포시 안덕면 산방로 141 원앤온리' FROM DUAL
UNION ALL 
 SELECT
 (SELECT 'RES_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(SPOT_CODE,5))),0)+7,3,'0')FROM SPOT)
 ,'우진해장국_테디베어뮤지엄_9.81 파크 제주_고집돌우럭 제주공항점'
 ,'제주특별자치도 제주시 서사로 11 1층_제주 서귀포시 중문관광로110번길 31_제주 제주시 애월읍 천덕로 880-24_제주특별자치도 제주시 임항로 30' FROM DUAL
;
