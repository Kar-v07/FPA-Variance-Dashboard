DROP VIEW IF EXISTS v_bva;
DROP VIEW IF EXISTS v_actuals_monthly;

CREATE VIEW v_actuals_monthly AS
SELECT strftime('%Y-%m-01', order_date) AS month,
       region, product,
       SUM(revenue) AS actual_revenue,
       SUM(cogs)    AS actual_cogs,
       COUNT(*)     AS orders
FROM transactions
GROUP BY 1, 2, 3;

CREATE VIEW v_bva AS
SELECT a.month, a.region, a.product,
       a.actual_revenue, a.actual_cogs,
       b.budget_revenue, b.budget_cogs,
       a.actual_revenue - b.budget_revenue AS rev_var,
       ROUND(100.0*(a.actual_revenue - b.budget_revenue)/b.budget_revenue, 1) AS rev_var_pct,
       CASE WHEN ABS(a.actual_revenue - b.budget_revenue)/b.budget_revenue > 0.05
            THEN 'Investigate' ELSE 'OK' END AS flag
FROM v_actuals_monthly a
JOIN budget b  ON a.month = b.month AND a.region = b.region AND a.product = b.product;