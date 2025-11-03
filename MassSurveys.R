library(readr)
library(mosaic)
library(tidyverse)


hopelessness <- read_csv("SurveyCSVs - Hopelessness.csv")
suicide <- read_csv("SurveyCSVs - Suicide.csv")

hopelessness = hopelessness %>%
  rename("SAD/HOPE" = "Feeling sad or hopeless for 2+ weeks that they stopped doing usual activities, past year") %>%
  rename("SELF-HARM" = "Injuring oneself intentionally without wanting to die, past year") %>%
  rename("POOR MH" = "their mental health was not good always or most of the time during the previous 30 days") 
  
suicide = suicide %>%
  rename("CONSIDER" = "Seriously considering suicide, past year") %>%
  rename("PLAN" = "Making a suicide plan, past year") %>%
  rename("ATTEMPT" = "Attempting suicide, past year") %>%
  rename("ATTEMPT&INJURY" = "Attempting suicide that resulted in an injury, poisoning or overdose that had to be treated by a doctor or nurse, past year") %>%
  rename("HELP" = "Asking for help from someone before their suicide attempt")


hopelessness_long <- pivot_longer(hopelessness, cols=2:4, names_to="area", values_to="proportion")
suicide_long <- pivot_longer(suicide, cols=2:6, names_to="area", values_to="proportion")

combined <- rbind(hopelessness_long, suicide_long)

combined = combined %>%
  rename(demographic = "Column 1") %>%
  mutate(proportion = proportion / 100)

race = filter(combined, demographic %in% c("White", "Black", "Hispanic", "Asian", "Other/Multiracial"))
race$demographic = as.factor(race$demographic)

sex = filter(combined, demographic %in% c("Male", "Female"))
sex$demographic = as.factor(sex$demographic)

grade_level = filter(combined, demographic %in% c("9th Grade", "10th Grade", "11th Grade", "12th Grade"))
grade_level$demographic = as.factor(grade_level$demographic)

grade_level$demographic = factor(grade_level$demographic, levels = c("9th Grade", "10th Grade", "11th Grade", "12th Grade"))

race_bw = filter(race, demographic %in% c("White", "Black"))

ggplot(grade_level, aes(x=area, y=proportion, fill=demographic)) + geom_col(position = "dodge")
ggplot(sex, aes(x=area, y=proportion, fill=demographic)) + geom_col(position = "dodge")
ggplot(race_bw, aes(x=area, y=proportion, fill=demographic)) + geom_col(position = "dodge")
