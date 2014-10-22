select P1.name
from Physicist P1 join Authors A1 join Paper, Cites, Physicist P2 join Authors A2
where A1.papid = Cites.citeid and
  A2.papid = Cites.citedid and
  P2.name = 'Albert Einstein';
