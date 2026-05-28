WITH pivoted_data AS (
	SELECT 
		CustomerId,
		COALESCE([Jan-21], 0) AS [Jan-21],
		COALESCE([Feb-21], 0) AS [Feb-21],
		COALESCE([Mar-21], 0) AS [Mar-21],
		COALESCE([Apr-21], 0) AS [Apr-21],
		COALESCE([May-21], 0) AS [May-21],
		COALESCE([Jun-21], 0) AS [Jun-21],
		COALESCE([Jul-21], 0) AS [Jul-21],
		COALESCE([Aug-21], 0) AS [Aug-21],
		COALESCE([Sep-21], 0) AS [Sep-21],
		COALESCE([Oct-21], 0) AS [Oct-21],
		COALESCE([Nov-21], 0) AS [Nov-21],
		COALESCE([Dec-21], 0) AS [Dec-21],
		-- Create 'Total' Column at the end
		COALESCE([Jan-21], 0) 
		+ COALESCE([Feb-21], 0) 
		+ COALESCE([Mar-21], 0) 
		+ COALESCE([Apr-21], 0) 
		+ COALESCE([May-21], 0) 
		+ COALESCE([Jun-21], 0) 
		+ COALESCE([Jul-21], 0) 
		+ COALESCE([Aug-21], 0) 
		+ COALESCE([Sep-21], 0) 
		+ COALESCE([Oct-21], 0) 
		+ COALESCE([Nov-21], 0) 
		+ COALESCE([Dec-21], 0) AS Total
	FROM (
	SELECT 
		-- original data with some format
		FORMAT(SalesDate, 'MMM-yy') AS SalesDate,
		CustomerId,
		CAST(REPLACE(Amount, '$' , '') AS INT) AS Amount
	FROM SalesData
	) AS source_table
	PIVOT(
		SUM(Amount)
		FOR SalesDate
		IN ([Jan-21],[Feb-21],[Mar-21],[Apr-21],[May-21],[Jun-21],[Jul-21],[Aug-21],[Sep-21],[Oct-21],[Nov-21],[Dec-21] )
	) AS pvt_table
),
final_data AS (
	SELECT * 
	FROM pivoted_data
	UNION ALL
	-- Create total row at the end of the customerId column
	SELECT 
		'Total',
		SUM([Jan-21]) ,
		SUM([Feb-21]),
		SUM([Mar-21]),
		SUM([Apr-21]),
		SUM([May-21]),
		SUM([Jun-21]),
		SUM([Jul-21]),
		SUM([Aug-21]),
		SUM([Sep-21]),
		SUM([Oct-21]),
		SUM([Nov-21]),
		SUM([Dec-21]),
		SUM(Total)
	FROM pivoted_data
)
-- final data with some formating like if the value has negative value add brackets and and remove negaive sign but if not add '$'
SELECT
    CustomerId,

	CASE 
	WHEN [Jan-21] < 0 THEN CONCAT('(', [Jan-21] * -1, ')$')
	ELSE CONCAT([Jan-21] , '$')
	END AS [Jan-21],

	CASE 
	WHEN [Feb-21] < 0 THEN CONCAT( '(', [Feb-21] * -1, ')$' )
	ELSE CONCAT([Feb-21], '$')
	END AS [Feb-21],

	CASE
		WHEN [Mar-21] < 0 THEN CONCAT('(', [Mar-21] * -1, ')$')
		ELSE CONCAT([Mar-21], '$')
	END AS [Mar-21],
    
	CASE
		WHEN [Apr-21] < 0 THEN CONCAT('(', [Apr-21] * -1, ')$')
		ELSE CONCAT([Apr-21], '$')
	END AS  [Apr-21],

	CASE
		WHEN [May-21] < 0 THEN CONCAT('(', [May-21] * -1, ')$')
		ELSE CONCAT([May-21], '$')
	END AS  [May-21],

	CASE
		WHEN [Jun-21] < 0 THEN CONCAT('(', [Jun-21] * -1, ')$')
		ELSE CONCAT([Jun-21], '$')
	END AS  [Jun-21],

	CASE
		WHEN [Jul-21] < 0 THEN CONCAT('(', [Jul-21] * -1, ')$')
		ELSE CONCAT([Jul-21], '$')
	END AS  [Jul-21],

	CASE
		WHEN [Aug-21] < 0 THEN CONCAT('(', [Aug-21] * -1, ')$')
		ELSE CONCAT([Aug-21], '$')
	END AS  [Aug-21],

	CASE
		WHEN [Sep-21] < 0 THEN CONCAT('(', [Sep-21] * -1, ')$')
		ELSE CONCAT([Sep-21], '$')
	END AS  [Sep-21],

	CASE
		WHEN [Oct-21] < 0 THEN CONCAT('(', [Oct-21] * -1, ')$')
		ELSE CONCAT([Oct-21], '$')
	END AS  [Oct-21],

	CASE
		WHEN [Nov-21] < 0 THEN CONCAT('(', [Nov-21] * -1, ')$')
		ELSE CONCAT([Nov-21], '$')
	END AS  [Nov-21],

	CASE
		WHEN [Dec-21] < 0 THEN CONCAT('(', [Dec-21] * -1, ')$')
		ELSE CONCAT([Dec-21], '$')
	END AS  [Dec-21],

	CASE
		WHEN Total < 0 THEN CONCAT('(', Total * -1, ')$')
		ELSE CONCAT(Total, '$')
	END AS  Total

FROM final_data;
