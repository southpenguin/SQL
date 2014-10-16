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
   intime int(4),
   outtime int(4),
   primary key (lid, sid, intime),
   foreign key (lid) references Line(lid),
   foreign key (sid) references Station(sid)
);

create table Price (
   cost numeric(4,2),
   fromstat varchar(20),
   tostat varchar(20),
   primary key (cost, fromstat, tostat)
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

insert into Schedule values()
