SELECT pri.dateprint,Sum(decision+increasedec),nif.tirada,Count(*)
FROM fn3printingdetail pridet ,fn3printing pri,
(SELECT infodate,service+incidencecont AS tirada
FROM fn3nodeinformation
WHERE header='MARCA' AND product='DIARIO' AND node='CCA') nif
WHERE
pri.used='Y' AND
pri.dateprint>=To_Date('20070701','yyyymmdd') and
pri.node='NOR' AND
pri.dateprint=pridet.dateprint AND
pri.orderf=pridet.orderf AND
pri.node=pridet.node AND
--nif.node='CCA' AND
nif.infodate=pri.dateprint AND
pri.dateprint=pridet.dateprint AND
pri.dateprint=nif.infodate AND
newsstand IN (
SELECT newsstand
FROM fn3newsstandon
WHERE dateoff IS NULL AND (newsstand LIKE '039%' OR newsstand LIKE '139%'))
GROUP BY pri.dateprint,nif.tirada
;