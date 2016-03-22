SELECT * FROM PARTIDORSSSF
--DELETE FROM tabla
 WHERE ROWID NOT IN
            (SELECT MIN(ROWID)
               FROM PARTIDORSSSF
              GROUP BY competicion, dominio, categoria, temporada, fase, jornada, fechapartido,codigo
              HAVING Count(*)>1);










SELECT dominio, temporada,jornada, fechapartido, valido, equipolocal, equipovisitante, goleslocal, golesvisitante, codigo, codigo2 FROM  PARTIDORSSSF
WHERE
(competicion, dominio, categoria, temporada, fase, jornada, fechapartido,codigo) IN
(SELECT competicion, dominio, categoria, temporada, fase, jornada, fechapartido,codigo
FROM
(
SELECT competicion, dominio, categoria, temporada, fase, jornada, fechapartido,codigo,Count(*)
FROM  PARTIDORSSSF
GROUP BY competicion, dominio, categoria, temporada, fase, jornada, fechapartido,codigo
HAVING Count(*)>1));

