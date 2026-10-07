-- Scenario: Insurance Claims

CREATE TABLE insurance_claims (
claim_id INT PRIMARY KEY,
customer_name VARCHAR(100),
insurance_type VARCHAR(50),
claim_amount DECIMAL(12,2),
branch VARCHAR(50)
);

INSERT INTO insurance_claims VALUES
(1, 'Ajay Kumar', 'Health', 75000, 'Hyderabad'),
(2, 'Meena Shah', 'Motor', 45000, 'Mumbai'),
(3, 'Rohit Jain', 'Health', 125000, 'Hyderabad'),
(4, 'Sara Ali', 'Travel', 30000, 'Delhi'),
(5, 'Vikas Rao', 'Motor', 85000, 'Mumbai'),
(6, 'Nisha Singh', 'Health', 60000, 'Delhi'),
(7, 'Imran Khan', 'Travel', 55000, 'Hyderabad'),
(8, 'Pooja Patel', 'Motor', 40000, 'Delhi'),
(9, 'Karan Mehta', 'Health', 150000, 'Mumbai'),
(10, 'Farah Ahmed', 'Travel', 35000, 'Hyderabad');

-- CTE Exercises

-- 1. Create a CTE calculating total claims by insurance type.
WITH TotalClaimsByInsType AS(
	SELECT insurance_type, SUM(claim_amount) as total_claim_amount
    FROM insurance_claims GROUP BY insurance_type
)
SELECT * FROM TotalClaimsByInsType;

-- 2. Use a CTE to calculate total claims by branch.
WITH TotalClaimsByBranch AS(
	SELECT branch, SUM(claim_amount) as total_claim_amount
    FROM insurance_claims GROUP BY branch
)
SELECT * FROM TotalClaimsByBranch;

-- 3. Find insurance types whose total claim amount exceeds ₹2,00,000.
WITH TotalClaimsByInsType AS(
	SELECT insurance_type, SUM(claim_amount) as total_claim_amount
    FROM insurance_claims GROUP BY insurance_type
)
SELECT * FROM TotalClaimsByInsType WHERE total_claim_amount > 200000;

-- 4. Create a CTE calculating average claim amount and filter claims above that average.
WITH averageclaim AS(
	SELECT AVG(claim_amount) as avg_amount
    FROM insurance_claims
)
SELECT ic.* FROM insurance_claims ic CROSS JOIN
averageclaim ac WHERE ic.claim_amount > ac.avg_amount;

-- 5. Create a CTE and rank insurance types by total claim amount.
WITH TotalClaimsByInsType AS(
	SELECT insurance_type, SUM(claim_amount) as total_claim_amount
    FROM insurance_claims GROUP BY insurance_type
)
SELECT insurance_type, RANK() OVER(ORDER BY total_claim_amount DESC) AS claim_rank FROM TotalClaimsByInsType;

-- 6. Create two CTEs in the same query and combine their results.
WITH BranchSummary AS (
    SELECT 'Branch' AS category_type, branch AS category_name, SUM(claim_amount) AS total_amount
    FROM insurance_claims GROUP BY branch
),
InsuranceSummary AS (
    SELECT 'Insurance Type' AS category_type, insurance_type AS category_name, SUM(claim_amount) AS total_amount
    FROM insurance_claims GROUP BY insurance_type
)
SELECT * FROM BranchSummary UNION ALL SELECT * FROM InsuranceSummary;


-- Correlated Subquery Exercises

-- 7. Find claims greater than the average claim amount for their own insurance type.
SELECT c1.* FROM insurance_claims c1 WHERE c1.claim_amount > (
	SELECT AVG(c2.claim_amount) FROM insurance_claims c2 
    WHERE c2.insurance_type = c1.insurance_type );
    
-- 8. Find claims greater than the average claim amount at their own branch.
SELECT c1.* FROM insurance_claims c1 WHERE c1.claim_amount > (
	SELECT AVG(c2.claim_amount) FROM insurance_claims c2 
    WHERE c2.branch = c1.branch );
    
-- 9. Find the largest claim for each insurance type.
SELECT c1.* FROM insurance_claims c1 WHERE c1.claim_amount = (
	SELECT MAX(c2.claim_amount) FROM insurance_claims c2 
    WHERE c2.insurance_type = c1.insurance_type );
    
-- 10. Find customers whose claim is above the branch average.
SELECT c1.customer_name, c1.branch, c1.claim_amount FROM insurance_claims c1
WHERE c1.claim_amount > (
    SELECT AVG(c2.claim_amount) FROM insurance_claims c2 
    WHERE c2.branch = c1.branch );
