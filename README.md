# FPA-Variance-Dashboard

Automated FP&A & Revenue Variance Dashboard

## What this project is about
Like a lot of finance teams at mid-sized SaaS companies, our fictional company, *Northwind Cloud*, was spending way too much time pulling monthly closes together manually in Excel.
I wanted to build a streamlined, end-to-end analytics pipeline that automatically tracks Revenue, COGS, and Operating Expenses (Opex) against budget—and instantly flags any regions or products falling off track.

## How I built it (Tech Stack & AI Workflow)
* **AI-Assisted Database Generation (Python):** Collaborated with AI as a development partner to write and refine a Python data-generation script (`pandas`, `numpy`).
* This helped quickly build a realistic local SQLite database containing "573,250+" transaction rows, complete with seasonal trends and embedded financial stories.
* Data Modeling & SQL (SQLite): Querying raw transactions directly is inefficient for reporting, so I structured clean relational SQL views (`v_bva`) to handle monthly aggregations and automate variance flags (`> 5%` threshold).
* Visualization (Tableau Public):Built an executive-ready dashboard so leadership can quickly review actuals vs. budget, regional variance matrices, and departmental spend.

## Key Insights Uncovered
1. The APAC Services Drop: APAC Services ran roughly 25% below budget starting in July 2025, which turned out to be the primary top-line revenue drag.
2. The EMEA Opex Spike:  EMEA Sales & Marketing saw an 18% opex overrun beginning in April 2025 due to unapproved campaign spend.

## How to run it yourself
1. Run `python3 data_generation/generate_data.py` to recreate the transactional dataset.
2. Load the CSVs into your SQLite database and run `sql/01_views.sql`.
3. Open the Tableau workbook inside `tableau/` to interact with the dashboard.
