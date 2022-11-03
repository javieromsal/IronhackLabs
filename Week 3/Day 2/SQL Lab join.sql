use sakila;
Select * from film_actor;
SELECT DISTINCT TABLE_NAME # find all tables wiht 'column_name' column
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE COLUMN_NAME IN ('actor_id')
        AND TABLE_SCHEMA='sakila'; # account and client table
Select * from film_actor;
#1
select first_name, last_name, count(film_id) as cc from film_actor as a 
left join actor as b using(actor_id)
group by actor_id
order by cc desc
limit 1;
#2
select * from customer;
select * from rental;
select first_name, last_name, count(customer_id) as bb from customer as a 
left join rental as b using(customer_id)
group by customer_id
order by bb desc
limit 1;
#3
select * from category;
select name, count(film_id) as dd from category as a 
left join film_category as b using(category_id)
group by category_id;
#4 Display the first and last names, as well as the address, of each staff member
select * from address;
SELECT DISTINCT TABLE_NAME # find all tables wiht 'column_name' column
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE COLUMN_NAME IN ('address_id')
        AND TABLE_SCHEMA='sakila'; # account and client table
select first_name, last_name, address from staff
inner join address as adrs using(address_id);
#5 get films titles where the film language is either English or italian, 
	#and whose titles starts with letter "M" , sorted by title descending.
select title, name from film
inner join language using(language_id)
where title regexp '^M'
having name like'English' or name like 'Italian';
#6 Display the total amount rung up by each staff member in August of 2005.
select * from payment;
SELECT DISTINCT TABLE_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE COLUMN_NAME IN ('staff_id')
        AND TABLE_SCHEMA='sakila';
select first_name, last_name, sum(amount) from staff
inner join payment using(staff_id)
where payment_date >= '2005-08-01 00:00:00' and payment_date < '2005-09-01 00:00:00'
group by staff_id
order by first_name;
#7 List each film and the number of actors who are listed for that film.
select * from film;
select title, count(actor_id) as tt from film
inner join film_actor using(film_id)
group by title
order by tt desc;
#8
