select P1.name
from Physicist P1 join Authors A1 join Paper, Cites, Physicist P2 join Authors A2
where A1.papid = Cites.citeid and
  A2.papid = Cites.citedid and
  P2.name = 'Albert Einstein';


select name
from Physicist join Authors A1, Authors A2
where A1.papid = A2.papid and
  Physicist.advisor = A2.pid
group by Physicist.pid
having count(distinct A1.papid) = 
  (select count(distinct papid) 
  from Authors A3 
  where A3.pid = Physicist.pid)
