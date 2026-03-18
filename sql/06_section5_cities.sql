USE nigerian_education;

-- 5a. Top 10 cities by number of institutions
-- Directly answers Question 4
SELECT 
    location_city,
    COUNT(*) AS total_institutions
FROM higher_institutions
WHERE location_city IS NOT NULL
AND location_city != ''
GROUP BY location_city
ORDER BY total_institutions DESC
LIMIT 10;

-- 5b. Top 10 cities with ownership breakdown
-- Shows what type of institutions dominate each city
SELECT 
    location_city,
    COUNT(*) AS total,
    SUM(CASE WHEN ownership_group = 'Private' THEN 1 ELSE 0 END) AS private_count,
    SUM(CASE WHEN ownership_group = 'Federal' THEN 1 ELSE 0 END) AS federal_count,
    SUM(CASE WHEN ownership_group = 'State' THEN 1 ELSE 0 END) AS state_count
FROM higher_institutions
WHERE location_city IS NOT NULL
AND location_city != ''
GROUP BY location_city
ORDER BY total DESC
LIMIT 10;

-- 5c. Top 10 cities with category breakdown
-- Shows what types of institutions are in each city
SELECT 
    location_city,
    COUNT(*) AS total,
    COUNT(DISTINCT category) AS categories_present
FROM higher_institutions
WHERE location_city IS NOT NULL
AND location_city != ''
GROUP BY location_city
ORDER BY total DESC
LIMIT 10;

-- 5d. Cities with the most diverse institutions
-- Most categories in one city
SELECT 
    location_city,
    COUNT(DISTINCT category) AS categories_present,
    COUNT(*) AS total_institutions
FROM higher_institutions
WHERE location_city IS NOT NULL
AND location_city != ''
GROUP BY location_city
HAVING categories_present >= 3
ORDER BY categories_present DESC, total_institutions DESC
LIMIT 10;

-- 5e. How many cities have institutions per state
-- Extracts state info from institution names
SELECT 
    location_city,
    COUNT(*) AS total,
    GROUP_CONCAT(DISTINCT category ORDER BY category SEPARATOR ', ') AS categories
FROM higher_institutions
WHERE location_city IS NOT NULL
AND location_city != ''
GROUP BY location_city
ORDER BY total DESC
LIMIT 15;