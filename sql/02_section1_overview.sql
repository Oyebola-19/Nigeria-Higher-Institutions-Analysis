USE nigerian_education;

-- 1a. Total institutions
SELECT COUNT(*) AS total_institutions
FROM higher_institutions;

-- 1b. Total by ownership
SELECT ownership_group, COUNT(*) AS total
FROM higher_institutions
GROUP BY ownership_group
ORDER BY total DESC;

-- 1c. Total by category
SELECT category, COUNT(*) AS total
FROM higher_institutions
GROUP BY category
ORDER BY total DESC;

-- 1d. Year range
SELECT 
    MIN(year_of_establishment) AS oldest_year,
    MAX(year_of_establishment) AS newest_year,
    MAX(year_of_establishment) - MIN(year_of_establishment) AS span_of_years
FROM higher_institutions
WHERE year_of_establishment IS NOT NULL
AND year_of_establishment > 0;