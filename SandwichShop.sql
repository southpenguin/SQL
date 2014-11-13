create table customer (
  phone char(10) primary key,
  building_num int,
  street varchar(20),
  apartment varchar(20)
 );
 
create table sandwich (
  sname varchar(20) primary key,
  description varchar (100)
 );
 
create table menu (
  sname varchar(20),
  size varchar (20),
  price decimal(4,2),
  primary key (sname, size),
  foreign key (sname) references sandwich(sname)
 );
 
create table orders (
  phone char(10),
  sname varchar(20),
  size varchar(20),
  o_time datetime,
  quantity int,
  status varchar(10),
  primary key (phone, sname, size, o_time),
  foreign key (phone) references customer(phone),
  foreign key (sname, size) references menu(sname, size)
);




INSERT INTO `TEST`.`customer` (`phone`, `building_num`, `street`, `apartment`) VALUES 
('7382913445', '82', 'Jay St', '405'),
('5184027175', '88', 'Adam St', 'A11'),
('5449103874', '119', 'Kings Hwy', 'C2'),
('1947102744', '72', 'Broadway', '9051'),
('6194015395', '3', '5th Ave', 'E-112'),
('9232345721', '350', 'Wall Street', '3702'),
('3810347591', '15', 'Main St', 'C3');


INSERT INTO `TEST`.`sandwich` (`sname`, `description`) VALUES 
('Black Forest', 'delicious sandwich mixed with bread and black forest ham.'),
('Breakfast', 'only breakfast sandwich serving in the morning'),
('Meat Lover', 'meat meat meat! a sandwich made by all meat');


INSERT INTO `TEST`.`menu` (`sname`, `size`, `price`) VALUES 
('Black Forest', 'Big', '5.5'),
('Black Forest', 'Small', '3.5'),
('Breakfast', 'Big', '4.5'),
('Breakfast', 'Small', '2.5'),
('Black Forest', 'Medium', '4.5'),
('Meat Lover', 'Regular', '8.5');


INSERT INTO `TEST`.`orders` (`phone`, `sname`, `size`, `o_time`, `quantity`, `status`) VALUES 
('1947102744', 'Breakfast', 'Big', '2014-11-10 09:37:06', '2', 'complete'),
('6194015395', 'Black Forest', 'Medium', '2014-11-12 21:40:39', '1', 'pending'),
('9232345721', 'Meat Lover', 'Regular', '2014-11-12 16:32:38', '4', 'delivering');
