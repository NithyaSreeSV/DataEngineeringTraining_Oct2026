-- Used the call_performance table from previous Practice Set (No: 6)

-- 1. Rank all records based on calls handled (using default RANK).
SELECT *, RANK() OVER(ORDER BY calls_handled DESC) AS call_rank
FROM call_performance;

-- 2. Use ROW_NUMBER() to number records from highest to lowest calls.
SELECT *, ROW_NUMBER() OVER(ORDER BY calls_handled DESC) AS row_num
FROM call_performance;

-- 3. Use RANK() to rank records.
SELECT *, RANK() OVER(ORDER BY calls_handled DESC) AS rank_val
FROM call_performance;

-- 4. Use DENSE_RANK() to rank records.
SELECT *, DENSE_RANK() OVER(ORDER BY calls_handled DESC) AS dense_rank_val
FROM call_performance;

-- 5. Compare the results of all three ranking functions.
SELECT agent_name, team, calls_handled,
       ROW_NUMBER() OVER(ORDER BY calls_handled DESC) AS row_num,
       RANK() OVER(ORDER BY calls_handled DESC) AS rank_val,
       DENSE_RANK() OVER(ORDER BY calls_handled DESC) AS dense_rank_val
FROM call_performance;

-- 6. Rank agents separately within each team based on calls handled.
SELECT *, RANK() OVER(PARTITION BY team ORDER BY calls_handled DESC) AS team_rank
FROM call_performance;

-- 7. Rank records according to customer rating.
SELECT *, RANK() OVER(ORDER BY customer_rating DESC) AS rating_rank
FROM call_performance;

-- 8. Find the top 3 performance records in each team based on calls.
WITH ranked_calls AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY team ORDER BY calls_handled DESC) AS rnk
    FROM call_performance
)
SELECT call_id, agent_name, team, calls_handled, customer_rating, performance_date
FROM ranked_calls
WHERE rnk <= 3;

-- 9. Find each agent's best performance day (based on highest calls).
WITH agent_best_day AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY agent_name ORDER BY calls_handled DESC) AS rnk
    FROM call_performance
)
SELECT agent_name, performance_date, calls_handled, customer_rating
FROM agent_best_day
WHERE rnk = 1;

-- 10. Rank agents based on their total calls handled.
WITH agent_totals AS (
    SELECT agent_name, SUM(calls_handled) AS total_calls
    FROM call_performance
    GROUP BY agent_name
)
SELECT agent_name, total_calls, RANK() OVER(ORDER BY total_calls DESC) AS agent_overall_rank
FROM agent_totals;
