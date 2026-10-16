-- You are given a table having the marks of one student in every test.
-- You have to output the tests in which the student has improved his performance.
-- For a student to improve his performance he has to score more than the previous test.
-- Provide 2 solutions, one including the first test score and second excluding it.
/*
		OUPUT 1                         OUTPUT 2
		| TEST_ID | MARKS |		        | TEST_ID | MARKS |	
		|---------|-------|				|---------|-------|
		|   100   |   55  |				|   102   |   60  |
		|   102   |   60  |				|   105   |   50  |
		|   105   |   50  |
*/

-- solution 1
select * 
from 
(
select *, LAG(marks, 1, 0) over(order by test_id) as prev_test_marks
from stu_tests
) x
where x.marks > x.prev_test_marks;

-- solution 2
select * 
from 
(
select *, LAG(marks, 1, marks) over(order by test_id) as prev_test_marks
from stu_tests
) x
where x.marks > x.prev_test_marks;

select * from stu_tests