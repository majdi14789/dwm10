select * from t_tourmgmt_tourpoint
where fk_tour='73f316ac0d12e26a000001288c5e61a00017'
order by c_sequencenumber;

select fk_tour, count(*) from t_tourmgmt_tourpoint 
where c_sequencenumber=0
group by fk_tour
having count(*)>1;

--nodes
select t3.c_id from t_tourmgmt_tourpoint
  inner join t_tourmgmt_tour t2 on t1.fk_tour=t2.c_id
  inner join t_orgloc_location t3 on t1.fk_location=t3.c_id
  where t2.c_isactual=1;

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
 