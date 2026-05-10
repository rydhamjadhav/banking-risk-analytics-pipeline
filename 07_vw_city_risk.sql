-- Step 7: City wise risk analysis
CREATE VIEW vw_city_risk AS
SELECT
    city,
    COUNT(*) AS total_customers,
    ROUND(AVG(CAST(credit_score AS FLOAT)), 0) AS avg_credit_score,
    ROUND(AVG(CAST(loan_amount AS FLOAT)), 2) AS avg_loan_amount,
    SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END) AS total_defaults,
    ROUND(
        100.0 * SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS npa_rate_pct,
    CASE
        WHEN AVG(CAST(credit_score AS FLOAT)) < 600 THEN 'High Risk City'
        WHEN AVG(CAST(credit_score AS FLOAT)) < 700 THEN 'Medium Risk City'
        ELSE 'Low Risk City'
    END AS city_risk_label
FROM loan_applicants
GROUP BY city;