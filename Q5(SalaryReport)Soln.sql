SELECT * FROM dbo.deduction;
SELECT * FROM dbo.income;
SELECT * FROM dbo.salary;
SELECT * FROM dbo.emp_transaction;
-- Exptected Output : 1
insert into dbo.emp_transaction
SELECT s.emp_id,    
       s.emp_name,
       x.trns_type,
       CASE WHEN trns_type IN ('Allowance', 'Basics', 'Health',
                                'House', 'Others', 'Insurance')
       THEN (s.emp_salary * x.prcntage)/100 END AS amount 
FROM salary AS s
CROSS JOIN 
(
    SELECT income AS trns_type, prcntage 
    FROM income
    UNION
    SELECT deduction AS trns_type , prcntage
    FROM deduction
) AS x 


-- Expected Output 2
select emp_name as employee,
       Basics, Allowance, Others,
       (Basics+Allowance+Others) AS Gross,
       Insurance, Health, House,
       (Insurance + Health + House) AS total_deduction,
       (Basics + Allowance + Others) - (Insurance + Health + House) AS net_pay
from 
    (
    SELECT emp_name, trns_type, amount
    from dbo.emp_transaction
    ) bq
pivot
    (
    sum(amount)
    FOR trns_type IN ([Allowance], [Basics], [Others], [Insurance], [Health], [House])
    ) pq;




-- SYNTAX OF USING PIVOT 
/*

select * 
from 
    (
    base query
    ) alias
pivot
    (
    agg. function
    list of columns
    ) alias

*/

