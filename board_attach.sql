drop table board_attach;

-- 파일 첨부
create table board_attach(
	uuid	varchar2(100)	not null
);

alter table board_attach add constraint pk_attach primary key(uuid);
alter table board_attach add constraint fk_board_attach primary key(bno) references board(bno);

select * from board_attach;