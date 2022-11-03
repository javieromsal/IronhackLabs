use sakila;
#1 List all films whose length is longer than the average of all the films.
select title from film
where length > (select avg(length) from film);

#2 How many copies of the film Hunchback Impossible exist in the inventory system?
select * from inventory;
select count(film_id) from inventory
where film_id = (select film_id from film
where title in ('Hunchback Impossible'));

#3 Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor
where actor_id in 
	(select actor_id from film_actor
	where film_id = 
		(select film_id from film
		where title like 'Alone Trip'));
        
#4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films.
select title from film
where film_id in 
	(select film_id from film_category
	where category_id =
		(select category_id from category
		where name like 'family'));
        
#5 Get name and email from customers from Canada using subqueries
select first_name, last_name, email from customer
where address_id in( 
	select address_id from address
	where city_id in (
		select city_id from city
		where country_id =
		(	select country_id from country
			where country like 'Canada')));
            
#6 Which are films starred by the most prolific actor?
select title from film 
where film_id in 
	(select film_id from film_actor
	where actor_id =
		(select actor_id from 
			(select actor_id,count(actor_id) as cc from film_actor
			group by actor_id
			order by cc desc
			limit 1) as s1));

            
#7 Films rented by most profitable customer
select title from film
where film_id in
	(select film_id from inventory
	where inventory_id in 
		(select inventory_id from rental
		where customer_id =
			(select customer_id from (
				select customer_id, sum(amount) as sa from payment
				group by customer_id
				order by sa desc
				limit 1) as sb1)));
                
#8 Customers who spent more than the average payments
set@av_ap :=(select avg(ap) from
	(select customer_id, avg(amount) as ap from payment
	group by customer_id) as sb1);
select first_name, last_name from customer
where customer_id in
	(select customer_id from
		(select customer_id, avg(amount) as ap from payment
		group by customer_id
		having ap > @av_ap) as sb3);
select * from customer;

select avg(ap) from
	(select customer_id, avg(amount) as ap from payment
	group by customer_id) as sb1;
select customer_id, avg(amount) as ap from payment
	;
select * from payment;