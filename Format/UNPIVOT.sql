SELECT * FROM [dbo].[employee_sales];
WITH sales_unpvt AS (
		SELECT 
			employee_id,
			employee_name,
			department,
			REPLACE(sales_month, '_sales', '') AS sales_month,
			sales_amt
		FROM  [dbo].[employee_sales] AS emp
		UNPIVOT(
			sales_amt FOR sales_month
			IN (jan_sales, feb_sales, mar_sales, apr_sales, may_sales, jun_sales)
		) AS unpvt_sales
),
bonus_unpvt AS (
		SELECT 
			employee_id,
			employee_name,
			department,
			REPLACE(bonus_month, '_bonus', '') AS bonus_month,
			bonus_amt
		FROM [dbo].[employee_sales]
		UNPIVOT (
			bonus_amt FOR bonus_month
			IN (jan_bonus, feb_bonus, mar_bonus)
		) AS unpvt_bonus
)
SELECT 
	sls.employee_id,
	sls.employee_name,
	sls.department,
	sales_month,
	sales_amt
	bonus_month,
	bonus_amt
FROM sales_unpvt AS sls
LEFT JOIN bonus_unpvt AS bn
ON sls.employee_id = bn.employee_id AND
	sls.sales_month = bn.bonus_month;
