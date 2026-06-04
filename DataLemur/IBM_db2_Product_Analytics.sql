SELECT
    unique_query,
    COUNT(*) AS employee_count
FROM
(
    SELECT
        e.employee_id,
        COUNT(DISTINCT q.query_id) AS unique_query
    FROM employees e
    LEFT JOIN queries q
        ON q.employee_id = e.employee_id AND
        query_starttime >= '2023-07-01T00:00:00Z' AND
        query_starttime < '2023-10-01T00:00:00Z'
        
    GROUP BY e.employee_id
) t
GROUP BY unique_query
ORDER BY unique_query;
