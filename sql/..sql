-- 음원 테이블 
create table music (
    m_no number primary key,
    m_name varchar2(10) not null,
    m_cont varchar2(1000),
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

-- 음원별 댓글 테이블
create table m_reply (
    m_no number references music(m_no),
    mr_no number primary key,
    mr_cont varchar2(100) not null,
    mr_writer varchar2(10) references user(user_id),
    mr_date date,
    mr_update date,
    mr_group number default 0,
    mr_layer number default 0
);
