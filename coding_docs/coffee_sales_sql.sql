--Total sales
Select sum(transaction_qty*unit_price) as Total_Sales from coffeeshop_sales;

--Total Orders
Select count(transaction_id) as Total_Orders from coffeeshop_sales;

--Total Quantity Sold
Select sum(transaction_qty) as Total_Qty from coffeeshop_sales;

--Calculate the total sales for each respective month
Select extract(month from transaction_date) as Month_Final, 
sum(transaction_qty*unit_price) as Total_Sales
from coffeeshop_sales
Group by extract(month from transaction_date);

--Determine the month-on-month increase or decrease in sales
With t1 as
(Select extract(month from transaction_date) as Month_Final, 
 sum(transaction_qty*unit_price) as Total_Sales, 
 lag(sum(transaction_qty*unit_price),1) over (order by extract(month from transaction_date)) as Previous_MonthSales
from coffeeshop_sales
 group by extract(month FROM transaction_date)
),
t2 as 
(Select 
Month_Final, Total_Sales,
 Round(((Total_Sales - Previous_MonthSales)/Previous_MonthSales)*100,2) as MoM
from t1
where Previous_MonthSales is not null 
)
Select * from t2;

--Calculate the total number of orders for each respective month
Select extract(month from transaction_date) as Month_Final, 
count(transaction_id) as Total_Orders
from coffeeshop_sales
group by extract(month from transaction_date)
;

--Determine the month-on-month increase or decrease in orders
With t1 as
(Select 
 extract(month from transaction_date) as Month_Final, 
 count(transaction_id) as Total_Orders, 
 lag(count(transaction_id),1) over (order by extract(month from transaction_date)) as Previous_MonthOrders
from coffeeshop_sales
group by extract(month FROM transaction_date)
),
t2 as 
(Select 
Month_Final, Total_Orders,
(cast(Total_Orders - Previous_MonthOrders as numeric)/cast(Previous_MonthOrders as numeric)) as MoM
from t1
where Previous_MonthOrders is not null 
)
Select * from t2;

--Calculate the difference in the number of orders between the selected month and the previous month
Select extract(month from transaction_date) as Final_Date,
count(transaction_id) as Total_Orders,
(cast (
(count(transaction_id) - lag(count(transaction_id)) over (order by extract (month from transaction_date))) as numeric
)/cast(
	lag(count(transaction_id)) over (order by extract (month from transaction_date)) as numeric))*100 as Order_Percentage
from coffeeshop_sales
where extract(month from transaction_date) in (3,4)
group by extract(month from transaction_date)
;

--Total Quantity Sold over the months
Select extract(month from transaction_date) as Month_Final,
sum(transaction_qty) as Total_Qty
from coffeeshop_sales
group by extract(month from transaction_date)
;

-- total quantity sold KPI - MOM difference and MOM growth
Select extract(month from transaction_date) as Month_Final,
sum(transaction_qty) as Total_Qty,
(cast(
	(sum(transaction_qty) - lag(sum(transaction_qty)) over (order by extract(month from transaction_date))) as Numeric) / cast(lag(sum(transaction_qty)) over (order by extract(month from transaction_date)) as numeric))*100 as MoM_Growth
from coffeeshop_sales
group by extract(month from transaction_date)
order by Month_Final
;

--Consider day of month (1, 2, ...31) and see if daily sales more or less than average sales for a given month
Select DOW,
case 
when Total_Sales > Avg_Sales then 'Above_Average'
when Total_Sales < Avg_Sales then 'Below_Average'
else 'Average' end as Sales_Category
from
(Select extract(day from transaction_date) as DOW,
 sum(transaction_qty*unit_price) as Total_Sales,
 Avg(sum(transaction_qty*unit_price)) over () as Avg_Sales
 from coffeeshop_sales
 where extract(month from transaction_date) = '5'
 group by extract(day from transaction_date)
 ) as t1
;

--Sales by weekday/weekend for the month of April
Select 
case 
when extract(DOW from transaction_date) in (0,6) then 'Weekend'
else 'Weekday' end as WeekDay_Status,
sum(transaction_qty*unit_price) as Total_Sales
from 
coffeeshop_sales
where extract(month from transaction_date) = '5'
group by WeekDay_Status;

--Sales by store location
Select 
store_location,
sum(transaction_qty*unit_price) as Total_Sales
from coffeeshop_sales
Group by store_location
Order by Total_Sales DESC;

--Sales by Products (Top 10)
Select product_type,
sum(transaction_qty*unit_price) as Total_Sales
from coffeeshop_sales
group by product_type
order by Total_Sales DESC
limit 10;

















