--INSERT INTO fn3forecastseriessimulated
SELECT t1.forsession, t1.simdec, t1.output, t1.dating, t1.valuedate, t1.forecast, t1.Variance,
       CASE WHEN t1.closed = 'N' THEN
                                     CASE WHEN t2.estpower = 0 THEN Greatest(Least(t1.forecast * Exp(t1.normalinv*sqrt(t1.variance)),
                                                                                   1000000,
                                                                                   t1.forecast+maxabsinc,
                                                                                   t1.forecast*(1+maxperinc)),
                                                                             1,
                                                                             t1.forecast+minabsinc,
                                                                             t1.forecast*(1+minperinc))
                                          ELSE Greatest(Least(t1.forecast + t1.normalinv*sqrt(t1.variance),
                                                              1000000,
                                                              t1.forecast+maxabsinc,
                                                              t1.forecast*(1+maxperinc)),
                                                        1,
                                                        t1.forecast+minabsinc,
                                                        t1.forecast*(1+minperinc))
                                          END
            ELSE 0
            END AS decision,
       t1.filter, t1.noise, t1.forcens, t1.used, t1.closed, t1.node
FROM  temporaluno  t1,temporaldos t2
WHERE t1.forsession = t2.forsession
  AND t1.output     = t2.output
  AND t1.dating     = t2.dating
  AND t1.valuedate  = t2.dateprint
  AND t1.node       = t2.node



