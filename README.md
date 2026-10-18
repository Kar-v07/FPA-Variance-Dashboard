# FPA-Variance-Dashboard 

Automated FP&A & Revenue Variance Dashboard

## What this project is about
Like a lot of finance teams at mid-sized SaaS companies, our fictional company, *Northwind Cloud*, was spending way too much time pulling monthly closes together manually in Excel.
I wanted to build a streamlined, end-to-end analytics pipeline that automatically tracks Revenue, COGS, and Operating Expenses (Opex) against budget—and instantly flags any regions or products falling off track.

## How I built it (Tech Stack & AI Workflow)
* AI-Assisted Data Generation & Python Pipeline: Partnered with AI tooling to design a custom Python data-generation script using pandas and numpy, cleaning duplicate values and modeling realistic financial anomalies.
* Large-Scale SQLite Database Engineering: Built a robust local SQLite database containing over 573,250+ transaction rows, incorporating seasonal trends and embedded financial narratives.
* SQL Data Modeling & Performance Optimization: Structured clean relational SQL views (v_bva) to optimize monthly aggregations and automate variance flags for transactions exceeding the 5% threshold.
* Executive Tableau Visualization: Developed an executive-ready Tableau Public dashboard displaying actuals versus budget, regional variance matrices, and departmental spend.

## Key Insights Uncovered
1. The APAC Services Drop: APAC Services ran roughly 25% below budget starting in July 2025, which turned out to be the primary top-line revenue drag.
2. The EMEA Opex Spike:  EMEA Sales & Marketing saw an 18% opex overrun beginning in April 2025 due to unapproved campaign spend.

## How to run it yourself
1. Run `python3 data_generation/generate_data.py` to recreate the transactional dataset.
2. Load the CSVs into your SQLite database and run `sql/01_views.sql`.
3. Open the Tableau workbook inside `tableau/` to interact with the dashboard.
