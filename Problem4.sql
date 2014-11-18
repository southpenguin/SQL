CREATE VIEW AvailableMovies AS
SELECT branch.bid BranchID, movie.title Movie
FROM branch, copy, movie, rental
WHERE branch.bid = copy.bid
  AND copy.mid = movie.mid
  AND copy.copyid = rental.copyid
  AND rental.returndate > rental.outdate
GROUP BY BranchID;


CREATE VIEW 
