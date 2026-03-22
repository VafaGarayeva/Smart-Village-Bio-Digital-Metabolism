CREATE TABLE Smart_Village_Data (
    Timestamp TIMESTAMP,
    Region VARCHAR2(50),
    Soil_Nitrogen_mg_kg NUMBER(10, 2),
    Waste_to_Biogas_kW NUMBER(10, 2),
    Acoustic_Anomaly_Score NUMBER(10, 5),
    Efficiency_Savings_AZN NUMBER(10, 2),
    Water_Leakage_Liters NUMBER(10, 2)
);
SELECT Region, 
       ROUND(AVG(Soil_Nitrogen_mg_kg), 2) as Avg_Nitrogen_Status,
       ROUND(SUM(Efficiency_Savings_AZN), 2) as Total_Financial_Savings,
       COUNT(CASE WHEN Acoustic_Anomaly_Score > 0.7 THEN 1 END) as Critical_Bio_Anomalies
FROM Smart_Village_Data
GROUP BY Region
ORDER BY Total_Financial_Savings DESC;
SELECT Region, 
       ROUND(AVG(Soil_Nitrogen_mg_kg), 2) as Avg_Nitrogen_Status,
       ROUND(SUM(Efficiency_Savings_AZN), 2) as Total_Financial_Savings,
       COUNT(CASE WHEN Acoustic_Anomaly_Score > 0.7 THEN 1 END) as Critical_Bio_Anomalies
FROM Smart_Village_Data
GROUP BY Region
ORDER BY Total_Financial_Savings DESC;
SELECT 
    EXTRACT(MONTH FROM Timestamp) as Ay,
    Region,
    ROUND(AVG(Soil_Nitrogen_mg_kg), 2) as Ayliq_Azot_Ortalamasi,
    ROUND(SUM(Waste_to_Biogas_kW), 2) as Ayliq_Enerji_Istehsali
FROM Smart_Village_Data
GROUP BY EXTRACT(MONTH FROM Timestamp), Region
ORDER BY Ay, Region;