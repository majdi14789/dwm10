SELECT TOUR.C_ID, COUNT(TOUR.C_ID) AS cntPoints
FROM T_TOURMGMT_TOUR TOUR, T_TOURMGMT_TOURPOINT POINT
WHERE POINT.FK_TOUR = TOUR.C_ID  AND TOUR.C_ISACTUAL=1
GROUP BY TOUR.C_ID
HAVING COUNT(TOUR.C_ID) < 10
ORDER BY  cntPoints DESC