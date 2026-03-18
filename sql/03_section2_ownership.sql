USE nigerian_education;

-- 2a. Ownership percentage breakdown
WITH ownership_counts AS (
    SELECT ownership_group, COUNT(*) AS total
    FROM higher_institutions
    GROUP BY ownership_group
),
grand_total AS (
    SELECT COUNT(*) AS overall_total
    FROM higher_institutions
)
SELECT 
    ownership_group,
    total,
    ROUND((total / overall_total) * 100, 1) AS percentage
FROM ownership_counts, grand_total
ORDER BY total DESC;

-- 2b. Ownership breakdown per category
SELECT 
    category,
    SUM(CASE WHEN ownership_group = 'Private' THEN 1 ELSE 0 END) AS private_count,
    SUM(CASE WHEN ownership_group = 'Federal' THEN 1 ELSE 0 END) AS federal_count,
    SUM(CASE WHEN ownership_group = 'State' THEN 1 ELSE 0 END) AS state_count,
    COUNT(*) AS total
FROM higher_institutions
GROUP BY category
ORDER BY total DESC;

-- 2c. Which ownership type has the most categories covered
SELECT 
    ownership_group,
    COUNT(DISTINCT category) AS categories_covered
FROM higher_institutions
GROUP BY ownership_group
ORDER BY categories_covered DESC;

-- 2d. Ownership dominance per category
-- Shows which ownership type leads in each category
SELECT 
    category,
    ownership_group,
    COUNT(*) AS total
FROM higher_institutions
GROUP BY category, ownership_group
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM higher_institutions hi2
        WHERE hi2.category = higher_institutions.category
        GROUP BY hi2.ownership_group
    ) AS max_counts
)
ORDER BY category;