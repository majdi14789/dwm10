SELECT tour.C_ID, point.C_SEQUENCENUMBER, adress.C_ADDRESS_ZIPCODE, point.C_ACTUALARRIVAL, point.C_ACTUALDEPARTURE
FROM T_TOURMGMT_TOUR tour, T_TOURMGMT_TOURPOINT point, T_ORGLOC_LOCATION loc, T_ADDRESSMGMT_PADDRESS adress
WHERE tour.C_ISACTUAL = 1 
  AND point.FK_TOUR = tour.C_ID 
  AND point.FK_LOCATION = loc.C_ID
  AND LOC.FK_ADDRESS = adress.C_ID
ORDER BY tour.C_ID ASC, point.C_SEQUENCENUMBER ASC;