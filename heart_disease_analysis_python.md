# Exploring Heart Disease Dataset: A deep dive into key features

# Introduction: 
Heart disease is one of the leading causes of death worldwide. It is influenced by several factors such as hypertension, diabetes, unhealthy lifestyles, and genetic predisposition. Understanding the relationship between various health metrics and heart disease can aid in early detection, treatment, and prevention. This project presents an exploratory data analysis of a heart disease dataset using Python, primarily focusing on key features that might indicate a higher risk of heart disease.
# Dataset Overview: 
The dataset contains information about 302 patients, with 14 columns, each representing various health metrics. Here's a quick overview of the columns:
•	age: The person’s age in years.
•	sex: The person’s sex (1 = male, 0 = female).
•	cp: Chest pain experienced (1 = typical angina, 2 = atypical angina, 3 = non-anginal pain, 4 = asymptomatic).
•	trestbps: Resting blood pressure (mm Hg on admission).
•	chol: Cholesterol measurement (mg/dl).
•	fbs: Fasting blood sugar (> 120 mg/dl, 1 = true, 0 = false).
•	restecg: Resting electrocardiographic measurement (0 = normal, 1 = abnormal).
•	thalach: Maximum heart rate achieved.
•	exang: Exercise-induced angina (1 = yes, 0 = no).
•	oldpeak: ST depression induced by exercise relative to rest.
•	slope: Slope of peak exercise ST segment (1 = upsloping, 2 = flat, 3 = downsloping).
•	ca: Number of major vessels (0–3).
•	thal: A blood disorder called thalassemia (3 = normal, 6 = fixed defect, 7 = reversible defect).
•	target: Heart disease (0 = no, 1 = yes).

[<img src="images/Picture1.jpg?raw=true"/>]
*Figure shows shape of the dataset before removing duplicates



# Data Cleaning and Preprocessing:
Before diving into the analysis, some basic data cleaning and preprocessing is done:
•	Renamed some columns.
•	Checked for missing values (data.isnull().sum()) and found that there were no null values.
•	Removed duplicate rows using data.drop_duplicates() to ensure that we only analyze unique records.
•	After cleaning, the dataset consists of 302 rows and 14 columns.
Used the head(), tail(), info(),shape() functions to study the dataset
Data after renaming columns


Used the head(), tail(), info(),shape() functions to study the dataset
Data after renaming columns


# Dataset after removing duplicates:


# Summary Statistics:
Here are some key statistics based on the dataset:
Used the describe() function to derive the summary statistics

Age: The average age of individuals in the dataset is 54.5 years, with a standard deviation of 9.04 years. This indicates a diverse age range, with 25% of people under 48 years and 75% under 61 years.

Gender: A closer look at the gender distribution in the dataset reveals that there are 206 males (68%) and 96 females (32%). 


Finding which gender is having more chance of heart attack

Also created a heatmap of the dataset


Chest Pain Types and Heart Disease
The chest pain types in the dataset were categorized as:
0: Typical angina
1: Atypical angina
2: Non-anginal pain
3: Asymptomatic
The distribution of chest pain types shows that most people with typical angina (cp = 0) do not have heart disease, while most individuals with atypical angina (cp = 1), non-anginal pain (cp = 2), and asymptomatic (cp = 3) are at higher risk of heart disease, suggesting these pain types might have more severe or undiagnosed heart conditions.




Resting Blood Pressure (trestbps): The average resting blood pressure is 131.6 mm Hg, which is slightly above the normal range of 120/80 mm Hg. This suggests that the dataset might contain individuals with borderline or elevated blood pressure.
Looking at the resting blood pressure distribution, refer to the histogram below:


Females have resting blood pressure around 120 while the mean have around 140.

Cholesterol (chol): The mean cholesterol level is 246.5 mg/dL, which is above the normal level of 200 mg/dL. This indicates that the majority of the population in this dataset has elevated cholesterol levels. Here is also the distribution of cholesterol 

Fasting Blood Sugar and Heart Disease
The data shows that even with normal blood sugar level, individuals can be at high risk for heart attack, emphasizing the importance of other cardiovascular risk factors. 

Maximum Heart Rate (thalach): The average maximum heart rate achieved during exercise is 149.56 bpm. While it falls within the expected range for adults, the 25% of individuals with a heart rate below 133.2 bpm suggest some lower fitness levels, while 75% have a heart rate above 166 bpm, indicating a higher fitness level.
Recommendations:
•	Promote awareness of atypical symptoms like non-anginal pain and silent ischemia.
•	Encourage lifestyle interventions to address elevated BP and cholesterol.
•	Prioritize routine health screenings to detect asymptomatic cases early.

