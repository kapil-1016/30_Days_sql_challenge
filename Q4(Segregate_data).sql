-- Q4. Segregate Data
-- Derive expected output
/*
         INPUT:
| ID |  NAME  |  LOCATION  |
|----|--------|------------|
| 1	 |        |            |
| 2  | David  |			   |
| 3  |        |  London    |
| 4  |        |            |
| 5  | David  |            |


    EXPTECTED OUTPUT 1:                  EXPECTED OUTPUT 2:
| ID |  NAME  |  LOCATION  |          | ID |  NAME  |  LOCATION  |
|----|--------|------------|          |----|--------|------------|
| 1	 | David  |  London    |          |  5 | David  |  London    |

*/

CREATE TABLE input
(
id int,
name varchar(30),
loc varchar(30)
);
INSERT INTO input
VALUES
(1,NULL,NULL),
(2,'David',NULL),
(3,NULL,'London'),
(4,NULL,NULL),
(5,'David',NULL);
SELECT * FROM input;

-- select top 1 id, name, loc from input; 
select min(id) id, min(name)name, min(loc) location from input;

select max(id)id, min(name)name, min(loc)location from input;