
select newsstand,datefrom,dateuntil
from fn3closingfixed
where dateuntil>sysdate
and newsstand in
(select newsstand
from fn3newsstandon
where dateoff is null
and (newsstand like '011%' or newsstand like '010%' or
newsstand like '041%' or newsstand like '029%' or
newsstand like '021%' or newsstand like '006%' or
newsstand like '004%' or newsstand like '014%' or
newsstand like '023%' or newsstand like '052%' or
newsstand like '018%') )
order by newsstand;

