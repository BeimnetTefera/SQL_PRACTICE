SELECT 
  ur.city,
  COUNT(*) AS total_completed_trade
FROM trades AS tr 
INNER JOIN users AS ur
ON ur.user_id = tr.user_id
WHERE status = 'Completed'
GROUP BY ur.city
ORDER BY total_completed_trade DESC
LIMIT 3;
