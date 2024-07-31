/*if more than one client connected to a
product id then display the count of customers else display the client_name*/

create table product
(product_id int
,client_name varchar(25)
,revenue decimal(18,0));

insert into product (product_id, client_name,revenue)  values
(101,'Mark',5000),
(101,'Terri',6500),
(101,'Roberto',4000),
(102,'Penny',3000),
(102,'Chris',3500),
(102,'Kane',2500),
(102,'Shane',4000),
(103,'David',3500),
(104,'Navab',2800);


/*
-- Expected Output:
+------+-------+
| id   | cnt   |
+------+-------+
|  101 | 3     |
|  102 | 4     |
|  103 | David |
|  104 | Navab |
+------+-------+
*/
-- simple aggregation function
select product_id, count(*)  as cnt
from product group by product_id;
/*+------+-------+
|  101 | 3     |
|  102 | 4     |
|  103 | 1     |
|  104 | 1     |
+------+-------+*/

select product_id
     ,case when count(*) > 1 then count(*) else max(client_name) end as cnt
from product group by product_id;

/*+------+-------+
| id   | cnt   |
+------+-------+
|  101 | 3     |
|  102 | 4     |
|  103 | David |
|  104 | Navab |
+------+-------+*/

