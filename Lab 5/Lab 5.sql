--Jing Tai Wu
--2/19/2014
--Lab 5

--Question 1: get the cities of agents booking an order for customer Basics
select agents.city
from agents, orders, customers
where agents.aid = orders.aid
and   customers.cid = orders.cid
and   customers.name = 'Basics';

--Question 2: get the pids of products ordered through any agent who makes at least one order for a customer
--in kyoto
select distinct products.pid
from products, orders, customers, agents
where products.pid = orders.pid
and   agents.aid = orders.aid
and   customers.cid = orders.cid
and   customers.city = 'Kyoto';

--Question 3: get the names of customers who have never placed an order. use a subquery
select name
from customers
where cid not in (select cid
		  from orders);

--Question 4: get the names of customers who have never placed an oder. use outer-join
select customers.name
from customers LEFT OUTER JOIN orders
on customers.cid = orders.cid
where orders.ordno is null;

--Question 5: get the names of customers who placed at least one order through an agent in their city,
--along with those agents' names
select distinct customers.name, customers.city, agents.name, agents.city
from customers, agents, orders
where orders.cid = customers.cid
and   orders.aid = agents.aid
and   customers.city = agents.city;

--Question 6: get the names of customers and agents in the same city, along with the name of the
--city regardless of whether or not the customer has ever placed an order with 
--that agent
select customers.name, customers.city, agents.name, agents.city
from customers, agents
where customers.city = agents.city;

--Question 7: get the name and city of customers who live in the city where the least number of
--products are made
select customers.name, customers.city, products.name, products.city
from customers, products
where customers.city = (select city --take the top city (the city that has the least occurance)
			from (select city, COUNT(city) as "CityCounts" --creates a table that calculates the occurance of the city in ascending order
			      from products
			      group by city
			      order by "CityCounts" ASC));
--this doesnt work yet
				
