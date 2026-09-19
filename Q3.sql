CREATE TABLE footer
(
id INT,
car VARCHAR(30),
lengthh INT,
widthh INT,
heightt INT
);

INSERT INTO footer
VALUES
(1,'Hyundai Tucson', 15, 6, NULL),
(2, NULL, NULL, NULL, 20),
(3, NULL, 12, 8, 15),
(4, 'Toyota Rav 4', NULL, 15, NULL),
(5, 'Kia Sportage', NULL, NULL, 18);

SELECT * FROM footer;

/* Problem Statement : Return footer values from input table, meaning all the last non-null values from
					   each field as shown in the expected output.
Expected Output:
|	 CAR     | LENGTH | WIDTH | HEIGHT |
|------------|--------|-------|--------|
|Kia Sportage| 12     | 15    | 18     |  */ 

SELECT car, lengthh AS length, widthh AS width, heightt AS height
FROM (SELECT TOP 1 car FROM footer WHERE car IS NOT NULL ORDER BY id DESC) car
CROSS JOIN (SELECT TOP 1 lengthh FROM footer WHERE lengthh IS NOT NULL ORDER BY id DESC) l
CROSS JOIN (SELECT TOP 1 widthh FROM footer WHERE widthh IS NOT NULL ORDER BY id DESC) w
CROSS JOIN (SELECT TOP 1 heightt FROM footer WHERE heightt IS NOT NULL ORDER BY id DESC) h;