use sakila;
select title from film;
select title from film;
select * from sakila.tables;
SELECT table_name #return all tables in 'sakila'
FROM information_schema.tables
WHERE table_type='BASE TABLE'
      AND table_schema = 'sakila';
select * from information_schema.columns
where table_schema = 'sakila'
order by table_name, ordinal_position;
select length as min from film;
select * from film;
select language_id as language from film;

SELECT DISTINCT language_id as language FROM sakila.film;
select * from store;

select * from staff;
select first_name from staff;

