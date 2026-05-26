SELECT 
  COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_viwes,
  COUNT(CASE WHEN device_type != 'laptop' THEN 1 END) AS mobile_viwes
FROM viewership;
