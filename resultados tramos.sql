SELECT tramo,avg(dev/tir) aspordev,avg(agot/OPEN) AS porago,Count(*)
FROM
(
SELECT 1 AS open,RETURN AS dev,service+incidence AS tir ,CASE WHEN RETURN=0 THEN 1 ELSE 0 END AS Agot,
       CASE WHEN service<10 THEN 1
       WHEN service<20 THEN 1
       WHEN service<30 THEN 2
       WHEN service<40 THEN 3
       WHEN service<50 THEN 4
       WHEN service<60 THEN 5
       WHEN service<70 THEN 6
       WHEN service<80 THEN 7
       ELSE 8 END AS Tramo
FROM fn3operation
WHERE header='MARCA'
AND product='DIARIO'
AND operationdate=dat('20080630')
AND newsstand LIKE '028%'
)
GROUP BY tramo