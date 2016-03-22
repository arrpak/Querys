SELECT S.OSUSER, --Usuario de SO
S.USERNAME, --Usuario
A.SQL_TEXT, --Query
SL.OPNAME, --Operaci�n que esta realizando (Table Scan, Sort/Merge,..)
trunc((SL.SOFAR*100)/SL.TOTALWORK,2) AS EVOL, --Evoluci�n en %
SL.SOFAR, --Tiempo que lleva
SL.TOTALWORK, --Tiempo total
To_Char(SYSDATE, 'dd/mm/yyyy HH24:MI:SS') AS T_NOW, --Ahora. D�a y hora actual.
To_Char(SYSDATE+((((1/24)/60)/60)*SL.TIME_REMAINING), 'dd/mm/yyyy HH24:MI:SS') AS T_STOP --D�a y hora cuando acabar�.
FROM
V$SESSION_LONGOPS SL, V$SESSION S ,V$SQLAREA A
WHERE
SL.SOFAR <> SL.TOTALWORK AND
SL.SID = S.SID AND
A.HASH_VALUE=S.SQL_HASH_VALUE;