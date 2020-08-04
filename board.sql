drop table board;
-- 게시판
create table board (
    bno         NUMBER(10)
    
);

alter table board add constraint pk_board primary key(bno);

select * from board;