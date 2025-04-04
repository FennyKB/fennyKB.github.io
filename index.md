# My Projects

[<img src="images/Healthcare_Sepsis_Analysis.jpg?raw=true"/>](https://public.tableau.com/app/profile/fenny.khosla8067/viz/PatientSepsisDataAnalysisDashboard/Dashboard32)

## Healthcare: Sepsis Patient Demographics and ICU Resource Allocation Analysis using Tableau 
This project aims to analyze data related to patients suffering from Sepsis, a severe condition where the body's response to infection improperly affects several organs. The goal is to gain insights into patient distribution based on age and gender, and to analyze ICU requirements to aid in planning care for patients.

# Analysis Summary: 
Using Tableau, the analysis highlights several key performance indicators (KPIs) and patient demographics. The age and gender distribution revealed a higher incidence of sepsis in patients aged 54-72 and over 72. The ICU data underscores the critical care requirements for older patients and the significant proportion of onset patients. The distribution of patients across MICU, SICU, and other ICUs provides insights into the varied needs of non-sepsis, onset, and sepsis patients. Onset patients are spread across different ICUs. MICU and SICU need to be prepared to handle both non-sepsis and sepsis patients.

The ICU length of stay analysis provides insights into resource allocation and care planning, emphasizing the need for tailored care strategies for patients with longer ICU stays. I noticed that the onset patients average ICU LOS was 59.4 as some patients had extremely long ICU stay whereas for all patients it was 39. This intrigued me to look at the median value which for all patients was 39 and for onset patients was 48. The higher average compared to the median suggests that there are some onset patients with very long ICU stays, which is pulling the average upwards. 

# Implications for Hospitals and ICUs:
-	The analysis reflects the need for strategic resource allocation to cater to older patients in line with their ICU stays
-	Tailored care strategies are essential for onset patients with complex conditions and prolonged ICU stays. This includes specialized medical teams and advanced monitoring.
-	The analysis highlights the importance of ICU readiness to handle critical cases, especially for patients directly admitted to the ICU and those whose conditions escalate.
-	Hospitals need to effectively manage patient flow between ICU and hospital units to ensure smooth transitions and optimal care during recovery phases.


## Food and Beverage: Coffee Shop Sales Analysis with PostgresSQL

[<img src="images/coffeesales.jpg?raw=true\">](./coffee_shop_sales_sql.md)

This project involves an in-depth analysis of a coffee shop's sales data over the first six months of 2023, providing actionable insights and strategic recommendations. 
Total Sales
- Total: $698.81k
- Highlight: May 2023 achieved a significant MoM growth of 31.77%, reaching $156k in sales.
Total Orders
- Total: 149.12k
- Observation: February 2023 saw a noticeable drop in orders, aligning with lower sales.
Total Quantity Sold
- Total: 214.47k units
- Highlight: May recorded the highest MoM growth of 32.3%, reaching 48,233 units, followed by a decline to single-digit   
  growth in June.
Weekday vs. Weekend Sales
- May 2023 Insight: Weekday sales outperformed weekend sales.
- Actionable Insight: This trend can guide targeted weekday promotions and weekend sales strategies.

Recommendations
- Implement weekday promotions to sustain the higher sales trend.
- Introduce weekend-specific offers to drive more traffic and balance sales across the week.
- Optimize staffing levels to handle higher weekday demand and ensure seamless customer service during peak hours.
- Promote high-performing products, such as Barista Espresso, to boost sales further.


## Financial Services: Navigating Financial Data with Tableau
[<img src="images/Navigating_Financial_Data_Dashboard.png?raw=true\">](./navigating_financial_data.md)

This project leverages Tableau to analyze bank loan data, focusing on key performance indicators (KPIs) such as total loan applications, funded amounts, and payments received. By calculating month-to-date (MTD) and month-on-month (MoM) changes, it provides insights into financial trends. Good and bad loans are distinguished, with KPIs calculated for both categories. Visualizations include a donut chart for loan health, an area chart for month-wise metrics, and state-wise geographic insights. Additionally, loan distributions by term, purpose, and employee tenure are examined. The analysis aids stakeholders in making informed financial decisions and understanding borrowing habits.

## Sales Data Analysis with PostgresSQL and Visualization using Tableau
[<img src="images/Sales_Data_Analysis.jpg?raw=true\">](./Sales_Data_Analysis.md)

Harnessing the power of data analytics, this project delved into a Sales Dataset using Tableau, focusing on key metrics such as total sales, profit, and quantity for the year 2022. The analysis revealed significant year-on-year growth, with total sales reaching $733.2k, profit at $93.44k, and quantity at 12k units. Visualizations, including a Hex Map and Sunburst Chart, highlighted geographical sales distributions and sub-category contributions, identifying California and New York as top performers. State-wise and monthly performance analyses provided actionable insights for strategic decision-making, underscoring the effectiveness of Tableau's dynamic calculation and visualization capabilities in exploring sales dynamics.

## Exploring Heart Disease Dataset: A deep dive into key features with Python
[Link Here](./heart_disease_analysis_python.md)

Heart disease is one of the leading causes of death worldwide. It is influenced by several factors such as hypertension, diabetes, unhealthy lifestyles, and genetic predisposition. This project presents an exploratory data analysis of a heart disease dataset using Python, primarily focusing on key features that might indicate a higher risk of heart disease.
Findings include: 
- Average age of inidividuals as 54.5 years with a standard deviation of 9.04 years. 
- There were 206 males in the dataset of which more than 40% have high chances of heart attcak; number of females is 96 and over 70% have high chances of heart attack in this dataset.
- Individuals with typical angina chest pain type did not show high risk to heart attack while those with atypical angina, non-anginal pain and asymptomatic are at a higher risk of heart attack.
- The average resting blood pressure is 131.6 mm Hg, which is slightly above the normal range of 120/80 mm Hg. This suggests that the dataset might contain individuals with borderline or elevated blood pressure
- Females have resting blood pressure around 120 while the mean have around 140.
- The data shows that even with normal blood sugar level, individuals can be at high risk for heart attack, emphasizing the importance of other cardiovascular risk factors. 

## Covid19 Data Anaylysis with PostgresSQL
[Link Here](./covid19_data_analysis_postgres.md)

This portfolio project demonstrates my expertise in data analysis using PostgreSQL by conducting a comprehensive analysis of COVID-19 datasets. By creating a database, defining schemas, and utilizing advanced SQL queries and functions, I extracted key insights such as total cases and deaths, death rates, and positivity rates. Highlights include identifying Peru with the highest death rate, Slovenia with the ninth-highest, and Bosnia and Herzegovina with the third-highest. The analysis also revealed Europe as the continent with the highest deaths. This project showcases my technical skills and ability to derive meaningful insights from complex data, essential for informed decision-making.

