CREATE OR REPLACE PROCEDURE SERVICIOMINEXP
(v_heade IN VARCHAR2,v_nod IN VARCHAR2,v_datep IN DATE,
v_orden IN INTEGER,v_datecomp1 IN DATE,v_datecomp2 IN DATE )
IS
CURSOR c IS
SELECT ope.newsstand AS newssta,tirada as tir,ven
FROM
(
  SELECT pri.newsstand,(case when (decision + increaseDec) <= 15
                then  ceil(decision + increaseDec)
                else  ROUND(decision + increaseDec) end) as tirada,decision
  FROM fn3printingdetail pri
  WHERE node=v_nod AND pri.header=v_heade AND dateprint=v_datep AND orderf=v_orden AND decision>0 ) pri,
(
 SELECT ope.newsstand,Decode(Min(RETURN),0,
Greatest(Max(service+incidence-RETURN)*1.05),1,
Greatest(Avg(service+incidence-RETURN)*1.05),1) as ven
 --Max(service+incidence-RETURN)*1.2,Avg(service+incidence-RETURN)*1.1) as ven
 FROM fn3operation ope
 WHERE ope.header=v_heade
       AND (operationdate=v_datecomp1 OR operationdate=v_datecomp2)
       GROUP BY newsstand) ope
WHERE
ope.newsstand=pri.newsstand
AND tirada<=ven AND ven>1;
  v_count NUMBER := 0;
BEGIN
  FOR i IN c LOOP
    BEGIN
    UPDATE fn3printingdetail
    SET    decision=i.ven,forsession='ModificacionServicio'
    WHERE
    -- i.tir < i.ven     AND
    orderf=v_orden
    AND header=v_heade
    AND newsstand=i.newssta
    AND  node=v_nod AND dateprint=v_datep;
    v_count := v_count + SQL%ROWCOUNT;
    EXCEPTION
      WHEN OTHERS THEN  Dbms_Output.Put_Line('error en el pv: '|| i.newssta);
    END;
--    COMMIT;
END LOOP;
  Dbms_Output.Put_Line('total: '|| v_count);
 END;
 /

BEGIN
   SERVICIOMIN('MARCA','AND',Dat('20070709'),1,Dat('20070702'),Dat('20070625'));
END;
/


BEGIN
   SERVICIOMINEXP('EXPANSION','CAM',Dat('20070707'),1,Dat('20070630'),Dat('20070623'));
END;
/



DROP PROCEDURE UPDATETIRADA2

