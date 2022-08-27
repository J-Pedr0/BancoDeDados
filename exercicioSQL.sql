Scripts de exercícios - dvdrental
1 - Listar todos os atores;
2 - Listar todos os atores com o primeiro nome igual a Christian;
3 - Listar apenas o nome e sobrenome dos atores com a inicial D;
4 - Listar os 10 primeiros atores;


--Entidade actor-------------------------------------------------

select * from actor;
select * from actor where first_name like 'Christian';
select first_name, last_name 
from actor where first_name like 'C%' and last_name like 'D%';
select * from actor order by actor_id limit 10;


--Entidade address-------------------------------------------------

select * from address;
select * from address where address like '%Paarl%';
select * from address where address like '%t' and district like 'S%';
select * from address order by address_id limit 10;


--Entidade categary-------------------------------------------------

select * from category;
select * from category where "name" like 'C%';

select f.title, c.name from film f 
inner join film_category fc on f.film_id = fc.film_id 
inner join category c on fc.category_id  = c.category_id
where f.title like 'C%' and c.name like 'C%';  

select * from category order by category_id limit 10;


--Entidade city-------------------------------------------------
select * from city;
select * from city where city  like 'Bat%';

select c.city, c2.country from city c 
inner join country c2 on c.country_id = c2.country_id
where c.city like 'C%' and c2.country like 'C%';

select * from city order by city_id limit 10;


--Entidade country-------------------------------------------------

select * from country;
select * from country where country  like 'South%';

select c.country, c2.city from city c2 
inner join country c on c2.country_id = c.country_id
where c.country like 'C%' and c2.city like 'C%';

select * from country order by country_id limit 10;


--Entidade customer-------------------------------------------------

select * from customer;
select * from customer where first_name like 'Ann%';
select first_name, last_name, email from customer 
where first_name like 'B%' and last_name like 'B%';

select * from customer order by customer_id limit 10;

--Entidade film-------------------------------------------------

select * from film;
select * from film where title like 'Moon%';

select f.title, a.first_name from film f 
inner join film_actor fa on f.film_id = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
where f.title like 'S%' and a.first_name like 'S%';

select * from film order by film_id limit 10;


--Entidade film_actor-------------------------------------------------

select * from film_actor fa
inner join film f on fa.film_id = f.film_id
inner join actor a on fa.actor_id = a.actor_id;

select a.first_name, a.last_name, f.title, f.description from film_actor fa
inner join film f on fa.film_id = f.film_id
inner join actor a on fa.actor_id = a.actor_id
where a.first_name like 'Sandra%';

select f.title, a.first_name from film_actor fa
inner join film f on fa.film_id = f.film_id
inner join actor a on fa.actor_id = a.actor_id
where f.title like 'S%' and a.first_name like 'S%';


select * from film_actor order by actor_id limit 10;


--Entidade film_category-------------------------------------------------

select * from film_category fc
inner join film f on fc.film_id = f.film_id
inner join category c on fc.category_id = c.category_id;

select * from film_category fc
inner join film f on fc.film_id = f.film_id
inner join category c on fc.category_id = c.category_id
where c.name like 'Horror';

select f.title, c.name from film_category fc
inner join film f on fc.film_id = f.film_id
inner join category c on fc.category_id = c.category_id
where f.title like 'C%' and c.name like 'C%';

select * from film_category order by category_id limit 10;


--Entidade inventory-------------------------------------------------

select * from inventory i
inner join film f on i.film_id  = f.film_id
inner join store s on i.store_id = s.store_id
inner join staff s2 on s.manager_staff_id = s2.staff_id
inner join address a on s.address_id = a.address_id;

select f.title, s2.first_name, s2.last_name, a.address, a.district from inventory i
inner join film f on i.film_id  = f.film_id
inner join store s on i.store_id = s.store_id
inner join staff s2 on s.manager_staff_id = s2.staff_id
inner join address a on s.address_id = a.address_id
where f.title like 'Bound%';

select f.title, s2.first_name, s2.last_name, a.address, a.district from inventory i
inner join film f on i.film_id  = f.film_id
inner join store s on i.store_id = s.store_id
inner join staff s2 on s.manager_staff_id = s2.staff_id
inner join address a on s.address_id = a.address_id
where f.title like 'J%' and s2.first_name like 'J%';

select * from inventory order by store_id limit 10;

--Entidade language-------------------------------------------------

select * from language l;
select * from language where name like 'M%';

select f.title, l.name from film f 
inner join language l on f.language_id = l.language_id
where f.title like 'E%' and l.name like 'E%';

select * from language order by language_id limit 3; -- Limite igual a 3 pois não tem 10 línguas


--Entidade payment-------------------------------------------------

select * from payment;

select * from payment p 
inner join customer c on p.customer_id = c.customer_id
inner join staff s on p.staff_id = s.staff_id
where c.first_name like 'Ann%';

select c.first_name, c.last_name, c.email, s.first_name, s.last_name, s.email from payment p 
inner join customer c on p.customer_id = c.customer_id
inner join staff s on p.staff_id = s.staff_id
where c.first_name like 'J%' and s.first_name like 'J%';

select * from payment order by payment_id limit 10;


--Entidade rental-------------------------------------------------

select * from rental;
select * from rental r 
inner join customer c on r.customer_id = c.customer_id
inner join staff s on r.staff_id = s.staff_id
where s.first_name like 'Mike';

select c.first_name, c.email, s.first_name, s.email from rental r 
inner join customer c on r.customer_id = c.customer_id
inner join staff s on r.staff_id = s.staff_id
where c.first_name like 'J%' and s.first_name like 'J%';

select * from rental order by rental_id limit 10;

--Entidade staff-------------------------------------------------

select * from staff;
select * from staff where first_name like 'Mike';
select * from staff 
where email  like '%sakilastaff%' and password like '%64';

select * from staff order by staff_id limit 1; 

--Entidade store

select * from store;

select * from store s 
inner join staff s2 on s.manager_staff_id = s2.staff_id
inner join address a on s.address_id = a.address_id
where s2.first_name like 'Mike';

select s2.first_name, s2.last_name, s2.email, a.address, a.district, c.city, c2.country  from store s 
inner join staff s2 on s.manager_staff_id = s2.staff_id
inner join address a on s.address_id = a.address_id
inner join city c on a.city_id = c.city_id 
inner join country c2 on c.country_id  = c2.country_id
where c.city like 'W%' and c2.country like 'A%';

select * from store order by store_id limit 1; 

