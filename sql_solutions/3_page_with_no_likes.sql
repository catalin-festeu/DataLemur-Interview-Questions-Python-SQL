--https://datalemur.com/questions/sql-page-with-no-likes
    SELECT
        pages.page_id 
    FROM
        pages 
    LEFT JOIN
        page_likes 
            ON pages.page_id = page_likes.page_id 
    WHERE
        page_likes.liked_date IS NULL 
    ORDER BY
        pages.page_id ASC;