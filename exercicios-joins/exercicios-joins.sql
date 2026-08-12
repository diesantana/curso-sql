-- EXERCÍCIOS ########################################################################

-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site

SELECT  
	cus.professional_status, 
	COUNT(fun.paid_date) AS pagamentos
FROM sales.customers AS cus
LEFT JOIN sales.funnel AS fun
	ON cus.customer_id = fun.customer_id
GROUP BY cus.professional_status
ORDER BY pagamentos DESC

-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders
-- O primeiro nome vai identificar o gênero. 
SELECT 
	ibge.gender, 
	COUNT(fun.paid_date) 
FROM sales.funnel AS fun 
LEFT JOIN sales.customers AS cus
	ON cus.customer_id = fun.customer_id
LEFT JOIN temp_tables.ibge_genders AS ibge
	ON LOWER(cus.first_name) = LOWER(ibge.first_name)
GROUP BY ibge.gender

-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions
select * from sales.customers limit 10
select * from temp_tables.regions limit 10

-- sales.customers state e city
-- temp_tables.regions city, state, region 
-- sales.funnel as VISITAS = visit_id
SELECT 
	reg.region , 
	COUNT(fun.visit_id) AS visitas
FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus
	ON fun.customer_id = cus.customer_id
LEFT JOIN temp_tables.regions AS reg 
	ON LOWER(cus.city) = LOWER(reg.city) 
	AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY reg.region
ORDER BY visitas DESC
