define comp='CLASMUNDIAL';
DEFINE TEMP='1960/1962';





INSERT INTO FN3TEMPORADA SELECT  '&TEMP','TEMPORADA &TEMP' FROM DUAL;
INSERT INTO FN3COMPETICIONFUTBOL SELECT '&COMP','MUN','PRIMERA','&TEMP',DAT('1960/01/01'),DAT('1962/12/31') FROM DUAL;
INSERT INTO FN3FASECOMPETICION   SELECT '&COMP','MUN','PRIMERA','&TEMP','UNICAUNI',DAT('1960/01/01'),DAT('1962/12/31'),0,0 FROM DUAL;
INSERT INTO FN3FASEJORNADACOMPETICION   SELECT '&COMP','MUN','PRIMERA','&TEMP','UNICAUNI','UNICA',DAT('1960/01/01'),DAT('1962/12/31') FROM DUAL;

insert INTO fn3equipocompite
SELECT '&COMP','MUN','PRIMERA','&TEMP',codigo,0
FROM fn3equipofutbol
WHERE tipoequipo='SEL'
AND CODIGO NOT IN
(
SELECT equipo
FROM fn3equipocompite
WHERE temporada='&TEMP' AND competicion='&COMP'  AND   dominio='MUN') ;



insert INTO fn3equipocompitefase
SELECT '&COMP','MUN','PRIMERA','&TEMP','UNICAUNI',codigo,'CLA','O'
FROM fn3equipofutbol
WHERE
tipoequipo='SEL' AND
CODIGO NOT IN
(
SELECT equipo
FROM fn3equipocompiteFASE
WHERE temporada='&TEMP' AND competicion='&COMP' and dominio='MUN')  ;


