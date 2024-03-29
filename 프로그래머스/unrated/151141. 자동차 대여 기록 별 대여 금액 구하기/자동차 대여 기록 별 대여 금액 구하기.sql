WITH TRUCK_DISCOUNT
AS (SELECT DURATION_TYPE, DISCOUNT_RATE
        FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
            WHERE CAR_TYPE = "트럭")

SELECT HISTORY_ID,
        TRUNCATE(DAILY_FEE * (DATEDIFF(END_DATE, START_DATE)+1) * 0.01 * (100 -
        IF(DATEDIFF(END_DATE, START_DATE)+1 >= 90,
           (SELECT DISCOUNT_RATE
                FROM TRUCK_DISCOUNT
                WHERE DURATION_TYPE = "90일 이상"),
            IF(DATEDIFF(END_DATE, START_DATE)+1 >= 30,
              (SELECT DISCOUNT_RATE
                    FROM TRUCK_DISCOUNT
                    WHERE DURATION_TYPE = "30일 이상"),
                IF(DATEDIFF(END_DATE, START_DATE)+1 >= 7,
                  (SELECT DISCOUNT_RATE
                        FROM TRUCK_DISCOUNT
                        WHERE DURATION_TYPE = "7일 이상"),
                  0)))), 0) FEE
    FROM CAR_RENTAL_COMPANY_CAR
        JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY USING(CAR_ID)
    WHERE CAR_TYPE = "트럭"
    ORDER BY FEE DESC, HISTORY_ID DESC