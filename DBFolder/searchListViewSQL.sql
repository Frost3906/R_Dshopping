
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


drop view searchList;
select * from searchList;