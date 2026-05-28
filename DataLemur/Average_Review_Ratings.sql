SELECT 
  DATE_FORMAT(submit_date, '%m') AS mth,
  product_id AS product,
  ROUND(AVG(stars),2) avg_stars
FROM reviews
GROUP BY product_id, DATE_FORMAT(submit_date, '%m')
ORDER BY mth, product;
