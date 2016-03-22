select tab1.newsstand,tab1.decision+tab1.increasedec as Dec,tab2.service as Ser,
tab2.service-tab1.decision-tab1.increasedec as Dif
from fn3printingdetail tab1,fn3operation tab2
where tab1.dateprint=to_date('20020304','yyyymmdd') and
      tab1.header='MARCA' and
      tab1.product='DIARIO'and
      tab1.newsstand like '028%' and
      tab1.orderf=1 and
      (tab1.decision+tab1.increasedec-tab2.service>1 or
      tab1.decision+tab1.increasedec-tab2.service<-1 )and
      tab1.header=tab2.header and
      tab1.product=tab2.product and
      tab1.newsstand=tab2.newsstand and
      tab1.dateprint=tab2.operationdate
      order by dif;
