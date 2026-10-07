-- Scenario: Company Reporting Structure

CREATE TABLE staff_hierarchy (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
manager_id INT,
designation VARCHAR(100)
);

INSERT INTO staff_hierarchy VALUES
(1, 'Raj Malhotra', NULL, 'CEO'),
(2, 'Meera Shah', 1, 'CTO'),
(3, 'Vikram Rao', 1, 'Sales Director'),
(4, 'Aman Khan', 2, 'Engineering Manager'),
(5, 'Sara Ali', 2, 'Data Manager'),
(6, 'Rohit Das', 4, 'Developer'),
(7, 'Priya Singh', 4, 'Developer'),
(8, 'Kabir Ahmed', 5, 'Data Engineer'),
(9, 'Neha Rao', 5, 'Data Analyst'),
(10, 'Imran Sheikh', 3, 'Sales Manager'),
(11, 'Pooja Jain', 10, 'Sales Executive');

-- 1. Find employees having no manager.
SELECT employee_id, employee_name, designation FROM staff_hierarchy
WHERE manager_id IS NULL;

-- 2. Find direct reports of the CEO.
SELECT employee_id, employee_name, designation FROM staff_hierarchy
WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE designation = 'CEO');

-- 3. Find direct reports of the CTO.
SELECT employee_id, employee_name, designation FROM staff_hierarchy
WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE designation = 'CTO');

-- 4. Use a recursive CTE to display the complete hierarchy.
WITH RECURSIVE org_hierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation
    FROM staff_hierarchy
    WHERE manager_id IS NULL
    
    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation
    FROM staff_hierarchy e
    INNER JOIN org_hierarchy oh ON e.manager_id = oh.employee_id
)
SELECT * FROM org_hierarchy;


-- 5. Add a hierarchy level to the result.
WITH RECURSIVE org_hierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation, 1 AS lvl
    FROM staff_hierarchy
    WHERE manager_id IS NULL
    
    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation, oh.lvl + 1
    FROM staff_hierarchy e
    INNER JOIN org_hierarchy oh ON e.manager_id = oh.employee_id
)
SELECT employee_id, employee_name, designation, lvl AS hierarchy_level FROM org_hierarchy;

-- 6. Find all employees working below Meera Shah.
WITH RECURSIVE meera_reports AS (
    SELECT employee_id, employee_name, manager_id, designation
    FROM staff_hierarchy
    WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE employee_name = 'Meera Shah')
    
    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation
    FROM staff_hierarchy e
    INNER JOIN meera_reports mr ON e.manager_id = mr.employee_id
)
SELECT * FROM meera_reports;

-- 7. Find everyone working below Aman Khan.
WITH RECURSIVE aman_reports AS (
    SELECT employee_id, employee_name, manager_id, designation
    FROM staff_hierarchy
    WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE employee_name = 'Aman Khan')
    
    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation
    FROM staff_hierarchy e
    INNER JOIN aman_reports am ON e.manager_id = am.employee_id
)
SELECT * FROM aman_reports;

-- 8. Display employee → manager relationships.
SELECT e.employee_name AS employee, COALESCE(m.employee_name, 'No Manager (Top Level)') AS manager
FROM staff_hierarchy e
LEFT JOIN staff_hierarchy m ON e.manager_id = m.employee_id;

-- 9. Determine how many employees are at each hierarchy level.
WITH RECURSIVE org_hierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation, 1 AS lvl
    FROM staff_hierarchy
    WHERE manager_id IS NULL
    
    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation, oh.lvl + 1
    FROM staff_hierarchy e
    INNER JOIN org_hierarchy oh ON e.manager_id = oh.employee_id
)
SELECT lvl AS hierarchy_level, COUNT(*) AS total_employees FROM org_hierarchy
GROUP BY lvl ORDER BY hierarchy_level;

-- 10. Display the organization starting with CEO and recursively moving downward.
WITH RECURSIVE org_hierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation
    FROM staff_hierarchy
    WHERE manager_id IS NULL
    
    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation
    FROM staff_hierarchy e
    INNER JOIN org_hierarchy oh ON e.manager_id = oh.employee_id
)
SELECT * FROM org_hierarchy;