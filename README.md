# 🏫 Nigeria Higher Institutions Analysis

## 📌 Project Overview
A comprehensive data analysis of **1,048 higher institutions in Nigeria**, covering universities, polytechnics, colleges of education and more. The analysis spans **115 years of history (1908–2023)** and examines ownership patterns, growth trends and geographic distribution across the country.

---

## 🎯 Project Objectives
1. Analyse the distribution of higher institutions across ownership types in Nigeria
2. Identify growth trends in institution establishment from 1908 to 2023
3. Examine the relationship between institution categories and ownership types
4. Highlight the rise of private sector participation in Nigerian higher education
5. Provide data-driven insights to support education policy and planning decisions

---

## 🔑 Key Findings
- **Private institutions dominate** with 56.7% (594 of 1,048) of all higher institutions, outnumbering Federal (21%) and State (22.3%) combined
- **The 2010s saw the highest growth** — 338 institutions established, driven almost entirely by private sector expansion (249)
- **Universities lead by category** with 220 institutions, followed by Colleges of Education (202) and Innovation Enterprises (181)
- **Federal Government pioneered** Nigerian higher education from 1908 through the 1970s, establishing 43 institutions in that decade alone
- **Private institutions were virtually absent before 1990** — only 4 established before then. From 2000 onward they established 492 institutions (83% of their total)

---

## 🛠️ Tools Used
| Tool | Purpose |
|------|---------|
| **Python (Pandas)** | Data cleaning and transformation |
| **MySQL Workbench 8.0** | Data storage and SQL analysis |
| **Power BI Desktop** | Data visualization and reporting |

---

## 📁 Repository Structure
```
Nigeria-Higher-Institutions-Analysis/
│
├── README.md                          ← Project overview (this file)
├── data/
│   └── Nigeria_Higher_Institutions_Cleaned.csv    ← Cleaned dataset
├── sql/
│   ├── 01_create_database.sql         ← Database and table setup
│   ├── 02_import_data.sql             ← Data import script
│   ├── 03_section1_overview.sql       ← Database overview queries
│   ├── 04_section2_ownership.sql      ← Ownership analysis queries
│   ├── 05_section3_category.sql       ← Category analysis queries
│   ├── 06_section4_growth.sql         ← Growth over time queries
│   ├── 07_section5_cities.sql         ← City/location analysis queries
│   └── 08_section6_rankings.sql       ← Advanced ranking queries
├── powerbi/
│   └── Nigeria_Higher_Institutions_Report.pbix    ← Power BI report
└── screenshots/
    ├── 01_cover_page.png
    ├── 02_table_of_contents.png
    ├── 03_executive_summary.png
    ├── 04_objectives.png
    ├── 05_overview_dashboard.png
    ├── 06_category_analysis.png
    ├── 07_growth_over_time.png
    ├── 08_ownership_deep_dive.png
    └── 09_conclusion.png
```

---

## 📊 Dataset Description
| Column | Description |
|--------|------------|
| `Institution Name` | Full name of the institution |
| `Year of Establishment` | Year the institution was founded |
| `Ownership` | Full ownership label (Federal Government / State Government / Private) |
| `Category` | Type of institution (10 categories) |
| `Location (City)` | City where institution is located |
| `Decade Established` | Decade bucket (e.g. 1980s) |
| `Ownership Group` | Simplified ownership: Federal / State / Private |

**Source:** National Universities Commission (NUC) / Federal Ministry of Education

---

## 🗄️ SQL Analysis Structure

### Section 1 — Database Overview
- Total institution count
- Breakdown by ownership and category
- Year range analysis (1908–2023)

### Section 2 — Ownership Analysis
- Ownership percentage breakdown
- Ownership distribution per category
- Ownership dominance per category

### Section 3 — Category Analysis
- Full category breakdown with percentages
- Private sector percentage per category
- Categories dominated by private sector

### Section 4 — Growth Over Time
- Institutions established per decade
- Peak decade identification
- Growth per decade by ownership type
- Running total of institutions over time
- When private overtook government institutions

### Section 5 — City/Location Analysis
- Top 10 cities by institution count
- City breakdown by ownership type
- Most educationally diverse cities

### Section 6 — Advanced Rankings
- Oldest institution per category (Window Functions)
- Top 3 oldest institutions per category
- Newest institution per category
- City rankings with running totals

---

## 📈 Power BI Report Structure
The Power BI report consists of 9 pages:

| Page | Content |
|------|---------|
| 1 | Cover Page |
| 2 | Table of Contents |
| 3 | Executive Summary |
| 4 | Objectives |
| 5 | Overview Dashboard |
| 6 | Category Analysis |
| 7 | Growth Over Time |
| 8 | Ownership Deep Dive |
| 9 | Conclusion & Key Findings |

---

## 🚀 How to Use This Project

### SQL Setup:
1. Install MySQL Workbench 8.0
2. Run `01_create_database.sql` to create the database and table
3. Run `02_import_data.sql` to import all 1,048 records
4. Run sections 3–8 in order for full analysis

### Power BI Setup:
1. Install Power BI Desktop
2. Open `Nigeria_Higher_Institutions_Report.pbix`
3. If prompted update the data source to your local CSV path

---

## 👤 Author
**Oyebola**
- Prepared: March 2026
- Data Source: NUC / Federal Ministry of Education

---

## 📝 License
This project is open source and available for educational purposes.
