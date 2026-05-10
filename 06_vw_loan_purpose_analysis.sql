-- Step 6: Loan purpose risk analysis
CREATE VIEW vw_loan_purpose_analysis AS
SELECT
    loan_purpose,
    COUNT(*) AS total_loans,
    ROUND(AVG(CAST(loan_amount AS FLOAT)), 2) AS avg_loan_amount,
    ROUND(AVG(CAST(credit_score AS FLOAT)), 0) AS avg_credit_score,
    SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END) AS total_defaults,
    ROUND(
        100.0 * SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS default_rate_pct,
    ROUND(AVG(CAST(dti_ratio AS FLOAT)), 4) AS avg_dti_ratio
FROM loan_applicants
GROUP BY loan_purpose;