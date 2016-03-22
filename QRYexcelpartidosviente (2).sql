SELECT * from
((SELECT competicion,categoria,fase,jornada,To_Char(fechapartido,'yyyy/mm/dd') AS fecha,
       eq1.descripcion AS LOCAL ,eq2.descripcion AS visitante
       ,goleslocal AS GolLoc,golesvisitante AS GolVis
FROM FN3PARTIDOFUTBOL,FN3EQUIPOFUTBOL EQ1,FN3EQUIPOFUTBOL EQ2
WHERE
FECHAPARTIDO>=DAT('20070820') AND
FECHAPARTIDO<=SYSDATE-1 AND
EQ1.CODIGO=EQUIPOLOCAL AND
VALIDO='S' AND
EQ2.CODIGO=EQUIPOVISITANTE
)
UNION
(SELECT competicion,categoria,fase,jornada,To_Char(fechapartido,'yyyy/mm/dd') AS fecha,
       eq1.descripcion AS LOCAL ,eq2.descripcion AS visitante
       ,NULL ,null
FROM FN3PARTIDOFUTBOL,FN3EQUIPOFUTBOL EQ1,FN3EQUIPOFUTBOL EQ2
WHERE
FECHAPARTIDO>=SYSDATE-1 AND
FECHAPARTIDO<=SYSDATE+30 AND
EQ1.CODIGO=EQUIPOLOCAL AND
VALIDO='S' AND
EQ2.CODIGO=EQUIPOVISITANTE)
)
ORDER BY fecha

