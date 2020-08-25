drop table product;
drop view searchList;
delete product where p_code >= 0;
delete product where p_name like '%더미%';
update product set p_name='상품2' where p_code=0001;

select * from product;

commit;

select * from searchList;

create table product(
    P_code number(8) not null primary key,
    P_name varchar2(50) not null,
    P_price number(20) not null,
    P_stock number(10) default 0,
    P_rating number(3) default 0,
    P_content varchar2(100),
    P_category1 varchar2(30),
    P_category2 varchar2(30),
    P_category3 varchar2(30)
)

insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000000,'Apple iPhone77 S+',3000,500,1,'애플 아이폰77 S+','전자제품','스마트폰','애플');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000001,'LG 그램',5000,500,3,'1g 무게의 노트북','전자제품','컴퓨터','노트북');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000002,'Samsung Galaxy53',7000,500,5,'Samsung 갤럭시S53','전자제품','스마트폰','삼성');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000003,'Guess 티셔츠',9000,500,4,'Guess T-shirt','의류','남성의류','상의');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000004,'POLO 반팔셔츠',10000,500,2,'폴로 반팔 셔츠 95/100/105','의류','남성의류','하의');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000005,'IKEA 암체어',13000,500,3,'이케아의 암체어 상품','가구','의자','이케아');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000006,'Do it! Jump to Python',15000,500,4,'Python Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000007,'정보처리기사 실기 기본서',18000,500,2,'Computer Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(10000008,'정보처리기사 필기 기본서',18000,500,1,'Book','서적','컴퓨터','');
commit;
              
create view searchList AS
select p_code,upper(p_name) as p_name,p_price,p_stock,p_rating, upper(p_content) as p_content,p_category1,p_category2,p_category3,property from product;

select * from searchList where p_content like '%아이폰77%';


		select * 
		from product
		where p_code in 
		(select p_code 
		from searchList 
		where p_name like upper('%samsung%') or
			  p_code like '%samsung%' or 
			  p_content like upper('%samsung%'));
              
              select * from product;
              
select * from (
select rownum rno, product.* from product where p_code in 
		(select p_code 
		from searchList 
		where 
			p_name like upper('%'||''||'%') or 
			p_code like '%'||''||'%' or 
			p_content like upper('%'||''||'%') or 
			p_category1 like upper('%'||''||'%') or 
			p_category2 like upper('%'||''||'%') or 
			p_category3 like upper('%'||''||'%')
		)
        ) where rno>6;
        
select * from cart where email = 'admin';

create sequence spring_seq;
drop sequence spring_seq;

insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
insert into product(p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3) values(SPRING_SEQ.nextval,'더미Test',18000,500,1,'Book','서적','컴퓨터','');
commit;

select count( distinct p_category1) from product;
select distinct p_category1 from product;
select * from product;



	
select count(*) from ( 
    select product.* 
    from product
    where 
        p_category1 = '전자제품' and 
        p_category2 = '스마트폰' and 
        p_code in (
            select p_code 
            from searchList 
            where p_name like upper('%'||' '||'%'))
);
    
