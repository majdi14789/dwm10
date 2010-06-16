--edges
select t4.c_id, t5.c_id, t1.c_actualarrival, t2.c_actualdeparture
from t_tourmgmt_tourpoint t1
  inner join t_tourmgmt_tourpoint t2 
    on (t1.fk_tour=t2.fk_tour and t2.c_sequencenumber=t1.c_sequencenumber-1) --t1 ist späterer Knoten
  inner join t_tourmgmt_tour t3 on t1.fk_tour=t3.c_id
  inner join t_orgloc_location t4 on t1.fk_location=t4.c_id
  inner join t_orgloc_location t5 on t2.fk_location=t5.c_id
  where c_isactual=1
  and t4.c_id=t5.c_id;
 