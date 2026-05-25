SELECT 
  candidate_id
FROM (
    SELECT 
      candidate_id,
      count(*) AS total_skill
    FROM candidates
    WHERE skill in ('Python', 'Tableau', 'PostgreSQL')
    GROUP BY candidate_id
    ) AS temp
WHERE total_skill >= 3
