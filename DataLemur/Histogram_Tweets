SELECT
    tweet_bucket,
    COUNT(*) AS users_num
FROM (
    SELECT
        user_id,
        COUNT(*) AS tweet_bucket
    FROM tweets
    WHERE tweet_date >= '2022-01-01'
      AND tweet_date <  '2023-01-01'
    GROUP BY user_id
) t
GROUP BY tweet_bucket;
