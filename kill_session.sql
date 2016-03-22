SELECT
       s.sid,
       s.serial#,
       p.spid,
       s.osuser,
       s.program,
       s.logon_time,
       s.*
FROM   v$process p,
       v$session s
WHERE  p.addr = s.paddr
  AND  s.terminal = 'SARGENT'
ORDER BY s.logon_time, s.program

DEFINE v_sid    = "100";
DEFINE v_serial = "9559";

ALTER SYSTEM KILL SESSION '&v_sid,&v_serial';