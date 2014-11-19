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




SELECT 
  (SELECT COUNT(*) 
  FROM information_schema.tables 
  WHERE table_schema = 'HW2' ) 'Number of Tables',
  (SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE table_schema = 'HW2') 'Number of Attributes'
  
  
SELECT column_name 'Key Name', table_name 'Table', referenced_table_name 'Referenced Table', referenced_column_name 'Referenced Attribute'
FROM information_schema.key_column_usage
WHERE table_schema='HW2'
  AND referenced_table_schema IS NOT NULL
  
  
SELECT table_name Table, column_name Attribute
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_schema = 'HW2'
  AND column_name LIKE '%name%'
  
SELECT table_name, column_name
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_schema = 'HW2'
  AND column_name LIKE '%name%'
