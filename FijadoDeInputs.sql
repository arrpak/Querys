--CONJUNTO DE QUERIES DESTINADAS A FIJAR INPUTS ANTIGUOS CUYO PARÁMETRO PRÁCTICAMENTE NO HAYA VARIADO DESDE UNA SESIÓN DE ESTIMACIÓN DETERMINADA.



Define cota = '0.003'               --Máxima diferencia admitida entre el valor de los parámetros de cada una de las cinco sesiones seleccionadas.

Define sesion1 = 'e20111014.NZ.04'  --Sesión de estimación utilizada para la entrega del primer informe mensual de las nuevas zonas.
Define sesion2 = 'e20111205.NZ.01'  --Sesión de estimación utilizada para la entrega del informe anual de 2010.
Define sesion3 = 'e20111214.Mkt.01'
Define sesion4 = 'e20120116.Mkt.02'
Define sesion5 = 'e20120207.IC.01'

Define fechatope = '31/12/2009'     --Fecha hasta la cual queremos fijar los inputs.


--FIJADO TEMPORAL DE INPUTS CANDIDATOS A SER FIJADOS DE FORMA DEFINITIVA.
--Fijamos temporalmente (co_fixed='S' en lugar de co_fixed='Y') los inputs candidatos.

UPDATE bsr_d_parameter
   SET co_fixed = 'S'
 WHERE (co_model, co_parameter) IN (SELECT p.co_model, p.co_parameter
                                    --SELECT e1.output, e1.setinput, e1.input, e1.orderf, p.co_fixed, e1.estsession, e1.Value, e2.estsession, e2.Value, e3.estsession, e3.Value, e4.estsession, e4.Value, e5.estsession, e5.Value --
                                      FROM ezcestimationinput e1, ezcestimationinput e2, ezcestimationinput e3, ezcestimationinput e4, ezcestimationinput e5, bsr_d_parameter p
                                     WHERE e1.estsession = '&sesion1'
                                       AND e2.estsession = '&sesion2'
                                       AND e3.estsession = '&sesion3'
                                       AND e4.estsession = '&sesion4'
                                       AND e5.estsession = '&sesion5'
                                       AND p.co_fixed = 'N'
                                       AND (e1.setinput <> 'Navidad' AND e1.setinput <> 'Pascuas' AND e1.setinput <> 'VeranoMadCap' AND e1.setinput NOT LIKE 'Extraordinario.%' AND e1.setinput <> 'Suplementos' AND e1.setinput NOT LIKE 'MetropoliLuna%' AND e1.setinput NOT LIKE 'ElCultural%' AND e1.setinput NOT LIKE 'Mercados%' AND e1.setinput NOT LIKE '%YoDona.%' AND e1.setinput NOT LIKE 'EstadioDeportivo%' AND e1.setinput NOT LIKE 'M_Intervenciones%' AND e1.setinput NOT LIKE 'M_SemanaSanta%' AND e1.setinput NOT LIKE 'CambioPrecio%' AND e1.setinput <> 'NoticiasAgregadas_NZ' AND e1.setinput NOT LIKE 'FestivoSemanal%' AND e1.setinput <> 'Navidad_NZ' AND e1.setinput <> 'Pascuas_NZ' AND e1.setinput <> 'Verano_NZ' AND e1.input <> 'LotNinno')
                                       AND (e2.setinput <> 'Navidad' AND e2.setinput <> 'Pascuas' AND e2.setinput <> 'VeranoMadCap' AND e2.setinput NOT LIKE 'Extraordinario.%' AND e2.setinput <> 'Suplementos' AND e2.setinput NOT LIKE 'MetropoliLuna%' AND e2.setinput NOT LIKE 'ElCultural%' AND e2.setinput NOT LIKE 'Mercados%' AND e2.setinput NOT LIKE '%YoDona.%' AND e2.setinput NOT LIKE 'EstadioDeportivo%' AND e2.setinput NOT LIKE 'M_Intervenciones%' AND e2.setinput NOT LIKE 'M_SemanaSanta%' AND e2.setinput NOT LIKE 'CambioPrecio%' AND e2.setinput <> 'NoticiasAgregadas_NZ' AND e2.setinput NOT LIKE 'FestivoSemanal%' AND e2.setinput <> 'Navidad_NZ' AND e2.setinput <> 'Pascuas_NZ' AND e2.setinput <> 'Verano_NZ' AND e2.input <> 'LotNinno')
                                       AND (e3.setinput <> 'Navidad' AND e3.setinput <> 'Pascuas' AND e3.setinput <> 'VeranoMadCap' AND e3.setinput NOT LIKE 'Extraordinario.%' AND e3.setinput <> 'Suplementos' AND e3.setinput NOT LIKE 'MetropoliLuna%' AND e3.setinput NOT LIKE 'ElCultural%' AND e3.setinput NOT LIKE 'Mercados%' AND e3.setinput NOT LIKE '%YoDona.%' AND e3.setinput NOT LIKE 'EstadioDeportivo%' AND e3.setinput NOT LIKE 'M_Intervenciones%' AND e3.setinput NOT LIKE 'M_SemanaSanta%' AND e3.setinput NOT LIKE 'CambioPrecio%' AND e3.setinput <> 'NoticiasAgregadas_NZ' AND e3.setinput NOT LIKE 'FestivoSemanal%' AND e3.setinput <> 'Navidad_NZ' AND e3.setinput <> 'Pascuas_NZ' AND e3.setinput <> 'Verano_NZ' AND e3.input <> 'LotNinno')
                                       AND (e4.setinput <> 'Navidad' AND e4.setinput <> 'Pascuas' AND e4.setinput <> 'VeranoMadCap' AND e4.setinput NOT LIKE 'Extraordinario.%' AND e4.setinput <> 'Suplementos' AND e4.setinput NOT LIKE 'MetropoliLuna%' AND e4.setinput NOT LIKE 'ElCultural%' AND e4.setinput NOT LIKE 'Mercados%' AND e4.setinput NOT LIKE '%YoDona.%' AND e4.setinput NOT LIKE 'EstadioDeportivo%' AND e4.setinput NOT LIKE 'M_Intervenciones%' AND e4.setinput NOT LIKE 'M_SemanaSanta%' AND e4.setinput NOT LIKE 'CambioPrecio%' AND e4.setinput <> 'NoticiasAgregadas_NZ' AND e4.setinput NOT LIKE 'FestivoSemanal%' AND e4.setinput <> 'Navidad_NZ' AND e4.setinput <> 'Pascuas_NZ' AND e4.setinput <> 'Verano_NZ' AND e4.input <> 'LotNinno')
                                       AND (e5.setinput <> 'Navidad' AND e5.setinput <> 'Pascuas' AND e5.setinput <> 'VeranoMadCap' AND e5.setinput NOT LIKE 'Extraordinario.%' AND e5.setinput <> 'Suplementos' AND e5.setinput NOT LIKE 'MetropoliLuna%' AND e5.setinput NOT LIKE 'ElCultural%' AND e5.setinput NOT LIKE 'Mercados%' AND e5.setinput NOT LIKE '%YoDona.%' AND e5.setinput NOT LIKE 'EstadioDeportivo%' AND e5.setinput NOT LIKE 'M_Intervenciones%' AND e5.setinput NOT LIKE 'M_SemanaSanta%' AND e5.setinput NOT LIKE 'CambioPrecio%' AND e5.setinput <> 'NoticiasAgregadas_NZ' AND e5.setinput NOT LIKE 'FestivoSemanal%' AND e5.setinput <> 'Navidad_NZ' AND e5.setinput <> 'Pascuas_NZ' AND e5.setinput <> 'Verano_NZ' AND e5.input <> 'LotNinno')
                                       AND Abs(e1.Value-e2.Value) <= &cota
                                       AND Abs(e1.Value-e3.Value) <= &cota
                                       AND Abs(e1.Value-e4.Value) <= &cota
                                       AND Abs(e1.Value-e5.Value) <= &cota
                                       AND Abs(e2.Value-e3.Value) <= &cota
                                       AND Abs(e2.Value-e4.Value) <= &cota
                                       AND Abs(e2.Value-e5.Value) <= &cota
                                       AND Abs(e3.Value-e4.Value) <= &cota
                                       AND Abs(e3.Value-e5.Value) <= &cota
                                       AND Abs(e4.Value-e5.Value) <= &cota
                                       AND e1.orderf = 0
                                       AND e2.orderf = 0
                                       AND e3.orderf = 0
                                       AND e4.orderf = 0
                                       AND e5.orderf = 0
                                       AND e1.output = e2.output
                                       AND e1.output = e3.output
                                       AND e1.output = e4.output
                                       AND e1.output = e5.output
                                       AND e2.output = e3.output
                                       AND e2.output = e4.output
                                       AND e2.output = e5.output
                                       AND e3.output = e4.output
                                       AND e3.output = e5.output
                                       AND e4.output = e5.output
                                       AND e1.setinput = e2.setinput
                                       AND e1.setinput = e3.setinput
                                       AND e1.setinput = e4.setinput
                                       AND e1.setinput = e5.setinput
                                       AND e2.setinput = e3.setinput
                                       AND e2.setinput = e4.setinput
                                       AND e2.setinput = e5.setinput
                                       AND e3.setinput = e4.setinput
                                       AND e3.setinput = e5.setinput
                                       AND e4.setinput = e5.setinput
                                       AND e1.input = e2.input
                                       AND e1.input = e3.input
                                       AND e1.input = e4.input
                                       AND e1.input = e5.input
                                       AND e2.input = e3.input
                                       AND e2.input = e4.input
                                       AND e2.input = e5.input
                                       AND e3.input = e4.input
                                       AND e3.input = e5.input
                                       AND e4.input = e5.input
                                       AND e1.orderf = e2.orderf
                                       AND e1.orderf = e3.orderf
                                       AND e1.orderf = e4.orderf
                                       AND e1.orderf = e5.orderf
                                       AND e2.orderf = e3.orderf
                                       AND e2.orderf = e4.orderf
                                       AND e2.orderf = e5.orderf
                                       AND e3.orderf = e4.orderf
                                       AND e3.orderf = e5.orderf
                                       AND e4.orderf = e5.orderf
                                       AND ('Modelo'||e1.output = p.co_model OR 'InformeMarketing'||e1.output = p.co_model)
                                       AND ('Modelo'||e2.output = p.co_model OR 'InformeMarketing'||e2.output = p.co_model)
                                       AND ('Modelo'||e3.output = p.co_model OR 'InformeMarketing'||e3.output = p.co_model)
                                       AND ('Modelo'||e4.output = p.co_model OR 'InformeMarketing'||e4.output = p.co_model)
                                       AND ('Modelo'||e5.output = p.co_model OR 'InformeMarketing'||e5.output = p.co_model)
                                       AND e1.input = p.co_parameter
                                       AND e2.input = p.co_parameter
                                       AND e3.input = p.co_parameter
                                       AND e4.input = p.co_parameter
                                       AND e5.input = p.co_parameter
                                    )




