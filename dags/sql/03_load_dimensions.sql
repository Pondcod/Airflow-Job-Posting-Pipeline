-- Load Company Dimension
INSERT INTO dim_company (company_id, company_name)
SELECT DISTINCT
    CAST(company_id AS NUMERIC)::BIGINT,
    company_name
FROM clean_postings
WHERE company_id IS NOT NULL;

-- Load Location Dimension
INSERT INTO dim_location (location_id, location)
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY location) AS location_id,
    location
FROM clean_postings
WHERE location IS NOT NULL;

-- Load Date Dimension
INSERT INTO dim_date (
    date_id,
    year,
    month,
    day,
    quarter,
    month_name,
    day_name,
    day_of_week
)
SELECT DISTINCT
    listed_at::DATE AS date_id,
    EXTRACT(YEAR FROM listed_at),
    EXTRACT(MONTH FROM listed_at),
    EXTRACT(DAY FROM listed_at),
    EXTRACT(QUARTER FROM listed_at),
    TO_CHAR(listed_at, 'Month'),
    TO_CHAR(listed_at, 'Day'),
    EXTRACT(DOW FROM listed_at)
FROM clean_postings
WHERE listed_at IS NOT NULL;