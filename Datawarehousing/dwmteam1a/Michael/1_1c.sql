SELECT address.c_address_zipcode, substr(point.c_actualarrival, 0, 8), count(point.fk_location)
FROM T_TOURMGMT_TOUR tour, T_TOURMGMT_TOURPOINT point, T_ORGLOC_LOCATION loc, T_ADDRESSMGMT_PADDRESS address
WHERE tour.c_isactual = 1
  AND tour.c_id = point.fk_tour
  AND point.fk_location = loc.c_id
  AND loc.fk_address = address.c_id
GROUP BY address.c_address_zipcode, substr(point.c_actualarrival, 0, 8)
ORDER BY count(point.fk_location) DESC;

--to_date(substr(point.c_actualarrival, 0, 8), 'DAY')