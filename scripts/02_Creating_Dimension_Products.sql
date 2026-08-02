CREATE VIEW gold.dim_products AS
select
	ROW_NUMBER() OVER(ORDER BY pn.prd_start_dt, pn.prd_key)  as product_key,
	pn.prd_id as product_id,
	pn.prd_key as product_number,
	pn.prd_nm as product_name,
	pn.cat_id as category_id,
	pc.cat as category,
	pc.subcat as subcategory,
	pc.maintenance,
	pn.prd_cost as cost,
	pn.prd_line as product_line,
	pn.prd_start_dt as start_date
from silver.crm_prd_info pn
LEFT JOIN
silver.erp_px_cat_g1v2 pc
on pn.cat_id = pc.id
where prd_end_dt is null---filtering out the historical data
--====================================================================================================================================


--CHECKING FOR DUPLICATES
select prd_key , count(*) from
(select
pn.prd_id,
pn.cat_id,
pn.prd_key,
pn.prd_nm,
pn.prd_cost,
pn.prd_line,
pn.prd_start_dt,
pn.prd_end_dt,
pc.cat,
pc.subcat,
pc.maintenance
from silver.crm_prd_info pn
LEFT JOIN
silver.erp_px_cat_g1v2 pc
on pn.cat_id = pc.id
where prd_end_dt is null)t ---filtering out the historical data
group by prd_key
having count(*) > 1