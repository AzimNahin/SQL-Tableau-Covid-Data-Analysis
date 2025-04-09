# 🦠 COVID-19 Global Impact Analysis (SQL + Tableau + Excel)

This project analyzes the global spread and impact of COVID-19 using real-world datasets on deaths, cases, and vaccinations. The objective was to transform raw data into meaningful insights and create a compelling **Tableau dashboard** to visualize infection rates, mortality distribution, and country-wise trends.

---

## 📁 Project Files

| File | Description |
|------|-------------|
| `CovidDeaths.xlsx` | Global COVID-19 deaths and case statistics |
| `CovidVaccinations.xlsx` | Global COVID-19 vaccination and testing statistics |
| `Covid Data Analysis Tables SQL.sql` | SQL schema to create base tables |
| `Covid Data Analysis SQL.sql` | SQL queries for data analysis and joins |
| `Covid Data Analysis Tables Excel.xlsx` | Same as base tables but in Excel format |
| `Covid Data Analysis Tableau.twbx` | Tableau workbook containing the final dashboard |
| `Covid Data Analysis Dashboard.png` | Static image of the final Tableau dashboard |

---

## 🔍 Dataset Overview

The dataset was sourced from **Our World in Data** and includes:

- **Temporal range**: Feb 2020 – April 2021
- **Locations**: 200+ countries and territories
- **Files used**:
  - `CovidDeaths.xlsx`: Contains daily cases, deaths, population, continent, etc.
  - `CovidVaccinations.xlsx`: Contains daily vaccination records, testing stats, and healthcare indices

---

## 🧹 Data Preparation & SQL Processing

Performed in **SQL Server**.

### ✅ Tables Created:
- Imported both Excel sheets into SQL Server using `CovidDeaths` and `CovidVaccinations` tables.
- Cleaned missing values and ensured date/time consistency.

### 🔁 Key SQL Joins & Transformations:
- Joined both tables on `location` and `date`
- Calculated:
  - Total and new cases per country
  - Percentage of population infected (`total_cases / population * 100`)
  - Death rate per country and continent
  - Rolling total infections and deaths over time
  - Monthly aggregation for trend charts
  - Grouped results by `continent`, `location`, and `month` for Tableau input

All transformed tables were exported or connected live to Tableau for visualization.

---

## 📊 Dashboard Visualizations (Tableau)

The Tableau dashboard includes five key visuals:

### 1. **Total Death Percentage**
- Displays global counts:
  - Total Cases
  - Total Deaths
  - Calculated death percentage

### 2. **Total Deaths per Continent**
- Bar chart showing cumulative deaths by continent
- Europe and North America recorded the highest death counts

### 3. **% of Population Infected by Country**
- World map using color gradients to show infection rate
- Countries like Andorra and the U.S. had high % population infected

### 4. **Trend of % Population Infected Over Time**
- Line chart showing how infection % rose in selected countries (Andorra, India, US, UK, Mexico)
- Forecasting included for extrapolation

### 5. **Interactive Filtering**
- Country-level detail with filtering by date and location
- Distinction between actual vs. estimated cases/infection percentages

---

## 💡 Key Insights

- Andorra had the highest percentage of population infected (~19.61%)
- Global death rate was ~2.1% as of April 2021
- Most deaths occurred in Europe (over 1 million) and North America (850k+)
- India's infection rate remained low in % terms (under 1%) during the timeline
- Forecasting helped project infection rates beyond April 2021

---

## 🛠 Tools Used

- **SQL Server Management Studio (SSMS)** – for SQL transformations and joins
- **Microsoft Excel** – for data exploration and table loading
- **Tableau Desktop** – for dashboard design and storytelling

---

## 👤 Contributor

- [Azim Nahin](https://github.com/AzimNahin)

---

## 📷 Dashboard Preview

![Dashboard](Covid%20Data%20Analysis%20Dashboard.png)
