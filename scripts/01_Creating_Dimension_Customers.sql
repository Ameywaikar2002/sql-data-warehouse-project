CREATE VIEW gold.dim_customers AS
select
    ROW_NUMBER() over(order by cst_id) as customer_key, ---generating a surrogate primary key in order to connect the data model
	ci.cst_id as customer_id,
	ci.cst_key as customer_number,
	ci.cst_firstname as first_name,
	ci.cst_lastname as last_name,
	la.cntry as country,
	ci.cst_marital_status as marital_status,
	CASE
		WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr --CRM IS THE MASTER OF GENDER INFO
		ELSE COALESCE(ca.gen, 'n/a')
	END
	as gender,
	ca.bdate as birthdate,
	ci.cst_create_date as create_date 


from silver.crm_cust_info ci
LEFT JOIN
silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key = la.cid
--=================================================================================================================================================================

--DATA PROFILING
--CHECKING FOR DUPLICATES
select cst_id , COUNT(*) from
	(select
		ci.cst_id,
		ci.cst_key,
		ci.cst_firstname,
		ci.cst_lastname,
		ci.cst_marital_status,
		ci.cst_gndr,
		ci.cst_create_date,
		ca.bdate,
		ca.gen,
		la.cntry
	from silver.crm_cust_info ci
	LEFT JOIN
	silver.erp_cust_az12 ca
	ON ci.cst_key = ca.cid
	LEFT JOIN silver.erp_loc_a101 la
	ON ci.cst_key = la.cid)t
GROUP BY cst_id
HAVING count(*) > 1

--NOW WE HAVE TWO GENDER COLUMNS SO WHICH IS THE ACCURATE ONE 

select
distinct
	ci.cst_gndr,
	ca.gen

from 
silver.crm_cust_info ci
LEFT JOIN
silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key = la.cid
order by 1,2
--ask the experts that which source has the master data (lets say cst_gender in this case)