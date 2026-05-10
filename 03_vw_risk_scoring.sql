-- Step 3: Create risk scoring view
-- Assigns 0-100 risk score to each customer
CREATE VIEW vw_risk_scoring AS
SELECT
    customer_id, age, gender, city, employment_type,
    income, loan_amount, loan_tenure_months, interest_rate,
    credit_score, existing_loans, default_history,
    collateral_value, loan_purpose, loan_date,
    loan_status, dti_ratio, emi_amount, risk_flag,

    -- Risk Score Calculation (max 100 points)
    (
        CASE
            WHEN credit_score < 550 THEN 40
            WHEN credit_score < 650 THEN 25
            WHEN credit_score < 750 THEN 10
            ELSE 0
        END
        +
        CASE WHEN default_history = 1 THEN 30 ELSE 0 END
        +
        CASE
            WHEN dti_ratio > 0.6 THEN 20
            WHEN dti_ratio > 0.4 THEN 10
            ELSE 0
        END
        +
        CASE
            WHEN existing_loans >= 3 THEN 10
            WHEN existing_loans = 2  THEN 5
            ELSE 0
        END
    ) AS risk_score,

    -- Risk Category Label
    CASE
        WHEN credit_score < 550 OR default_history = 1 THEN 'High Risk'
        WHEN credit_score BETWEEN 550 AND 699          THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category

FROM loan_applicants;