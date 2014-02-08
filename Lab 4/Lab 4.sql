--Jinig Tai Wu
--Lab 4
--2/8/2014


--Get the Cities of agents booking an order for customer Basics
select city
from agents
where aid in (select aid 
	      from orders
	      where cid in (select cid
			    from customers
			    where name = 'Basics'));

--Get the pids of products ordered through any agent who makes at least one order
--for a customer in Kyoto.
select distinct pid
from Orders
where cid in (select cid
	      from customers
	      where city = 'Kyoto');

--Find the cids and names of customers who never placed an order through agent a03
select cid, name
from customers
where cid in (select cid
	      from orders
	      where cid != 'a03');

--Get the cids and names of customers who ordered both product p01 and p07
select cid, name
from customers
where cid in (select distinct cid
              from orders
              where pid = 'p01' --cid with order p01 (c001, c006, c004)
		INTERSECT select distinct cid
			  from orders
			  where pid = 'p07'); --cid with oder p07(c006, c001)

--Get the pids of products ordered by any customers who ever placed an order
--through agent a03
select pid
from orders
where aid in (select aid
              from orders
              where aid = 'a03');

--Get the names and discounts of all customers who ever placed an oder through
--agents in Dallas or Duluth
select name, discount
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid
			    from agents
			    where city = 'Dallas' OR city = 'Duluth'));

--Find all customers who have the same discount as that of any customers in Dallas
--or Kyoto.
select *
from customers
where discount in (select discount
	           from customers
	           where city = 'Dallas' OR city = 'Kyoto');