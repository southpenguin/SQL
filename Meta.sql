create table Station (
   sid int(4),
   name varchar(20),
   primary key (sid)
);

create table Line (
   lid int(2),
   direction varchar(8),
   primary key (lid, direction)
);


create table Stop (
   sid int(4),
   lid int(2),
   primary key (sid, lid),
   foreign key (sid) references Station(sid),
   foreign key (lid) references Line(lid)
);

create table Train (
   lid int(2),
   stime int(4),
   primary key (lid, stime),
   foreign key (lid) references Line(lid)
);

create table Card (
   cid int(5),
   balance numeric(4,2),
   insid int(4),
   outsid int(4),
   intime int(4),
   outtime int(4),
   primary key (cid)
);

create table Schedule (
   lid int(2),
   sid int(4),
   stime int(4),
   intime int(4),
   outtime int(4),
   primary key (lid, sid, stime, intime),
   foreign key (lid) references Line(lid),
   foreign key (sid) references Station(sid),
   foreign key (stime) references Train(stime)
);

create table Price (
   cost numeric(4,2),
   fromsid int(4),
   tosid int(4),
   primary key (cost, fromsid, tosid)
);


insert into Station values (1001, 'Jay St');
insert into Station values (1002, 'Times Sq');
insert into Station values (1003, 'Penn Station');
insert into Station values (1004, 'Wall St');
insert into Station values (1101, 'Kings Highway');
insert into Station values (1011, 'York St');
insert into Station values (1201, '7th Ave');
insert into Station values (1021, 'Park Ave');
insert into Station values (1301, 'Columbus Circle');
insert into Station values (1031, 'Coney Island');


insert into Line values (1, 'uptown');
insert into Line values (1, 'downtown');
insert into Line values (2, 'uptown');
insert into Line values (2, 'downtown');
insert into Line values (3, 'uptown');
insert into Line values (3, 'downtown');

insert into Stop values (1001, 1);
insert into Stop values (1002, 1);
insert into Stop values (1003, 1);
insert into Stop values (1004, 2);
insert into Stop values (1101, 2);
insert into Stop values (1101, 3);
insert into Stop values (1001, 2);
insert into Stop values (1031, 3);
insert into Stop values (1011, 1);
insert into Stop values (1011, 2);
insert into Stop values (1301, 2);
insert into Stop values (1301, 1);
insert into Stop values (1301, 3);
insert into Stop values (1031, 2);
insert into Stop values (1031, 1);

insert into Train values (1, 0620);
insert into Train values (1, 0820);
insert into Train values (1, 1020);
insert into Train values (2, 0330);
insert into Train values (2, 0630);
insert into Train values (2, 1330);
insert into Train values (3, 0900);
insert into Train values (3, 1400);
insert into Train values (3, 2000);

insert into Card values (10345, 10.50, 1001, 1201, 0830, 1330);
insert into Card values (20341, 2210.75, 1031, 1201, 0927, 0330);
insert into Card values (38741, 813.20, 1001, 1021, 1357, 0959);
insert into Card values (29414, 84.19, 1301, 1001, 1638, 2147);
insert into Card values (92345, 9.00, 1021, 1011, 0530, 1549);

insert into Schedule values(1, 1001, 0820, 0857, 0859);
insert into Schedule values(1, 1003, 0820, 0837, 0840);
insert into Schedule values(2, 1101, 0630, 1321, 1322);
insert into Schedule values(2, 1001, 0630, 1141, 1145);
insert into Schedule values(3, 1031, 0900, 0931, 0933);
insert into Schedule values(3, 1101, 0900, 1045, 1047);
insert into Schedule values(3, 1031, 0900, 1040, 1042);

insert into Price value (2.5, 1001, 1003);
insert into Price value (3.5, 1001, 1031);
insert into Price value (4.5, 1001, 1002);
insert into Price value (3, 1021, 1201);
insert into Price value (2.5, 1001, 1003);
insert into Price value (4.5, 1301, 1002);
insert into Price value (2.25, 1011, 1301);
insert into Price value (3.5, 1101, 1003);



select cost Cost, Sc2.intime - Sc1.outtime Time
from Price, Station S1, Station S2, Schedule Sc1, Schedule Sc2
where Price.fromsid = S1.sid
	and Price.tosid = S2.sid
    and S1.name = 'Metro Square'
    and S2.name = 'Broadway'
    and Sc1.stime = Sc2.stime
    and Sc1.sid = S1.sid
    and Sc2.sid = S2.sid
    


select name 'Station Names', count(distinct cid) Traffic
from Station, Card
where Station.sid = Card.insid
or Station.sid = Card.outsid
and Card.intime >= 0800
and Card.intime <= 1000
or Card.outtime >= 0800
and Card.outtime <= 1000
group by name


select cid
from Card
where intime <= 2400-1000
and outtime < intime
