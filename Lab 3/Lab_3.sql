--Number 1
select name, city
from agents
where name = 'Smith';

--Number 2
select pid, name, quantity
from products
where priceusd > 1.25;

--Number 3
select ordno, aid
from orders;

--Number 4
select name, city
from customers
where city = 'Dallas';

--Number 5
select name
from agents
where city != 'New York' and city != 'Newark';

--Number 6
select *
from products
where city != 'New York' and city != 'Newark' and priceusd >= 1;

--Number 7
select *
from orders
where mon = 'jan' or mon = 'mar';

--Number 8
select *
from orders
where mon = 'feb' and dollars < 100;

--Number 9
select ordno
from orders
where cid = 'c001';