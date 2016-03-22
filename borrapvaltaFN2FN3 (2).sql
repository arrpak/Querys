delete --select count(*)
from kiosco
where direccion = 'CERRO MINGUETE 3';




delete --select count(*)
from fn3Codification
where newsStand = '028105824067' or
      newsStand = '100005824067';

delete --select count(*)
from fn2Codificacion
where puntoVenta = '028105824067' or
      puntoVenta = '100005824067';


delete --select count(*)
from Fn3ProbNotOutOff
where output = 'VentaMarca028105824067' or
      output = 'VentaMarca100005824067';

delete --select count(*)
from fn2probabilidadnoagotaroutput
where output = 'VentaMarca028105824067' or
      output = 'VentaMarca100005824067';


delete --select count(*)
from Fn3ServiceFixed
where newsStand = '028105824067' or
      newsStand = '100005824067';

delete --select count(*)
from fn2serviciofijo
where puntoVenta = '028105824067' or
      puntoVenta = '100005824067';


delete --select count(*)
from Fn3NewsStandOn
where newsStand = '028105824067' or
      newsStand = '100005824067';

delete --select count(*)
from fn2puntoventaalta
where puntoVenta = '028105824067' or
      puntoVenta = '100005824067';




delete --select count(*)
from fn3Estimation
where output = 'VentaMarca028105824067' or
      output = 'VentaMarca100005824067';

delete --select count(*)
from fn2Estimation
where outputdef = 'VentaMarca028105824067' or
      outputdef = 'VentaMarca100005824067';


delete --select count(*)
from fn3OutputDating
where output = 'VentaMarca028105824067' or
      output = 'VentaMarca100005824067';

delete --select count(*)
from fn2OutputDef
where outputdef = 'VentaMarca028105824067' or
      outputdef = 'VentaMarca100005824067';


delete --select count(*)
from fn3Output
where code = 'VentaMarca028105824067' or
      code = 'VentaMarca100005824067';

delete --select count(*)
from fn2Output
where output = 'VentaMarca028105824067' or
      output = 'VentaMarca100005824067';


delete --select count(*)
from fn3Node
where code = '028105824067' or
      code = '100005824067';

delete --select count(*)
from fn2nodo
where codigo = '100005824067' or
      codigo = '028105824067' ;


delete --select count(*)
from fn3NewsStand
where code = '028105824067' or
      code = '100005824067';

delete --select count(*)
from fn2puntoventa
where codigo = '100005824067' or
      codigo = '028105824067' ;

