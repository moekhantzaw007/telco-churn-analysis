Telco Customer Churn Analysis

End-to-end analysis (SQL → Python → Tableau) of what drives customer churn at a telecom provider, and which interventions would protect the most revenue.

Business question: What drives customer churn, and which 2–3 interventions would most reduce churn and protect revenue?

Live dashboard: https://public.tableau.com/app/profile/moe.khant.zaw/viz/Churn_project_17905954318080/Dashboard1

Key findings
Finding	Number
Overall churn rate	26.5% (1,869 of 7,043 customers)
Monthly revenue lost to churn	$139,131, or 30.5% of monthly revenue
Churn on month-to-month contracts	42.7%, versus 11.3% (1-year) and 2.8% (2-year)
Share of lost revenue from month-to-month customers	87%
Churn in the first 12 months of tenure	47.4%, versus 9.5% after 4+ years
Churn with electronic check payment	45.3%, versus 15–17% on autopay
Churn on fiber optic internet	41.9%, versus 19.0% on DSL
Month-to-month customers without tech support	50.4%, versus 30.7% with it

The highest-risk segment: month-to-month contract + fiber optic + electronic check.

1,307 customers (about 19% of the base)
60.4% churn rate
$68,282 of monthly revenue lost, about 49% of the total

Contract type remained the strongest driver even after controlling for tenure, so it is not simply a "new customers leave" effect.

Recommendations
Target the high-risk segment first. Offer an autopay incentive (small bill credit) together with a discounted one-year contract. This one group holds roughly half of the lost revenue.
Convert month-to-month customers to one-year plans. Month-to-month customers account for 87% of lost revenue.
Offer a tech support and online security trial to month-to-month customers. The churn gap is largest for this group (50.4% vs 30.7%) and almost disappears on longer contracts.
Illustrative impact (high-risk segment)
Churn reduction in segment	Monthly revenue protected	Annualized
10%	~$6,828	~$81,900
20%	~$13,656	~$163,900
30%	~$20,484	~$245,800

Assumptions: saved customers keep paying their current monthly charge for a full year; reduction percentages are scenarios, not forecasts; campaign costs are not included; scenarios for different interventions overlap and should not be added together.

Process
1. SQL (MySQL): data cleaning
Loaded the raw CSV into churn_raw
Checked for duplicate customerIDs
Converted 11 blank TotalCharges values to NULL (new customers with tenure 0)
Converted TotalCharges from text to DECIMAL(10,2) and set MonthlyCharges to DECIMAL(10,2)
Checked categorical columns for inconsistent values (none found)
Created a numeric churn_flag (1 = churned, 0 = stayed) for calculations

Lesson learned: MonthlyCharges was first loaded into a DECIMAL(10,0) column, which silently rounded every value to a whole number. I caught it in Python because the revenue total came out as a round number, then restored the values from the raw table. The corrected total ($139,130.85) matches the original file.

2. Python (pandas): exploratory analysis
Validated data types, nulls, and totals
Compared churn rates across contract, tenure group, payment method, internet service, and support add-ons
Ran cross-tabs (contract × tech support, tenure × contract, internet service × payment method) to test whether each driver holds up on its own
Checked group sizes before trusting small cells
Quantified revenue at risk in dollars, by contract and by segment
3. Tableau: dashboard
KPI cards: customers, churn rate, monthly revenue lost
Driver charts: churn by tenure, contract, and payment method
Where to act: revenue lost by contract and the high-risk segment
Repository structure
telco-churn-analysis/
├── README.md
├── data/
│   ├── WA_Fn-UseC_-Telco-Customer-Churn.csv   # raw data
│   └── churn_clean.csv                         # cleaned output from SQL
├── sql/
│   └── 01_data_cleaning.sql
├── python/
│   └── 02_churn_eda.ipynb
└── tableau/
    ├── churn_dashboard.png
    └── churn_tableau.csv
How to reproduce
Run sql/01_data_cleaning.sql in MySQL to create churn_clean, then export it to data/churn_clean.csv.
Open python/02_churn_eda.ipynb in Jupyter and run all cells (requires pandas and matplotlib).
Open the dashboard on Tableau Public, or connect Tableau to tableau/churn_tableau.csv.
Limitations
Patterns, not proven causes. The data shows who churns, not why. A customer survey or exit interviews would be needed to confirm reasons.
Contract lock-in. Part of the low churn on 1- and 2-year contracts reflects customers being unable to leave during the term, not necessarily higher satisfaction.
Self-selection. Customers who choose longer contracts or add tech support may already be more loyal, so the real effect of an intervention is likely smaller than the raw gap.
Small cells. Some segments (for example, 2-year contracts in the first year, n = 68) are too small for firm conclusions.
Snapshot data. Results describe one point in time; intervention estimates are scenarios, not forecasts.
Tools

MySQL · Python (pandas, matplotlib) · Jupyter · Tableau Public

Data source

IBM Telco Customer Churn sample dataset (7,043 customers, 21 attributes).

Author
Moe Khant Zaw Tableau Public · GitHub: https://github.com/moekhantzaw007 · LinkedIn: www.linkedin.com/in/moe-khant-zaw-9baa413b4
