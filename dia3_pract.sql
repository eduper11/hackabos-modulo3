-- 1a. Muestra el nombre y apellidos de todos los actores de la tabla "actor.

SELECT first_name, last_name FROM sakila.actor;

-- 1b. Muestra el nombre y apellido de cada actor en una sola columna en mayúsculas. Nombra a la columna "Actor Name"

select actor_id, first_name, last_name from sakila.actor
where first_name = 'joe';

-- 2a. Encuentra el número de ID, nombre y apellido de un actor, del cual solo sabes su nombre, "Joe".
--      Que consulta unica usarias para obtener esta información?

Select CONCAT(first_name, ' ', last_name) as 'Actor Name' from sakila.actor;

-- 2b. Encuentra todos los actores cuyo apellido contiene las letras GEN:

select first_name, last_name from sakila.actor
where last_name like '%gen%'

-- 2c. Encuentra todos los actores cuyos apellidos contengan las letras LI. Al mismo tiempo, ordena las celdas por apellido y nombre, en este orden:

select first_name, last_name from sakila.actor
where last_name like '%li%'
order by sakila.actor.last_name, sakila.actor.first_name

-- 2d. Usando IN muestra las columnas "country_id" y "country" de los siguientes paises: Afghanistan, Bangladesh, and China:

select country_id, country from sakila.country 
where country  in ('Afghanistan', 'Bangladesh', 'China');

-- 3a. Añade una columna llamada "middle_name" a la tabla "actor". Posiciónala entre "first_name" y "last_name". Pista: Tendrás que especificar el tipo de dato.

ALTER TABLE sakila.actor
ADD middle_name VARCHAR(255) AFTER first_name;

-- 3b. Te das cuenta de que algunos de los actores tienen apellidos tremendamente largos
--  Cambia el tipo de dato de la columna "middle_name" a "blobs"

ALTER TABLE sakila.actor
MODIFY middle_name blob;

-- 3c. Ahora borra la columna "middle_name"

ALTER TABLE sakila.actor
DROP middle_name;

-- 4a. Lista los apellidos de los actores, asi como cuantos actores tienen apellido.

select last_name, count(last_name) from sakila.actor
group by last_name;

-- 4b. Lista los apellidos de los actores y el número de actores quienes tienen apellido,
--     pero solo para aquellos nombres que son compartidos con al menos dos actores

select last_name, count(last_name) from sakila.actor
group by last_name
having count(last_name) >= 2;

-- 4d. Es posible que nos hayamos precipitado cambiando GROUCHO a HARPO. Resulta que GROUHCO era el nombre
-- correcto después de todo! 
-- En una sola consilta, si el primer nombre del actor es actualmente HARPO, 
-- cambialo por GROUCHO. Por otra parte, cambia el nombre a MUCHO GROUCHO, que es lo que seria exatamente
-- el actor con el gravísimo error. TEN CUIDADOD DE NO CAMBIAR EL NOMBRE DE TODOS LOS ACTORES
-- A MUCHO GROUCHO! 
-- (Pista: actualiza el dato usando un identificador único.)
 
-- 5a. No puedes localizar el esquema de la tabla "addreess". Que consulta usarias para recrearla?

describe sakila.address;

-- 6a. Usa JOIN para mostrar los nombres y apellidos, así como las direcciones, de todos los miembros de staff. Usa las tablas "staff" y "address":

select first_name, last_name, address from staff
inner join address on address.address_id = staff.address_id;

-- 6b. Usa JOIN para mostrar la cantidad total ganada por cada miembro del staff en Agosto de 2015. Usa las tablas "staff" y "payment".

SELECT staff.first_name, staff.last_name, sum(payment.amount) 
FROM staff
INNER JOIN payment ON payment.staff_id = staff.staff_id
WHERE year(payment.payment_date) = 2005 and month(payment.payment_date) = 08
GROUP BY staff.staff_id;

-- 6c. Lista cada película y el número de actores que estan apuntados para esa película. Usa las tablas "film_actor" y "film". Usa inner join.

select title, count(actor_id) from film
inner join film_actor on film.film_id = film_actor.film_id
group by title;

-- 6d. Cuantas copias de la película Hunchback Impossible existen en el sistema de inventario?

select film.title, count(inventory.film_id) from film
inner join inventory on inventory.film_id = film.film_id
where title = 'Hunchback Impossible'
group by inventory.film_id;

select count(film_id) from inventory
where film_id = 439
group by film_id;

-- 6e. Usanto las tablas "payment" y "customer" y el comando JOIN, lista el total pagado por cada cliente. 
--     Lista los clientes alfabéticamente por apellido.

select first_name, last_name, sum(payment.amount) from customer
inner join payment on customer.customer_id = payment.customer_id
group by customer.customer_id
order by first_name;

-- 7a. La musica de Queen y Kris Kristofferson han obtenido un resurgimiento inesperado. Como consecuencia inesperada,
--  las películas comenzando por las letras K y Q se han disparado en popularidad. Usa subconsultas para mostrar los títulos
--  de las películas que comienzan por las letras K y Q cuyo idioma es "English".

select title from film
inner join language on language.language_id = film.language_id
where (title like 'Q%' or title like 'K%') and language.name = 'English';

-- 7b. Usa subconsultas para mostrar todos los actores que aparezcan en la película Alone Trip.

select first_name, last_name from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film.film_id = film_actor.film_id
where title = 'Alone Trip';

-- 7c. Quieres lanzar una campaña de marketing por e-mail en Canadá, para lo cual necesitarás saber los nombres y
--     las direcciones de e-mail de todos los clientes canadienses.
--     Usa joins para obtener esta información

select first_name, last_name, email from customer
inner join address on address.address_id = customer.address_id
inner join city on city.city_id = address.city_id
inner join country on country.country_id = city.country_id
where country = 'Canada'; 

-- 7d. Las ventas han bajado en las familias jóvenes, y quieres marcar como objetivo todas las peliculas familiares para una promoción.
--  Identifica todas las películas categorizadas como "family films".
-- ojo, campo ENUM

select title from film
where rating = 'G' or 'pg' or 'pg-13';

-- 7e. Muestra las más frecuentemente alquiladas peliculas en orden descendiente

select title, count(rental.rental_id) from film
inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
group by inventory.film_id
order by count(rental.rental_id) desc;

-- 7f. Escribe una consulta para mostrar cuanto negocio, en dolares, ha traído cada tienda



-- 7g. Escribe una consulta para mostrar, por cada tienda, su ID, ciudad y país

select store_id, city from store
inner join address on store.address_id = address.address_id
inner join city on address.city_id = city.city_id;

-- 7h. Lista los 5 generos mas rentables en orden descendiente 
-- (Pista: puede que necesites usar las siguientes tablas: "category, film_category, inventory, payment, and rental".)

select name, count(rental.rental_id), sum(payment.amount) from category
inner join film_category on category.category_id = film_category.category_id
inner join inventory on film_category.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
inner join payment on payment.rental_id = rental.rental_id
group by category.name
order by sum(payment.amount) desc;
-- 8a. En tu nuevo rol como ejecutivo, te gustaría tener una forma más fácil de ver 
--     los 5 géneros más rentables. Usa la solución del problema anterior para crear una vista. 
--     Si aun no has resuelto el 7º, puedes sustituirlo por cualquier otra consulta para crear una vista

-- 8b. Como mostrarías la vista que has creado en el 8a?

-- 8c. Encuentras que no necesitas la vista de los 5 generos. Escribe una consulta para borrarla.
drop view view_5most_rentable_category;