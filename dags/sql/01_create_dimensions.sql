DROP TABLE IF EXISTS dim_company CASCADE;
DROP TABLE IF EXISTS dim_location CASCADE;
DROP TABLE IF EXISTS dim_date CASCADE;

CREATE TABLE dim_company (
    company_id BIGINT,
    company_name TEXT
);

CREATE TABLE dim_location (
    location_id BIGINT,
    location TEXT
);

CREATE TABLE dim_date (
    date_id DATE,
    year NUMERIC,
    month NUMERIC,
    day NUMERIC,
    quarter NUMERIC,
    month_name TEXT,
    day_name TEXT,
    day_of_week NUMERIC
);