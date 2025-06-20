
# 🧠 HR Analytics with dbt & Databricks

This project leverages **dbt** and **Databricks** to build a modern analytics workflow for Human Resources data. It focuses on uncovering key workforce trends to support data-driven HR decisions.

## 📊 Project Overview

In this challenge, we explore an HR dataset to answer critical business questions:

### 🔍 Key Questions to Address

- How diverse is the workforce in terms of **gender**, **ethnicity**, and **age**?
- Is there a correlation between **pay levels**, **departments**, and **job titles**?
- What is the **geographic distribution** of employees?
- What are the **yearly employee retention trends**?
- What is the retention rate segmented by **gender**, **ethnicity**, and **age**?
- Which **business unit** has the highest and lowest **employee retention rate**?
- Which **business unit** and **department** pays the highest and lowest **annual bonuses**?
- What does the **historical bonus trend** look like?
- How can we demonstrate **pay equity** across **gender**, **ethnicity**, and **age**?
- What is the **employee turnover rate** (monthly, quarterly, annually) since 2017?

### 📌 Turnover Rate Formula

We apply the standard formula for turnover rate:

```
Turnover Rate (%) = (Number of Separations / Average Number of Employees) × 100
```

> Example: If a company starts the year with 50 employees, ends with 55, and has 5 separations during the year:
>
> Average = (50 + 55) / 2 = 52.5  
> Turnover Rate = (5 / 52.5) × 100 ≈ **9.52%**

---

## 🛠️ Tech Stack

- **dbt-core** for transformations
- **dbt-databricks** for Databricks integration
- **Databricks SQL Warehouse** for data processing
- **pandas**, **matplotlib**, **seaborn** for exploratory analysis

---

## 🏗️ Project Structure

```
dbt-databricks/
│
├── models/                     # dbt models
│   ├── staging/                # Staging models
│   ├── marts/                  # Final analytics models (retention, bonus, etc.)
│
├── .env                        # Environment variables (Databricks token, etc.)
├── dbt_project.yml             # dbt config
├── profiles.yml                # dbt profiles (linked to Databricks)
├── notebooks/                  # EDA and visualizations
└── README.md                   # Project overview
```

---

## ✅ Getting Started

1. **Set up virtual environment**

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

2. **Configure Databricks**

Create a `.env` file with your Databricks credentials:

```env
DATABRICKS_TOKEN=your_token_here
```

3. **Initialize dbt**

```bash
dbt init
```

4. **Run the project**

```bash
dbt debug
dbt build
```

---

## 📈 Output & Deliverables

- Curated **marts** for HR metrics (retention, diversity, turnover, pay equity)
- Clean and reusable **staging** layers
- Visual analytics and KPIs for business users

---

## 👤 Author

- [@tunguyenn99](https://github.com/tunguyenn99)

---

## 🧠 Inspiration

This project was built as part of a challenge to explore workforce analytics and demonstrate modern data engineering best practices using dbt and Databricks.
