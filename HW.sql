CREATE TABLE Customer (
	cid int(10),
	cname varchar(40),
	caddress varchar(40),
	cphone varchar(10),
	balance int(4),
	primary key (cid));

CREATE TABLE Movie (
	mid int(10),
	title varchar(40),
	genre varchar(20),
	year int(4),
	primary key (mid));

CREATE TABLE Branch (
	bid int(10),
	bname varchar(40),
	baddress varchar(40),
	primary key (bid));

CREATE TABLE Copy (
	copyi int(10),
	mid int(10),
	bid int(10),
	primary key (copyid),
	foreign key (mid) references movie(mid),
	foreign key (bid) references branch(bid));


CREATE TABLE Rental (
	cid int(10),
	copyid int(10),
	outdate int(8),
	returndate int(8),
	cost int(4),
	primary key (cid,copyid,outdate),
	foreign key (cid) references customer(cid),
	foreign key (copyid) references copy(copyid));





select cname
from Customer
where 
	Customer.cid in
		(select Rental.cid 
		from Rental, Copy, Movie
		where Rental.copyid = Copy.copyid 
		and Copy.mid = Movie.mid 	
		and Movie.title = 'Terminator1')
	and 
	Customer.cid in
		(select Rental.cid 
		from Rental, Copy, Movie
		where Rental.copyid = Copy.copyid 
		and Copy.mid = Movie.mid 
		and Movie.title = 'Terminator2')
	and
	Customer.cid not in
		(select Rental.cid 
		from Rental, Copy, Movie
		where Rental.copyid = Copy.copyid 
		and Copy.mid = Movie.mid 
		and Movie.title = 'Terminator3')
group by Customer.cid




select cname
from Customer, Rental R1, Rental R2, Copy C1, Copy C2, Movie M1, Movie M2
where Customer.cid = R1.cid
	and Customer.cid = R2.cid
	and R1.copyid = C1.copyid
	and R2.copyid = C2.copyid
	and C1.mid=M1.mid
	and C2.mid=M2.mid
	and M1.title = M2.title
	and R1.outdate > R2.outdate
group by Customer.cid






select customer.cid, balance
from Customer, Rental R1, Rental R2, Copy C1, Copy C2, Movie M1, Movie M2, Branch B1, Branch B2
where Customer.cid = R1.cid
	and Customer.cid = R2.cid
	and R1.copyid = C1.copyid
	and R2.copyid = C2.copyid
	and C1.mid=M1.mid
	and C2.mid=M2.mid
	and C1.bid = B1.bid
	and C2.bid = B2.bid
	and M1.title = M2.title
	and R1.outdate <> R2.outdate
	and B1.bid <> B2.bid
group by customer.cid





select title, count(*) 'Rent Times'
from Movie, Copy, Rental
where Movie.mid = copy.mid
	and Copy.copyid = Rental.copyid
group by title




select title, count(distinct branch.bid) times
from Movie, Branch, Copy, Rental
where movie.mid = copy.mid
	and copy.copyid = rental.copyid
	and copy.bid = branch.bid
group by title
having times = 
	(select count(bid)
	from branch)




select bname, sum(cost) income
from branch, copy, rental
where branch.bid = copy.bid
	and copy.copyid = rental.copyid
	and rental.outdate >= 20090000
	and rental.outdate <= 20099999
group by bname
order by income desc
limit 1




select title
from movie, copy, rental
where movie.mid = copy.mid
	and copy.copyid = rental.copyid
group by title
having 
	count(distinct copy.copyid) = 
	sum(
        	case 
        		when returndate is null 
        		then 1 
        		else 0 
        	end)





update Customer
set balance = balance + 5
where exists 
	(select Customer.cid
	from Movie, Copy, Rental
	where Customer.cid = Rental.cid
		and Rental.copyid = Copy.copyid
		and Copy.mid = Movie.mid
		and rental.outdate >= 20141002 /*The first day of the 2 weeks*/
	group by Customer.cid
	having count(distinct Movie.mid) >= 5)



update Rental, Customer
set Rental.returndate = 20141016, 
	Rental.cost = (2014 - Rental.outdate/10000)*365 + 
	(10 - Rental.outdate%10000 / 100) * 30 + 
	(16 - Rental.outdate%1000000) + 2,
	Customer.balance = Customer.balance - cost
where Rental.cid = 15647 and
	Rental.copyid = 76235 and
	Rental.outdate = 20141003









create view analyst as 
select bname Branches, title Movies, sum(cost) 'Total Income', count(outdate) 'Rental'
from Movie, Branch, Rental, Copy
where Movie.mid = Copy.mid
	and Copy.copyid = Rental.copyid
	and Copy.bid = Branch.bid
    and Rental.outdate >= 20090000
    and Rental.outdate <= 20099999
group by bname, title


select Rentals
from analyst
where Branches = 'Brooklyn Heights'
	and Movies = 'Terminator2' 

select Branches
from analyst
order by 'Total Income' desc
limit 1


create view Customers as
select cid, cname, caddress
from Customer


select caddress
from Customers
where cname = 'John Smith'

/*Cannot output second*/


insert into Customers(cid, cname, caddress)
value (18123, 'Bob Jones', '23 Court Street, Brooklyn')



Stations(sid, name)
Stop(sid, lid)
Lin(lid, direction, number)
Trains(tid, lid, stime
Card(cid, balance, ins, outs, int, outt)
Schedule(lid, sid, in, out)
Price(cost, froms, tos)
