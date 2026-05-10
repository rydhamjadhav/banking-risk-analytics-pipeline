-- Step 8: Monthly default trend analysis
CREATE VIEW vw_monthly_trend AS
SELECT
    LEFT(loan_date, 7) AS year_month,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END) AS total_defaults,
    SUM(CASE WHEN loan_status = 'Approved'  THEN 1 ELSE 0 END) AS total_approved,
    ROUND(
        100.0 * SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS default_rate_pct,
    ROUND(AVG(CAST(loan_amount AS FLOAT)), 2) AS avg_loan_amount
FROM loan_applicants
GROUP BY LEFT(loan_date, 7);