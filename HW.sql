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
