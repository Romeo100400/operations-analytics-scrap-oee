# Operations Analytics – Scrap & OEE Analysis

## 📌 Business Context
This project analyzes manufacturing operations performance with a focus on **scrap rates, quality drivers, and operational KPIs**.  
The goal is to support **data-driven decision-making** by identifying where quality losses occur and which factors contribute most.

The analysis is a **simulated reconstruction based on real consulting experience** in operations and supply chain contexts.

---

## ❓ Business Questions
- Which production lines show the highest scrap rates?
- Are there performance differences across shifts?
- What are the main drivers of scrap, and how much do they contribute overall?
- Is there a relationship between downtime and scrap levels?
- What does the overall plant performance look like at an executive level?

---

## 🧩 Dataset
The project uses a **simulated manufacturing dataset** designed to reflect real-world production scenarios.

Main fields include:
- Production line
- Shift
- Produced units
- Scrap units
- Scrap reason
- Downtime minutes
- OEE (Overall Equipment Effectiveness)

---

## 🛠️ Methodology
The analysis follows a **top-down approach**:

1. High-level KPI analysis to identify critical areas
2. Drill-down by production line and shift
3. Pareto analysis of scrap causes
4. Diagnostic comparison of scrap and downtime
5. Executive-level KPI summary

All calculations and aggregations were performed using **SQL**, focusing on clarity and business relevance rather than technical complexity.

---

## 🔍 Key Insights
- Certain production lines consistently show higher scrap rates than others
- A limited number of scrap causes account for the majority of total scrap volume
- Lines with higher downtime tend to also exhibit higher scrap levels
- Performance variability suggests opportunities for targeted operational improvements

---

## ✅ Business Recommendations
- Prioritize improvement actions on the worst-performing production lines
- Focus first on the main scrap drivers identified through Pareto analysis
- Investigate operational stability where downtime and scrap are both high
- Use scrap and downtime together as leading indicators of process health

---

## 📊 Visualization
- **Excel** was used to create pivot tables and simple KPI charts for stakeholder communication
- **Tableau** was used to build a lightweight dashboard highlighting:
  - Scrap rate by production line
  - Main scrap drivers

The dashboard is available in the `assets` folder.

---

## 📎 Repository Structure
