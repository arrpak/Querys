SELECT t3.* ,t2.distributorcode,description
FROM fn3newsstandon t1,fn3codification t2,fn3newsstand t3,fn3newsstandtype t4
WHERE
t2.distributor='BERALAN'
AND t1.dateoff IS null
AND t1.newsstand=t2.newsstand
AND t3.code=t2.newsstand
AND t4.code=t3.newsstandtype
order BY COMPANY

