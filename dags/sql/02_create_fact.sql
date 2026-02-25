DROP TABLE IF EXISTS fact_job_postings CASCADE;

CREATE TABLE fact_job_postings (
    job_id TEXT,
    company_id BIGINT,
    location_id BIGINT,
    date_id DATE,
    salary_estimate NUMERIC,
    work_type TEXT,
    experience_level TEXT
);