select * from prods;
-- Q1. From 'prods' table, Remove Redundant Pairs

/* Problem Statement:
- For pairs of brands in the same year (e.g. apple/samsung/2020 and samsung/apple/2020) 
    - if custom1 = custom3 and custom2 = custom4 : then keep only one pair

- For pairs of brands in the same year 
    - if custom1 != custom3 OR custom2 != custom4 : then keep both pairs

- For brands that do not have pairs in the same year : keep those rows as well
*/
WITH cte AS
			(
			SELECT *, 
				CASE WHEN brand1 < brand2 THEN concat(brand1, brand2, yearr)
				ELSE concat(brand2, brand1, yearr) END AS pair_id
			FROM prods
			),
     cte_rn AS
	 		  (
			   SELECT *,
			   ROW_NUMBER() OVER(PARTITION BY pair_id ORDER BY pair_id) AS rn
			   FROM cte
			  )
select brand1, brand2, yearr, custom1, custom2, custom3, custom4 
from cte_rn
where rn = 1
or (custom1 <> custom3 or custom2 <> custom4);