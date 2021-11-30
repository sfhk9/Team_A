
/* Drop Tables */

DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE FAQ_user CASCADE CONSTRAINTS;
DROP TABLE orderCancel CASCADE CONSTRAINTS;
DROP TABLE orderList CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE goodsinfo CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;
DROP TABLE admininfo;



/* Create Tables */
CREATE TABLE cart
(
	unq number NOT NULL,
	-- 사용자정보테이블의 userid
	userid varchar2(100) NOT NULL,
	-- 상품 테이블의 g_unq
	goodsunq number NOT NULL,
	csize number NOT NULL,
	color varchar2(10) NOT NULL,
	PRIMARY KEY (unq)
);


CREATE TABLE FAQ
(
	
	unq number NOT NULL,
	title varchar2(100) NOT NULL,
	name varchar2(50) NOT NULL,
	content varchar2(4000) NOT NULL,
	-- 회원혜택/서비스
	-- 주문결제
	-- 상품
	-- 배송
	-- 취소/반품
	-- 회원정보
	-- 기타
	category varchar2(5) check(category in ('SVC','ORD','GDS','DLV','CNL','MEM','ETC')),
	rdate timestamp NOT NULL,
	udate timestamp NOT NULL,
	hits number DEFAULT 0 NOT NULL,
	filename varchar2(50) UNIQUE,
	PRIMARY KEY (unq)
);


CREATE TABLE FAQ_user
(
	unq number NOT NULL,
	title varchar2(100) NOT NULL,
	userid varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	-- 회원혜택/서비스
	-- 주문결제
	-- 상품
	-- 배송
	-- 취소/반품
	-- 회원정보
	-- 기타
	category varchar2(5) NOT NULL check(category in ('SVC','ORD','GDS','DLV','CNL','MEM','ETC')),
	rdate timestamp NOT NULL,
	udate timestamp NOT NULL,
	hits number default 0 NOT NULL,
	gid number,
	PRIMARY KEY (unq)
);


CREATE TABLE goodsinfo
(
	unq number NOT NULL,
	-- CLS : 옷
	-- SHO : 신발
	category varchar2(5) NOT NULL check (category in ('CLS','SHO')),
	-- SPT : 스포츠
	-- LES : 레저
	-- LIF : 일상
	ctg_type varchar2(5) NOT NULL check (ctg_type in ('SPT','LES','LIF')),
	-- N : 무관
	-- M : 남성용
	-- F : 여성용
	ctg_gender varchar2(3) NOT NULL check(ctg_gender in('N','M','F')),
	price number NOT NULL,
	csize varcahr2(50) NOT NULL,
	color varchar2(50) NOT NULL,
	-- 썸네일
	thumbnail varchar2(100) NOT NULL UNIQUE,
	-- 상품 설명용 이미지
	img_goods varchar2(300) NOT NULL UNIQUE,
	hits number default '0' NOT NULL,
	PRIMARY KEY (unq)
);


CREATE TABLE notice
(
	unq number NOT NULL,
	title varchar2(100) NOT NULL,
	name varchar2(20) NOT NULL,
	content varchar2(4000) NOT NULL,
	rdate timestamp NOT NULL,
	udate timestamp NOT NULL,
	hits number default 0 NOT NULL,
	-- 0 : 공지
	-- 1 : 이벤트
	category varchar2(5) check(category in ('NTC','EVT')),
	-- 공지사항용 파일 이름
	filename varchar2(50) UNIQUE,
	PRIMARY KEY (unq)
);


CREATE TABLE orderCancel
(
	unq number NOT NULL,
	orderunq number NOT NULL,
	reason varchar2(50),
	rdate timestamp NOT NULL,
	udate timestamp NOT NULL,
	-- 0 : 주문취소대기
	-- 1 : 반송확인
	-- 2 : 완료
	-- 3 : 오류
	stmt number NOT NULL check(stmt in(0,1,2,3)),
	PRIMARY KEY (unq)
);


