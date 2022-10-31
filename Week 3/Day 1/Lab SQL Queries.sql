use bank;
select * from client;
SELECT DISTINCT TABLE_NAME # find all tables wiht 'district_id' column
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE COLUMN_NAME IN ('district_id')
        AND TABLE_SCHEMA='bank'; # account and client table

select * from client;
SELECT   client_id  from bank.client #QUERY 1
WHERE  district_id = 1
LIMIT 5;
# Query 2
select max(client_id) from client
where district_id = 72;
# Query 3
select * from loan;
select amount from loan 
order by amount 
limit 3;
# Query 4
select distinct status from loan
order by status;
#Query 5
select loan_id from loan
order by payments desc
limit 1;
# QUery 6
select  account_id as '#id', amount from loan 
order by account_id
limit 5;
#Query 7
select account_id from loan
where duration = 60
order by amount
limit 5;
#Query 8
select distinct k_symbol from bank.order 
where k_symbol not in (' ')
order by k_symbol;
#Query 9
select order_id from bank.order
where account_id = 34 ;
#Query 10
select  distinct account_id from bank.order
where order_id > 29539 and order_id <= 29560;
#Query 11
select amount from bank.order
where account_to = 30067122;
#Query 12
Select  distinct trans_id, date, type, amount from trans
where account_id = 793
order by date desc
limit 10;
#Query 13
select district_id, count(district_id) from client
where district_id < 10
group by district_id
order by district_id;
#Query 14
select type, count(type) from card
group by type;
#Query 15
select account_id, sum(amount) from loan
group by account_id
order by sum(amount) desc
limit 10;
#Query 16
select date, count(date) from loan
where date < 930907
group by date
order by date desc;
#Query 17
select date,  duration, count(date) from loan
where date > 971205 and date <= 971225
group by date, duration 
order by date, duration;
#Query 18
select account_id, type , sum(amount) from trans
where account_id = 396
group by type;
#Query 19
select account_id,  case type  when 'PRIJEM' then 'INCOMING' when 'VYDAJ' then 'OUTGOING' end as transaction_type , floor(sum(amount)) as sum from trans
where account_id = 396
group by transaction_type ;
#Query 20
select account_id, floor(sum(if(type = 'PRIJEM',amount,null))) as Income, floor(sum(if(type = 'VYDAJ',amount,null))) as 'out',
floor(sum(if(type = 'PRIJEM',amount,null))) - floor(sum(if(type = 'VYDAJ',amount,null))) as 'dif' from trans
where account_id = 396;


