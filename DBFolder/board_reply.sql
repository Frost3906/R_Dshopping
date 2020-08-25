drop table board_reply;

-- 게시판 댓글
create table board_reply (
	rno		number(10),						-- 댓글 글 번호
	bno		number(10)		not null,		-- 원본 글 번호
	reply 	varchar2(1000)	not null,		-- 댓글 내용
	replyer	varchar2(50)	not null,		-- 댓글 작성자
	replydate	date default	sysdate,	-- 댓글 작성일
	updatedate	date default	sysdate		-- 댓글 수정일
);

alter table board_reply add constraint pk_reply primary key(rno);
alter table board_reply add constraint fk_board_reply foreign key(bno) references board(bno);

create sequence seq_reply;

select * from board_reply;