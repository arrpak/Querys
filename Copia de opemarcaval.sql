set newpage none
set termout off
set colsep '|'
set head off
set feedback off
set trimspool on
set linesize 1000
set pagesize 50000
--set numwidth 5
spool C:/recoletos/opemarcaval.txt
column pro heading _ format A5
column ser heading _ format A5
column inc like ser
column dev like ser
select codPubli                                               as pro,
       cli.codCliProv                                         as pun,
       to_char(to_date(numportada, 'YYYYMMDD'), 'YYYY/MM/DD') as fec,
       replace(to_char(normal,'09999'),' ','')                as ser,
       replace(to_char(reposicion,'09999'),' ','')            as inc,
       replace(to_char((DEVOL+abonos),'09999'),' ','')        as dev,
       agotado                                                as ago
from   sir6.estadisticas estad, sir6.clientes cli
where  codPubli      LIKE '2010%'    and
       estad.codEmp != '888'       and
       numportada   >= '20000930'  and
       numportada   <= '20000930'  and
       estad.codEmp  = cli.codEmp  and
       estad.codCli  = cli.codCli;
spool off;
exit;
