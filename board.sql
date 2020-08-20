drop table board;

-- 게시판
create table board (
    bno         NUMBER(10)		not null,
    title		varchar2(200)	not null,
    content		varchar2(2000)	not null,	
    writer		varchar2(50)	not null,
    regdate		date default sysdate,
    updatedate	date default sysdate,
    replycnt	number default 0
);

alter table board add constraint pk_board primary key(bno);

create sequence seq_board;

select * from board;


create index idx_reply on board_reply(bno desc,rno asc);