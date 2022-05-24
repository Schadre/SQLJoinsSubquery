-- 1.) List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, customer.email, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas'

--2.) Get all payments above $6.99 with the Cutomer's Full Name
select customer.first_name, customer.last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;


-- 3.) Show all customers names who have made payments over $175(use subqueries)
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
)


-- 4.)List all customers that live in Nepal(use the city table) - 0
select customer.first_name, customer.last_name, city
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
where city = 'Nepal';

-- 5.)Which staff member had the most transactions? Mike Hillyer
select customer.store_id, staff.first_name, staff.last_name, count(customer.store_id)
from staff
full join store
on staff.store_id = store.store_id
full join customer 
on store.store_id = customer.store_id
group by customer.store_id, staff.first_name, staff.last_name
order by count (customer.store_id)	

-- 6.) How many movies of each rating are there?
select rating, count(rating) as ratings
from film
group by rating
order by ratings desc;

-- 7.) Show all customers who have made a single payment above $6.99(Use Subqueries)
select customer_id, first_name, last_name 
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	)

--8.)How many free rentals did our stores give away? 690
select rental.rental_id, rental.customer_id, amount
from rental
full join payment
on rental.customer_id = payment.customer_id
where amount = 0
	
	