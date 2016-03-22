INSERT INTO FN3PARTIDOFUTBOL
SELECT competicion,'MUN','PRIMERA',temporada||'/'||TEMPORADA,'UNICAUNI','UNICA',fechapartido,'N','S',90,
equipolocal,EQUIPOVISITANTE,goleslocal,golesvisitante,NULL,NULL,NULL
FROM FN3PARTIDOTMP2
WHERE
--COMPETICION='AMISTOSO' AND
FECHAPARTIDO||EQUIPOLOCAL||EQUIPOVISITANTE IN
(
SELECT FECHAPARTIDO||EQUIPOLOCAL||EQUIPOVISITANTE
FROM FN3PARTIDOTMP2
MINUS
SELECT FECHAPARTIDO||EQUIPOLOCAL||EQUIPOVISITANTE
FROM FN3PARTIDOFUTBOL)



SELECT *
FROM fn3partidofutbol
WHERE
fase='UNICAUNI' AND jornada='UNICA' and
fechapartido||equipolocal||equipovisitante IN
( SELECT fechapartido||equipolocal||equipovisitante
FROM
(SELECT fechapartido,equipolocal,equipovisitante,Count(*)
FROM fn3partidofutbol
GROUP BY competicion,fechapartido,equipolocal,equipovisitante
HAVING Count(*)>1))
;