create table mountain_huts 
(
	id 			integer not null unique,
	name 		varchar(40) not null unique,
	altitude 	integer not null
);
insert into mountain_huts 
values (1, 'Dakonat', 1900),
(2, 'Natisa', 2100),
(3, 'Gajantut', 1600),
(4, 'Rifat', 782),
(5, 'Tupur', 1370);


create table trails 
(
	hut1 		integer not null,
	hut2 		integer not null
);
insert into trails values (1, 3);
insert into trails values (3, 2);
insert into trails values (3, 5);
insert into trails values (4, 5);
insert into trails values (1, 5);

select * from mountain_huts;
select * from trails;
-----------------------------solution----------------------------------------------------
with cte_trails1 AS 
	(
	select t1.hut1 as start_hut, h1.name as start_hut_name,
	h1.altitude as start_hut_altitude, t1.hut2 as end_hut
	from mountain_huts as h1 join trails as t1
	on h1.id = t1.hut1
	),

	cte_trails2 AS 
	(
	select t2.*, h2.name as end_hut_name, h2.altitude as end_hut_altitude,
	case when start_hut_altitude > h2.altitude then 1 else 0 end as altitude_flag 
	-- here, flag checks, wheter the trails are in descending order(i.e. start_pt > end_pt)
	from cte_trails1 as t2 join mountain_huts as h2
	on h2.id = t2.end_hut
	),

	cte_final AS 
	(
	select case when altitude_flag = 1 then start_hut else end_hut end as start_hut,
		   case when altitude_flag = 1 then start_hut_name else end_hut_name end as start_hut_name,
		   case when altitude_flag = 1 then end_hut else start_hut end as end_hut,
		   case when altitude_flag = 1 then end_hut_name else start_hut_name end as end_hut_name
	from cte_trails2
	)
-- possible trails are: [ 1->3->5 ] [ 2->3->5 ] [ 3->5->4 ] [ 1->5->4 ]
select * 
from cte_final as c1 
join cte_final as c2
on c1.end_hut = c2.start_hut;
				