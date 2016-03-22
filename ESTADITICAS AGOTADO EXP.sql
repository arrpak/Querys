SELECT num/numtot,t1.venta
from
(SELECT Count(*) AS num,service+incidence-return AS venta
FROM fn3operation
WHERE header='EXPANSION' AND product='DIARIO' AND
operationdate>=To_Date('20110801','yyyymmdd')
GROUP BY service+incidence-RETURN) t1,
(SELECT Count(*) AS numtot
FROM fn3operation
WHERE header='EXPANSION' AND product='DIARIO'AND
operationdate>=To_Date('20110801','yyyymmdd') ) t2




SELECT num/numtot,t1.venta
from
(SELECT Count(*) AS num,service+incidence-return AS venta
FROM fn3operation
WHERE header='EXPANSION' AND product='DIARIO' AND
operationdate>=To_Date('20110801','yyyymmdd') AND RETURN=0
GROUP BY service+incidence-RETURN) t1,
(SELECT Count(*) AS numtot
FROM fn3operation
WHERE header='EXPANSION' AND product='DIARIO'AND
operationdate>=To_Date('20110801','yyyymmdd') AND RETURN=0) t2
