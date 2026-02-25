# 📌 Job Posting ETL Pipeline with Apache Airflow

## 📖 Project Overview

This project implements an end-to-end ETL pipeline using **Apache Airflow**, **PostgreSQL**, and **Docker** to transform raw job posting data into a structured data warehouse using a **star schema design**.

The pipeline automates:

- Table creation
- Data transformation
- Dimension loading
- Fact table loading
- Constraint enforcement

The system runs as a scheduled DAG and processes job posting data into analytics-ready tables.

---

# 🏗 Architecture

## 🛠 Tools & Technologies Used

- **Apache Airflow** – Workflow orchestration  
- **PostgreSQL** – Data warehouse  
- **Docker & Docker Compose** – Containerized environment  
- **SQL** – Data transformation logic  

## 🔄 Pipeline Flow
create_dimensions

create_fact

load_dimensions

load_fact

create_constraints


---

# 🗄 Data Warehouse Design

The project follows a **Star Schema** model.

## Dimension Tables

- `dim_company`
- `dim_location`
- `dim_date`

## Fact Table

- `fact_job_postings`

This structure enables efficient analytical queries and reporting.

---

# 🔁 ETL Process

## 1️⃣ Create Tables

Dimension and fact tables are created using SQL scripts executed via Airflow's `PostgresOperator`.

---

## 2️⃣ Transform & Load Dimensions

- Company IDs cast from FLOAT to BIGINT  
- Distinct values extracted from raw dataset  
- Date dimension generated using SQL date functions  

---

## 3️⃣ Load Fact Table

- Joined cleaned data with dimension tables  
- Applied proper type casting  
- Inserted records into fact table  

---

## 4️⃣ Add Constraints

- Primary keys  
- Foreign keys  
- Referential integrity enforcement  

---

# ⚙️ Key Challenges Solved

- Fixed `TemplateNotFound` error by configuring `template_searchpath`
- Resolved FLOAT to BIGINT casting issues in PostgreSQL
- Debugged Airflow scheduler and retry behavior
- Structured DAG dependencies correctly
- Ensured successful containerized deployment

---
