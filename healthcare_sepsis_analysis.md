# Healthcare: Analysis of Sepsis Patient Demographics and ICU resource Utilization
[<img src="images/Healthcare_Sepsis_Analysis.jpg?raw=true"/>](https://public.tableau.com/app/profile/fenny.khosla8067/viz/PatientSepsisDataAnalysisDashboard/Dashboard32)

[Tableau Link](https://public.tableau.com/app/profile/fenny.khosla8067/viz/PatientSepsisDataAnalysisDashboard/Dashboard32)

# Introduction: 
This project aims to analyze data related to patients suffering from Sepsis, a severe condition where the body's response to infection improperly affects several organs. The goal is to gain insights into patient distribution based on age and gender, and to analyze ICU requirements to aid in planning care for patients.

# Analysis Summary: 
Using Tableau, the analysis highlights several key performance indicators (KPIs) and patient demographics. The age and gender distribution revealed a higher incidence of sepsis in patients aged 54-72 and over 72. The ICU data underscores the critical care requirements for older patients and the significant proportion of onset patients. The distribution of patients across MICU, SICU, and other ICUs provides insights into the varied needs of non-sepsis, onset, and sepsis patients. Onset patients are spread across different ICUs. MICU and SICU need to be prepared to handle both non-sepsis and sepsis patients.

The ICU length of stay analysis provides insights into resource allocation and care planning, emphasizing the need for tailored care strategies for patients with longer ICU stays. I noticed that the onset patients average ICU LOS was 59.4 as some patients had extremely long ICU stay whereas for all patients it was 39. This intrigued me to look at the median value which for all patients was 39 and for onset patients was 48. The higher average compared to the median suggests that there are some onset patients with very long ICU stays, which is pulling the average upwards. 

# Implications for Hospitals and ICUs:
-	The analysis reflects the need for strategic resource allocation to cater to older patients in line with their ICU stays
-	Tailored care strategies are essential for onset patients with complex conditions and prolonged ICU stays. This includes specialized medical teams and advanced monitoring.
-	The analysis highlights the importance of ICU readiness to handle critical cases, especially for patients directly admitted to the ICU and those whose conditions escalate.
-	Hospitals need to effectively manage patient flow between ICU and hospital units to ensure smooth transitions and optimal care during recovery phases.

# Introduction to Dataset and Analysis:
The dataset, downloadable via a provided link, includes over 1 million records with 40 time-dependent variables. The key demographic variables analyzed are:
-	Age
-	Gender: 0 (female), 1 (male)
-	Unit 1 (MICU): 0 (false), 1 (true)
-	Unit 2 (SICU): 0 (false), 1 (true)
-	HospAdmTime: Hours since ICU admission
-	ICULOS: ICU length of stay
-	Sepsis Label: 1 (sepsis), 0 (no sepsis)

# Understanding the patient landscape:
Total Patients: 40,336
Non-sepsis patients: 37,404
Sepsis Patients: 2,926
Onset Patients: 2,506 patients developed sepsis after ICU admission, providing insights into sepsis development post-admission. These patients had sepsis label as 0 when admitted and then were diagnosed as sepsis lab1 1 over time.

Age and Gender:
The butterfly chart shows the age and gender distribution of patients for sepsis and non-sepsis patients. The age groups include, below 18, 18-36, 36-54, 54-72 and over 72. A gender distribution showed that 56% of patients were male and 44% were female. Also, most of the patients were in the age range of 54-72 and over 72. 

ICU units:
Across MICU and SICU, patients in the age group of 54-72 and over 72 made the largest population signifying the level of care this age group requires. 

Hospital Admission Time: This column helped in identifying three categories of patients including:
-	Direct to the ICU – indicate critical conditions
-	From hospital to the ICU – represent an escalation in the health issues 
-	From ICU to hospital – signify a transition for recovery
The negative values in the dataset indicate that the patients were admitted to the ICU and then transferred to the hospital for recovery. There were over 38,000 patients who were in this category. The patients who were directly admitted to ICU were 1,313 signifying their critical condition and those who were moved from Hospital to ICU were 256 considering their condition must have deteriorated and they were moved to the ICU.
This distribution suggests that non-sepsis patients are more evenly spread across different types of ICU units. We see a similar pattern in the case of onset patients and sepsis patients while the lowest in numbers are present across all types of ICU units with a slight concentration in other ICUs and MICU. 
The numbers emphasize the need for ICU readiness and provide insight into the evolution of medical conditions. 

ICU Length of Stay: This tells about the length of stay of patients in the ICU and the graph shows the distinct patient populations within the ICULOS bins. The bins range from 0-14, 14-28, 28-42, 42-56, 56-70, 70-84,..and so on up to 336. 
The graph shows distribution of patients across ICULOS bins, showing the duration of ICU stays within the patient population. This helps in planning the resource allocation in ICUs. I have also showed the ICULOS for onset patients. Patients will longer stay in the ICU have more complex conditions and this information can help the hospitals plan care for patients when needed the most. 
The average ICU length of stay is 39.01 for all patients with onset patients having high average ICULOS as some patients have extremely long stays. This compelled me to look at the median values for ICULOS for onset patients. The median value is 48 for onset patients whereas the median value for all patients is 39. The average helps in determining the efficiency and urgency with which care should be provided, the median value helps in making individual care plans.     

