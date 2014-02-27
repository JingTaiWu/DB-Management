--Lab 6
--2/26/2014

--Question 1: get the name and city of customers 
--who live in a city where the most number of products are made
select customers.name, customers.city
from customers
where customers.city = (select city
			from (select city, sum(quantity) as orderedQuantity
			      from products
			      group by city
			      order by orderedQuantity DESC
			      limit 1) as leastCity); --No customers live in Newark, therefore there is no answer


--Question 2: get the name and city of customers 
--who live in any city where the most number of products are made
select customers.name, customers.city
from customers
where customers.city = (select city
			from (select city, sum(quantity) as orderedQuantity
			      from products
			      group by city
			      order by orderedQuantity DESC
			      limit 1) as leastCity);

--Question 3: List the products 
--whose priceUSB is above the average price USD
select products.name
from products
where products.priceUSD > (select avg(priceUSD) as averagePrice
			   from products);

--Question 4: Show the customer name, pid ordered, and the dollars
--for all customer orders, sorted by dollar from high to low
select customers.name, orders.pid, orders.dollars as orderedDollar
from customers, orders
where customers.cid = orders.cid
order by orders.dollars desc;

--Question 5: Show all customers names (in order)
--and their total ordered, and nothing more.
--Use coalesce to avoid showing nulls

select name, coalesce(sum(qty), 0) as sumQty
from customers full outer join orders
on customers.cid = orders.cid
group by customers.cid
order by sumQty desc;

--Question 6: show the names of all cusstomers who bought products
--from agents based in NEw York along with the names of the products they
--ordered, and the names of the agents who sold it to them.
select customers.name, products.name, agents.name
from customers, products, agents, orders
where customers.cid = orders.cid
and   agents.aid = orders.aid
and   products.pid = orders.pid
and   agents.city = 'New York';

--Question 7: write a query to check the accuracy of the dollars column in the orders table
--this means calculating orders.dollars from other data in other tables and then comparing those
--values to the values in orders.dollars

--calculate the dollars:  products.priceUSD * orders.qty * (1- customers.discount / 100)
select orders.dollars, products.priceUSD * orders.qty * (1 - customers.discount / 100) as ActualAmount
from orders, products, customers
where customers.cid = orders.cid
and   products.pid = orders.pid













