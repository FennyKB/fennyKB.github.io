# Navigating Financial Data: A Tableau Dashboard Analysis

Planning to buy a new house or that dream car but need financial assistance? Bank loans can be a lifesaver. Understanding bank loans and borrowing habits is vital for making well-informed decisions. In this blog post, we'll delve into insights from a dataset containing information about financial loans using Tableau, an exceptional data visualization tool.
Here is the link to the Dashboard
[Tableau Link](https://public.tableau.com/app/profile/fenny.khosla8067/viz/BankLoansReport/Dashboard4)

[<img src="images/Navigating_Financial_Data_Dashboard.png?raw=true"/>](https://public.tableau.com/app/profile/fenny.khosla8067/viz/BankLoansReport/Dashboard4)

 
# Key Performance Indicators (KPIs)

The journey begins with calculating Key Performance Indicators (KPIs) to offer quick insights into loan applications and financial trends. The first KPI focuses on the total number of bank loan applications. A calculated field called Total_Loan_Applications is created to count the IDs and determine the total count. Here is the calculated field COUNT([Id]).

Additionally, month-to-date (MTD) loan applications and their month-on-month (MoM) changes are analyzed to track trends over time. Similar calculations are performed for total funded amounts and total payments received, providing a comprehensive view of financial activities.

Create a calculated field --> Loan_Applications_MTD\
```
COUNT(IF
DATEDIFF('month',[Issue Date],{MAX([Issue Date])}) = 0
THEN [Id]
END
)
```

For calculating the previous month total loan applications, here is the calculated field.\

**PMTD_Loan_Applications**
```
IF DATEDIFF('month',[Issue Date],{MAX([Issue Date])}) = 1 THEN [Id] END
```

**MoM loan applications** 
```
(Count([MTD_Loan_Applications]) - COUNT([PMTD_Loan_Applications]))/
COUNT([PMTD_Loan_Applications])
```

Next set of KPIs is focused on total funded amount where again month to date, previous month to date, and month on month loan amount is analyzed. Also, similar KPIs for Total Payment are presented on the dashboard. Similar calculated fields are used to present this set of KPIs.

**Total_Funded_Amount**
```
Sum(Loan_Amount)
```

**MTD Loan Amount**
```
IF DATEDIFF('month',[Issue Date],{MAX([Issue Date])}) = 0 THEN [Loan Amount] END
```

**PMTD Loan Amount**
```
IF DATEDIFF('month',[Issue Date],{MAX([Issue Date])}) = 1 THEN [Loan Amount] END
```

**MoM Loan Amount**
```
(SUM([MTD_Loan_Amount])-SUM([PMTD_Loan_Amount ]))/SUM([PMTD_Loan_Amount ])
```

Similarly, Total amount received, average interest rate and average DTI can be shown.

<img src="images/Navigating_Financial_Data_2nd_pic.png?raw=true"/>
# Good Loans vs. Bad Loans Analysis
To distinguish between good and bad loans, two groups are created: "good loans" and "bad loans". Good loans include those labeled as "Fully Paid" or "Current", while bad loans are labeled as "Charged Off". Visualizing the percentage of good loans using a donut chart helps understand the loan portfolio's health.

Next create a calculated field Good Loans Applications Count
```
Count(IF [Good Vs Bad Loans] = 'Good Loans' THEN 1 END)
```
Create a calculated field -> Good Loans Amount
```
Sum(IF [Good Vs Bad Loans] = 'Good Loans' THEN [Loan Amount] END)
```
Create a calculated field -> Good Loans Payment
```
Sum (IF [Good Vs Bad Loans] = 'Good Loans' THEN [Total Payment] END)
```

KPIs are calculated for both good and bad loans, including the count of applications, loan amounts, and payments. This analysis offers insights into the performance of loan portfolios.\
Similarly, an analysis for bad loans is developed supported by KPIs as for good loans.

# Month-Wise Analysis
An area chart visualizes loan applications, funded amounts, and payments month-wise. To offer flexibility in data exploration, a parameter is created, allowing users to toggle between these metrics seamlessly.

For the month-wise analysis, a parameter was introduced to facilitate user interaction. This parameter is set up with string data type and includes allowable values for users to select from, such as "Loan Applications", "Funded Amounts", and "Payments". These options serve as toggles for the displayed metric on the chart.

Next, the parameter is integrated into the visualization by creating a calculated field using a case when statement. This level of interactivity empowers users to delve deeper into the data, gaining insights tailored to their specific needs and interests.

# State-Wise Loan Status
Geographical insights are further explored by mapping loan applications, funded amounts, and payments received across different states. A parameter allows users to switch between these metrics, facilitating a deeper understanding of regional trends.

# Loan Distribution by Term and Purpose
A pie chart displays loan distribution by term, highlighting the proportion of loans with different repayment durations. Additionally, loan purposes are analyzed, revealing insights into borrowers' needs. Debt consolidation emerges as the primary reason for borrowing, followed by credit card payments.

# Employee Tenure and Loan Purpose Analysis
Lastly, loan applications based on employee tenure and loan purpose are explored. Employees with more than 10 years of experience dominate loan applications and amounts. Debt consolidation and credit card payments are the most common purposes for borrowing.

# Conclusion
In conclusion, Tableau enables gaining valuable insights into loan applications, funding, and payments. By analyzing KPIs, distinguishing between good and bad loans, and exploring trends across various dimensions, stakeholders can make informed decisions regarding financial assistance. Whether it's buying a new house, a dream car, or managing existing debt, understanding borrowing habits is essential for financial well-being.
