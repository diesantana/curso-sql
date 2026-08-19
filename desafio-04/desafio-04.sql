-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
-- sales.funnel.visit_id = visitas
-- sales.funnel.product_id = produtos 
-- sales.products.brand = marca
SELECT 
	prod.brand,
	COUNT(fun.visit_id) AS visitas
FROM sales.funnel AS fun
LEFT JOIN sales.products AS prod
	ON prod.product_id = fun.product_id
GROUP BY prod.brand
ORDER BY visitas DESC


-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
-- sales.funnel.visit_id = visitas
-- sales.funnel.store_id = loja
-- sales.stores.store_id = loja
-- sales.stores.store_name = Nome da loja
SELECT 
	sto.store_id AS id_loja,
	sto.store_name AS loja,
	COUNT(visit_id) AS visitas
FROM sales.funnel AS fun
LEFT JOIN sales.stores AS sto
	ON sto.store_id = fun.store_id
GROUP BY id_loja
ORDER BY visitas DESC


-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
-- Buscar os clientes
-- Buscar aonde eles moram 
-- Buscar as regiões
-- CITY E STATE TEM QUE BATER
SELECT 
	reg.size AS tamanho_cidade,
	COUNT(cus.customer_id) AS clientes
FROM sales.customers AS cus
LEFT JOIN temp_tables.regions AS reg
	ON LOWER(cus.city) = LOWER(reg.city) 
	AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY tamanho_cidade
ORDER BY clientes DESC
