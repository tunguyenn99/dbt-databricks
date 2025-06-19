# dbt-databricks


tunguyenn99@tunm2:~/project/dbt-databricks$ touch .env
tunguyenn99@tunm2:~/project/dbt-databricks$ python3 -m venv venv
tunguyenn99@tunm2:~/project/dbt-databricks$ source venv/bin/activate
(venv) tunguyenn99@tunm2:~/project/dbt-databricks$ pip install pandas matplotlib seaborn dbt-core dbt-databricks


dbt init



What should your report include?
In Challenge 15 we will be identifying trends within a Human Resource dataset.
Create a report that allows end users to easily find answers to the following questions: 

How diverse is the workforce in terms of gender, ethnicity, and age?
Is there a correlation between pay levels, departments, and job titles?
How about the geographic distribution of the workforce?
What is the employee retention rate trend yearly?
What is the employee retention rate in terms of gender, ethnicity, and age?
Which business unit had the highest and lowest employee retention rate?
Which business unit and department paid the most and least bonuses annually?
What is the annual historical bonus trend? Can we show new hires some statistics?
How about the pay equity based on gender, ethnicity, and age?
What is the employee turnover rate (e.g., monthly, quarterly, annually) since 2017?
Tips for working with the dataset
Use the formula: Apply the following formula to calculate the turnover rate:

Employee Turnover Rate — (Number of Separations / Average Number of Employees​) ×100.

For example, if a company had 50 employees at the start of the year, 55 at the end, and 5 separations occurred during the year, using the formula:

Turnover Rate= (5/52.5)×100≈9.52%