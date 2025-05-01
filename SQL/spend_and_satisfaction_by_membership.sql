-- Аналитика по типу подписки: сколько клиентов, сколько тратят и как оценивают сервис
SELECT 
  `Membership Type`,
  COUNT(`Customer ID`) AS customer_count, -- Количество клиентов в каждой подписке
  SUM(`Total Spend`) AS total_sum, -- Общая сумма трат
  ROUND(SUM(CASE WHEN `Satisfaction Level` = 'Unsatisfied' THEN 1 ELSE 0 END) * 100 / COUNT(*), 1) AS low_pct, -- Процент неудовлетворённых клиентов
  ROUND(SUM(CASE WHEN `Satisfaction Level` = 'Neutral' THEN 1 ELSE 0 END) * 100 / COUNT(*), 1) AS medium_pct, -- Процент нейтральных клиентов
  ROUND(SUM(CASE WHEN `Satisfaction Level` = 'Satisfied' THEN 1 ELSE 0 END) * 100 / COUNT(*), 1) AS high_pct -- Процент довольных клиентов
FROM customer_profile
GROUP BY `Membership Type`
ORDER BY total_sum DESC;