SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
    FROM REST_INFO
        JOIN (
            SELECT FOOD_TYPE, MAX(FAVORITES) MAX_FAVORITE
                FROM REST_INFO
                GROUP BY FOOD_TYPE
        ) A
        USING (FOOD_TYPE)
    WHERE MAX_FAVORITE = FAVORITES
    GROUP BY FOOD_TYPE
    ORDER BY FOOD_TYPE DESC;