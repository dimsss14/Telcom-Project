--churn rate
--2022
SELECT churn,
	EXTRACT(year from date_of_regist) AS year,
	COUNT(*) AS churn_rate
FROM usage_info
WHERE date_of_regist BETWEEN '01/01/2022' AND '30/12/2022'
GROUP BY churn, year
ORDER BY churn DESC

--2021
SELECT churn,
	EXTRACT(year from date_of_regist) AS year,
	COUNT(*) AS churn_rate
FROM usage_info
WHERE date_of_regist BETWEEN '01/01/2021' AND '30/12/2021'
GROUP BY churn, year
ORDER BY churn DESC

--2020
SELECT churn,
	EXTRACT(year from date_of_regist) AS year,
	COUNT(*) AS churn_rate
FROM usage_info
WHERE date_of_regist BETWEEN '01/01/2020' AND '30/12/2020'
GROUP BY churn, year
ORDER BY churn DESC

--what the age brackets for customer churn
SELECT age_brackets,
	COUNT(churn)
FROM customer
	INNER JOIN usage_info
	ON customer.customer_id = usage_info.usage_id
WHERE churn = 'Yes'
GROUP BY age_brackets

--customer retention
SELECT churn,
	EXTRACT(month from date_of_regist) AS month,
	EXTRACT(year from date_of_regist) AS year,
	COUNT(churn) AS not_churn
FROM usage_info
WHERE (date_of_regist NOT BETWEEN '01/01/2023' AND '03/05/2023' )
	AND churn = 'No'
GROUP BY (churn, month, year)
ORDER BY month, year

--count of customers
SELECT COUNT(*) AS count_of_customers
FROM customer

--churned vs city
SELECT city,
	COUNT(churn) AS count_of_churn
FROM address
	INNER JOIN customer
	ON address.add_id = customer.customer_id
	INNER JOIN usage_info
	ON customer.customer_id = usage_info.usage_id
WHERE churn = 'Yes'
GROUP BY city
LIMIT 5

--calls usage
SELECT EXTRACT(month from date_of_regist) AS month,
	EXTRACT(year from date_of_regist) AS year,
	SUM(calls_made) AS trend_calls_made
FROM usage_info
WHERE date_of_regist NOT BETWEEN '01/01/2023' AND '03/05/2023'
GROUP BY (month, year)
ORDER BY month, year

--SMS usage
SELECT EXTRACT(month from date_of_regist) AS month,
	EXTRACT(year from date_of_regist) AS year,
	SUM(sms_made) AS trend_sms_made
FROM usage_info
WHERE date_of_regist NOT BETWEEN '01/01/2023' AND '03/05/2023'
GROUP BY (month, year)
ORDER BY month, year

--data usage
SELECT EXTRACT(month from date_of_regist) AS month,
	EXTRACT(year from date_of_regist) AS year,
	SUM(data_usage) AS trend_data_usage
FROM usage_info
WHERE date_of_regist NOT BETWEEN '01/01/2023' AND '03/05/2023'
GROUP BY (month, year)
ORDER BY month, year

--salary city highest
SELECT city,
	ROUND(AVG(estimated_salary), 2) AS average_salary
FROM address
	INNER JOIN capabilities
	ON address.add_id = capabilities.cap_id
GROUP BY city
ORDER BY average_salary DESC