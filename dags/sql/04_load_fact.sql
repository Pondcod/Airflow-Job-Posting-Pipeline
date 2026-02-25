INSERT INTO fact_job_postings (
    job_id,
    company_id,
    location_id,
    date_id,
    salary_estimate,
    work_type,
    experience_level
)
SELECT
    cp.job_id,
    CAST(cp.company_id AS NUMERIC)::BIGINT,
    dl.location_id,
    cp.listed_at::DATE,
    cp.salary_estimate,
    cp.work_type,
    cp.experience_level
FROM clean_postings cp
LEFT JOIN dim_location dl
    ON cp.location = dl.location
WHERE cp.job_id IS NOT NULL;