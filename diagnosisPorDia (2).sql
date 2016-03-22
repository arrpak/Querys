define newsstand='028000100004';
define inidate='2007/07/01';

SELECT det.newsstand,pnf.header,pnf.node,pnf.dateprint,pnf.orderf,pnf.forsession,pnf.sonnode,pnf.orderf,
(case when (det.decision + det.increaseDec) <= 15
              then  ceil(det.decision + det.increaseDec)
              else  ROUND(det.decision + det.increaseDec) end) as Tirada,fser.forecast,sale.venta
FROM fn3printingnodeforsession pnf,fn3printing pri,
     (SELECT *
     FROM fn3printingdetail
     WHERE dateprint=dat('&inidate') AND node='CAM'AND header='MARCA') det,
     fn3node nod,
     (SELECT *
     FROM fn3forecastseries
     WHERE valuedate=dat('&inidate')
  )  fser,
     (SELECT operationdate,newsstand,service+incidence-RETURN AS venta
      FROM fn3operation
      WHERE header='MARCA'
      AND operationdate=dat('&inidate')
) sale
WHERE pnf.node='CAM' AND pnf.dateprint>=dat('&inidate') AND pnf.header='MARCA'
AND pri.used='Y'
--AND det.newsstand='028000100002'
AND pri.node=pnf.node
AND pri.header=pnf.header
AND pri.product=pnf.product
AND pri.node=pnf.node
AND pri.orderf=pnf.orderf
AND pri.dateprint=pnf.dateprint
AND det.node=pri.node
AND det.dateprint=pri.dateprint
AND det.header=pri.header
AND det.product=pri.product
AND det.orderf=pri.orderf
AND nod.fathernode=pnf.sonnode
AND nod.newsstand=det.newsstand
AND sale.newsstand=det.newsstand
AND nod.header=det.header
AND nod.product=det.product
AND fser.forsession=det.forsession
AND fser.valuedate=det.dateprint
AND sale.operationdate=det.dateprint
AND 'VentaMarca'||det.newsstand=fser.output
;
