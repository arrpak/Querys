load data
infile 'C:\Archivos de programa\RSSSF8.11\rsssf.out\ucr2009.league1.rpt'
append into table FN3PARTIDOFUTBOLRSSF2010
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
  penaltieslocal     "to_number(null)"  ,
  penaltiesvisitante "to_number(null)" ,
  incidencia01       "to_char(null)"   )   