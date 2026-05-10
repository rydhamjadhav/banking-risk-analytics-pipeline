-- Step 1: Create the loan_applicants table
CREATE TABLE loan_applicants (
    customer_id          VARCHAR(20)    PRIMARY KEY,
    age                  INT,
    gender               VARCHAR(10),
    city                 VARCHAR(50),
    employment_type      VARCHAR(30),
    income               DECIMAL(15,2),
    loan_amount          DECIMAL(15,2),
    loan_tenure_months   INT,
    interest_rate        DECIMAL(5,2),
    credit_score         INT,
    existing_loans       INT,
    default_history      INT,
    collateral_value     DECIMAL(15,2),
    loan_purpose         VARCHAR(30),
    loan_status          VARCHAR(20),
    risk_flag            VARCHAR(20),
    loan_date            VARCHAR(20),
    monthly_emi          VARCHAR(30),
    debt_to_income_ratio VARCHAR(20)
);