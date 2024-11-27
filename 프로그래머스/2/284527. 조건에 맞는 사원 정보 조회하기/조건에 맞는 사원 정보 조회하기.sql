    # FROM HR_EMPLOYEES E JOIN HR_GRADE G JOIN ON (E.EMP_NO = G.EMP_NO)
    # WHERE G.YEAR = "2022"

WITH HR_SCORES AS (SELECT EMP_NO, SUM(SCORE) AS "SCORE"
                    FROM HR_GRADE
                    WHERE YEAR = 2022
                    GROUP BY EMP_NO)
                    
SELECT S.SCORE, S.EMP_NO, EMP_NAME, POSITION, EMAIL
    FROM HR_EMPLOYEES E JOIN HR_SCORES S ON (E.EMP_NO = S.EMP_NO)
    WHERE S.SCORE = (SELECT MAX(SCORE) FROM HR_SCORES);