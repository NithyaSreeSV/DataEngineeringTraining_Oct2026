-- Stored Procedure Task

CREATE DATABASE banking_db;
USE banking_db;

CREATE TABLE accounts (
account_id INT PRIMARY KEY,
customer_name VARCHAR(100),
account_type VARCHAR(30),
balance DECIMAL(10,2),
city VARCHAR(50)
);

INSERT INTO accounts VALUES
(101, 'Arun Kumar', 'Savings', 45000, 'Hyderabad'),
(102, 'Meera Shah', 'Current', 85000, 'Mumbai'),
(103, 'Ravi Reddy', 'Savings', 32000, 'Hyderabad'),
(104, 'Priya Nair', 'Savings', 67000, 'Bangalore'),
(105, 'Sameer Khan', 'Current', 120000, 'Pune'),
(106, 'Neha Gupta', 'Savings', 28000, 'Delhi'),
(107, 'Vikram Rao', 'Current', 95000, 'Hyderabad'),
(108, 'Anjali Singh', 'Savings', 54000, 'Mumbai');

SELECT * FROM accounts;

DELIMITER //

CREATE PROCEDURE GetAllAccounts()
BEGIN
  SELECT * FROM accounts;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetSavingsAccounts()
BEGIN
  SELECT *
  FROM accounts
  WHERE account_type = 'Savings';
END //

DELIMITER ;
  
DELIMITER //

CREATE PROCEDURE GetAccountsByCity(IN p_city VARCHAR(50))
BEGIN
  SELECT *
  FROM accounts
  WHERE city = p_city;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetAccountsAboveBalance(IN p_balance DECIMAL(10,2))
BEGIN
  SELECT *
  FROM accounts
  WHERE balance > p_balance;
END //

DELIMITER ;

CALL GetAllAccounts();
CALL GetSavingsAccounts();
CALL GetAccountsByCity('Hyderabad');
CALL GetAccountsAboveBalance(50000);

DELIMITER //

CREATE PROCEDURE UpdateAccountBalance(IN accnt_id INT, IN add_balance DECIMAL(10,2))
BEGIN
  UPDATE accounts
  SET balance = add_balance
  WHERE account_id = accnt_id;
END //

DELIMITER ;

CALL UpdateAccountBalance(103, 30000.00);

DELIMITER //

CREATE PROCEDURE DepositAmount(IN accnt_id INT, IN deposit_amount DECIMAL(10,2))
BEGIN
  UPDATE accounts
  SET balance = balance + deposit_amount
  WHERE account_id = accnt_id;
END //

DELIMITER ;

CALL DepositAmount(103, 5000.00);

DELIMITER //

CREATE PROCEDURE WithdrawAmount(IN accnt_id INT, IN withdraw_amount DECIMAL(10,2))
BEGIN
  UPDATE accounts
  SET balance = balance - withdraw_amount
  WHERE account_id = accnt_id;
END //

DELIMITER ;

CALL WithdrawAmount(103, 5000.00);

DELIMITER //

CREATE PROCEDURE DeleteAccount(IN p_account_id INT)
BEGIN
  DELETE FROM accounts
  WHERE account_id = p_account_id;
END //

DELIMITER ;

CALL DeleteAccount(106);