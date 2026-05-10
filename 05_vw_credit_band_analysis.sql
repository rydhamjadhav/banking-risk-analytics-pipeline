-- Step 5: Credit score band analysis
CREATE VIEW vw_credit_band_analysis AS
SELECT
    CASE
        WHEN credit_score BETWEEN 300 AND 499 THEN '1. 300-499 (Very Poor)'
        WHEN credit_score BETWEEN 500 AND 599 THEN '2. 500-599 (Poor)'
        WHEN credit_score BETWEEN 600 AND 699 THEN '3. 600-699 (Fair)'
        WHEN credit_score BETWEEN 700 AND 799 THEN '4. 700-799 (Good)'
        WHEN credit_score BETWEEN 800 AND 900 THEN '5. 800-900 (Excellent)'
    END AS credit_band,
    COUNT(*) AS total_applicants,
    ROUND(AVG(CAST(loan_amount AS FLOAT)), 2) AS avg_loan_amount,
    ROUND(AVG(CAST(income AS FLOAT)), 2) AS avg_income,
    SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END) AS total_defaults,
    ROUND(
        100.0 * SUM(CASE WHEN loan_status = 'Defaulted' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS default_rate_pct
FROM loan_applicants
GROUP BY
    CASE
        WHEN credit_score BETWEEN 300 AND 499 THEN '1. 300-499 (Very Poor)'
        WHEN credit_score BETWEEN 500 AND 599 THEN '2. 500-599 (Poor)'
        WHEN credit_score BETWEEN 600 AND 699 THEN '3. 600-699 (Fair)'
        WHEN credit_score BETWEEN 700 AND 799 THEN '4. 700-799 (Good)'
        WHEN credit_score BETWEEN 800 AND 900 THEN '5. 800-900 (Excellent)'
    END;