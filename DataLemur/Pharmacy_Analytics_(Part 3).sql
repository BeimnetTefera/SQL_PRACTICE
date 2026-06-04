SELECT 
  manufacturer,
  CONCAT('$', ROUND(sale, 0),' ', 'million') AS sale
FROM
(
SELECT 
  manufacturer,
  SUM(total_sales) / 1000000 AS sale
FROM pharmacy_sales
GROUP BY manufacturer
) AS t
ORDER BY t.sale DESC
