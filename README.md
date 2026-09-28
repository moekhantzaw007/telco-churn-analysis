# Telco Customer Churn Analysis

**Business question:** What drives customer churn, and which 2-3
interventions would most reduce churn and protect revenue?

## Key findings
- 26.5% of customers churned, representing $139K (30.5%) of monthly revenue.
- Month-to-month contracts account for 87% of lost revenue.
- One segment (month-to-month + fiber optic + electronic check) is 19% of
  customers but about half of lost revenue, with a 60% churn rate.

## Recommendations
1. Target the high-risk segment first (autopay incentive + one-year offer).
2. Convert month-to-month customers to one-year contracts.
3. Offer a tech support / online security trial to month-to-month customers.

## Tools
MySQL (cleaning) · Python (pandas, matplotlib) · Tableau Public (dashboard)

## Dashboard
[link to your Tableau Public viz] + screenshot

## Process
1. SQL: deduplication check, blank-to-NULL, type fixes, churn flag
2. Python: churn rate by segment, cross-cuts, revenue at risk
3. Tableau: KPIs and driver charts

## Limitations
Findings show patterns, not proven causes. Contract lock-in likely
explains part of the low long-contract churn, and some segments are small.
