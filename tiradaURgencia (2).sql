select fecha,
         substr(rutadistribuidor,0,6) as Ruta,
         substr(codigodistribuidor,0,6) as Codigo,
         substr(empresa,0,20),substr(nombre,0,20),
         substr(apellido1,0,20),substr(apellido2,0,20),
         substr
        decision as Servicio
from fn2detalletirada,fn2codificacion,fn2puntoventa
where  fn2detalletirada.fecha = to_date('20011024','yyyymmdd') and
           orden='2' and
           fn2detalletirada.puntoventa=fn2codificacion.puntoventa and
           fn2codificacion.puntoventa=fn2puntoventa.codigo
order by ruta;

