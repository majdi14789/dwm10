select * from dba_tables where owner='LPT_LEK_LOGO' order by table_name; --tablespace_name='USERS';
desc d511;

-- a) fertig
select t2.c_id as tour_id, t1.c_sequencenumber, t4.c_address_zipcode, t1.c_actualarrival, t1.c_actualdeparture
from  t_tourmgmt_tourpoint t1
  inner join t_tourmgmt_tour t2 on (t1.fk_tour=t2.c_id) 
  inner join t_orgloc_location t3 on (t1.fk_location=t3.c_id)
  inner join t_addressmgmt_paddress t4 on (t3.fk_address=t4.c_id)
where t2.c_isactual=1
order by 1, 2;

-- b) fertig
select t2.c_id as tour_id, count(*) as stopps
from t_tourmgmt_tourpoint t1
  inner join t_tourmgmt_tour t2 on (t1.fk_tour=t2.c_id) 
where c_isactual=1
group by t2.c_id
having  count(*)<10
order by 2 desc;

-- c) fertig
select t4.c_address_zipcode, to_char(t1.c_actualarrival, 'DAY') as day, count(*) as anzahl
from  t_tourmgmt_tourpoint t1
  inner join t_tourmgmt_tour t2 on (t1.fk_tour=t2.c_id) 
  inner join t_orgloc_location t3 on (t1.fk_location=t3.c_id)
  inner join t_addressmgmt_paddress t4 on (t3.fk_address=t4.c_id)
where t2.c_isactual=1 
group by t4.c_address_zipcode, to_char(t1.c_actualarrival, 'DAY')
order by 3 desc;

d) fertig
select zip, day, max(anzahl) as max
from (
select t4.c_address_zipcode as zip, to_char(t1.c_actualarrival, 'DAY') as day, count(*) as anzahl
from  t_tourmgmt_tourpoint t1
  inner join t_tourmgmt_tour t2 on (t1.fk_tour=t2.c_id) 
  inner join t_orgloc_location t3 on (t1.fk_location=t3.c_id)
  inner join t_addressmgmt_paddress t4 on (t3.fk_address=t4.c_id)
where t2.c_isactual=1 
group by t4.c_address_zipcode , to_char(t1.c_actualarrival, 'DAY')
)
group by zip, day
order by 3 desc
;

