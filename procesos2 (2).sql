SELECT *
FROM Fn3processcontrol
WHERE active='Y'
UNION
SELECT *
FROM Fn5processcontrol
WHERE active='Y'

UPDATE fn3processcontrol
set active='N' WHERE active='Y' AND IDSESSION='y2007m07d18h11n05s05'