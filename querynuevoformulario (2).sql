SELECT tabla1.prefijo,tabla1.fecha,tabla1.tirada,tabla2.servicio,tabla2.incidencia,tabla2.devolucion,tabla2.PorcentajeDevolucion,
       tabla2.NumeroNOAgotatos,tabla2.NumeroAgotatos,tabla2.PorcentajeAgotado,tabla2.NumeroOperaciones
from
(
select
Replace(NEWSSTAND,' ','') as Prefijo, pri.dateprint as Fecha ,
(case when (decision + increaseDec) <= 15
              then  ceil(decision + increaseDec)
              else  ROUND(decision + increaseDec) END) AS Tirada
 from formarca.Fn3printingdetail det, fn3printing pri
 where det.header    in ('MARCA')
 AND det.header = pri.header
   and det.product   in ('DIARIO')
   AND det.product = pri.product
   and det.newsStand in ('041000407014')
   AND det.node = pri.node
   AND det.dateprint = pri.dateprint
   AND det.orderf = pri.orderf
   AND pri.used = 'Y'
 order by det.dateprint ASC )tabla1,
(select    Replace(NEWSSTAND,' ','') as Prefijo, OPERATIONDATE as Fecha ,
To_Number(NULL) AS Tirada,
(service) as Servicio ,
(incidence) as Incidencia ,
(RETURN) as Devolucion ,
  to_number(decode((SERVICE+INCIDENCE+RETURN),0,'',
(SERVICE + INCIDENCE - RETURN ))) as Venta ,
  to_number(substr(decode((RETURN), 0, decode( (SERVICE + INCIDENCE), 0, '', 0),
 decode((SERVICE + INCIDENCE), 0, '',
((RETURN))/((SERVICE + INCIDENCE)))),1,6)) as PorcentajeDevolucion ,
(least(1,service) * least(1,return)) as NumeroNOAgotatos ,
(least(1,service)) - (least(1,service) * least(1, return)) as NumeroAgotatos ,
((least(1,service)) - (least(1,service) * least(1,return))) / greatest(1,(least(1,service))) as PorcentajeAgotado ,
1 as NumeroOperaciones
 from formarca.Fn3OPERATION
 where header    in ('MARCA')
   and product   in ('DIARIO')
   and newsStand in ('041000407014')
 order by Fecha, Prefijo
  ) tabla2
  WHERE tabla1.fecha=tabla2.fecha(+)
        AND tabla1.prefijo=tabla2.prefijo(+)