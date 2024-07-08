# Sales Data Analysis and Visualization Using Tableau

[<img src="images/Sales_Data_Analysis.jpg?raw=true"/>]

(https://public.tableau.com/app/profile/fenny.khosla8067/viz/SalesDashboardF_17159659028480/Dashboard1)

Harnessing the power of data analytics, I embarked on a comprehensive exploration of a Sales Dataset, delving into its nuances through multiple dimensions. The focal point of this project lies in the Orders data source, encapsulating pivotal columns such as Order ID, Order Date, Ship Date, Customer Name, Segment, State/Province, Category, Sub-Category, Sales, Quantity, among others.

# Dataset Overview:

The Sales Dataset under scrutiny forms the bedrock of our analysis. It encompasses key metrics essential for unraveling the intricacies of sales dynamics, facilitating a granular understanding of transactional patterns, customer behavior, and regional variations.

# Key Performance Indicators (KPIs):
My endeavor was to distill actionable insights from the dataset, with a keen emphasis on discerning the following KPIs for the year 2022:
Total Sales: $733.2k, marking a robust year-on-year growth of 20.36%.
Total Profit: $93.44k, demonstrating a commendable year-on-year growth of 14.24%.
Total Quantity: 12k units, registering a substantial year-on-year growth of 26.83%.

Hex Map Visualization:
Leveraging the power of visualization, I crafted a Hex Map, shedding light on the geographical distribution of sales and profit across states. Notably, California and New York emerged as frontrunners, showcasing the highest sales and profit figures.

State-wise Performance Analysis:
A meticulous examination of state-wise performance revealed compelling insights. Seventeen states surpassed the US sales average, underscoring pockets of excellence amidst regional disparities. Similarly, a nuanced analysis of profit delineated 33 states as profitable, with 14 states trailing below the average.

Monthly Sales Trends:
Unraveling the temporal dimension of sales dynamics, I meticulously dissected monthly sales trends across segments. 

Sub-category Contribution Analysis:
Zooming into the sub-category level, I scrutinized the contribution of various sub-segments to overall sales. Chairs, Tables, Phones, Copiers, Binders, Storage, and Appliances emerged as pivotal contributors within their respective categories, underlining focal points for targeted interventions and optimization efforts.

Technical Implementations:
Sales KPI Calculation: Utilizing Tableau's robust calculation engine, I engineered dynamic calculations for sales, profit, and quantity, enabling granular insights into year-on-year growth trajectories.

Calculated field to calculate sales in 2022 

IF YEAR([Order Date]) = {MAX(YEAR([Order Date]))} THEN [Sales] END

IF YEAR([Order Date]) = 2022 THEN [Sales] END

(SUM([Total_Sales_2022])-SUM([Total_Sales_2021]))/SUM([Total_Sales_2021])

On the basis of these calculations, I created line charts showing sales for the two years on a monthly basis
Similarly, Profit and Quantity KPIs and charts have been created. 

Hex Map Visualization: Leveraging Tableau's visualization capabilities, I orchestrated the creation of a Hex Map, integrating sales and profit data for an immersive geographical perspective.
To create a Hex Map in Tableau. Upload the hexmap dataset and make a join with the sales dataset. The Hex Map dataset has Row, Column, State, Abbreviation. 
Creating Hex Maps showing above and below sales average and profit average
For showing above and below sales average and profit average, create fixed LODs. 
State wise avg Sales Calculated Field
{ FIXED [State/Province]: AVG(IF YEAR([Order Date]) = {MAX(YEAR([Order Date]))} THEN [Sales 2022] END)}
Avg Sales for the entire US in 2022 
{ FIXED : AVG([Sales 2022])}
Map Calculation Calculated Field
IF [State wise avg Sales]> [Avg Sales 2022 Overall] THEN 'Above Average'
ELSEIF [State wise avg Sales]< [Avg Sales 2022 Overall] THEN 'Below Average'
ELSEIF [State wise avg Sales] = [Avg Sales 2022 Overall] THEN 'Equal to Average'
END

Area Chart Dynamics: Harnessing the prowess of Tableau parameters, I devised an interactive area chart, affording users the flexibility to toggle between different metrics seamlessly, thus fostering a more immersive data exploration experience.

Sunburst Chart: Employing Tableau's dual-axis functionality and Marks card versatility, I sculpted a visually captivating Sunburst Chart, elucidating the sales distribution across categories and sub-categories with finesse.

# Conclusion:
In essence, this tableau project encapsulates a holistic journey through the labyrinth of sales data, unraveling patterns, trends, and insights that serve as catalysts for informed decision-making and strategic foresight. 

