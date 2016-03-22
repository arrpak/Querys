spool c:\puntosdev.txt
select newsstand,sum(return)/sum(service)*100,sum(service)
from fn3operation
where
header='MARCA' and
product='DIARIO' and
operationdate>to_date('20020301','yyyymmdd') and
newsstand like '028%' 
--and rownum < 200
group by newsstand
order by sum(return)/sum(service)*100;
spool off;
