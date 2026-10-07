-- Scenario: Vehicle Rental

CREATE TABLE vehicles (
vehicle_id INT PRIMARY KEY,
vehicle_name VARCHAR(100),
vehicle_type VARCHAR(50),
daily_rate DECIMAL(10,2),
available_status VARCHAR(20)
);

INSERT INTO vehicles VALUES
(1, 'Honda City', 'Car', 2500, 'Available'),
(2, 'Toyota Innova', 'Car', 3500, 'Available'),
(3, 'Royal Enfield', 'Bike', 1200, 'Rented'),
(4, 'Activa', 'Scooter', 700, 'Available'),
(5, 'Mahindra Thar', 'SUV', 4500, 'Rented'),
(6, 'Hyundai Creta', 'SUV', 3200, 'Available'),
(7, 'KTM Duke', 'Bike', 1500, 'Available');

-- 1. Create GetAllVehicles
DELIMITER //

CREATE PROCEDURE GetAllVehicles()
BEGIN
	SELECT * FROM vehicles;
END //

DELIMITER ;

-- 2. Create GetAvailableVehicles
DELIMITER //

CREATE PROCEDURE GetAvailableVehicles()
BEGIN
	SELECT * FROM vehicles 
    WHERE available_status = 'Available';
END //

DELIMITER ;

-- 3. Create a procedure accepting vehicle type and returning matching vehicles.
DELIMITER //

CREATE PROCEDURE GetVehiclesByType(IN p_type VARCHAR(50))
BEGIN
	SELECT * FROM vehicles
    WHERE vehicle_type = p_type;
END //

DELIMITER ;

-- 4. Create a procedure accepting maximum daily rate.
DELIMITER //

CREATE PROCEDURE GetVehiclesByMaxRate(IN p_max_rate DECIMAL(10,2))
BEGIN
    SELECT * FROM vehicles 
    WHERE daily_rate <= p_max_rate;
END //

DELIMITER ;

-- 5. Create a procedure accepting vehicle ID and new daily rate.
DELIMITER //

CREATE PROCEDURE UpdateVehicleRate(IN p_vehicle_id INT, IN p_daily_rate DECIMAL(10,2))
BEGIN
	UPDATE vehicles
    SET daily_rate = p_daily_rate
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

-- 6. Create a procedure to change vehicle status.
DELIMITER //

CREATE PROCEDURE UpdateVehicleStatus(IN p_vehicle_id INT, IN p_status VARCHAR(20))
BEGIN
	UPDATE vehicles
    SET available_status = p_status
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

-- 7. Create a procedure that increases the daily rate by a supplied percentage.
DELIMITER //

CREATE PROCEDURE IncreaseRateByPercentage(IN p_percentage DECIMAL(5,2))
BEGIN
    UPDATE vehicles 
    SET daily_rate = daily_rate * (1 + (p_percentage / 100));
END //

DELIMITER ;


-- 8. Create a procedure that deletes a vehicle based on vehicle ID.
DELIMITER //

CREATE PROCEDURE DeleteVehicle(IN p_vehicle_id INT)
BEGIN
    DELETE FROM vehicles 
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

-- 9. Create a procedure returning all vehicles between two rental rates.
DELIMITER //

CREATE PROCEDURE GetVehiclesByRentalRates(IN p_min_rental_rate DECIMAL(10,2), IN p_max_rental_rate DECIMAL(10,2))
BEGIN
    SELECT * FROM vehicles 
    WHERE daily_rate BETWEEN p_min_rental_rate AND p_max_rental_rate;
END //

DELIMITER ;

-- 10. Create a procedure that counts vehicles based on vehicle type.
DELIMITER //

CREATE PROCEDURE GetVehiclesCountByType(IN p_vehicle_type VARCHAR(50), OUT vehicles_count INT)
BEGIN
	SELECT COUNT(*) INTO vehicles_count FROM vehicles
    WHERE vehicle_type = p_vehicle_type;
END//

DELIMITER ;


-- CALL Statements

CALL GetAllVehicles();
CALL GetAvailableVehicles();
CALL GetVehiclesByType('Car');
CALL GetVehiclesByType('Bike');
CALL GetVehiclesByMaxRate(2000.00);
CALL UpdateVehicleRate(1, 2800.00); -- Update Vehicle Daily Rate
SELECT * FROM vehicles WHERE vehicle_id = 1;  -- Verification
CALL UpdateVehicleStatus(3, 'Available'); -- Update Status
SELECT * FROM vehicles WHERE vehicle_id = 3; -- Verification
CALL IncreaseRateByPercentage(10.00); -- Increase all vehicle rates
SELECT * FROM vehicles; -- Verification
CALL DeleteVehicle(4); -- Deletes Vehicle
SELECT * FROM vehicles; -- Verification
CALL GetVehiclesByRentalRates(1000.00, 3000.00);
CALL CountVehiclesByType('Car', @total); -- Stores result in @total
SELECT @total AS total_cars; -- Verification


