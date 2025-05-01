-- Разделение клиентов по активности и тратам
SELECT 
    CASE                                             -- категория по тратам
    WHEN `Total Spend` > 1200 THEN 'VIP'
    ELSE 'Обычные'
  END AS client_category,
  CASE                                               -- категория по активности
    WHEN `Days Since Last Purchase` <= 30 THEN 'Активные'
    WHEN `Days Since Last Purchase` <= 90 THEN 'Рисковые'
    ELSE 'Неактивные'
  END AS activity_segment,
  COUNT(`Customer ID`) AS customer_count,            -- количество клиентов
  ROUND(SUM(`Total Spend`), 0) AS total_sum         -- общая сумма трат
FROM customer_profile
GROUP BY  CASE 
    WHEN `Total Spend` > 1200 THEN 'VIP'
    ELSE 'Обычные'
  END,
  CASE 
    WHEN `Days Since Last Purchase` <= 30 THEN 'Активные'
    WHEN `Days Since Last Purchase` <= 90 THEN 'Рисковые'
    ELSE 'Неактивные'
  END
ORDER BY client_category, activity_segment;
