-- Scenario: Online Registration Data

CREATE TABLE registrations (
registration_id INT PRIMARY KEY,
full_name VARCHAR(100),
email VARCHAR(100),
mobile VARCHAR(40),
city VARCHAR(50),
postal_code VARCHAR(20)
);

INSERT INTO registrations VALUES
(1, ' rohit sharma ', ' ROHIT@GMAIL.COM ', '+91-98765-43210', 'hyderabad', NULL),
(2, 'SARA KHAN', 'sara@yahoo.com', '99887 66554', ' MUMBAI ', '400001'),
(3, ' amit patel ', '', '(040)99887766', 'Hyderabad', '500 032'),
(4, 'Neha Singh ', NULL, '9876543210', 'BANGALORE', '560001'),
(5, 'imran ali', 'IMRAN@MAIL.COM ', '91 9988772211', NULL, '500084'),
(6, 'Priya Rao', 'priya@gmail', '98765-AB210', 'Pune', '411001');

-- 1. Remove spaces before and after names.
SELECT TRIM(full_name) AS cleaned_full_name FROM registrations;

-- 2. Convert names to uppercase.
SELECT UPPER(TRIM(full_name)) AS uppercase_name FROM registrations;

-- 3. Convert email addresses to lowercase.
SELECT LOWER(TRIM(email)) AS lowercase_email FROM registrations;

-- 4. Convert blank email values into NULL.
SELECT IF(TRIM(email)='', NULL, TRIM(email)) AS normalized_email FROM registrations;

-- 5. Remove spaces and hyphens from mobile numbers.
SELECT REPLACE(REPLACE(mobile, ' ', ''), '-', '') AS cleaned_mobile FROM registrations;

-- 6. Remove every non-numeric character from mobile numbers.
SELECT REGEXP_REPLACE(mobile, '[^0-9]', '') AS strictly_numeric_mobile FROM registrations;

-- 7. Standardize city names to uppercase.
SELECT UPPER(TRIM(city)) AS standardized_city FROM registrations;

-- 8. Find records where city is NULL.
SELECT * FROM registrations WHERE city IS NULL;

-- 9. Find records where email is NULL or blank.
SELECT * FROM registrations WHERE email IS NULL OR TRIM(email) = '';

-- 10. Find only Gmail email addresses using RegEx.
SELECT * FROM registrations WHERE email REGEXP '^[[:space:]]*[A-Za-z0-9._%+-]+@gmail\\.com[[:space:]]*$';

-- 11. Identify incorrectly formatted email addresses.
SELECT * FROM registrations WHERE email IS NOT NULL
AND TRIM(email) != '' AND TRIM(email) NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';

-- 12. Extract only numeric characters from postal codes.
SELECT REGEXP_REPLACE(postal_code, '[^0-9]', '') AS numeric_postal_code FROM registrations;

-- 13. Find mobile numbers containing alphabetic characters.
SELECT * FROM registrations WHERE mobile REGEXP '[A-Za-z]';

-- 14. Produce a cleaned output containing name, email, mobile and city.
SELECT 
    UPPER(TRIM(full_name)) AS full_name,
    IF(TRIM(email) = '' OR TRIM(email) NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$', NULL, LOWER(TRIM(email))) AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(TRIM(city)) AS city
FROM registrations;

-- 15. Create a cleaned copy of the data in another table.
CREATE TABLE cleaned_registrations AS
SELECT 
    registration_id,
    UPPER(TRIM(full_name)) AS full_name,
    IF(TRIM(email) = '' OR TRIM(email) NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$', NULL, LOWER(TRIM(email))) AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(TRIM(city)) AS city,
    REGEXP_REPLACE(postal_code, '[^0-9]', '') AS postal_code
FROM registrations;
