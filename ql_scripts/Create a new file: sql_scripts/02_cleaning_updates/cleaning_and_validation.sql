/* Phase 1: Quantity validation
-Find any quantity values that are <= 0 (negative or zero)
-Count how many invalid quantities exist
*/

--Customer table
select *
FROM customer_data
--Where customer_data.customer_id <=0
--OR customer_data.age < 1

--Produdct table
SELECT *
FROM product_data pd 
Where pd.product_id <=0
or pd.cost_price <=0
or pd.list_price <=0

--Sales table
SELECT *
FROM sales_data sd
WHERE sd.transaction_id <=0
or sd.store_id <=0
or sd.product_id <=0
or sd.customer_id <=0 --missing customer_ids
or sd.quantity <=0
or sd.discount <0
or sd.returned <0

--Count missing customer_ids
SELECT Count (*)
FROM sales_data sd 
where sd.customer_id <=0 

--Check for missing or nulls in the date column
SELECT *
FROM sales_data sd
WHERE sd.`date` IS NULL OR sd.`date` = ''

--Check for future dates in the date column
SELECT *
FROM sales_data sd
WHERE sd.`date` > '2026-12-31'  

SELECT *
FROM sales_data
WHERE discount < 0 OR discount > 1.0 

--Store table
SELECT *
FROM store_data sd 
--No misisng data in this table

---Key insight: The 1,844 customer_id = 0 values in sales_data

/*Phase 2: Data Cleaning*/

/*Cleaning up the misisng customer_ids 1,844 customer_ids by adding a placeholder customer
 for the the missing customer_ids in the sales data table */

INSERT into customer_data (customer_id, age, gender, city, email)
VALUES ('C000000', NULL, NULL, NULL, '')

SELECT *
from customer_data cd 
order by customer_id ASC

--DELETE FROM customer_data
--WHERE customer_id = 'C000000'
--LIMIT 1


UPDATE sales_data
SET customer_id = 'C000000'
WHERE customer_id = 0 OR customer_id IS NULL OR customer_id = ''

SELECT *
from sales_data sd 
ORDER BY customer_id ASC 

SELECT COUNT(*) FROM sales_data WHERE customer_id = 'C000000'

--Updating the blanks in the color column to read unknown

update product_data
SET color = 'Unknown'
where color = ''

SELECT Count(*)
from product_data pd 
where pd.color = 'Unknown'

/*Missing emails in customer_data (496 rows)*/
update customer_data
SET email = 'unknown@example.com'
where email = ''

SELECT COUNT(*)
FROM customer_data cd 
WHERE cd.email = 'unknown@example.com'

/*Update product table column category to Unknown instead of ??? for consistency in blank data*/

UPDATE product_data 
set category = 'Unknown'
where category = '???'

SELECT pd.product_id, pd.category 
FROM product_data pd 
WHERE category = 'Unknown'

SELECT COUNT(*)
from product_data pd 
where category = '???'

/*Query that sumarizes all of the data cleaning I did*/

SELECT 'Missing Customer IDs' as IssueType, COUNT(*) as Before
   FROM sales_data
   WHERE customer_id = 'C000000'
   UNION
SELECT 'Empty Colors' as IssueType, COUNT(*) as Before
   FROM product_data
   WHERE color = 'Unknown' 
   UNION  
SELECT 'Missing Category' as IssueType, COUNT(*) as Before
   FROM product_data pd 
   WHERE pd.category = ''
   UNION 
SELECT 'Missing Email' as IssueType, Count(*) as Before
   FROM customer_data cd 
   WHERE cd.email = 'unknown@example.com'
   UNION   
  SELECT 'Missing Customer IDs' as IssueType, COUNT(*) as After
   FROM sales_data
   WHERE customer_id is NULL or ''
   UNION
SELECT 'Empty Colors' as IssueType, COUNT(*) as After
   FROM product_data
   WHERE color is NULL  or ''
   UNION  
SELECT 'Missing Category' as IssueType, COUNT(*) as After
   FROM product_data pd 
   WHERE pd.category is NULL  or ''
   UNION 
SELECT 'Missing Email' as IssueType, Count(*) as After
   FROM customer_data cd 
   WHERE cd.email is NULL or ''
   
