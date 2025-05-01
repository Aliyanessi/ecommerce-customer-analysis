-- Анализ возврата клиентов по давности последней покупки
SELECT 
	COUNT(`Customer ID`) AS customer_count,
	CASE                                                            -- группировка по времени возврата
		WHEN `Days Since Last Purchase` <= 30 THEN 'Вернувшиеся'
		WHEN `Days Since Last Purchase` <= 60 THEN 'Рисковые'
		ELSE 'Потерянные'
	END AS retention_group,
	ROUND(SUM(`Total Spend`), 0) AS total_sum,                       -- общая сумма трат
	ROUND(AVG(`Days Since Last Purchase`), 0) AS avg_days_since      -- среднее количество дней с последней покупки
FROM customer_profile
GROUP BY 
		CASE
			WHEN `Days Since Last Purchase` <= 30 THEN 'Вернувшиеся'
			WHEN `Days Since Last Purchase` <= 60 THEN 'Рисковые'
			ELSE 'Потерянные'
		END
  ORDER BY total_sum DESC;