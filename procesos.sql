SELECT *
FROM fn3processcontrol
WHERE active='Y'
UNION
(SELECT *
FROM fn5processcontrol
WHERE active='Y'
)


UPDATE fn5processcontrol
SET active='N'
WHERE idsession='2007032330_CRE.PV';