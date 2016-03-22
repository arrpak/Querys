load data
infile 'C:\Archivos de programa\RSSSF8\rsssf.out\aus.rpt'
append into table fn3rsssf2008  
fields terminated by '@' 
TRAILING NULLCOLS
(
  competicion      , 
  dominio          ,  
  categoria        ,        
  temporada        ,        
  fase             ,        
  jornada          ,   
  fechapartido   date "yyyy-mm-dd"     ,     
  valido           ,    
  equipolocal      ,    
  equipovisitante  ,
  goleslocal       ,
  golesvisitante   ,    
  notas "substr(:notas,1,1000)"            )   