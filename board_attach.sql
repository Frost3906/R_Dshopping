drop table board_attach;

-- 파일 첨부
create table board_attach(
	uuid		varchar2(100)	not null,
	uploadPath	varchar2(200)	not null,
	fileName	varchar2(100)	not null,
	fileType	char(1)	default	'I',
	bno number(10, 0)
);

alter table board_attach add constraint pk_attach primary key(uuid);
alter table board_attach add constraint fk_board_attach foreign key(bno) references board(bno);

select * from board_attach;

select * from board_attach where uploadpath = to_char(sysdate-1, 'yyyy/mm/dd');