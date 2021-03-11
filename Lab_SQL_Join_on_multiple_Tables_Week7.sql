-- Write a query to display for each store its store ID, city, and country.


select st.store_id,co.country,c.city from store st
join address a
on st.address_id=a.address_id
join city c
on c.city_id=a.city_id
join country co
on co.country_id=c.country_id;

-- Write a query to display how much business, in dollars, each store brought in

select * from sales_by_store;

-- What is the average running time of films by category?

select c.name,round(avg(f.length),2) from film_category cat
join film f
on f.film_id=cat.film_id
join category c
on cat.category_id=c.category_id
group by c.name;

-- Which film categories are longest?

select distinct c.name,f.length from film_category cat
join film f
on f.film_id=cat.film_id
join category c
on cat.category_id=c.category_id
order by length desc;

-- Display the most frequently rented movies in descending order.

select f.title,count(r.rental_id) as number_of_rentals from rental r
join inventory i
on i.inventory_id=r.inventory_id
join film f
on f.film_id=i.film_id
group by title
order by count(r.rental_id) desc;

-- List the top five genres in gross revenue in descending order.

select cat.name,round(sum(amount),2) as gross_revenue from film_category fc
join category cat
on fc.category_id=cat.category_id
join inventory i
on i.film_id=fc.film_id
join rental r
on r.inventory_id=i.inventory_id
join payment p
on p.rental_id=r.rental_id
group by cat.name
order by sum(amount) desc;

-- Is "Academy Dinosaur" available for rent from Store 1?


SELECT f.title,r.return_date,store_id
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
-- WHERE title = "Academy Dinosaur" AND store_id = 1 AND return_date IS NOT NULL;
WHERE i.inventory_id = 2699 AND return_date IS NULL;



