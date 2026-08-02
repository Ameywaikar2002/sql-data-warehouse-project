CREATE VIEW gold.fact_sales AS
select
	sd.sls_ord_num as order_number,
	pr.product_key,
	cu.customer_key,
	sd.sls_order_dt as order_date,
	sd.sls_ship_dt as shipping_date,
	sd.sls_due_dt as due_date,
	sd.sls_sales as sales_amount,
	sd.sls_quantity as quantity,
	sd.sls_price as price
from silver.crm_sales_details sd
LEFT JOIN
gold.dim_products pr
ON sd.sls_prd_key = pr.product_number
LEFT JOIN
gold.dim_customers cu
ON sd.sls_cust_id = cu.customer_id


--QUALITY CHECK
--FOREIGN KEY INTEGRITY DIMENSIONS
select * from gold.fact_sales f
LEFT JOIN
gold.dim_customers c
on c.customer_key = f.customer_key
where c. customer_key is NULL
-----------------------------------------------------------( THERE ARE NO NULLS MEANS EVERYTHING IS CORRECT)

select * from gold.fact_sales f
LEFT JOIN
gold.dim_products p
on p.product_key = f.product_key
where p.product_key is NULL
------------------------------------------------------------( THERE ARE NO NULLS MEANS EVERYTHING IS CORRECT)