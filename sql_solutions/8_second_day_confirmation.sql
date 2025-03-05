--https://datalemur.com/questions/second-day-confirmation
    SELECT
        user_id 
    FROM
        emails  
    JOIN
        texts  
            ON emails.email_id=texts.email_id 
    WHERE
        signup_action='Confirmed' 
        AND  EXTRACT('days' FROM action_date-signup_date)=1;
    