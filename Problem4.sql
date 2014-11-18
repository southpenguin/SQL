CREATE VIEW AvailableMovies AS
SELECT branch.bid BranchID, movie.title Movie
FROM branch, copy, movie, rental
WHERE branch.bid = copy.bid
  AND copy.mid = movie.mid
  AND copy.copyid = rental.copyid
  AND rental.returndate > rental.outdate
GROUP BY BranchID;


CREATE VIEW CustView AS
SELECT cid CustomerID, cname Name
FROM customer


INSERT CustView VALUES(55555, 'Jason Smith');


CREATE TRIGGER update_oldaddress
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
  INSERT INTO OldAddresses VALUES(OLD.cid, OLD.caddress);
END



SELECT COUNT(*) from information_schema.tables 
WHERE table_type = 'base table' 

SELECT TABLE_NAME, COUNT(*) 
FROM INFORMATION_SCHEMA.COLUMNS 
GROUP BY TABLE_NAME
