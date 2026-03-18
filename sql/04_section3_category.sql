USE nigerian_education;

-- 3a. Full category breakdown with percentages
-- Answers Question 7
WITH category_counts AS (
    SELECT category, COUNT(*) AS total
    FROM higher_institutions
    GROUP BY category
),
grand_total AS (
    SELECT COUNT(*) AS overall_total
    FROM higher_institutions
)
SELECT 
    category,
    total,
    ROUND((total / overall_total) * 100, 1) AS pct_of_all
FROM category_counts, grand_total
ORDER BY total DESC;

-- 3b. Private percentage per category
-- Answers Question 3 and 7
WITH category_totals AS (
    SELECT category, COUNT(*) AS total
    FROM higher_institutions
    GROUP BY category
),
private_totals AS (
    SELECT category, COUNT(*) AS private_count
    FROM higher_institutions
    WHERE ownership_group = 'Private'
    GROUP BY category
)
SELECT 
    ct.category,
    ct.total,
    COALESCE(pt.private_count, 0) AS private_count,
    ROUND((COALESCE(pt.private_count, 0) / ct.total) * 100, 1) AS private_pct
FROM category_totals ct
LEFT JOIN private_totals pt ON ct.category = pt.category
ORDER BY private_pct DESC;

-- 3c. Categories where private institutions outnumber 
-- federal and state combined
-- Answers Question 3
SELECT 
    category,
    SUM(CASE WHEN ownership_group = 'Private' THEN 1 ELSE 0 END) AS private_count,
    SUM(CASE WHEN ownership_group != 'Private' THEN 1 ELSE 0 END) AS govt_count,
    ROUND(SUM(CASE WHEN ownership_group = 'Private' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS private_pct
FROM higher_institutions
GROUP BY category
HAVING private_count > govt_count
ORDER BY private_pct DESC;

-- 3d. Average year of establishment per category
-- Shows which categories are oldest vs newest
SELECT 
    category,
    ROUND(AVG(year_of_establishment), 0) AS avg_year,
    MIN(year_of_establishment) AS oldest,
    MAX(year_of_establishment) AS newest,
    COUNT(*) AS total
FROM higher_institutions
WHERE year_of_establishment > 0
GROUP BY category
ORDER BY avg_year ASC;