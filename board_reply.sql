drop table board_reply;

-- 게시판 댓글
create table board_reply (
	rno		number(10)
);

alter table board_reply add constraint pk_reply primary key(rno);
alter table board_reply add constraint fk_board_reply foreign key(bno) references board(bno);

create sequence seq_reply;

select * from board_reply;