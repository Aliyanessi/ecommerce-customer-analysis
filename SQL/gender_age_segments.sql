-- Анализ по полу и возрастной группе
SELECT 
  Gender,                                          -- пол
   CASE                                            -- возрастная категория
	WHEN Age < 30 THEN 'Молодые'
	WHEN Age BETWEEN 30 AND 45 THEN 'Взрослые'
	ELSE 'Старше 45'
   END AS age_group, 
  COUNT(`Customer ID`) AS customer_count,            -- количество клиентов
  ROUND(SUM(`Total Spend`), 0) AS total_sum,         -- общая сумма трат
  ROUND(AVG(`Total Spend`), 0) AS avg_sum            -- средняя сумма трат
FROM customer_profile
GROUP BY Gender, 
	CASE
	WHEN Age < 30 THEN 'Молодые'
	WHEN Age BETWEEN 30 AND 45 THEN 'Взрослые'
	ELSE 'Старше 45'
    END
ORDER BY Gender, age_group;
