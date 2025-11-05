# Massachusetts Youth Risk Behavior Survey Analysis

Dataset from https://www.mass.gov/lists/massachusetts-youth-health-survey-myhs

According to the Massachusetts Department of Secondary and Elementary Education: 

*The YRBS was developed by the Centers for Disease Control and Prevention to monitor priority health risk behaviors that contribute to the leading causes of death, disease, injury, and social problems among youth. The Massachusetts Department of Elementary and Secondary Education (Department) — in collaboration with the Centers for Disease Control and Prevention (CDC) and the Massachusetts Department of Public Health (DPH) — conducts the Youth Risk Behavior Survey (YRBS) in randomly selected public high schools in every odd-numbered years. The Massachusetts YRBS (MYRBS) focuses on the major risk behaviors that threaten the health and safety of young people. This anonymous survey includes questions about tobacco use, alcohol and other drug use, sexual behaviors that might lead to unintended pregnancy or sexually transmitted disease, dietary behaviors, physical activity, and behaviors associated with intentional or unintentional injuries. Since 2007, the MYRBS has been conducted jointly with the Massachusetts Youth Health Survey  (MYHS) developed by DPH.*

### Data Description

This data was collected from schools with an in-person survey. For some of the data points, participation in the question did not create a large enough sample size, or the margin of error was too high. In these cases, the database is marked with **. 

## Analysis 

I used data from the 2023 and 2021 surveys to complete this analysis, as they were the most recent surveys conducted and published. I used data from the document provided with the information and created a Google Sheet. I corrected some of the headers to have no spacing errors and deleted the confidence intervals. Then, I replaced all of the ** with NA to better fit the format of dataframes in R. 

I downloaded these sheets as CSV files and imported them into R. From here, I wrangled the data, including: 

  - Renaming categories to be more readable on graphs; "CONSIDER" = "Seriously considering suicide, past year", for example
  - Pivoting the tables into long format
  - Combining dataframes
  - Converting the percentage points into proportions
  - Filtering for race, sex, grade, and sexuality/gender identity as demographics
  - Setting demographics as factors

## Visualization

I created graphs for each demographic type (race, sex, and grade). 

Here is the key that contains all of the short versions used on the graph with the full questions from the survey.

| Short Version | Full Question |
| --- | --- |
| SAD/HOPE | Feeling sad or hopeless for 2+ weeks that they stopped doing usual activities, past year |
| SELF-HARM | Injuring oneself intentionally without wanting to die, past year |
| POOR MH | their mental health was not good always or most of the time during the previous 30 days |
| CONSIDER | Seriously considering suicide, past year |
| PLAN | Making a suicide plan, past year | 
| ATTEMPT | Attempting suicide, past year |
| ATTEMPT&INJURY | Attempting suicide that resulted in an injury, poisoning or overdose that had to be treated by a doctor or nurse, past year | 
| HELP | Asking for help from someone before their suicide attempt |

### Grade

<img src="graph_bygrade.png" style="width:100%; height:auto;">

### Sex

Here is a bar graph representing the proportion of students who answered yes to questions in the suicide and hopelessness section of the survey. 

<img src="graph_bysex.png" style="width:100%; height:auto;">


### Race

<img src="graph_byrace.png" style="width:100%; height:auto;">

<img src="graph_bybw.png" style="width:100%; height:auto;">

### Sexuality/Gender Identity

<img src="graph_bysexuality.png" style="width:100%; height:auto;">

<img src="graph_lgbtyear.png" style="width:100%; height:auto;">

<img src="graph_straightyea.png" style="width:100%; height:auto;">

I did a chi-square test for independence on LGBTQ+ responses to determine if there was a correlation between sexuality and question responses. 

$$H_0: \text{Sexuality/Gender Identity and survey responeses are independent}$$
$$H_A: \text{Sexuality/Gender Identity and survey responeses are dependent}$$

I completed this test for every question that was asked for each year. Here is a table of my results. 

| Question | Year | Chi-Square Result | P-Value | Result |
| --- | --- | --- | --- | --- |




