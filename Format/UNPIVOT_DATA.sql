-- Create table
CREATE TABLE EmployeeSales (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),

    jan_sales INT NULL,
    feb_sales INT NULL,
    mar_sales INT NULL,
    apr_sales INT NULL,
    may_sales INT NULL,
    jun_sales INT NULL,

    jan_bonus INT NULL,
    feb_bonus INT NULL,
    mar_bonus INT NULL,

    region_east INT NULL,
    region_west INT NULL,
    region_north INT NULL,
    region_south INT NULL
);

-- Insert data
INSERT INTO EmployeeSales
(
    employee_id,
    employee_name,
    department,

    jan_sales,
    feb_sales,
    mar_sales,
    apr_sales,
    may_sales,
    jun_sales,

    jan_bonus,
    feb_bonus,
    mar_bonus,

    region_east,
    region_west,
    region_north,
    region_south
)
VALUES
(
    1, 'Alice', 'Electronics',
    1200, 1400, NULL, 1800, 2000, 2100,
    100, 120, NULL,
    10, 15, 20, NULL
),

(
    2, 'Bob', 'Clothing',
    900, NULL, 1100, 1200, NULL, 1500,
    80, NULL, 90,
    5, 8, NULL, 12
),

(
    3, 'Charlie', 'Electronics',
    NULL, 1600, 1700, NULL, 2200, 2400,
    NULL, 140, 160,
    20, NULL, 25, 30
),

(
    4, 'David', 'Furniture',
    2000, 2100, 2200, 2300, NULL, NULL,
    200, 210, 220,
    NULL, 18, 22, 25
),

(
    5, 'Eva', 'Clothing',
    1000, 1050, NULL, 1300, 1400, 1500,
    90, 95, NULL,
    8, 10, 12, NULL
);

-- View data
SELECT *
FROM EmployeeSales;
