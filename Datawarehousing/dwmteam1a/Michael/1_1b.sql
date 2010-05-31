SELECT tour.c_id, count(point.fk_tour) AS anzStops
FROM T_TOURMGMT_TOUR tour, T_TOURMGMT_TOURPOINT point
WHERE tour.c_isactual = 1
  AND tour.c_id = point.fk_tour
GROUP BY tour.c_id
HAVING count(point.fk_tour) < 10
ORDER BY count(point.fk_tour) DESC;