/*Customer Table*/

/*Checking for Duplicates in the customertable*/

SELECT (COUNT(*)) as duplicate_count
from customer_data cd 
GROUP BY cd.customer_id 
HAVING COUNT(*) > 1

SELECT cd.email, (COUNT(*)) as duplicate_count
from customer_data cd 
GROUP BY cd.email 
HAVING COUNT(*) > 1

 
/*Checking for Nulls or '' in customer table*/
SELECT (Count(*)) 
FROM customer_data cd 
WHERE cd.customer_id  IS NULL OR cd.customer_id = ''
   OR cd.age  IS NULL OR cd.age = ''
   OR cd.city IS NULL OR cd.city = ''
   OR cd.email IS NULL OR cd.email  = ''
   OR cd.gender  IS NULL OR cd.gender = ''

SELECT *
FROM customer_data cd 
WHERE cd.customer_id  IS NULL OR cd.customer_id = ''
   OR cd.age  IS NULL OR cd.age = ''
   OR cd.city IS NULL OR cd.city = ''
   OR cd.email IS NULL OR cd.email  = ''
   OR cd.gender  IS NULL OR cd.gender = ''
   
  
SELECT 
  COUNT(*) as total_customers,
  COUNT(CASE WHEN cd.email IS NULL OR cd.email = '' THEN 1 END) as null_emails,
  ROUND(100.0 * COUNT(CASE WHEN cd.email IS NULL OR cd.email = '' THEN 1 END) / COUNT(*), 2) as null_percentage
FROM customer_data cd



   /* Insights: This number 496 matches the Number of Dupes from the email column. 
    I think it s fair all the Dupes and NULLS are the same and in the email column and needs to be fixed*/
   

