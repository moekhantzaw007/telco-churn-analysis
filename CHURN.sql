SELECT *
FROM churn_raw;

DROP TABLE IF EXISTS churn_clean;

CREATE TABLE `churn_clean` (
  `customerID` text,
  `gender` text,
  `SeniorCitizen` int DEFAULT NULL,
  `Partner` text,
  `Dependents` text,
  `tenure` int DEFAULT NULL,
  `PhoneService` text,
  `MultipleLines` text,
  `InternetService` text,
  `OnlineSecurity` text,
  `OnlineBackup` text,
  `DeviceProtection` text,
  `TechSupport` text,
  `StreamingTV` text,
  `StreamingMovies` text,
  `Contract` text,
  `PaperlessBilling` text,
  `PaymentMethod` text,
  `MonthlyCharges` decimal(10,2) DEFAULT NULL,
  `TotalCharges` text,
  `Churn` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM churn_clean;

INSERT churn_clean
SELECT *
FROM churn_raw;

SELECT customerID, COUNT(*) AS cnt
FROM churn_clean
GROUP BY customerID
HAVING COUNT(*) > 1;

-- STANDARDIZE
SELECT *
FROM churn_clean;

SELECT DISTINCT gender 
FROM churn_clean;

SELECT DISTINCT Partner 
FROM churn_clean;

SELECT DISTINCT Dependents 
FROM churn_clean;

SELECT DISTINCT PhoneService
FROM churn_clean;

SELECT DISTINCT MultipleLines 
FROM churn_clean;

SELECT DISTINCT InternetService 
FROM churn_clean;

SELECT DISTINCT OnlineSecurity 
FROM churn_clean;

SELECT DISTINCT OnlineBackup 
FROM churn_clean;

SELECT DISTINCT DeviceProtection 
FROM churn_clean;

SELECT DISTINCT TechSupport 
FROM churn_clean;

SELECT DISTINCT StreamingTV 
FROM churn_clean;

SELECT DISTINCT StreamingMovies 
FROM churn_clean;

SELECT DISTINCT Contract 
FROM churn_clean;

SELECT DISTINCT PaperlessBilling 
FROM churn_clean;

SELECT DISTINCT PaymentMethod 
FROM churn_clean;

SELECT DISTINCT Churn
FROM churn_clean;

-- Count total rows and blanks
SELECT
    COUNT(*) AS total_rows,
    SUM(TRIM(TotalCharges) = '') AS empty_total_charges,
    SUM(TotalCharges IS NULL) AS null_total_charges
FROM churn_clean;

SELECT *
FROM churn_clean;

UPDATE churn_clean
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

ALTER TABLE churn_clean
MODIFY COLUMN TotalCharges DECIMAL(10,2);

SELECT MonthlyCharges
FROM churn_clean;

SELECT
    COUNT(*) AS total_rows,
    SUM(TRIM(MonthlyCharges) = '') AS empty_MonthlyCharges,
    SUM(TotalCharges IS NULL) AS null_MonthlyCharges
FROM churn_clean;

ALTER TABLE churn_clean
MODIFY COLUMN MonthlyCharges DECIMAL(10,2);

-- adding churn_flag for calculation
ALTER TABLE churn_clean
ADD COLUMN churn_flag INT;

UPDATE churn_clean
SET churn_flag = CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END;

SELECT churn, churn_flag
FROM churn_clean;

SELECT * 
FROM churn_clean 
LIMIT 20;

SELECT COUNT(*) AS total_rows 
FROM churn_clean;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT customerID) AS unique_customers,
       SUM(TotalCharges IS NULL) AS null_total_charges,
       SUM(churn_flag) AS churned
FROM churn_clean;


















