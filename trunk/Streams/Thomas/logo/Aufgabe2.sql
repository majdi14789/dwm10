select * from t_tourmgmt_tourpoint
where fk_tour='73f316ac0d12e26a000001288c5e61a00017'
order by c_sequencenumber;

select fk_tour, count(*) from t_tourmgmt_tourpoint 
where c_sequencenumber=0
group by fk_tour
having count(*)>1;

--nodes
select 
    t1.c_id as node_id, --tourpoint
    t2.c_id as tour_id, 
    t4.c_id as address_id,
    t4.c_address_country as country,
    t4.c_address_zipcode as zip,
    t4.c_address_city as city,
    t4.c_address_street as street
  from t_tourmgmt_tourpoint t1
  inner join t_tourmgmt_tour t2 on t1.fk_tour=t2.c_id
  inner join t_orgloc_location t3 on t1.fk_location=t3.c_id
  inner join t_addressmgmt_paddress t4 on t3.fk_address=t4.c_id
  where t2.c_isactual=1;

--edges
select t1.c_id as n1_id, t2.c_id as n2_id, -- tourpoints
  t1.c_actualdeparture as departure, t2.c_actualarrival as arrival, 
  t1.c_sequencenumber as seqnumber
from t_tourmgmt_tourpoint t1
  inner join t_tourmgmt_tourpoint t2 
    on (t1.fk_tour=t2.fk_tour and t2.c_sequencenumber=t1.c_sequencenumber+1) --t2 ist späterer Knoten
  inner join t_tourmgmt_tour t3 on t1.fk_tour=t3.c_id
  where t3.c_isactual=1



 