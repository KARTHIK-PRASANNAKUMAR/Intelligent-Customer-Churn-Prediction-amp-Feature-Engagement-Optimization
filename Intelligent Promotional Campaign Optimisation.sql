SHOW DATABASES;
use marketing_db;
SHOW TABLES;
SELECT COUNT(*)
FROM marketing_campaign_performance;


#Query 1: The &quot;Margin-Eroding Discount&quot; Detector
SELECT
    Product_Category,
    Channel,
    SUM(Revenue) AS Total_Promo_Revenue,
    SUM(Baseline_Units * Base_Price) AS Baseline_Value,

    ROUND(
        (SUM(Revenue) / SUM(Baseline_Units * Base_Price)) * 100,
        2
    ) AS Revenue_Coverage_Percentage,

    ROUND(
        (SUM(CASE
                WHEN ROI < 1.0 THEN 1
                ELSE 0
            END) * 100.0) / COUNT(*),
        2
    ) AS Underperform_Percentage

FROM marketing_campaign_performance

GROUP BY
    Product_Category,
    Channel

HAVING
    (SUM(Revenue) / SUM(Baseline_Units * Base_Price)) < 0.40
    AND
    (SUM(CASE
            WHEN ROI < 1.0 THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)) > 25.0

ORDER BY Revenue_Coverage_Percentage ASC;

#Query 2: The &quot;Cannibalization Risk&quot; Finder
SELECT
    Date,
    Product_Category,
    Channel,
    Units_Sold,
    Discount_Pct,
    ROI,
    AI_Recommended_Action

FROM marketing_campaign_performance AS m1

WHERE Units_Sold >
(
    SELECT AVG(m2.Units_Sold)
    FROM marketing_campaign_performance AS m2
    WHERE m2.Channel = m1.Channel
)

AND Discount_Pct > 0.30

ORDER BY
    Date,
    Product_Category,
    Channel;

#Query 3: Channel Performance Stress Test
SELECT
    Customer_Segment,

    ROUND(
        AVG(CASE
                WHEN Channel = 'Paid Search'
                THEN Gross_Profit
            END),
        2
    ) AS Avg_PaidSearch_Gross_Profit,

    ROUND(
        AVG(CASE
                WHEN Channel = 'Email'
                THEN Gross_Profit
            END),
        2
    ) AS Avg_Email_Gross_Profit,

    ROUND(
        AVG(CASE
                WHEN Channel = 'Paid Search'
                THEN Gross_Profit
            END)
        -
        AVG(CASE
                WHEN Channel = 'Email'
                THEN Gross_Profit
            END),
        2
    ) AS Profit_Drop

FROM marketing_campaign_performance

GROUP BY Customer_Segment

HAVING
(
    AVG(CASE
            WHEN Channel = 'Paid Search'
            THEN Gross_Profit
        END)
    -
    AVG(CASE
            WHEN Channel = 'Email'
            THEN Gross_Profit
        END)
) > 5000

ORDER BY Profit_Drop DESC;

#Query 4: The &quot;False Optimization&quot; Audit
SELECT
    Original_AI_Action,
    Corrected_Action,
    COUNT(*) AS Total_Campaigns,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS Percentage

FROM marketing_campaign_performance

GROUP BY
    Original_AI_Action,
    Corrected_Action

ORDER BY
    Total_Campaigns DESC;