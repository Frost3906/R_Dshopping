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