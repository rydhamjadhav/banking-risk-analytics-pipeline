-- Step 2: Add proper numeric columns for analysis
ALTER TABLE loan_applicants
ADD dti_ratio  DECIMAL(8,4),
    emi_amount DECIMAL(15,2);

-- Populate DTI ratio
UPDATE loan_applicants
SET dti_ratio = ROUND(loan_amount / NULLIF(income, 0), 4);

-- Populate EMI amount using loan repayment formula
UPDATE loan_applicants
SET emi_amount = ROUND(
    (loan_amount * (interest_rate/100/12) *
     POWER(1 + interest_rate/100/12, loan_tenure_months)) /
    (POWER(1 + interest_rate/100/12, loan_tenure_months) - 1),
2);

-- Verify
SELECT TOP 5
    customer_id,
    loan_amount,
    income,
    dti_ratio,
    emi_amount
FROM loan_applicants;