--FIJADO DEFINITIVO DE INPUTS CANDIDATOS.
--Fijamos de forma definitiva los inputs candidatos hasta una fecha determinada dándole el valor que cogió en la última estimación.

UPDATE bsr_d_parameter
   SET co_fixed = 'Y', vl_ini = (SELECT Value
                                   FROM ezcestimationinput e
                                  WHERE e.estsession = '&sesion5'
                                    AND e.input = co_parameter
                                    AND ('Modelo'||e.output = co_model OR 'InformeMarketing'||e.output = co_model)
                                    AND e.orderf = 0
                                 )
--SELECT * FROM bsr_d_parameter
 WHERE co_parameter IN (SELECT DISTINCT f.input
                          FROM ezcestimationinputeffect f, bsr_d_parameter p
                         WHERE valuedate <= To_Date('&fechatope','dd/mm/yyyy')
                           AND estsession = '&sesion5'
                           AND ('Modelo'||f.output = p.co_model OR 'InformeMarketing'||f.output = p.co_model)
                           AND f.input = p.co_parameter

                         MINUS

                        SELECT DISTINCT f.input
                          FROM ezcestimationinputeffect f, bsr_d_parameter p
                         WHERE valuedate > To_Date('&fechatope','dd/mm/yyyy')
                           AND estsession = '&sesion5'
                           AND ('Modelo'||f.output = p.co_model OR 'InformeMarketing'||f.output = p.co_model)
                           AND f.input = p.co_parameter
                        )
   AND co_fixed = 'S'
   AND co_model <> 'InformeMarketingVentaCadiz' --Excluimos Cádiz porque es la única zona con co_fixed = 'S'.




--DESFIJADO DE INPUTS CANDIDATOS.
--Desfijamos los inputs candidatos que sobrepasan la fecha fijada anteriormente.

UPDATE bsr_d_parameter
   SET co_fixed = 'N'
 WHERE co_fixed = 'S'
   AND co_model <> 'InformeMarketingVentaCadiz'


