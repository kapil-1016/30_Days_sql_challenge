##  Using the given Salary, Income and Deduction tables, first write an sql query to populate the Emp_Transaction table as shown below and then generate a salary report as shown.

 ### Salary Table
|EMP_ID| EMP_NAME|	BASE_SALARY|
|------|---------|-------------|
|1|	Rohan|	5000|
2	|Alex	|6000|
|3|Maryam	|7000|

 ### Income Table
|ID| Income|	Percentage|
|------|---------|-------------|
|1|	Basic|	100|
2	|Allowance	|4|
|3|Others	|6|

 ### Deduction Table
|ID| Deduction|	Percentage|
|------|---------|-------------|
|1|	Insurance|	5|
2	|Health	|6|
|3|House	|4|

### Expected Output 1 : EMP_TRANSACTION

|EMP_ID|	EMP_NAME|	TRNS_TYPE	|AMOUNT|
|------|----------|-----------|------|
|1|	Rohan|	Insurance|	250|
|2|	Alex	|Insurance	|300|
|3|	Maryam	|Insurance|	350|
|1|	Rohan	|House	|200|
|2|	Alex	|House|	240|
|3|	Maryam|	House	|280|
|1|	Rohan	|Basic	|5000|
|2|	Alex|	Basic|	6000|
|3|	Maryam	|Basic	|7000|
|1|	Rohan	|Health	|300|
|2|	Alex	|Health|	360|
|3|Maryam	|Health|	420|
|1|	Rohan	|Allowance|	200|
|2|	Alex	|Allowance	|240|
|3|	Maryam|	Allowance|	280|
|1|	Rohan	|Others	|300|
|2|	Alex	|Others|	360|
|3|	Maryam|	Others|	420|

### Expected Output 2 : Salary Report

|EMPLOYEE|	BASIC|	ALLOWANCE|	OTHERS|	GROSS|	INSURANCE|	HEALTH|	HOUSE|	TOTAL_DEDUCTIONS|	NET_PAY|
|--------|-------|-----------|--------|------|-----------|--------|------|------------------|--------|
|Alex|	6000|	240|	360|	6600|	300|	360|	240|	900|	5700|
|Maryam	|7000	|280	|420	|7700	|350	|420	|280	|1050	|6650|
|Rohan|	5000|	200|	300|	5500|	250|	300|	200|	750|	4750|


