SELECT 
  COUNT(duplicate_post) AS duplicate_companies
FROM (
    SELECT 
      COUNT(*) AS duplicate_post
    FROM job_listings
    GROUP BY company_id, title, description
    HAVING COUNT(*) > 1
) AS duplicate_count;
