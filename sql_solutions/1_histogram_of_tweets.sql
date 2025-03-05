  --https://datalemur.com/questions/sql-histogram-tweets
  WITH unique_tweets_per_user AS (  SELECT
        COUNT(tweet_id) AS tweets_per_user ,
        user_id  
    FROM
        tweets 
    WHERE
        tweet_date BETWEEN '2022-01-01' AND '2022-12-31' 
    GROUP BY
        user_id )  SELECT
        tweets_per_user AS tweet_bucket,
        COUNT(user_id) AS users_num 
    FROM
        unique_tweets_per_user 
    GROUP BY
        tweets_per_user;