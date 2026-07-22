/*Phase 1: Data Exploration
 * Learning the Data Structure
 * Looking for Duplicates, missing or inaccurate Data */

/*How many rows*/
SELECT *
FROM product_data pd;

/* View first 5 row */
SELECT *
FROM product_data pd 
Limit(5);

/*Check the structure/columns*/
SELECT *
FROM pragma_table_info('product_data');


/*Product Table*/

/*Checking for Duplicates in the product table*/
SELECT (COUNT(*)) as duplicate_count
from product_data pd 
GROUP BY pd.product_id 
HAVING COUNT(*) > 1

/*Checking for Nulls or '' in product table*/
SELECT (COUNT(*))
FROM product_data pd
WHERE pd.product_id IS NULL OR pd.product_id = ''
   OR pd.category IS NULL OR pd.category = ''
   OR pd.color IS NULL OR pd.color = ''
   OR pd.cost_price IS NULL OR pd.cost_price = ''
   OR pd.size IS NULL OR pd.size = ''
   OR pd.season IS NULL OR pd.season = ''
   OR pd.supplier IS NULL OR pd.supplier = '';


SELECT *
FROM product_data pd
WHERE pd.product_id IS NULL OR pd.product_id = ''
   OR pd.category IS NULL OR pd.category = ''
   OR pd.color IS NULL OR pd.color = ''
   OR pd.cost_price IS NULL OR pd.cost_price = ''
   OR pd.size IS NULL OR pd.size = ''
   OR pd.season IS NULL OR pd.season = ''
   OR pd.supplier IS NULL OR pd.supplier = '';

  
SELECT 
  COUNT(*) as product_color,
  COUNT(CASE WHEN pd.color IS NULL OR pd.color = '' THEN 1 END) as null_color,
  ROUND(100.0 * COUNT(CASE WHEN pd.color IS NULL OR pd.color  = '' THEN 1 END) / COUNT(*), 2) as null_percentage
FROM product_data pd 


/* Insights: All 990 '' are from the color column and need to be fixed */
