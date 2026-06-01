SELECT 
  user_id
FROM emails AS e 
LEFT JOIN texts AS t 
ON e.email_id = t.email_id
WHERE signup_action = 'Confirmed'
      AND action_date = DATE_ADD(signup_date, INTERVAL 1 DAY);
