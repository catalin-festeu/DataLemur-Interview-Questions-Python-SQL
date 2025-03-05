--https://datalemur.com/questions/updated-status
SELECT 
  COALESCE(advertiser.user_id, daily_pay.user_id) AS user_id,
  COALESCE(
      CASE WHEN daily_pay.user_id IS NULL THEN 'CHURN' ELSE NULL END,
      CASE WHEN advertiser.status IS NULL AND daily_pay.user_id IS NOT NULL THEN 'NEW' END,
      CASE WHEN advertiser.status='CHURN' THEN 'RESURRECT' ELSE 'EXISTING' END
  ) AS new_status
FROM 
    advertiser
FULL OUTER JOIN 
    daily_pay
ON 
    advertiser.user_id=daily_pay.user_id
ORDER BY
     user_id;