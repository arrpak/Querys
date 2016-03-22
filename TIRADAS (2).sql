DELETE fn3printingdetail WHERE header='MARCA' AND dateprint=dat('20070831') AND node='CATBAR' AND decision=0;



delete fn3printingdetail
 WHERE header='MARCA' AND dateprint=dat('20070826') AND node='AND' AND orderf=2;

INSERT INTO fn3printingdetail
SELECT header,product,node,dateprint,2,newsstand,forsession,decision+increasedec,0,decsession,decsys
FROM
fn3printingdetail
WHERE header='MARCA' AND dateprint=dat('20070826') AND node='AND' AND orderf=1;


SELECT *
FROM fn3processcontrol where active='Y' ;

UPDATE fn3processcontrol SET active='N' where active='Y' AND idsession='2007082431_NOR.PV  ';

SELECT Count(*) FROM fn3printingdetail WHERE dateprint=dat('20070821') AND header='EXPANSION' AND decision>0;
SELECT Count(*) FROM fn3printingdetail WHERE dateprint=dat('20070814') AND header='MARCA' AND NODE='CAM' AND decision>0;