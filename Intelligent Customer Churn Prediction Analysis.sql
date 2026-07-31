SHOW DATABASES;
USE marketing_db;

SHOW TABLES;

SELECT COUNT(*)
FROM neobank_customer_churn;

SHOW COLUMNS
FROM marketing_campaign_performance;

#Query 1

SELECT
    Plan_Type,
    KYC_Status,
    SUM(Monthly_Deposits) AS Total_Monthly_Deposits,
    AVG(Account_Balance) AS Average_Account_Balance,

    ROUND(
        (SUM(Monthly_Deposits) / AVG(Account_Balance)) * 100,
        2
    ) AS Deposit_Coverage_Percentage,

    ROUND(
        (
            SUM(
                CASE
                    WHEN Failed_Logins > 0
                         OR Support_Tickets > 0
                    THEN 1
                    ELSE 0
                END
            ) * 100.0
        ) / COUNT(*),
        2
    ) AS Friction_Percentage

FROM neobank_customer_churn

GROUP BY
    Plan_Type,
    KYC_Status

HAVING
    (SUM(Monthly_Deposits) / AVG(Account_Balance)) < 0.30
    AND
    (
        SUM(
            CASE
                WHEN Failed_Logins > 0
                     OR Support_Tickets > 0
                THEN 1
                ELSE 0
            END
        ) * 100.0
    ) / COUNT(*) > 30

ORDER BY Deposit_Coverage_Percentage;


# Query 2

SELECT
    Customer_ID,
    Signup_Date,
    Plan_Type,
    Support_Tickets,
    Account_Balance
FROM neobank_customer_churn n
WHERE
    Support_Tickets >
    (
        SELECT AVG(n2.Support_Tickets)
        FROM neobank_customer_churn n2
        WHERE n2.Plan_Type = n.Plan_Type
    )
AND
    Account_Balance <
    (
        SELECT AVG(n3.Account_Balance)
        FROM neobank_customer_churn n3
        WHERE YEAR(n3.Signup_Date) = YEAR(n.Signup_Date)
          AND MONTH(n3.Signup_Date) = MONTH(n.Signup_Date)
    )
ORDER BY Signup_Date, Customer_ID;

#Query 3

SELECT
    Plan_Type,

    ROUND(
        AVG(CASE
                WHEN KYC_Status = 'Completed'
                THEN Core_Feature_Score
            END),2
    ) AS Avg_Completed_Feature_Score,

    ROUND(
        AVG(CASE
                WHEN KYC_Status = 'Pending'
                THEN Core_Feature_Score
            END),2
    ) AS Avg_Pending_Feature_Score,

    ROUND(
        AVG(CASE
                WHEN KYC_Status = 'Completed'
                THEN Core_Feature_Score
            END)
        -
        AVG(CASE
                WHEN KYC_Status = 'Pending'
                THEN Core_Feature_Score
            END),2
    ) AS Engagement_Drop

FROM neobank_customer_churn

GROUP BY Plan_Type

HAVING
(
    AVG(CASE
            WHEN KYC_Status = 'Completed'
            THEN Core_Feature_Score
        END)
    -
    AVG(CASE
            WHEN KYC_Status = 'Pending'
            THEN Core_Feature_Score
        END)
) > 15

ORDER BY Engagement_Drop DESC;

#Query 4

SELECT
    Plan_Type,

    COUNT(*) AS Total_High_Risk_Customers,

    SUM(
        CASE
            WHEN Core_Feature_Score >= 80 THEN 1
            ELSE 0
        END
    ) AS False_Churn_Alarms,

    ROUND(
        SUM(
            CASE
                WHEN Core_Feature_Score >= 80 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS False_Alarm_Percentage

FROM neobank_customer_churn

WHERE AI_Risk_Band = 'High'

GROUP BY Plan_Type

ORDER BY Plan_Type; 