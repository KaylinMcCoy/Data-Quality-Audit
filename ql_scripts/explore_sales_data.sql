/*Sales Data*/

Select *
from sales_data sd 

/* Sales Duplicate Check*/

/CT (COUNT(*)) as duplicate_count
from sales_data sd 
GROUP BY sd.transaction_id 
HAVING COUNT(*) > 1

 
/*Checking for Nulls or '' in Sales table*/
SELECT (Count(*)) 
FROM sales_data sd 
WHERE sd.customer_id IS NULL OR sd.customer_id = ''
   OR sd.date IS NULL OR sd.date = ''
   OR sd.discount IS NULL OR sd.discount = ''
   OR sd.product_id IS NULL OR sd.product_id = ''
   OR sd.quantity IS NULL OR sd.quantity = ''
   OR sd.returned IS NULL OR sd.returned = ''
   OR sd.store_id IS NULL OR sd.store_id = ''
   OR sd.transaction_id IS NULL OR sd.transaction_id = ''

SELECT *
FROM sales_data sd 
WHERE sd.customer_id IS NULL OR sd.customer_id = ''
   OR sd.date IS NULL OR sd.date = ''
   OR sd.discount IS NULL OR sd.discount = ''
   OR sd.product_id IS NULL OR sd.product_id = ''
   OR sd.quantity IS NULL OR sd.quantity = ''
   OR sd.returned IS NULL OR sd.returned = ''
   OR sd.store_id IS NULL OR sd.store_id = ''
   OR sd.transaction_id IS NULL OR sd.transaction_id = ''
  
SELECT 
  COUNT(*) as total_rows,
  COUNT(CASE WHEN sd.customer_id IS NULL OR sd.customer_id = '' THEN 1 END) as customer_id_nulls,
  COUNT(CASE WHEN sd.product_id IS NULL OR sd.product_id = '' THEN 1 END) as product_id_nulls,
  COUNT(CASE WHEN sd.store_id IS NULL OR sd.store_id = '' THEN 1 END) as store_id_nulls,
  COUNT(CASE WHEN sd.transaction_id IS NULL OR sd.transaction_id = '' THEN 1 END) as transaction_id_nulls,
  COUNT(CASE WHEN sd.`date` IS NULL OR sd.`date` = '' THEN 1 END) as date_nulls,
  COUNT(CASE WHEN sd.discount IS NULL OR sd.discount = '' THEN 1 END) as discount_nulls,
  COUNT(CASE WHEN sd.quantity IS NULL OR sd.quantity = '' THEN 1 END) as quantity_nulls,
  COUNT(CASE WHEN sd.returned IS NULL OR sd.returned = '' THEN 1 END) as returned_nulls
FROM sales_data sd

/*Insights:Nulls or '' are in the discount column or the customer_id column and Needs to be fixed*/