select * from searchList;
            select p_code 
            from searchList 
            where p_name like upper('%'||'App'||'%');
	
	<select id="searchKeyword" resultType="com.spring.domain.ProductVO" parameterType="java.util.List">
		select * from (
			select <![CDATA[rownum rno,]]>product.* from product where p_code in 
			(select p_code 
			from searchList 
			where 
			<foreach collection="keywordList" item="keyList" separator=" or ">
				p_name like upper('%'||#{keyList}||'%') or 
				p_code like '%'||#{keyList}||'%' or 
				p_content like upper('%'||#{keyList}||'%') or 
				p_category1 like upper('%'||#{keyList}||'%') or 
				p_category2 like upper('%'||#{keyList}||'%') or 
				p_category3 like upper('%'||#{keyList}||'%') 
			</foreach>
			)
		) where <![CDATA[rno>(#{pageNum}-1)*#{amount} and rno<=#{pageNum}*#{amount}]]>
	</select>
    
select * from product;


update product set (p_code,p_name,p_price,p_stock,p_rating,p_content,p_category1,p_category2,p_category3,property)=
(10000000,'Apple iPhone77 S+',3000,500,1,'애플 아이폰77 S+','전자제품','스마트폰','애플','');

update product
set p_code = 10000000,
    p_name = 'Apple iPhone77 S+',
    p_price = 3000,
    p_stock = 500,
    p_rating = 1,
    p_content = '애플 아이폰77 S+',
    p_category1 = '전자제품',
    p_category2 = '스마트폰',
    p_category3 = '애플',
    property = ''
    where p_code = 10000000;
    
select * from product;
commit;

select rownum rno, product.* from product;


select * from test_mem;

update test_mem set role = 'ROLE_ADMIN' where email = 'admin';
commit;

alter table test_mem rename column EMAIL to username;
select * from test_mem;

select * from test_mem;
select * from spring_member;
select * from spring_member_auth;
update spring_member set userid='admin@admin.com' where username='admin';
update spring_member_auth set userid='admin@admin.com' where userid='admin';

		select mem.userid, userpw, username, enabled, regdate, updatedate, auth
		from spring_member mem left outer join spring_member_auth auth on mem.userid = auth.userid
		where mem.userid = 'admin';
        
    select * from spring_attach;
    
select * from board_reply;
select * from board;
select * from (select /*+INDEX_DESC(board pk_board) */
						rownum rn, bno, title, writer, regdate, updatedate, replycnt
						from board
						where
			bno > 0 and rownum <= (1*10))
			where rn > (1-1)*10;
create index idx_reply on board_reply(bno desc,rno asc);

alter table board modify (replycnt default 0);

-- 시퀀스 초기화
1. 시퀀스의 현재 값을 확인
SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_BOARD';
2. 시퀀스의 INCREMENT 를 현재 값만큼 빼도록 설정 (아래는 현재값이 999999 일 경우)

ALTER SEQUENCE SEQ_BOARD INCREMENT BY -144;
3. 시퀀스에서 다음 값을 가져 온다

SELECT SEQ_BOARD.NEXTVAL FROM DUAL;
4. 현재 값을 확인 해보면 -999999 만큼 증가 했다

SELECT SEQ_BOARD.CURRVAL FROM DUAL;
5. 시퀀스의 INCREMENT 를 1로 설정 한다

ALTER SEQUENCE SEQ_BOARD INCREMENT BY 1;

create sequence seq_board;
drop sequence seq_board;

delete from board where bno>0;

select * from board_reply;
delete from board_reply where bno>0;

select * from board;
alter table board modify (content null);
commit;
delete from board where bno=62;
ALTER TABLE child_table_name 
  ADD CONSTRAINT fk_name 
  FOREIGN KEY (child_column_name) 
  REFERENCES parent_table_name(parent_column_name) 
  ON DELETE CASCADE;
  
-- delete cascade 제약조건 추가
alter table board_reply add constraint FK_BOARD_REPLY foreign key (bno) references board(bno) on delete cascade;
ALTER TABLE board_reply DROP CONSTRAINT FK_BOARD_REPLY;

select * from orders;
select * from orders_detail;
select * from test_mem;
select * from product;
select * from s

select * from ( select rownum rno, product.* from product where p_code in (select p_code from searchList where p_name like upper('%'||'ele'||'%') or p_code like '%'||'ele'||'%' or p_content like upper('%'||'ele'||'%') or p_category1 like upper('%'||'clothes'||'%') or p_category2 like upper('%'||'ele'||'%') or p_category3 like upper('%'||'ele'||'%') ) ) where rno>0*6 and rno<=1*6;


create view searchList AS
select p_code,
       upper(p_name) as p_name,
       p_price,
       p_stock,
       p_rating, 
       upper(p_content) as p_content,
       upper(p_category1) as p_category1,
       upper(p_category2) as p_category2,
       upper(p_category3) as p_category3,
       property 
from product;
commit;