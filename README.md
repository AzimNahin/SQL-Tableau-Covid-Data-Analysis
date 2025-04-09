# 🦠 COVID-19 Global Impact Analysis (SQL Server + Tableau)

This project investigates the global impact of the COVID-19 pandemic using a data pipeline built in **SQL Server**, cleaned and transformed from Excel datasets, and visualized using **Tableau Desktop**.

The goal was to answer questions like:
- Which countries and continents were most impacted by COVID-19?
- What percentage of the population got infected?
- What is the global death rate from COVID-19?
- How did infections spread over time?

---

## 📁 Project Files

| File | Description |
|------|-------------|
| `CovidDeaths.xlsx` | Daily COVID-19 cases and deaths by country |
| `CovidVaccinations.xlsx` | Vaccination, testing, and hospital metrics |
| `Covid Data Analysis Tables SQL.sql` | SQL schema to create base tables in SQL Server |
| `Covid Data Analysis SQL.sql` | SQL queries for cleaning, transforming, and joining |
| `Covid Data Analysis Tables Excel.xlsx` | Excel-based copies of SQL tables |
| `Covid Data Analysis Tableau.twbx` | Tableau dashboard with visuals |
| `Covid Data Analysis Dashboard.png` | Static preview of the dashboard |

---

## 🔍 Data Overview

- **Source**: Our World in Data (OWID)
- **Scope**: February 2020 – April 2021
- **Countries**: 200+
- **Metrics Tracked**:
  - Cases, deaths, population
  - Vaccinations, hospitalizations, tests
  - Continent/country/date breakdowns

---

## 🧹 Data Preparation in SQL Server

All data cleaning and transformation were performed using **T-SQL** inside **SQL Server Management Studio (SSMS)**.

### ✅ Steps Taken:

1. **Imported Excel Tables**
   - Created SQL tables `CovidDeaths` and `CovidVaccinations`
   - Ensured correct data types for `date`, `population`, numeric fields

2. **Handled Missing Values**
   - Filtered out nulls in critical fields (e.g. `population`, `total_cases`)
   - Filled gaps for smoother aggregation

3. **Joined Deaths and Vaccinations**
   - Joined tables on `location` and `date` to create a unified dataset

4. **Created Derived Metrics**
   - `DeathPercentage` = (`total_deaths` / `total_cases`) * 100
   - `PercentPopulationInfected` = (`total_cases` / `population`) * 100

5. **Grouped & Aggregated**
   - Grouped by `continent`, `location`, and `month`
   - Aggregated totals for continent-wise and country-wise analysis

6. **Filtered Incomplete Data**
   - Excluded rows where deaths, cases, or population were 0 or NULL

7. **Exported Data for Tableau**
   - Final cleaned tables were linked live to Tableau
   - Forecasted values for selected countries were added in Tableau

---

## 📊 Tableau Dashboard Breakdown

The interactive Tableau dashboard includes 5 major visual components:

### 1. **Total Death Percentage Table**
- Aggregated Global Stats:
  - **Total Cases**: 150M+
  - **Total Deaths**: 3.18M+
  - **Global Death %**: ~2.11%

### 2. **Total Deaths by Continent**
- Vertical bar chart
- Highlights that **Europe (1M+)** and **North America (850k+)** saw the most deaths

### 3. **Percentage of Population Infected by Country**
- Choropleth world map using gradient scale
- Countries like **Andorra**, **USA**, **UK** had high infection % (up to 17%)

### 4. **Monthly Infection Trend (Line Chart)**
- Compares **actual** and **forecasted** infection percentages
- Includes:
  - Andorra (actual & estimated)
  - India (actual & estimated)
  - Mexico, UK, US (actual & estimated)
- Forecasts were built using Tableau’s built-in forecasting model

### 5. **Interactive Elements**
- Filters by country and date
- Tooltip interactivity on map and line charts

---

## 💡 Key Insights

- **Global infection rate** was ~2.1% of confirmed cases resulting in death
- **Andorra** had the highest % of population infected (~19.61%)
- **Europe** recorded the most total deaths (1M+), followed by **North America**
- Infection spread was not uniform — smaller countries often showed high % infected
- Vaccination data, while available, was used to track timeline but not directly plotted in the dashboard

---

## 🛠 Tools Used

- **SQL Server Management Studio (SSMS)** – data cleaning and transformation
- **T-SQL** – all joins, filters, aggregations, and metrics
- **Microsoft Excel** – source format for original datasets
- **Tableau Desktop** – for all data visualizations and forecasting
- **Mapbox (via Tableau)** – for geographic visualizations

---

## 👤 Contributor

- [Azim Nahin](https://github.com/AzimNahin)

---

## 📷 Dashboard Preview

![Dashboard](Covid%20Data%20Analysis%20Dashboard.png)
