select newsstand
from fn3closingfixed
where dateuntil=to_date('22220222','yyyymmdd')
and newsstand like '028%'
 minus
 (select newsstand
 from fn3newsstandon
 where newsstand like '028%'
 and dateoff < to_date('22220222','yyyymmdd'));



select newsstand,DATEFROM,DATEUNTIL
from fn3closingfixed
where newsstand in
(select newsstand
from fn3closingfixed
where dateuntil=to_date('22220222','yyyymmdd')
and newsstand like '028%'
 minus
 (select newsstand
 from fn3newsstandon
 where newsstand like '028%'
 and dateoff < to_date('22220222','yyyymmdd')));







select fn3newsstandon.newsstand,dateoff,datefrom,dateuntil
from fn3closingfixed,fn3newsstandon
where dateuntil=to_date('22220222','yyyymmdd')
and fn3closingfixed.newsstand like '028%'
and fn3closingfixed.newsstand=fn3newsstandon.newsstand
order by dateoff,datefrom;

