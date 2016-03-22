  set newpage none;
  set hea on
  set linesize 100;
  set colsep ';';
  set pagesize 50000;
select ope.newsstand,operationdate,decision+increasedec as Decision,ope.service,ope.incidence,ope.return,
       ope.service+ope.incidence-ope.return as venta
from fn3operationhistorical ope,fn3printingdetail det,fn3printing pri
where 
--ope.newsstand='028102524118' and
pri.used='Y' and
ope.header='MARCA' and
pri.node='CAM' and
ope.product='DIARIO' and
ope.operationdate=to_date('20030319','yyyymmdd') and
ope.service=0 and
ope.newsstand like '028%' and
det.dateprint=operationdate and
det.dateprint=pri.dateprint and
det.newsstand=ope.newsstand and
ope.header=pri.header and
pri.header=det.header and
ope.product=pri.product and
det.product=pri.product and
pri.dateprint=det.dateprint and
det.decision>0 and
pri.orderf=det.orderf;



