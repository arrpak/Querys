
SELECT t1.dateprint--,Max(t1.orderf)
,decsession
FROM emuprintingdetail t1,
(
SELECT dateprint,Max(orderf) AS orderf
FROM emuprinting
WHERE dateprint > to_date('2010/12/01', 'yyyy/mm/dd')
GROUP BY dateprint
 )    t2
WHERE
t1.dateprint > to_date('2010/12/01', 'yyyy/mm/dd')
AND t1.orderf=t2.orderf
AND t1.dateprint=t2.dateprint
AND decsession LIKE 'F%'
GROUP BY t1.dateprint,decsession