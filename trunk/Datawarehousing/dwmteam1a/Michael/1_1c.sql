SELECT address.c_address_zipcode, to_date(substr(point.c_actualarrival, 0, 8), 'DD.MM.YYYY'), count(point.fk_location)
FROM T_TOURMGMT_TOUR tour, T_TOURMGMT_TOURPOINT point, T_ORGLOC_LOCATION loc, T_ADDRESSMGMT_PADDRESS address
WHERE tour.c_isactual = 1
  AND tour.c_id = point.fk_tour
  AND point.fk_location = loc.c_id
  AND loc.fk_address = address.c_id
GROUP BY address.c_address_zipcode, to_date(substr(point.c_actualarrival, 0, 8), 'DD.MM.YYYY')
ORDER BY count(point.fk_location) DESC;

--to_date(to_date(substr(point.c_actualarrival, 0, 8), 'DD.MM.YYYY'), 'D')  funktioniert nicht, da Jahr 2-stellig ist