CREATE TABLE orderList
(
	unq number NOT NULL,
	-- 사용자 정보 테이블의 userid
	userid varchar2(100) NOT NULL,
	-- 상품 정보 테이블의 unq
	goodsunq number NOT NULL,
	csize number NOT NULL,
	color varchar2(10) NOT NULL,
	-- 주문 배송 상태
	-- 0 : 결제 대기 
	-- 1 : 결제 취소
	-- 2 : 결제 완료
	-- 3 : 배송 준비
	-- 4 : 배송중
	-- 5 : 배송완료
	-- 6 : 거래완료
	-- 7 : 반송
	-- 8 : 오류
	stmt number NOT NULL check(stmt in (0,1,2,3,4,5,6,7,8)),
	PRIMARY KEY (unq)
);


CREATE TABLE QNA
(
	unq number NOT NULL,
	goodsunq number NOT NULL,
	title varchar2(100) NOT NULL,
	userid varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	rdate timestamp NOT NULL,
	udate timestamp NOT NULL,
	hits number default 0 NOT NULL,
	gid number,
	PRIMARY KEY (unq)
);


CREATE TABLE review
(
	unq number NOT NULL,
	goodsunq number NOT NULL,
	title varchar2(100) NOT NULL,
	userid varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	rdate timestamp NOT NULL,
	udate timestamp NOT NULL,
	hits number default 0 NOT NULL,
	img varchar2(100) UNIQUE,
	mark number default 3 check(mark in(1,2,3,4,5)),
	PRIMARY KEY (unq)
);


CREATE TABLE userinfo
(
	userid varchar2(100) NOT NULL,
	pass varchar2(100) NOT NULL,
	name varchar2(50) NOT NULL,
	birth date NOT NULL,
	phone varchar2(20) NOT NULL,
	email varchar2(100) NOT NULL,
	zipcode varchar2(6),
	address1 varchar2(100) NOT NULL,
	address2 varchar2(100) NOT NULL,
	rdate timestamp NOT NULL,
	udate timestamp NOT NULL,
	PRIMARY KEY (userid)
);


CREATE table admininfo 
(
    userid varchar2(100) PRIMARY KEY,
    pass varchar2(100) NOT NULL
);


/* Comments */

COMMENT ON COLUMN cart.userid IS '사용자정보테이블의 userid';
COMMENT ON COLUMN cart.g_unq IS '상품 테이블의 g_unq';
COMMENT ON COLUMN FAQ.category IS '회원혜택/서비스
주문결제
상품
배송
취소/반품
회원정보
기타';
COMMENT ON COLUMN FAQ_user.category IS '회원혜택/서비스
주문결제
상품
배송
취소/반품
회원정보
기타';
COMMENT ON COLUMN goodsinfo.category IS '0 : 옷
1 : 신발';
COMMENT ON COLUMN goodsinfo.ctg_type IS '0 : 스포츠
1 : 레저
2 : 일상';
COMMENT ON COLUMN goodsinfo.ctg_gender IS 'N : 무관
M : 남성용
F : 여성용';
COMMENT ON COLUMN goodsinfo.thumbnail IS '썸네일';
COMMENT ON COLUMN goodsinfo.img_goods IS '상품 설명용 이미지';
COMMENT ON COLUMN notice.category IS '0 : 공지
1 : 이벤트';
COMMENT ON COLUMN notice.filename IS '공지사항용 파일 이름';
COMMENT ON COLUMN orderCancel.stmt IS '0 : 주문취소대기
1 : 반송확인
2 : 완료
3 : 오류';
COMMENT ON COLUMN orderList.userid IS '사용자 정보 테이블의 userid';
COMMENT ON COLUMN orderList.g_unq IS '상품 정보 테이블의 unq';
COMMENT ON COLUMN orderList.stmt IS '주문 배송 상태
0 : 결제 대기 
1 : 결제 취소
2 : 결제 완료
3 : 배송 준비
4 : 배송중
5 : 배송완료
6 : 거래완료
7 : 반송
8 : 오류';



