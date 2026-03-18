USE nigerian_education;

-- 6a. Oldest institution per category
-- Directly answers Question 6
WITH ranked_institutions AS (
    SELECT 
        institution_name,
        category,
        year_of_establishment,
        ownership_group,
        RANK() OVER (
            PARTITION BY category 
            ORDER BY year_of_establishment ASC
        ) AS rank_num,
        COUNT(*) OVER (
            PARTITION BY category, year_of_establishment
        ) AS tied_count
    FROM higher_institutions
    WHERE year_of_establishment > 0
)
SELECT 
    category,
    institution_name,
    year_of_establishment,
    ownership_group,
    CASE 
        WHEN tied_count > 1 THEN '🔴 Tied'
        ELSE '✅ Sole Oldest'
    END AS status
FROM ranked_institutions
WHERE rank_num = 1
ORDER BY year_of_establishment ASC;

-- 6b. Top 3 oldest institutions per category
WITH ranked_institutions AS (
    SELECT 
        institution_name,
        category,
        year_of_establishment,
        ownership_group,
        RANK() OVER (
            PARTITION BY category 
            ORDER BY year_of_establishment ASC
        ) AS rank_num
    FROM higher_institutions
    WHERE year_of_establishment > 0
)
SELECT 
    rank_num,
    category,
    institution_name,
    year_of_establishment,
    ownership_group
FROM ranked_institutions
WHERE rank_num <= 3
ORDER BY category, rank_num;

-- 6c. Newest institution per category
WITH ranked_newest AS (
    SELECT 
        institution_name,
        category,
        year_of_establishment,
        ownership_group,
        RANK() OVER (
            PARTITION BY category 
            ORDER BY year_of_establishment DESC
        ) AS rank_num
    FROM higher_institutions
    WHERE year_of_establishment > 0
)
SELECT 
    category,
    institution_name,
    year_of_establishment,
    ownership_group
FROM ranked_newest
WHERE rank_num = 1
ORDER BY year_of_establishment DESC;

-- 6d. Rank cities by number of institutions
-- with running total
SELECT 
    location_city,
    COUNT(*) AS total,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS city_rank,
    SUM(COUNT(*)) OVER (ORDER BY COUNT(*) DESC) AS running_total
FROM higher_institutions
WHERE location_city IS NOT NULL
AND location_city != ''
GROUP BY location_city
ORDER BY city_rank ASC
LIMIT 15;

-- 6e. Full ranking summary — top institution 
-- per ownership per category
WITH full_ranking AS (
    SELECT 
        institution_name,
        category,
        ownership_group,
        year_of_establishment,
        RANK() OVER (
            PARTITION BY category, ownership_group
            ORDER BY year_of_establishment ASC
        ) AS rank_num
    FROM higher_institutions
    WHERE year_of_establishment > 0
)
SELECT 
    category,
    ownership_group,
    institution_name,
    year_of_establishment
FROM full_ranking
WHERE rank_num = 1
ORDER BY category, year_of_establishment ASC;