SELECT 
  user_id,
  TIMESTAMPDIFF(DAY, MIN(post_date),  MAX(post_date)) AS days_between
FROM posts
WHERE post_date >= '2021-01-01'
  AND post_date < '2022-01-01'
GROUP BY user_id
HAVING TIMESTAMPDIFF(DAY, MIN(post_date),  MAX(post_date)) > 0
