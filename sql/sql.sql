-- 음원 테이블 
create table music (
    m_no number primary key,
    m_name varchar2(100) not null,
    m_cont varchar2(1000),
    m_album varchar2(100) not null,
    m_artist varchar2(100) not null,
    m_like number default 0,
    m_audio varchar2(50) not null,
    m_mv varchar2(50) not null,
    m_image varchar2(50) not null,
    m_pcount number default 0,
    m_ptime number not null,
    m_lyrics varchar2(1000) not null,
    m_date date,
    m_update date
);

create table music_user (
    user_no number primary key,
    user_id varchar2(50) unique not null,
    user_pwd varchar2(100) not null,
    user_name varchar(20) not null,
    user_gender varchar2(20),
    user_email varchar2(100) not null,
    user_phone varchar2(30),
    user_purchase char(5) check(user_purchase in('false', 'true')),
    user_regdate date,
    user_update date
);

-- 음원별 댓글 테이블
create table m_reply (
    m_no number references music(m_no),
    mr_no number primary key,
    mr_cont varchar2(100) not null,
    mr_writer varchar2(10) references music_user(user_id),
    mr_date date,
    mr_update date,
    mr_group number default 0,
    mr_layer number default 0
);

-- 영상별 댓글 테이블
create table v_reply (
    v_no number references music(m_no),
    vr_no number primary key,
    vr_cont varchar2(100) not null,
    vr_writer varchar2(10) references music_user(user_id),
    vr_date date,
    vr_update date,
    vr_group number default 0,
    vr_layer number default 0
);

-- 공지사항 테이블
create table music_notice (
   music_no number(5) primary key,      -- 공지사항 글 번호
   music_writer varchar2(30) not null,  -- 공지사항 글 작성자
   music_title varchar2(1000) not null, -- 공지사항 글 제목
   music_cont varchar2(2000) not null,  -- 공지사항 글 내용
   music_pwd varchar2(30) not null,     -- 공지사항 글 비밀번호
   music_hit number(10) default 0,      -- 공지사항 글 조회수
   music_date date,                     -- 공지사항 글 작성일자
   music_update date                -- 공지사항 글 수정일자 
);

-- 이벤트 테이블
create table music_event (
   event_no number(5) primary key,      -- 이벤트 글 번호
   event_writer varchar2(30) not null,  -- 이벤트 글 작성자
   event_title varchar2(1000) not null, -- 이벤트 글 제목
   event_cont varchar2(2000) not null,  -- 이벤트 글 내용
   event_pwd varchar2(30) not null,     -- 이벤트 글 비밀번호
   event_hit number(10) default 0,      -- 이벤트 글 조회수
   event_date date,                     -- 이벤트 글 작성일자
   event_update date                -- 이벤트 글 수정일자 
);

-- 회원별 플레이리스트
create table music_playlist (
	user_no number not null,		-- 회원 번호
	m_no number not null,			-- 곡 번호
	m_order number not null,		-- 플레이리스트 내 순서
	playlist_order number not null,		-- 플레이리스트 순서
	playlist_no number not null,		-- 플레이리스트 번호
	playlist_name varchar2(1000) not null,	-- 플레이리스트 이름
	playlist_thumbnail varchar2(50)		-- 플레이리스트 섬네일
);

-- 회원별 음원
create table music_by_user (
	user_no number not null,	-- 회원 번호
	m_no number not null,		-- 곡 번호
	play_date date,			-- 플레이리스트 내 순서
	play_thumbs  varchar2(5) check(play_thumbs in('false', 'true')),		-- '좋아요' 여부
	play_counts number,		-- 곡 플레이 횟수
	constraint music_by_user_PK primary key(user_no, m_no)
);

insert into music_member
    values('1','admin', '1234', '관리자', '','admin@naver.com','010-1234-5678','0', sysdate ,'');

