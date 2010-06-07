SELECT address.c_address_zipcode, to_char(point.c_actualarrival, 'DAY') as daychar, count(*)
FROM T_TOURMGMT_TOUR tour, T_TOURMGMT_TOURPOINT point, T_ORGLOC_LOCATION loc, T_ADDRESSMGMT_PADDRESS address
WHERE tour.c_isactual = 1
  AND tour.c_id = point.fk_tour
  AND point.fk_location = loc.c_id
  AND loc.fk_address = address.c_id
GROUP BY address.c_address_zipcode, to_char(point.c_actualarrival, 'DAY')
ORDER BY count(*) DESC;
