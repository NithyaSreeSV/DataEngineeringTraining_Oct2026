-- Calculate and list orders delivered after their promised dates.
WITH
  delay_calc AS (
    SELECT
      o.order_id,
      o.customer_id,
      o.region,
      d.promised_date,
      d.delivered_date,
      CASE
        WHEN d.delivered_date IS NULL THEN NULL
        ELSE GREATEST(DATEDIFF(d.delivered_date, d.promised_date), 0)
      END delay_days
    FROM
      orders o
      JOIN delivery_status d ON o.order_id = d.order_id
  )
  
  -- Return delayed orders sorted by delay duration.
SELECT
  *
FROM
  delay_calc
WHERE
  delay_days > 0
ORDER BY
  delay_days DESC;

-- Create a procedure that returns delayed orders for one customer.
DELIMITER //

CREATE PROCEDURE GetDelayedOrdersForCustomer (IN p_customer_id INT) BEGIN
SELECT
  o.order_id,
  o.customer_id,
  d.promised_date,
  d.delivered_date,
  GREATEST(DATEDIFF(d.delivered_date, d.promised_date), 0) delay_days
FROM
  orders o
  JOIN delivery_status d ON o.order_id = d.order_id
WHERE
  o.customer_id = p_customer_id
  AND d.delivered_date > d.promised_date;

END //

DELIMITER ;

-- Run the delayed-orders procedure for all customers.
CALL GetDelayedOrdersForCustomer (101);
CALL GetDelayedOrdersForCustomer (102);
CALL GetDelayedOrdersForCustomer (103);
CALL GetDelayedOrdersForCustomer (104);
CALL GetDelayedOrdersForCustomer (105);
CALL GetDelayedOrdersForCustomer (106);
CALL GetDelayedOrdersForCustomer (107);
CALL GetDelayedOrdersForCustomer (108);
CALL GetDelayedOrdersForCustomer (109);
CALL GetDelayedOrdersForCustomer (110);
CALL GetDelayedOrdersForCustomer (111);
CALL GetDelayedOrdersForCustomer (112);