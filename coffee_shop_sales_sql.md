# Coffee Shop Sales Analysis: January to June 2023

# Introduction: 
This project entails a comprehensive analysis of a coffee shop's sales data over the first six months of 2023, covering January through June. The dataset includes 149,116 rows and 11 columns with key details such as transaction ID, date, time, quantity, store location, product specifics, and more. My objective is to draw meaningful insights from this data to guide strategic business decisions for my client using PostgreSQL.
Let’s assume I have a client who is a coffee shop (brand) owner and she wants to know the total sales, total orders and quantity sold each month in 2023. Also, the client is curious to know the months when maximum growth was recorded and when there was negative growth. 

# Analysis Summary: 
Total Sales: $698.81k
Sales Trend: January to June 2023
-	February saw a decline in sales. However, from March onwards, sales exhibited a positive growth trajectory.
-	Notably, May 2023 recorded a significant month-on-month (MoM) growth of 31.77%, reaching $156,727.26 in sales.
-	In June 2023, the growth rate slowed to single digits, indicating a dip in momentum.
Total Orders: 149.12k
-	February 2023 experienced a drop in orders, similar to sales.
-	From March onwards, the number of orders increased month-over-month.
-	For instance, between March and April, orders grew by 19.34%, reaching 25.3k orders. It was again the month of May that recorded the highest MoM growth in line with the sales growth. 
Total Quantity Sold: 214.47k units
-	February saw a negative MoM growth of -5.3%.
-	March rebounded with a growth of 29%.
-	The highest MoM growth was observed in May at 32.3% to 48,233, but June experienced a drop to single-digit growth.

# Detailed Insights:
My client was particularly interested in understanding which days in May 2023 saw sales exceeding the average for that month. Upon investigation, I found that sales were above average on 17 days in May. This raises intriguing questions about potential promotions or holidays that might have driven these spikes.

Weekday vs. Weekend Sales:
Another query from my client focused on comparing weekday and weekend sales, particularly for May 2023. The analysis revealed that weekday sales were higher than weekend sales in May. This insight is valuable for making decisions about promotions and staffing, suggesting that weekday strategies might need more focus.

# Store Location Performance:
-	Top Performing Store: Hell’s Kitchen, with sales totaling $236.5k.
-	Runner-ups: Astoria and Lower Manhattan held the second and third spots respectively.

Product Performance:
-	Top Selling Product Type: Barista Espresso, followed by Brewed Chai Tea and Hot Chocolate.

Strategic Recommendations:
-	Promotions: Consider running targeted promotions on weekdays to capitalize on higher sales trends. 
-	Staffing: Adjust staffing levels to match higher weekday demand, ensuring optimal customer service during peak times.
-	Product Strategy: Focus on promoting high-selling products such as Barista Espresso to boost overall sales.
By leveraging these insights, my client can make informed decisions to drive growth and optimize operations in her coffee shops. 

PostgreSQL Queries with results: <br>
Total Sales
```
Select sum(transaction_qty*unit_price) as Total_Sales from coffeeshop_sales;
```

<img src="images/Picture1c.jpg?raw=true"/>
<br>
Total Orders

```
Select count(transaction_id) as Total_Orders from coffeeshop_sales;
```

<img src="images/Picture2c.jpg?raw=true"/>
<br>

Total Quantity Sold
```
Select sum(transaction_qty) as Total_Qty from coffeeshop_sales;
```
<img src="images/Picture3c.jpg?raw=true"/>
<br>

Calculate the total sales for each respective month <br>
```
Select extract(month from transaction_date) as Month_Final, 
sum(transaction_qty*unit_price) as Total_Sales
from coffeeshop_sales
Group by extract(month from transaction_date);
```

<img src="images/Picture4c.jpg?raw=true"/>
<br>

Determine the month-on-month increase or decrease in sales <br>
```
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
```
<br>
<img src="images/Picture5c.jpg?raw=true"/>

<br>
Calculate the total number of orders for each respective month <br>
```
Select extract(month from transaction_date) as Month_Final, 
count(transaction_id) as Total_Orders
from coffeeshop_sales
group by extract(month from transaction_date)
;
```
<br>
<img src="images/Picture6c.jpg?raw=true"/>
<br>

Determine the month-on-month increase or decrease in orders <br>
```
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
```

<br>
<img src="images/Picture7c.jpg?raw=true"/>
<br>

Calculate the difference in the number of orders between the selected month and the previous month <br>
```
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
```
<br>
<img src="images/Picture8c.jpg?raw=true"/>
<br>

Total Quantity Sold over the months <br>
```
Select extract(month from transaction_date) as Month_Final,
sum(transaction_qty) as Total_Qty
from coffeeshop_sales
group by extract(month from transaction_date)
;
```

<br>
<img src="images/Picture9c.jpg?raw=true"/>
<br>

Total quantity sold KPI - MOM difference and MOM growth  <br>
```
Select extract(month from transaction_date) as Month_Final,
sum(transaction_qty) as Total_Qty,
(cast(
	(sum(transaction_qty) - lag(sum(transaction_qty)) over (order by extract(month from transaction_date))) as Numeric) / cast(lag(sum(transaction_qty)) over (order by extract(month from transaction_date)) as numeric))*100 as MoM_Growth
from coffeeshop_sales
group by extract(month from transaction_date)
order by Month_Final
;
```

<br>
<img src="images/Picture10c.jpg?raw=true"/>

<br>

Consider day of month (1, 2, ...31) and see if daily sales more or less than average sales for a given month <br>
```
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
```

<br>
<img src="images/Picture11c.jpg?raw=true"/>

<br>

Sales by weekday/weekend for the month of May  <br>
```
Select 
case 
when extract(DOW from transaction_date) in (0,6) then 'Weekend'
else 'Weekday' end as WeekDay_Status,
sum(transaction_qty*unit_price) as Total_Sales
from 
coffeeshop_sales
where extract(month from transaction_date) = '5'
group by WeekDay_Status;
;
```

<br>
<img src="images/Picture12c.jpg?raw=true"/>

<br>

Sales by store location  <br>
```
Select 
store_location,
sum(transaction_qty*unit_price) as Total_Sales
from coffeeshop_sales
Group by store_location
Order by Total_Sales DESC;
```
<br>
<img src="images/Picture13c.jpg?raw=true"/>
<br>

Sales by Products (Top 10)  <br>
```
Select product_type,
sum(transaction_qty*unit_price) as Total_Sales
from coffeeshop_sales
group by product_type
order by Total_Sales DESC
limit 10;
```

<br>
<img src="images/Picture14c.jpg?raw=true"/>
<br>
