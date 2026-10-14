-- Select the supply-chain database.
USE supply_chain_lab;

-- Find inventory items below their reorder levels.
SELECT * FROM inventory
WHERE quantity_on_hand < reorder_level;

-- Increase the quantity of inventory item 1 by 10 units.
UPDATE inventory
SET quantity_on_hand = quantity_on_hand + 10
WHERE inventory_id = 1;

-- Insert a sample inventory record for testing.
INSERT INTO inventory
VALUES(999, 1, 99, 'Training WH', 5, 50, '2026-10-01');

-- Delete the sample inventory record.
DELETE FROM inventory
WHERE inventory_id = 999;

-- List the warehouses represented in inventory.
SELECT DISTINCT warehouse_name 
FROM inventory;

-- Classify each inventory item as requiring reorder or being adequately stocked.
SELECT product_id, quantity_on_hand, reorder_level,
CASE WHEN quantity_on_hand < reorder_level THEN 'REORDER' ELSE 'OK'
END stock_status
FROM inventory;

-- Create a procedure that lists products needing replenishment.
DELIMITER //

CREATE PROCEDURE GetReorderRecommendations()
BEGIN

SELECT i.warehouse_name, p.product_name, i.quantity_on_hand, i.reorder_level,
  GREATEST(i.reorder_level * 2 - i.quantity_on_hand, 0) suggested_order_quantity
FROM inventory i JOIN products p ON i.product_id = p.product_id
WHERE i.quantity_on_hand < i.reorder_level
ORDER BY i.quantity_on_hand;

END //

DELIMITER ;

-- Run the reorder recommendation procedure.
CALL GetReorderRecommendations();