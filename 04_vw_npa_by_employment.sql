-- Step 4: NPA rate by employment type
CREATE VIEW vw_npa_by_employment AS
SELECT
    employment_type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END) AS total_defaults,
    SUM(CASE WHEN loan_status = 'Approved'  THEN 1 ELSE 0 END) AS total_approved,
    SUM(CASE WHEN loan_status = 'Rejected'  THEN 1 ELSE 0 END) AS total_rejected,
    ROUND(
        100.0 * SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS npa_rate_pct
FROM loan_applicants
GROUP BY employment_type;