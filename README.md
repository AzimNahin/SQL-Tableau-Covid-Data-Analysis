# 🦠 COVID-19 Global Impact Analysis Dashboard (SQL Server + Tableau)

This project analyzes the global spread, severity, and response to the COVID-19 pandemic by merging and transforming two comprehensive datasets: **COVID deaths** and **vaccinations**. All data was cleaned and processed using **SQL Server**, and the final visualization dashboard was created in **Tableau Desktop**.

The goal was to uncover:
- Which regions were most impacted?
- How did infection and death rates evolve over time?
- What percentage of populations were infected?
- How did vaccination affect country-level trends?

---

## 📁 Project Files

| File | Description |
|------|-------------|
| `CovidDeaths.xlsx` | Global deaths and cases data (daily, by country) |
| `CovidVaccinations.xlsx` | Vaccination and testing data (daily, by country) |
| `Covid Data Analysis Tables SQL.sql` | SQL schema to create base tables in SQL Server |
| `Covid Data Analysis SQL.sql` | SQL transformations and analysis queries |
| `Covid Data Analysis Tables Excel.xlsx` | Excel version of tables for alternative loading |
| `Covid Data Analysis Tableau.twbx` | Tableau workbook with final dashboard |
| `Covid Data Analysis Dashboard.png` | Static image of the Tableau dashboard |

---

## 🔍 Dataset Summary

- **Source**: Our World in Data (https://ourworldindata.org/coronavirus)
- **Rows**: 85,171 (each file)
- **Date Range**: February 2020 – April 2021
- **Coverage**: 200+ countries and continents

### Common Columns:
- `location`, `continent`, `date`, `population`
- `total_cases`, `new_cases`, `total_deaths`, `new_deaths`
- `total_vaccinations`, `people_vaccinated`, `positive_rate`, `tests_per_case`

---

## 🧹 Data Preparation & Cleaning (SQL Server)

All transformations were performed in **SQL Server Management Studio (SSMS)** using T-SQL.

### ✅ Cleaning & Processing Steps:

1. **Importing Raw Data**
   - Imported `.xlsx` files into SQL Server using `CovidDeaths` and `CovidVaccinations` tables.

2. **Joining Tables**
   - Merged on `location` and `date` to create a unified analysis table for Tableau

3. **Handling Missing Data**
   - Replaced NULLs in critical fields like `population`, `total_cases`, `total_deaths`
   - Filtered out records without population info (for per capita calculations)

4. **New Fields Created**
   - `death_percentage` = `(total_deaths / total_cases) * 100`
   - `percent_population_infected` = `(total_cases / population) * 100`

5. **Date Aggregation**
   - Extracted `month` and `year` for trend analysis
   - Grouped by `month`, `continent`, and `location`

6. **Filtering Data**
   - Excluded records where both deaths and cases were 0
   - Focused on latest available data for country-level summaries

---

## 📊 Dashboard Components (Tableau)

The dashboard is composed of 5 interactive and insightful visualizations:

### 1. 🧮 Total Death Percentage Table
- Displays:
  - Total Cases: **150M+**
  - Total Deaths: **3.18M**
  - Global Death %: **~2.11%**

### 2. 🌍 Deaths per Continent
- Bar chart summarizing deaths across continents:
  - **Europe** had the highest total deaths: **1M+**
  - Followed by **North America** and **South America**

### 3. 🗺️ Infected Population by Country
- Choropleth map shows **% of population infected**
- Countries like **Andorra**, **USA**, and **UK** were among the highest

### 4. 📈 Infection Trend Over Time
- Line graph tracking infection % across:
  - **Andorra**, **India**, **Mexico**, **United Kingdom**, **United States**
- Both **actual** and **forecasted** trend lines included

### 5. 🧭 Interactivity & Forecast
- Filters by country, forecast indicator, and time
- Forecasts built using Tableau’s exponential smoothing model

---

## 💡 Key Insights

- **Andorra** had the highest infection rate (~19.61%)
- Global infection rate was low, but uneven across continents
- Death rates were highest in Europe and North America
- Infections steadily rose from mid-2020 and spiked through 2021
- Forecasts show that smaller nations may reach higher saturation faster

---

## 🛠 Tools Used

- **SQL Server Management Studio (SSMS)** – Data wrangling and joining
- **T-SQL** – Custom calculations and aggregations
- **Microsoft Excel** – Initial data source
- **Tableau Desktop** – Dashboard design and forecasting
- **OpenStreetMap via Mapbox** – For geographical visuals

---

## 👤 Contributor

- [Azim Nahin](https://github.com/AzimNahin)

---

## 📷 Dashboard Preview

![Covid Dashboard](Covid%20Data%20Analysis%20Dashboard.png)
