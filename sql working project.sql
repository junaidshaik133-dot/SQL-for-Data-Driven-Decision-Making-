
use project

---solving problem statement for-Data-Driven-Decision-Making ------------------------

 

--Q1.Generate a yearly report for 'croma' customer where the output contains these fields:/---
          -- fiscal_year
          -- yearly_gross_sales/-----

select p.fiscal_year,sum(s.sold_quantity * p.gross_price) as total from [dbo].[dim_customer] as c join fact_sales_monthly as s
on c.customer_code = s.customer_code join fact_gross_price p
on s.product_code = p.product_code
where c.customer='croma'
group by p.fiscal_year;

--Q2.Generate a report which contain fiscal year and also the number of unique products sold in that year. //----
with mycte as (
select * from (
select *, ROW_NUMBER() over (partition by product_code,fiscal_year order by product_code ) as num  from [fact_sales_monthly] 
)x
where x.num = 1)
select  fiscal_year,count(*) as distinct_count_product from mycte  
group by fiscal_year

----or other method without row_number------

select   fiscal_year, count(distinct(product_code)) as dist_cont_product   from fact_sales_monthly
group by fiscal_year

--Q3.Provide the list of markets in which customer  "Atliq  Exclusive"  operates its business in the  APAC  region.//---- 

select distinct c.market from  dim_customer c
where c.customer='Atliq  Exclusive' or c.region='APAC';

--- or with the group by -----//

select  c.market from  dim_customer c
where c.customer='Atliq  Exclusive' or c.region='APAC'
group by c.market;

--Q4. Provide a report with all the unique product counts for each  segment  and sort them in descending order of product counts. The final output contains 2 fields, segment product_count--/// 


select segment , count( distinct product) as count_for_segment from dim_product
group by segment
order by  count_for_segment desc;

--Q5. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment product_count_2020 product_count_2021 difference ---/////---

with mycte_1 as (
select s.fiscal_year, p.segment,count(distinct(s.product_code)) as dist_count from fact_sales_monthly s left join dim_product p 
on s.product_code = p.product_code 
group by s.fiscal_year, p.segment)
select fiscal_year,segment,isnull(dist_count - lag(dist_count) over (order by fiscal_year),'-') as difference_between from mycte_1;

-----or with pivoting   ---------------
with mycte_1 as (
select s.fiscal_year,p.segment,count(distinct(s.product_code)) as dist_count 
from fact_sales_monthly s left join dim_product p
on s.product_code = p.product_code
group by s.fiscal_year,p.segment),
pivoted as (select segment , max(case when fiscal_year=2020 then dist_count else 0 end) as product_count_2020,
              max(case when fiscal_year=2021 then dist_count else 0 end) as product_count_2021 from mycte_1
              group by segment)
              select segment , product_count_2020,product_count_2021,(product_count_2020-product_count_2021)as diff
              from pivoted 
              order by diff desc;

--Q6. Get the products that have the highest and lowest manufacturing costs The final output should contain these fields product_code, product , manufacturing_cost////-----

select p.product,p.product_code, m.manufacturing_cost  from fact_manufacuring_cost m left join dim_product p
on m.product_code = p.product_code
where manufacturing_cost = (select min(manufacturing_cost) from fact_manufacuring_cost)
or manufacturing_cost = (select max(manufacturing_cost) from fact_manufacuring_cost);

------------------------------------- or -------------------------------------------------------------------

with mycte  as(
select  p.product,p.product_code, m.manufacturing_cost ,
ROW_NUMBER() over (order by m.manufacturing_cost asc ) as min_cost,
 ROW_NUMBER() over (order by manufacturing_cost desc ) as max_cost 
 from fact_manufacuring_cost m join dim_product p
on m.product_code = p.product_code)
select product,product_code,manufacturing_cost from mycte
where min_cost = 1 or max_cost = 1
order by manufacturing_cost asc;



--Q7. Generate a report which contains the top 5 customers who received an discount_pct greater then avg pre_invoice_discount_pct  for the  fiscal  year 2021  and in the Indian  market. The final output contains these fields,customer_code customer average_discount_percentage ---///--

with mycte_1 as (
select d.customer_code, c.customer,DENSE_RANK() over (order by d.pre_invoice_discount_pct desc) as row_num,
d.pre_invoice_discount_pct  from fact_pre_invoice_deductions d left join dim_customer c
on d.customer_code = c.customer_code
where pre_invoice_discount_pct >= (select avg(pre_invoice_discount_pct) from fact_pre_invoice_deductions)
and d.fiscal_year=2021 and c.market ='india')
select  customer_code,customer,pre_invoice_discount_pct from mycte_1
where row_num <=5;

--Q8. Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each year  .  
              ---This analysis helps to  get an idea of low and 
               --high-performing months and take strategic decisions. 
               --The final report contains these columns:  
               --Year 
               --Gross sales Amount-----///

Select s.fiscal_year , c.customer ,cast(sum(s.sold_quantity*g.gross_price) as decimal(10,2)) as total_sales 
from dim_customer c  join fact_sales_monthly s 
on c.customer_code = s.customer_code join fact_gross_price g 
on s.product_code = g.product_code
where customer = 'Atliq Exclusive'
group by s.fiscal_year,c.customer;


--Q9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?  
--The final output  contains these fields, channel, gross_sales_mln, percentage 
--we want sales year(2021) and per_cont of channel --////

with mycte as (
select  c.channel,sum( s.sold_quantity * p.gross_price )as total_sale  
from dim_customer c join fact_sales_monthly s
on c.customer_code = s.customer_code join fact_gross_price p
on s.product_code = p.product_code
where s.fiscal_year = 2021
group by c.channel)
select top 1 *, round(total_sale*100/sum(total_sale) over (),2) as prec_cont from mycte
order by total_sale desc;

--Q10.Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?
--The final output contains these fields, division product_code , product, total_sold_quantity ---////

with mycte as (
select p.division,p.product_code,p.product,s.sold_quantity, 
ROW_NUMBER() over (partition by division order by sold_quantity desc) as ranking 
from dim_product p inner join fact_sales_monthly s
on p.product_code = s.product_code)
select division,product_code,product,sold_quantity  from mycte
where ranking <= 3;










  
  











 














