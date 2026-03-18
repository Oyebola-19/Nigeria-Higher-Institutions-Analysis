USE nigerian_education;

-- 4a. Institutions established per decade
-- Answers Question 2
SELECT 
    decade_established,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS percentage
FROM higher_institutions
WHERE decade_established != ''
GROUP BY decade_established
ORDER BY decade_established ASC;

-- 4b. Decade with the MOST growth
-- Directly answers Question 2
SELECT 
    decade_established,
    COUNT(*) AS total
FROM higher_institutions
WHERE decade_established != ''
GROUP BY decade_established
ORDER BY total DESC
LIMIT 1;

-- 4c. Growth per decade by ownership type
-- Answers Question 5
SELECT 
    decade_established,
    SUM(CASE WHEN ownership_group = 'Private' THEN 1 ELSE 0 END) AS private_count,
    SUM(CASE WHEN ownership_group = 'Federal' THEN 1 ELSE 0 END) AS federal_count,
    SUM(CASE WHEN ownership_group = 'State' THEN 1 ELSE 0 END) AS state_count,
    COUNT(*) AS total
FROM higher_institutions
WHERE decade_established != ''
GROUP BY decade_established
ORDER BY decade_established ASC;

-- 4d. Running total of institutions over time
-- Shows cumulative growth story
SELECT 
    year_of_establishment,
    COUNT(*) AS new_institutions,
    SUM(COUNT(*)) OVER (ORDER BY year_of_establishment ASC) AS running_total
FROM higher_institutions
WHERE year_of_establishment > 0
GROUP BY year_of_establishment
ORDER BY year_of_establishment ASC;

-- 4e. Which decade saw private institutions 
-- overtake government institutions
WITH decade_ownership AS (
    SELECT 
        decade_established,
        SUM(CASE WHEN ownership_group = 'Private' THEN 1 ELSE 0 END) AS private_count,
        SUM(CASE WHEN ownership_group != 'Private' THEN 1 ELSE 0 END) AS govt_count
    FROM higher_institutions
    WHERE decade_established != ''
    GROUP BY decade_established
)
SELECT 
    decade_established,
    private_count,
    govt_count,
    CASE 
        WHEN private_count > govt_count THEN '🔴 Private Leads'
        WHEN govt_count > private_count THEN '🟢 Government Leads'
        ELSE '🟡 Tied'
    END AS who_leads
FROM decade_ownership
ORDER BY decade_established ASC;