load data
infile 'C:\partidef.txt'
--infile 'C:\kk.txt'
append into table fn3partidofutboltmp10 
fields terminated by '@' 
TRAILING NULLCOLS
(
  competicion, 
  dominio,  
  categoria,        
  temporada,        
  fase,        
  jornada,   
  fechapartido   date "yyyy/mm/dd",     
--  fechapartido,  
  valido,    
  eqlocal,    
  eqvis,
  golloc,
  golvis,    
  info  "substr(:info,1,1000)",
  codlocal,
  codvis
)   
