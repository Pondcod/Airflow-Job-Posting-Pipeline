-- Primary Keys
ALTER TABLE dim_company
ADD PRIMARY KEY (company_id);

ALTER TABLE dim_location
ADD PRIMARY KEY (location_id);

ALTER TABLE dim_date
ADD PRIMARY KEY (date_id);

-- Foreign Keys
ALTER TABLE fact_job_postings
ADD CONSTRAINT fk_company
FOREIGN KEY (company_id)
REFERENCES dim_company(company_id);

ALTER TABLE fact_job_postings
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id)
REFERENCES dim_location(location_id);

ALTER TABLE fact_job_postings
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);