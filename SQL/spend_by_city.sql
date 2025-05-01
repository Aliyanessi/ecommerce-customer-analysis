-- Аналитика по городу: сколько клиентов, сколько тратят
SELECT 
  City, 
  COUNT(`Customer ID`) AS customer_count, -- Количество клиентов 
  ROUND(SUM(`Total Spend`), 0) AS total_sum, -- Общая сумма трат
  ROUND(AVG(`Total Spend`), 0) AS avg_spend -- Средняя сумма трат
FROM customer_profile
GROUP BY City
ORDER BY total_sum DESC;
