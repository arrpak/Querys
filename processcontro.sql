SELECT * from
(SELECT * FROM fn5processcontrol
WHERE active='Y'
union
SELECT * FROM fn3processcontrol
WHERE active='Y')
ORDER BY dateprocess


UPDATE fn5processcontrol
SET active='N'
WHERE active='Y'

UPDATE fn3processcontrol
SET active='N'
WHERE active='Y'  and idsession='20080425.PV_CATBAR_CAVCMU'

UPDATE fn5processcontrol
SET active='N'
WHERE active='Y'  and idsession='2008030512_AST_DASA.PV_03'

UPDATE fn3process
SET maxoutput=1
WHERE code='puntoventaestpack4bis.bat'


SELECT Count(*),state,stateinfo
FROM fn3estimation
WHERE estsession='20080228.PV'
GROUP BY state,stateinfo



SELECT Count(*),SubStr(output,11,3),state
FROM fn3forecast
WHERE forsession='2008020512.PV'
GROUP BY SubStr(output,11,3),state



SELECT Count(*),state,stateinfo
FROM fn3forecast
WHERE forsession='2008021825.PV'
GROUP BY state,stateinfo


SELECT Count(*),state
FROM fn3forecast
WHERE forsession='2008021825.PV'
GROUP BY state




SELECT Count(*) FROM fn3operationtmp

TRUNCATE TABLE fn3operationtmp


UPDATE fn3outputinputinformation SET omega='0.1' WHERE input='AlbornozRMA.Cupon';



SELECT Count(*),state
FROM fn3estimation
WHERE estsession='20080228.PV'
GROUP BY state




SELECT Count(*) FROM fn3operationtmp
TRUNCATE TABLE fn3operationtmp





SELECT * FROM v$log
SELECT * FROM v$logfile
SELECT * FROM v$log_history




ALTER SYSTEM SWITCH logfile


ALTER DATABASE ADD LOGFILE GROUP 3 ('/opt/oracle/oradata/oracle83/redo3.log') SIZE 500M;


ALTER DATABASE DROP   LOGFILE GROUP 6;

