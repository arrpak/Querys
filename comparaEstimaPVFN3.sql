 select substr(tab1.output,1,30),tab1.stddeviation as old ,tab2.stddeviation as new
 ,tab2.stddeviation-tab1.stddeviation as dif
    from fn3estimation tab1, fn3estimation tab2
    where tab1.estsession='20020124_CAM.PV' and
          tab2.estsession='20020130_CAM.PV' and 
          tab1.estpower=0                   and
--          tab1.estpower=1                   and
          tab1.output=tab2.output           and
         tab1.estpower=tab2.estpower
     order by dif;

