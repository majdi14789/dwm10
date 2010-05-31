SELECT TOUR.C_ID, point.c_sequencenumber, address.c_address_zipcode, point.c_actualarrival, point.c_actualdeparture
FROM T_TOURMGMT_TOUR tour, T_TOURMGMT_TOURPOINT point, T_ADDRESSMGMT_PADDRESS address, T_ORGLOC_LOCATION loc
WHERE tour.C_ISACTUAL = 1
  AND tour.c_id = point.fk_tour
  AND POINT.FK_LOCATION = loc.c_id
  AND loc.fk_address = address.c_id
ORDER BY tour.C_ID, point.c_sequencenumber ASC;