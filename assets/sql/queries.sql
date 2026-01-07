-- Operations Analytics – Scrap & OEE Analysis
-- SQL Queries (BigQuery)

-- QUERY 1/8 — Scrap rate per line
SELECT
  production_line,
  ROUND(SUM(scrap_units) * 1.0 / SUM(produced_units) * 100, 2) AS scrap_rate_pct
FROM `my-project-1-479717.project_core_lean.Lines data`
GROUP BY production_line
ORDER BY scrap_rate_pct DESC;

-- QUERY 2/8 — Scrap rate per shift
SELECT
  shift,
  ROUND(SUM(scrap_units) * 1.0 / SUM(produced_units) * 100, 2) AS scrap_rate_pct
FROM `my-project-1-479717.project_core_lean.Lines data`
GROUP BY shift
ORDER BY scrap_rate_pct DESC;

-- QUERY 3/8 — Scrap rate per line and shift
SELECT
  shift,
  production_line,
  ROUND(SUM(scrap_units) * 1.0 / SUM(produced_units) * 100, 2) AS scrap_rate_pct
FROM `my-project-1-479717.project_core_lean.Lines data`
GROUP BY shift, production_line
ORDER BY scrap_rate_pct DESC;

-- QUERY 4/8 — Top scrap reasons (Pareto) — units + % of total scrap
SELECT
  scrap_reason,
  SUM(scrap_units) AS total_scrap_units,
  ROUND(
    SUM(scrap_units) * 1.0
    / (SELECT SUM(scrap_units) FROM `my-project-1-479717.project_core_lean.Lines data`)
    * 100,
    2
  ) AS scrap_pct_of_total
FROM `my-project-1-479717.project_core_lean.Lines data`
GROUP BY scrap_reason
ORDER BY total_scrap_units DESC;

-- QUERY 5/8 — Scrap reasons per line (drill-down)
SELECT
  production_line,
  scrap_reason,
  SUM(scrap_units) AS total_scrap_units
FROM `my-project-1-479717.project_core_lean.Lines data`
GROUP BY production_line, scrap_reason
ORDER BY production_line ASC, total_scrap_units DESC;

-- QUERY 6/8 — Downtime per line and shift (ranking)
SELECT
  shift,
  production_line,
  SUM(downtime_minutes) AS total_downtime_minutes
FROM `my-project-1-479717.project_core_lean.Lines data`
GROUP BY shift, production_line
ORDER BY total_downtime_minutes DESC;

-- QUERY 7/8 — Scrap vs downtime (per line)
SELECT
  production_line,
  SUM(scrap_units) AS total_scrap_units,
  SUM(downtime_minutes) AS total_downtime_minutes
FROM `my-project-1-479717.project_core_lean.Lines data`
GROUP BY production_line
ORDER BY total_scrap_units DESC;

-- QUERY 8/8 — Overall plant KPIs (Executive Summary)
SELECT
  ROUND(SUM(scrap_units) * 1.0 / SUM(produced_units) * 100, 2) AS scrap_rate_pct,
  SUM(downtime_minutes) AS total_downtime_minutes,
  ROUND(AVG(oee), 2) AS avg_oee
FROM `my-project-1-479717.project_core_lean.Lines data`;
