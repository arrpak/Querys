Define distribuidor = 'MARINAPRESS';
define delegate  = 'BARCELONA';
define node ='CATBAR';
define dateprint = '20070830';
define orderf = '1';

SELECT       pd.header as Cabecera,
            pd.product as Producto,
            pd.newsstand as PuntoVenta,
           -- pd.valuedate as Fecha,
            pd.forSession as Sesion,
            op.numope as NumOpe,
            op.numagovoz as NumAgo,
           round(fs.forecast) as PrevMod,
           (pd.decision + nvl(pd.increasedec, 0)) as ServMod,
           round(op.ventamedia,2) as VentaMedia,
           ceil(case when round(op.ventamedia,2) <= 2
                 then round(op.ventamedia,2)
               when round(op.ventamedia) >= 3 and round(op.ventamedia) <= 9
                 then round(op.ventamedia) + 1
               when round(op.ventamedia) >= 10 and round(op.ventamedia) <= 15
                 then round(op.ventamedia) + 2
               else round(op.ventamedia)*(1+0.20)
          end) as Propuesta
FROM
(SELECT DISTINCT *
  FROM  Fn3PRINTINGDETAIL pd
  WHERE  EXISTS
  (
    SELECT *
    FROM   formarca.Fn3OPERATION op
    WHERE  pd.header    = op.header
      AND  pd.product   = op.product
      AND  pd.newsstand = op.newsstand
      AND  op.service + op.incidence - op.RETURN >= 0
      AND  op.service + op.incidence > 0
      AND  op.service >= 0
      AND op.operationDate < pd.datePrint
      AND ( op.operationDate >= pd.datePrint  - (7*(3))
      AND To_Char(op.operationDate, 'd') = To_Char(pd.datePrint, 'd')
 )
    GROUP BY op.header, op.product, op.newsstand

  )
     AND pd.datePrint =  to_date('&dateprint', 'yyyymmdd')
     AND pd.header  = 'MARCA'
     AND pd.product = 'DIARIO'
     AND pd.node    = '&node'
     AND pd.orderf  = '&orderf'
) pd,
    (
    select DISTINCT op.header AS header, op.product AS product , op.newsstand AS newsstand,
            count(*) as numope,
            sum(1-least(op.return, 1)) as numagovoz,
            avg(op.service+ op.incidence - op.return) as ventamedia
     from fn3Operation op, fn3codification c
     where op.header    = 'MARCA'
       and op.product   = 'DIARIO'
       AND c.distributor = '&distribuidor'
       AND c.delegate ='&delegate'
       AND op.newsstand = c.newsstand
      and op.operationdate < to_date('&dateprint', 'yyyy/mm/dd')
       --and op.operationdate in (to_date('2007/08/09', 'yyyy/mm/dd'),to_date('2007/08/16','yyyy/mm/dd'),to_date('2007/08/23', 'yyyy/mm/dd'))
       and ( operationDate >=  to_date('&dateprint', 'yyyymmdd')  - (7*(3))
       and to_char(operationDate, 'D') = to_char( to_date('&dateprint', 'yyyymmdd') ,'D') )
       AND  op.service + op.incidence - op.RETURN >= 0
       AND  op.service + op.incidence > 0
       AND  op.service >= 0
   group by op.header, op.product, op.newsstand
    ) op, fn3forecastseries fs , fn3output ou
  WHERE   pd.node  = '&node'
  and pd.orderf  =  '&orderf'
  and pd.dateprint  =  to_date('&dateprint', 'yyyymmdd')
  AND op.numagovoz > 1
  AND pd.header  = op.header
  and pd.product = op.product
  and pd.newsstand = op.newsstand
  AND pd.header   = ou.header
  and pd.product   = ou.product
  AND pd.newsstand = ou.node
  AND pd.forsession = fs.forsession
  AND pd.dateprint = fs.valuedate
  AND pd.newsstand = ou.node
  AND fs.output = ou.code
  order by op.numagovoz desc