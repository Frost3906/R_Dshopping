drop table board;

-- 게시판
create table board (
    bno         NUMBER(10)		not null,
    title		varchar2(200)	not null,
    content		varchar2(2000)	not null,	
    writer		varchar2(50)	not null,
    regdate		date,
    updatedate	date,
    replycnt	number
);

alter table board add constraint pk_board primary key(bno);

select * from board;