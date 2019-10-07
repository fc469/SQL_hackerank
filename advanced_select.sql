
SELECT LEVEL_1, LVL
FROM(
    SELECT LEVEL_1, CASE WHEN LEVEL_2 IS NULL THEN 'Root' WHEN LEVEL_3 IS NULL THEN 'Leaf' ELSE 'Inner' END AS LVL
    FROM(
        SELECT DISTINCT A.N AS LEVEL_1, A.P LEVEL_2, B.P AS LEVEL_3
        FROM BST A LEFT OUTER JOIN BST B
        ON A.N = B.P
        )
)
ORDER BY LEVEL_1;
